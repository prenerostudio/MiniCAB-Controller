<div class="card-body">            																	
	<h2 class="mb-4">	
		Meet & Greet Charges		
	</h2>    															
	<p align="justify">	
		When picking up a <strong>MiniCAB</strong> customer at the airport, we expect that the driver is available to meet & greet the customer as they arrive and direct them to the car. The price that you appear for on the site should therefore include any meet and greet charges you may have. Using the below tool you can add any fees you may have and these will automatically be added on top of any price you appear for on the minicaboffice.com website regardless of whether this has been calculated via by mileage, location or postcode area pricing.<br><br>		
		This flat fee will apply for your selected location as well as 0.2 miles around the location to ensure that the charge still applies for nearby locations also.<br><br>		
		If you charge a meet and greet charge for a location that you can’t find below, please request this via email to admin@minicaboffice.com.<br><br>		
		Please add reasonable pickup charges for these airports, as relevant. Any requests to add reasonable pickup charges for other venues can be sent to admin@minicaboffice.com, for the MiniCAB  team to consider.</p>
	<div class="row">							
		<table class="table">									
			<tbody>											
				<tr>													
					<td>Pickup Locations</td>															
					<td>Pickup Charges</td>															
					<td></td>															
				</tr>													
				<form action="mg_process.php" method="post">				
					<tr>																	
						<td style="width: 50%;">
							<input type="text" name="pickup" class="form-control" id="pickup_location" required />
						</td>																	
						<td>																	
							<div class="input-group mb-3"> 
								<div class="input-group-prepend">								
									<span class="input-group-text">									
										£										
									</span> 									
								</div>
								<input type="text" name="price" class="form-control" aria-label="Amount (to the nearest pound)" required />								
							</div>																			
						</td>																	
						<td>																	
																									
						</td>																	
					</tr>	
					<tr>																	
						<td style="width: 50%;">
							<input type="text" name="pickup" class="form-control" id="pickup_location" required />							
						</td>																	
						<td>																	
							<div class="input-group mb-3"> 
								<div class="input-group-prepend">								
									<span class="input-group-text">									
										£										
									</span> 									
								</div>
								<input type="text" name="price" class="form-control" aria-label="Amount (to the nearest pound)" required />								
							</div>																			
						</td>																	
						<td>																	
							<button type="submit" class="btn btn-success" style="width: 100%;">							
								<i class="ti ti-plus"></i>
								Add																					
							</button>																			
						</td>																	
					</tr>		
				</form>													
			</tbody>			
		</table>									
	</div>																				
	<div class="row">																					
		<table class="table table-responsive">															
			<tbody>											
				<tr>													
					<td>ID</td>															
					<td>Pickup Locations</td>					
					<td>Pickup Charges</td>															
					<td></td>
				</tr>													
				<?php													
				$n=0;													
				$mgsql=mysqli_query($connect,"SELECT * FROM `mg_charges`");													
				while($mgrow = mysqli_fetch_array($mgsql)){				
					$n++;															
				?>													
				<tr>														
					<td style="width: 4%;">					
						<?php echo $n; ?>																	
					</td>															
					<td style="width: 50%;">					
						<?php echo $mgrow['pickup_location'] ?>																	
					</td>															
					<td>															
						<?php echo $mgrow['pickup_charges'] ?>																	
					</td>															
					<td>
						<a href="edit-mg.php?mg_id=<?php echo $mgrow['mg_id']; ?>">						
							<button class="btn btn-info">								
								<i class="ti ti-pencil"></i>
							</button>							
						</a>
						<a href="del-mg.php?mg_id=<?php echo $mgrow['mg_id'];?>">						
							<button class="btn btn-danger">
								<i class="ti ti-square-rounded-x"></i>
							</button>							
						</a>																	
					</td>															
				</tr>													
				<?php													
				}													
				?>													
			</tbody>											
		</table>									
	</div>																		
</div>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBkPNpPhCg1hVZ14GUWeGpxpSaIL-qPdbU&libraries=places&callback=initAutocomplete"
    async defer></script>
<script>	
	function initAutocomplete() {        
    var pickupInput = document.getElementById('pickup_location');            
                
    var autocompleteOptions = {        
        types: ['geocode'],                    
        componentRestrictions: {country: 'GB'}    
    };				            
    var autocompletePickup = new google.maps.places.Autocomplete(pickupInput, autocompleteOptions);
    var autocompleteDropoff = new google.maps.places.Autocomplete(dropoffInput, autocompleteOptions);
    var autocompleteStop = new google.maps.places.Autocomplete(stopInput, autocompleteOptions); // Initialize autocomplete for stop field

    autocompletePickup.addListener('place_changed', function () {        
        updateDistance();        
        updateJourneyFare();    
    });            
    autocompleteDropoff.addListener('place_changed', function () {
        updateDistance();        
        updateJourneyFare();    
    });	
    autocompleteStop.addListener('place_changed', function () { // Add listener for stop input field
        updateDistance();        
        updateJourneyFare();    
    });

    function handleSuggestions(predictions, inputField) {        
        var addresses = predictions.map(function(prediction) {            
            return prediction.description;        
        });			                    
        updateAutocompleteSuggestions(inputField, addresses);    
    }				        

    function updateAutocompleteSuggestions(inputField, suggestions) {        
        var datalistId = inputField.id + '_datalist';                    
        var datalist = document.getElementById(datalistId);			                    
        if (!datalist) {            
            datalist = document.createElement('datalist');                            
            datalist.id = datalistId;                            
            document.body.appendChild(datalist);        
        }						            
        datalist.innerHTML = '';			                    
        suggestions.forEach(function(suggestion) {            
            var option = document.createElement('option');                            
            option.value = suggestion;                            
            datalist.appendChild(option);        
        });						                    
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
                    journeyDistanceInput.value = distanceValue.toFixed(2);                
                    updateJourneyFare(distanceValue);            
                } else {                
                    console.error('Invalid distance value:', distanceText);            
                }       
            } else {            					            
                console.error('Error calculating distance:', status);        
            }    
        });	
    }   
}	
	google.maps.event.addDomListener(window, 'load', initAutocomplete);  
</script>	