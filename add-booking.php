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
					<form method="post" action="booking-process.php" enctype="multipart/form-data">				
						<div class="modal-body">													
							<div class="row">							
								<div class="mb-3 col-md-4">    																	
									<label class="form-label">Booking Type</label>
									<select class="form-control" name="b_type_id">
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
								<div class="mb-3 col-lg-4">    																	
									<label class="form-label">Name</label>
									<select class="form-control" name="c_id" id="clientSelect">
										<option value="">Select Customer</option>
										<?php        																			
										$clsql = mysqli_query($connect, "SELECT * FROM `clients`");
										while ($clrow = mysqli_fetch_array($clsql)) {
										?>           																			
										<option value="<?php echo $clrow['c_id'] ?>">
											<?php echo $clrow['c_name'] ?>
										</option>           																			
										<?php       																			
										}				
										?>    																	
									</select>																								
								</div>																							
								<div class="mb-3 col-lg-4">  																
									<label class="form-label">Customer Phone</label>
									<input type="text" class="form-control" name="cphone" id="customerPhone" readonly>
								</div>				
								<div class="mb-3 col-lg-4">   																	
									<label class="form-label">Customer Email</label>
									<input type="text" class="form-control" name="cemail" id="customerEmail" readonly>
								</div>															
								<script>   																	
									var clientSelect = document.getElementById('clientSelect');
									var customerPhoneInput = document.getElementById('customerPhone');
									var customerEmailInput = document.getElementById('customerEmail');
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
									<input type="text" id="pickup" name="pickup" class="form-control" placeholder="Select pickup location">
								</div>																	
								<div class="mb-3 col-lg-4">    								
									<label class="form-label">Drop-off Location:</label>    									
									<input type="text" id="dropoff" name="dropoff" class="form-control" placeholder="Select drop-off location">									
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
									<input type="number" class="form-control" name="passenger">							
								</div> 																				
								<div class="mb-3 col-lg-4">
									<label class="form-label">Pickup Date</label>								
									<input type="date" class="form-control" name="pick_date">							
								</div>														
								<div class="mb-3 col-lg-4">
									<label class="form-label">Pickup Time</label>								
									<input type="time" class="form-control" name="pick_time">							
								</div>																
								<div class="mb-3 col-lg-4">								
									<div class="form-label">Journey Type</div>																
									<div class="mb-3">
										<label class="form-check form-check-inline">										
											<input class="form-check-input" type="radio" name="journey_type" checked="" value="One Way">
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
											<input class="form-check-input" type="radio" name="child_seat" checked="" value="Yes">
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
								<div class="mb-3 col-lg-4">										
									<label class="form-label">Jouney Fare</label>								
									<input type="text" class="form-control"  name="journey_fare" id="journeyFare" >							
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
							<a href="#" class="btn btn-danger" data-bs-dismiss="modal"> 						
								<i class="ti ti-circle-x" style="margin-right: 10px; font-size: 20px;"></i>						
								Cancel           														
							</a>           																								
							<button type="submit" class="btn btn-success ms-auto" data-bs-dismiss="modal">						
								<i class="ti ti-message-plus" style="margin-right: 10px; font-size: 20px;"></i>						
								Save Booking  																
							</button>					     											
						</div> 										
					</form>																		
				</div>                                                    				
			</div>              			
		</div>		
	</div>
</div>       
<!-- Include the Google Maps API script -->  
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBkPNpPhCg1hVZ14GUWeGpxpSaIL-qPdbU&libraries=places&callback=initAutocomplete"
    async defer></script>
<script>
	
function updateJourneyFare() {
    var vehicleSelect = document.getElementById('vehicleSelect');
    var journeyDistanceInput = document.getElementById('journeyDistance');
    var journeyFareInput = document.getElementById('journeyFare');
    var selectedVehicleId = vehicleSelect.value;

    // Make an AJAX request to get the per mile price for the selected vehicle
    $.ajax({
        type: 'POST',
        url: 'get_vehicle_pricing.php',
        data: { v_id: selectedVehicleId },
        success: function (response) {
            try {
                var data = JSON.parse(response);
                if (data.success) {
                    var perMilePrice = parseFloat(data.price);
                    var distanceValue = parseFloat(journeyDistanceInput.value);

                    if (!isNaN(perMilePrice) && !isNaN(distanceValue)) {
                        var journeyFare = perMilePrice * distanceValue;
                        journeyFareInput.value = journeyFare.toFixed(2);
                    } else {
                        console.error('Invalid per mile price or journey distance');
                    }
                } else {
                    console.error('Invalid per mile price: ' + response);
                }
            } catch (error) {
                console.error('Error parsing JSON response: ' + error);
            }
        },
        error: function (error) {
            console.error('Error fetching per mile price: ' + JSON.stringify(error));
        }
    });
}


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