<?php
include('header.php');

$book_id = isset($_GET['book_id']) ? intval($_GET['book_id']) : 0; // Sanitize input
$booksql = mysqli_prepare($connect, "SELECT bookings.*, clients.*, booking_type.*, vehicles.* 
    FROM bookings 
    INNER JOIN booking_type ON bookings.b_type_id = booking_type.b_type_id 
    INNER JOIN clients ON bookings.c_id = clients.c_id 
    INNER JOIN vehicles ON bookings.v_id = vehicles.v_id 
    WHERE bookings.book_id = ?");
mysqli_stmt_bind_param($booksql, 'i', $book_id);
mysqli_stmt_execute($booksql);
$result = mysqli_stmt_get_result($booksql);
$bookrow = mysqli_fetch_array($result);
?>

<div class="page-body page_padding">
    <div class="row row-deck row-cards">			      			
        <div class="col-12">            						
            <div class="card">                							
                <div class="card-header">                    								
                    <h3 class="card-title">Booking Details</h3>                  										
                </div>                  				
                <div class="card-body border-bottom py-3">														
                    <form method="post" action="update-booking.php" enctype="multipart/form-data">				
                        <div class="modal-body">													
                            <div class="row">							
                                <div class="mb-3 col-md-4">	
                                    <label class="form-label">Booking Type</label>
                                    <input type="hidden" class="form-control" name="book_id" value="<?php echo htmlspecialchars($bookrow['book_id']); ?>">
                                    <select class="form-control" name="b_type_id" id="bookingType">
                                        <option value="<?php echo htmlspecialchars($bookrow['b_type_id']); ?>">
                                            <?php echo htmlspecialchars($bookrow['b_type_name']); ?>
                                        </option>
                                        <?php
                                        $btsql = mysqli_query($connect, "SELECT * FROM `booking_type`");
                                        while ($btrow = mysqli_fetch_array($btsql)) {										
                                        ?>           																			
                                        <option value="<?php echo htmlspecialchars($btrow['b_type_id']); ?>">
                                            <?php echo htmlspecialchars($btrow['b_type_name']); ?>										
                                        </option>
                                        <?php       																			
                                        }        																			
                                        ?>
                                    </select>																
                                </div>
                            </div>																						
                            <div class="row">
                                <h4>Passenger Details:</h4>
                                <div class="mb-3 col-lg-4">    																	
                                    <label class="form-label">Name</label>
                                    <select class="form-control" name="c_id" id="clientSelect">
                                        <option value="<?php echo htmlspecialchars($bookrow['c_id']); ?>">
                                            <?php echo htmlspecialchars($bookrow['c_name']); ?>
                                        </option>
                                        <?php        																			
                                        $clsql = mysqli_query($connect, "SELECT * FROM `clients`");
                                        while ($clrow = mysqli_fetch_array($clsql)) {
                                        ?>           																			
                                        <option value="<?php echo htmlspecialchars($clrow['c_id']); ?>">
                                            <?php echo htmlspecialchars($clrow['c_name']); ?>
                                        </option>
                                        <?php       																			
                                        }				
                                        ?>    																	
                                    </select>
                                </div>																							
                                <div class="mb-3 col-lg-4">  																
                                    <label class="form-label">Customer Phone</label>
                                    <input type="text" class="form-control" name="cphone" value="<?php echo htmlspecialchars($bookrow['c_phone']); ?>" id="customerPhone" readonly>
                                </div>				
                                <div class="mb-3 col-lg-4">   																	
                                    <label class="form-label">Customer Email</label>
                                    <input type="text" class="form-control" name="cemail" value="<?php echo htmlspecialchars($bookrow['c_email']); ?>" id="customerEmail" readonly>
                                </div>															
                                <script>   																	
                                    var bookingTypeSelect = document.getElementById('bookingType');
                                    var clientSelect = document.getElementById('clientSelect');    
                                    var customerPhoneInput = document.getElementById('customerPhone');
                                    var customerEmailInput = document.getElementById('customerEmail');    
                                    bookingTypeSelect.addEventListener('change', function () {
                                        var selectedBookingType = bookingTypeSelect.value;        
                                        $.ajax({            
                                            type: 'POST',            
                                            url: 'get_clients.php',             
                                            data: { b_type_id: selectedBookingType },            
                                            success: function (response) {
                                                clientSelect.innerHTML = '<option value="">Select Customer</option>' + response;            
                                            },            
                                            error: function () {
                                                console.error('Error fetching clients');
                                            }        
                                        });    
                                    });									    
                                    clientSelect.addEventListener('change', function () {        
                                        var selectedClientId = clientSelect.value;        
                                        $.ajax({            
                                            type: 'POST',            
                                            url: 'get_customer_details.php',            
                                            data: { c_id: selectedClientId },            
                                            success: function (response) {                
                                                var data = JSON.parse(response);                
                                                customerPhoneInput.value = data.phone; 
                                                customerEmailInput.value = data.email;            
                                            },            
                                            error: function () {
                                                console.error('Error fetching customer details');
                                            }        
                                        });    
                                    });																						
                                </script>
                            </div>																								
                            <div class="row">																				
                                <h4>Journey Details:</h4>																	
                                <div class="mb-3 col-lg-4">    								
                                    <label class="form-label">Pickup Location:</label>    									
                                    <input type="text" id="pickup" name="pickup" class="form-control" value="<?php echo htmlspecialchars($bookrow['pickup']); ?>">
                                </div>																	
                                <div class="mb-3 col-lg-4">    								
                                    <label class="form-label">Drop-off Location:</label>    									
                                    <input type="text" id="dropoff" name="dropoff" class="form-control" value="<?php echo htmlspecialchars($bookrow['destination']); ?>">									
                                </div>	
                                
                                <div class="col-lg-4">								
                                    <div id="stops-container"></div>									
                                    <div class="mb-3 col-lg-2">																	
                                        <button id="add-stop-btn" class="btn btn-info" style="margin-top: 25px;" title="Add Stop">
                                            <i class="ti ti-plus"></i>											
                                        </button>																			
                                    </div>																		
                                </div>								
                                <div class="mb-3 col-lg-4">										
                                    <label class="form-label">Address</label>									
                                    <input type="text" class="form-control" name="address" value="<?php echo htmlspecialchars($bookrow['address']); ?>">							
                                </div>							
                                <div class="mb-3 col-lg-4">		
                                    <label class="form-label">Postal Code</label>								
                                    <input type="text" class="form-control" name="postal_code" value="<?php echo htmlspecialchars($bookrow['postal_code']); ?>">							
                                </div>							
                                <div class="mb-3 col-lg-4">												
                                    <label class="form-label">No. of Passenger</label>								
                                    <input type="number" class="form-control" name="passenger" value="<?php echo htmlspecialchars($bookrow['passenger']); ?>">							
                                </div> 																				
                                <div class="mb-3 col-lg-4">
                                    <label class="form-label">Pickup Date</label>								
                                    <input type="date" class="form-control" name="pick_date" value="<?php echo htmlspecialchars($bookrow['pick_date']); ?>">							
                                </div>														
                                <div class="mb-3 col-lg-4">
                                    <label class="form-label">Pickup Time</label>								
                                    <input type="time" class="form-control" name="pick_time" value="<?php echo htmlspecialchars($bookrow['pick_time']); ?>">							
                                </div>																
                                <div class="mb-3 col-lg-4">								
                                    <div class="form-label">Journey Type</div>																
                                    <div class="mb-3">
                                        <label class="form-check form-check-inline">										
                                            <input class="form-check-input" type="radio" name="journey_type" value="One Way" <?php echo ($bookrow['journey_type'] == 'One Way') ? 'checked' : ''; ?>>
                                            <span class="form-check-label">One Way</span>									
                                        </label>
                                        <label class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="journey_type" value="Return" <?php echo ($bookrow['journey_type'] == 'Return') ? 'checked' : ''; ?>>
                                            <span class="form-check-label">Return</span>
                                        </label>
                                    </div>                          														
                                </div>						
                            </div>												
                            <div class="row">	
                                <div class="mb-3 col-lg-4">    								
                                    <label class="form-label">Vehicle Type</label>   									
                                    <select class="form-control" name="v_id" id="vehicleSelect" onchange="updateFare()">
                                        <option value="<?php echo htmlspecialchars($bookrow['v_id']); ?>">
                                            <?php echo htmlspecialchars($bookrow['v_name']); ?>
                                        </option>
                                        <?php
                                        $vsql = mysqli_query($connect, "SELECT * FROM `vehicles`");
                                        while ($vrow = mysqli_fetch_array($vsql)) {
                                        ?>
                                        <option value="<?php echo htmlspecialchars($vrow['v_id']); ?>">
                                            <?php echo htmlspecialchars($vrow['v_name']); ?>
                                        </option>
                                        <?php       									
                                        }        									
                                        ?>    								
                                    </select>							
                                </div>															
                                <div class="mb-3 col-lg-4">				
                                    <label class="form-label">Luggage</label>								
                                    <input type="text" class="form-control" name="luggage" value="<?php echo htmlspecialchars($bookrow['luggage']); ?>">										
                                </div> 															
                                <div class="mb-3 col-lg-4">								
                                    <div class="form-label">Child Seat</div>																
                                    <div>                              																		
                                        <label class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="child_seat" value="Yes" <?php echo ($bookrow['child_seat'] == 'Yes') ? 'checked' : ''; ?>>
                                            <span class="form-check-label">Yes</span>									
                                        </label>
                                        <label class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="child_seat" value="No" <?php echo ($bookrow['child_seat'] == 'No') ? 'checked' : ''; ?>>
                                            <span class="form-check-label">No</span>												
                                        </label>                             																
                                    </div>                          														
                                </div>															
                                <div class="mb-3 col-lg-4">          								
                                    <label class="form-label">Flight Number </label>								
                                    <input type="text" class="form-control" name="flight_number" value="<?php echo htmlspecialchars($bookrow['flight_number']); ?>">
                                </div>															
                                <div class="mb-3 col-lg-4">          								
                                    <label class="form-label">Delay Time </label>								
                                    <input type="text" class="form-control" name="delay_time" value="<?php echo htmlspecialchars($bookrow['delay_time']); ?>">							
                                </div>													
                            </div>												
                            <div class="row">							
                                <div class="mb-3">                 															
                                    <label class="form-label">Special Note</label>								
                                    <textarea class="form-control" rows="3" name="note"><?php echo htmlspecialchars($bookrow['note']); ?></textarea>								
                                </div> 							
                            </div>    												
                            <div class="row">						
                                <h4>Pricing Section</h4>													
                                <div class="mb-3 col-lg-4">          
                                    <label class="form-label">Booking Fee </label>								
                                    <input type="text" class="form-control" name="booking_fee" value="<?php echo htmlspecialchars($bookrow['booking_fee']); ?>">							
                                </div>														
                                <div class="mb-3 col-lg-4">          
                                    <label class="form-label">Car Park </label>								
                                    <input type="text" class="form-control" name="car_parking" value="<?php echo htmlspecialchars($bookrow['car_parking']); ?>">							
                                </div>							
                                <div class="mb-3 col-lg-4">          
                                    <label class="form-label">Waiting Charges </label>								
                                    <input type="text" class="form-control" name="waiting" value="<?php echo htmlspecialchars($bookrow['waiting']); ?>">							
                                </div>							
                                <div class="mb-3 col-lg-4">          
                                    <label class="form-label">Tolls </label>								
                                    <input type="text" class="form-control" name="tolls" value="<?php echo htmlspecialchars($bookrow['tolls']); ?>">							
                                </div>							
                                <div class="mb-3 col-lg-4">          
                                    <label class="form-label">Extra </label>								
                                    <input type="text" class="form-control" name="extra" value="<?php echo htmlspecialchars($bookrow['extra']); ?>">							
                                </div>																						 
                                <div class="mb-3 col-lg-4">
                                    <label class="form-label">Distance (Auto-calculated)</label>                                
                                    <input type="text" class="form-control" name="journey_distance" id="journeyDistance" value="<?php echo htmlspecialchars($bookrow['journey_distance']); ?>" readonly>
                                </div>							
                                <div class="mb-3 col-lg-4">										
                                    <label class="form-label">Journey Fare</label>								
                                    <input type="text" class="form-control" name="journey_fare" id="journeyFare" value="<?php echo htmlspecialchars($bookrow['journey_fare']); ?>">							
                                </div>																					
                                <div class="col-lg-4">                															
                                    <h4>Send Online Payment Link</h4>										
                                    <p>							   																		
                                        <label>							     										
                                            <input type="checkbox" name="Payment Link[]" value="phone">
                                            Phone Number									
                                        </label>							   									
                                        <br>							   									
                                        <label>							      
                                            <input type="checkbox" name="Payment Link[]" value="email">
                                            Email Address									
                                        </label>							    									
                                        <br>						      																
                                    </p>                          													
                                </div>										
                            </div>					  												
                        </div>          										      											
                        <div class="modal-footer">           														
                            <button type="submit" class="btn btn-success ms-auto">						
                                <i class="ti ti-message-plus"></i>						
                                Update Booking  																
                            </button>
                            <a href="dispatch-booking.php?book_id=<?php echo htmlspecialchars($bookrow['book_id']); ?>" class="btn btn-instagram" style="margin-left: 20px;">
                                <i class="ti ti-plane-tilt"></i>						
                                Dispatch Booking  																
                            </a>
                        </div> 										
                    </form>																		
                </div>                                                    				
            </div>              			
        </div>		
    </div>
</div>       

<!-- Include the Google Maps API script -->  
<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places&callback=initAutocomplete" async defer></script>
<script>
function initAutocomplete() {    
    var pickupInput = document.getElementById('pickup');        
    var dropoffInput = document.getElementById('dropoff');        
    var journeyDistanceInput = document.getElementById('journeyDistance');		        
    var autocompleteOptions = {        
        types: ['geocode'],            
        componentRestrictions: {country: 'GB'}
    };				        
    var autocompletePickup = new google.maps.places.Autocomplete(pickupInput, autocompleteOptions);        
    var autocompleteDropoff = new google.maps.places.Autocomplete(dropoffInput, autocompleteOptions);		        
    
    autocompletePickup.addListener('place_changed', updateDistance);        
    autocompleteDropoff.addListener('place_changed', updateDistance);		        

    function updateDistance() {        
        var pickupPlace = autocompletePickup.getPlace();            
        var dropoffPlace = autocompleteDropoff.getPlace();			            
        if (pickupPlace.geometry && dropoffPlace.geometry) {            
            calculateDistance(pickupPlace.geometry.location, dropoffPlace.geometry.location);
        }			
    }				        
    
    function calculateDistance(pickupLocation, dropoffLocation) {        
        var service = new google.maps.DistanceMatrixService();            
        service.getDistanceMatrix({            
            origins: [pickupLocation],                
            destinations: [dropoffLocation],                
            travelMode: 'DRIVING',
        }, function(response, status) {                
            if (status === 'OK' && response.rows.length > 0) {                
                var distanceText = response.rows[0].elements[0].distance.text;                    
                journeyDistanceInput.value = distanceText;                
            } else {
                console.error('Error calculating distance:', status);                
            }            
        });        
    }    
}			
	
	function updateFare() {    
    var vehicleSelect = document.getElementById('vehicleSelect');        
    var journeyDistanceInput = document.getElementById('journeyDistance');        
    var journeyFareInput = document.getElementById('journeyFare');		        
    
    var selectedVehicleId = vehicleSelect.value;        
    var journeyDistance = parseFloat(journeyDistanceInput.value);

    // Check if journey distance is valid
    if (isNaN(journeyDistance) || journeyDistance <= 0) {
        journeyFareInput.value = '0.00'; // Reset fare if distance is invalid
        return;
    }

    // Make an AJAX request to get the pricing of the selected vehicle        
    $.ajax({        
        type: 'POST',            
        url: 'get_vehicle_pricing.php', // Replace with the actual URL to fetch vehicle pricing            
        data: { v_id: selectedVehicleId },            
        success: function(response) {            
            var vehiclePricing = parseFloat(response);
            
            // Check if vehicle pricing is valid
            if (!isNaN(vehiclePricing) && vehiclePricing >= 0) {
                var journeyFare = vehiclePricing * journeyDistance;				                
                // Update the journey fare input field                
                journeyFareInput.value = journeyFare.toFixed(2);
            } else {
                console.error('Invalid vehicle pricing received:', response);
                journeyFareInput.value = '0.00'; // Reset fare if pricing is invalid
            }
        },			            
        error: function(xhr, status, error) {            
            console.error('Error fetching vehicle pricing:', status, error);
            journeyFareInput.value = '0.00'; // Reset fare on error
        }        
    });    
}

google.maps.event.addDomListener(window, 'load', initAutocomplete);

</script>	
<?php
include('footer.php');
?>