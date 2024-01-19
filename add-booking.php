<?php
include('header.php');
?>  
<div class="page-body page_padding">
	<div class="row row-deck row-cards">			      			
		<div class="col-12">            						
			<div class="card">                							
				<div class="card-header">                    								
					<h3 class="card-title">Create New Booking</h3>                  										
				</div>                  				
				<div class="card-body border-bottom py-3">														
					<form method="post" action="booking-process.php" enctype="multipart/form-data" onsubmit="return validateForm();">				
						<div class="modal-body">													
							<div class="row">							
								<div class="mb-3 col-md-4">    																	
   
									<label class="form-label">Booking Type</label>
    
									<select class="form-control" name="b_type_id" id="bookingType" required>
        
										<option value="">Select Booking Type</option>
        
										<?php
        
										$btsql = mysqli_query($connect, "SELECT * FROM `booking_type`");
        
										while ($btrow = mysqli_fetch_array($btsql)) {										
        
										?>
        
										<option value="<?php echo $btrow['b_type_id'] ?>">
            
											<?php echo $btrow['b_type_name'] ?>										
        
										</option>
        
										<?php
        
										}				
        
										?>
    
									</select>

								</div>																								
							</div>																						
							<div class="row">
								<h4>Passenger Details:</h4>
							
								<div class="mb-3 col-lg-3">    																	
    
								
									<label class="form-label">Name</label>
    

									<select class="form-control" name="c_id" id="clientSelect" required>
        
									
										<!--<option value="">Select Customer</option>-->
    
								
									</select>

								
								
								</div>

								

								
								<div class="mb-3 col-lg-3">  																
    
								
									<label class="form-label">Customer Phone</label>
    
									
									<input type="text" class="form-control" name="cphone" id="customerPhone" readonly>
 
								</div>


								<div class="mb-3 col-lg-3">   																	
    
									<label class="form-label">Customer Email</label>
    
									<input type="text" class="form-control" name="cemail" id="customerEmail" readonly>

								</div>

								

								<script>   																	
    
									var bookingTypeSelect = document.getElementById('bookingType');
    
									var clientSelect = document.getElementById('clientSelect');
    
									var customerPhoneInput = document.getElementById('customerPhone');
    
									var customerEmailInput = document.getElementById('customerEmail');

    
									bookingTypeSelect.addEventListener('change', function () {
        
										// Fetch clients based on booking type
        
										var selectedBookingType = bookingTypeSelect.value;
        
										$.ajax({
            
											type: 'POST',
            
											url: 'get_clients.php', // Create a new PHP file to handle this request
            
											data: { b_type_id: selectedBookingType },
            
											success: function (response) {
                
												// Populate client list
                
												clientSelect.innerHTML = '<option value="">Select Customer</option>' + response;
            
											},
            
											error: function () {
                
												// Handle error if needed
            
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
                
												// Handle error if needed
            
											}
        
										});
    
									});

								</script>																									
							
							</div>																								
							<div class="row">																				
								<h4>Journey Details:</h4>																	
								<div class="mb-3 col-lg-4">    								
									<label class="form-label">Pickup Location:</label>    									
									<input type="text" id="pickup" name="pickup" class="form-control" placeholder="Select pickup location" required>
								</div>																	
								<div class="mb-3 col-lg-4">    								
									<label class="form-label">Drop-off Location:</label>    									
									<input type="text" id="dropoff" name="dropoff" class="form-control" placeholder="Select drop-off location" required>									
								</div>							
								<div class="mb-3 col-lg-4">																				
									<label class="form-label">Address</label>								
									<input type="text" class="form-control" name="address">							
								</div>							
								<div class="mb-3 col-lg-4">																				
									<label class="form-label">Postal Code</label>								
									<input type="text" class="form-control" name="postal_code">							
								</div>							
								<div class="mb-3 col-lg-4">												
									<label class="form-label">No. of Passenger</label>								
									<input type="number" class="form-control" name="passenger" required>							
								</div> 																				
								<div class="mb-3 col-lg-4">
									<label class="form-label">Pickup Date</label>								
									<input type="date" class="form-control" name="pick_date" required>							
								</div>														
								<div class="mb-3 col-lg-4">
									<label class="form-label">Pickup Time</label>								
									<input type="time" class="form-control" name="pick_time" required>							
								</div>																
								<div class="mb-3 col-lg-4">								
									<div class="form-label">Journey Type</div>																
									<div class="mb-3">
										<label class="form-check form-check-inline">										
											<input class="form-check-input" type="radio" name="journey_type" value="One Way">
											<span class="form-check-label">One Way</span>									
										</label>
										<label class="form-check form-check-inline">
											<input class="form-check-input" type="radio" name="journey_type" value="Return">
											<span class="form-check-label">Return</span>												
										</label>                             																
									</div>                          														
								</div>						
							</div>												
							<div class="row">	
								<div class="mb-3 col-lg-4">    								
									<label class="form-label">Vehicle Type</label>   									
									<select class="form-control" name="v_id" id="vehicleSelect" onchange="updateJourneyFare()">
										<option value="">Select Vehicle</option>       									
										<?php        									
										$vsql = mysqli_query($connect, "SELECT * FROM `vehicles`");        									
										while ($vrow = mysqli_fetch_array($vsql)) {           									
										?>           									
										<option value="<?php echo $vrow['v_id'] ?>">
											<?php echo $vrow['v_name'] ?>									
										</option>           									
										<?php       									
										}        									
										?>    								
									</select>							
								</div>															
								<div class="mb-3 col-lg-4">				
									<label class="form-label">Luggage</label>								
									<input type="text" class="form-control" name="luggage">										
								</div> 															
								<div class="mb-3 col-lg-4">								
									<div class="form-label">Child Seat</div>																
									<div>                              																		
										<label class="form-check form-check-inline">
											<input class="form-check-input" type="radio" name="child_seat" value="Yes">
											<span class="form-check-label">Yes</span>									
										</label>
										<label class="form-check form-check-inline">
											<input class="form-check-input" type="radio" name="child_seat" value="No">
											<span class="form-check-label">No</span>												
										</label>                             																
									</div>                          														
								</div>															
								<div class="mb-3 col-lg-4">          								
									<label class="form-label">Flight Number </label>								
									<input type="text" class="form-control" name="flight_number">
								</div>															
								<div class="mb-3 col-lg-4">          								
									<label class="form-label">Delay Time </label>								
									<input type="text" class="form-control" name="delay_time">							
								</div>													
							</div>												
							<div class="row">							
								<div class="mb-3">                 															
									<label class="form-label">Special Note</label>								
									<textarea class="form-control" rows="3" name="note"></textarea>								
								</div> 							
							</div>    												
							<div class="row">						
								<h4>Pricing Section</h4>	
								
								<div class="mb-3 col-lg-4">										
									<label class="form-label">Jouney Fare</label>								
									<input type="text" class="form-control"  name="journey_fare" id="journeyFare"  required>	
									<button class="btn btn-instagram" id="calculateFareBtn">Calculate Fare</button>
								</div>
								<div class="mb-3 col-lg-4">          
									<label class="form-label">Bookinng Fee </label>								
									<input type="text" class="form-control" name="booking_fee">							
								</div>														
								<div class="mb-3 col-lg-4">          
									<label class="form-label">Car Park </label>								
									<input type="text" class="form-control" name="car_parking">							
								</div>							
								<div class="mb-3 col-lg-4">          
									<label class="form-label">Waiting Charges </label>								
									<input type="text" class="form-control" name="waiting">							
								</div>							
								<div class="mb-3 col-lg-4">          
									<label class="form-label">Tolls </label>								
									<input type="text" class="form-control" name="tolls">							
								</div>							
								<div class="mb-3 col-lg-4">          
									<label class="form-label">Extra </label>								
									<input type="text" class="form-control" name="extra">							
								</div>																						 
								<div class="mb-3 col-lg-4">
									<label class="form-label">Distance (Auto-calculated)</label>                                
									<input type="text" class="form-control" name="journey_distance" id="journeyDistance" readonly>
								</div>							
																													
								<div class="col-lg-4">                															
									<h4>Send Online Payment Link</h4>										
									<p>							   																		
										<label>							     										
											<input type="checkbox" name="Payment Link" value="checkbox" id="PaymentLink_0">
											Phone Number									
										</label>							   									
										<br>							   									
										<label>							      
											<input type="checkbox" name="Payment Link" value="checkbox" id="PaymentLink_1">
											Email Address									
										</label>							    									
										<br>						      																
									</p>                          													
								</div>										
							</div>					  												
						</div>          										      											
						<div class="modal-footer">           														
							<a href="all-bookings.php" class="btn btn-danger"> 						
								<i class="ti ti-circle-x"></i>						
								Cancel           														
							</a>           																								
							<button type="submit" class="btn btn-success ms-auto">						
								<i class="ti ti-message-plus"></i>						
								Save Booking  																
							</button>					     											
						</div> 										
					</form>	
					<script>
    $(document).ready(function() {
        // Other existing code...

        // Add a click event listener for the "Calculate Fare" button
        $('#calculateFareBtn').on('click', function(e) {
            e.preventDefault(); // Prevent the form from submitting

            // Fetch required values for calculations
            var distance = parseFloat($('#journeyDistance').val());
            var pickDate = new Date($('input[name="pick_date"]').val());
            var pickTime = $('input[name="pick_time"]').val();
            var vehicleId = $('#vehicleSelect').val();

            // Fetch vehicle pricing from the database (you need to implement this)
            var vehiclePricing = parseFloat(fetchVehiclePricing(vehicleId));

            // Calculate base fare: distance * per mile price
            var baseFare = distance * vehiclePricing;

            // Check if pick date is a holiday, increase fare by 10%
            if (isHoliday(pickDate)) {
                baseFare *= 1.1;
            }

            // Check if pick time is between 8 PM and 9 AM, increase fare by 5%
            var pickHour = parseInt(pickTime.split(':')[0], 10);
            if (pickHour < 9 || pickHour >= 20) {
                baseFare *= 1.05;
            }

            // Update the fare field with the calculated fare
            $('#journeyFare').val(baseFare.toFixed(2));
        });

        // Function to fetch vehicle pricing from the server (you need to implement this)
        function fetchVehiclePricing(vehicleId) {
             // Make an AJAX request to the server
        $.ajax({
            type: 'POST',
            url: 'fetch_vehicle_pricing.php', // Create a separate PHP file for this function
            data: { vehicleId: vehicleId },
            success: function(response) {
                // Parse the JSON response
                var data = JSON.parse(response);

                // Callback with the result
                callback(data);
            },
            error: function() {
                // Handle error if needed
            }
        });
            return 15.0; // Replace with actual pricing logic
        }

        // Function to check if a given date is a holiday (you need to implement this)
        function isHoliday(date) {
            // Implement the logic to check if the date is a holiday
            // ...

            // For now, return a placeholder value (false)
            return false;
        }
    });

    function validateForm() {
        // Perform your form validation here
        var typeInput = document.getElementsByName("b_type_id")[0].value;
        var cidInput = document.getElementsByName("c_id")[0].value;
        var pickupInput = document.getElementsByName("pickup")[0].value;
		
        var dropoffInput = document.getElementsByName("dropoff")[0].value;
        var pdateInput = document.getElementsByName("pick_date")[0].value;
        var ptimeInput = document.getElementsByName("pick_time")[0].value;
		
        var fareInput = document.getElementsByName("journey_fare")[0].value;
		

        if (typeInput === "" || cidInput === "" || pickupInput === "" || dropoffInput === "" || pdateInput === "" || ptimeInput === "" || fareInput === "") {
            // Display an error message or prevent the form submission
            alert("Please fill in all required fields.");
            return false;
        }

        // If validation passes, you can proceed with the form submission
        return true;
    }
</script>
				</div>                                                    				
			</div>              			
		</div>		
	</div>
</div>       
<!-- Include the Google Maps API script -->  
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBkPNpPhCg1hVZ14GUWeGpxpSaIL-qPdbU&libraries=places&callback=initAutocomplete"
    async defer></script>
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

    // Add event listeners to update distance on place change        
    autocompletePickup.addListener('place_changed', function () {
        updateDistance();
        updateJourneyFare();
    });        
    autocompleteDropoff.addListener('place_changed', function () {
        updateDistance();
        updateJourneyFare();
    });		        

    // Callback function for handling address suggestions        
    function handleSuggestions(predictions, inputField) {        
        var addresses = predictions.map(function(prediction) {            
            return prediction.description;
        });			            
        updateAutocompleteSuggestions(inputField, addresses);
    }				        

    // Function to update input field with autocomplete suggestions        
    function updateAutocompleteSuggestions(inputField, suggestions) {        
        // You can use a library like jQuery UI Autocomplete or any other method to display suggestions to users            
        // For simplicity, I'll use a basic example using a datalist element            
        var datalistId = inputField.id + '_datalist';            
        var datalist = document.getElementById(datalistId);			            
        if (!datalist) {            
            datalist = document.createElement('datalist');                
            datalist.id = datalistId;                
            document.body.appendChild(datalist);
        }						            

        // Clear previous suggestions            
        datalist.innerHTML = '';			            
        // Add new suggestions            
        suggestions.forEach(function(suggestion) {            
            var option = document.createElement('option');                
            option.value = suggestion;                
            datalist.appendChild(option);
        });						            
        // Link the datalist to the input field            
        inputField.setAttribute('list', datalistId);
    }

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
            var distanceValue = parseFloat(distanceText.replace(/[^\d.]/g, ''));

            if (!isNaN(distanceValue)) {
                // Update the journey distance input field only if it's a valid number
                journeyDistanceInput.value = distanceValue.toFixed(2);
                updateJourneyFare(distanceValue);
            } else {
                console.error('Invalid distance value:', distanceText);
            }
        } else {
            // Handle error if needed
            console.error('Error calculating distance:', status);
        }
    });
}


   

}

    google.maps.event.addDomListener(window, 'load', initAutocomplete);  
</script>	
<?php
include('footer.php');
?>