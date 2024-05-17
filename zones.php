<?php
include('header.php');
?>  
<div class="page-header d-print-none page_padding">		   		
	<div class="row g-2 align-items-center">        	
		<div class="col">            								
			<div class="page-pretitle">                			
				Overview                				
			</div>                			
			<h2 class="page-title">                			
				Zones Section                				
			</h2>              			
		</div>		
		<div class="col-auto ms-auto d-print-none">            		
			<div class="btn-list">                			
				<a href="#" class="btn btn-primary d-none d-sm-inline-block" data-bs-toggle="modal" data-bs-target="#modal-zone">  											
					<i class="ti ti-map-pin-plus"></i>                    					
					Add Zone                 					
				</a>                  				
				           				
			</div>              			
		</div>		
	</div>	
</div>
<div class="page-body page_padding">          	
	
	<div class="row row-deck row-cards">			
		  
					
		
	
		<div class="col-12">       
		
			<div class="card">            
			
				<div class="card-header">                
				
					<h3 class="card-title">Zones List</h3>            
					
				</div>            
				
				<div class="card-body border-bottom py-3">                
				
					<div id="table-adriver" class="table-responsive">                    
					
						<table class="table">                        
						
							<thead>                            
							
								<tr>                                
								
									<th>
									
										<button class="table-sort" data-sort="sort-id">ID</button>
										
									</th>                                
									
									<th>
									
										<button class="table-sort" data-sort="sort-date">
											Starting Point
										</button>
											
									</th>                                
									
									
									<th>
									
										
										<button class="table-sort" data-sort="sort-time">
											End Point
										</button>
													
									</th>                                
												
									<th>
														
										<button class="table-sort" data-sort="sort-passenger">
											Distance
										</button>
													
									</th>                                
													
									<th>
													
										<button class="table-sort" data-sort="sort-pickup">
											Fare (£)
										</button>
													
									</th>       
													
									<th>
													
										<button class="table-sort">Actions</button>
													
									</th>                            
												
								</tr>                       
											
							</thead>                       						
										
							<tbody class="table-tbody">                        						
											
								<?php                            						
											
								$x = 0;                            						
										
								$zsql = mysqli_query($connect, "SELECT * FROM `zones`");   						
								
								while ($zrow = mysqli_fetch_array($zsql)) :
								
								$x++;                            						
								
								?>
								
								<tr>                            							
								
									<td class="sort-id">								
									
										<?php echo $x; ?>							
										
									</td>                                   							
									
									<td class="sort-date">
									
										<?php echo $zrow['starting_point']; ?>	
										
									</td>                                   							
									
									<td class="sort-time">								
									
										<?php echo $zrow['end_point']; ?>							
										
									</td>                                  							
									
									<td class="sort-passenger">									
									
										<?php echo $zrow['distance']; ?>								
										
									</td>                                 								
									
									<td class="sort-pickup">								
									
										<?php echo $zrow['fare']; ?>							
										
									</td>                                 							
									
									
									
									<td>									
									
										<a href="zone-details.php?z_id=<?php echo $zrow['zone_id']; ?>">
										
											<button class="btn btn-info">
											
												<i class="ti ti-eye"></i>
												
												View
												
											</button>                                        
											
										</a>                                       
										
										<a href="del-zone.php?z_id=<?php echo $zrow['zone_id']; ?>">
										
											<button class="btn btn-danger">
											
												<i class="ti ti-square-rounded-x"></i>
												
												Delete
												
											</button>														
											
										</a>                                   
										
									</td>
									
								</tr>                          						
								
								<?php endwhile; ?>                         							
								
								<?php if ($x === 0) : ?>
								
								<tr>                                   							
								
									<td colspan="8">								
									
										<p align="center">No Zone Found!</p>								
										
									</td>                              							
									
								</tr>                           							
								
								<?php endif; ?>                        						
								
							</tbody>                   					
							
						</table>               							
						
					</div>           						
					
				</div>       							
				
			</div>   						
			
		</div>					
		
		

		
	</div>
                
	
</div>
            
 
<script>	
	document.addEventListener("DOMContentLoaded", function() {    		
		const list = new List('table-default', {      					
			sortClass: 'table-sort',      							
			listClass: 'table-tbody',      							
			valueNames: [ 'sort-id', 'sort-date', 'sort-time', 'sort-fare',						 
						 'sort-driver'						
						]					
		}); 			
	})	
</script>

<!-------------------------------
----------Add Zone---------------
-------------------------------->
<div class="modal modal-blur fade" id="modal-zone" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">    	
		<div class="modal-content">        		
			<div class="modal-header">            			
				<h5 class="modal-title">Add New Zone</h5>            				
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div> 
			<form method="post" enctype="multipart/form-data" action="zone-process.php" onsubmit="return validateForm();" >			
				<div class="modal-body">								
					<div class="row">              					
						<div class="col-lg-6">				
							<div class="mb-3">              					
								<label class="form-label">Starting Point</label>
								<input type="text" class="form-control" id="pickup" name="sp" placeholder="Starting Point">            				
							</div> 						
						</div>              					
						<div class="col-lg-6">                
							<div class="mb-3">                  							
								<label class="form-label">Ending Point</label>
								<input type="text" class="form-control" id="dropoff" name="ep" placeholder="Ending Point">
							</div>             				
						</div>            				
					</div>			
					<div class="row">              					
						<div class="col-lg-6">				
							<div class="mb-3">              					
								<label class="form-label">Distance(KM)</label>
								<input type="text" class="form-control" name="dis" placeholder="Kilo Meters">
							</div> 						
						</div>              					
						<div class="col-lg-6">                
							<div class="mb-3">                  
								<label class="form-label">Fare</label>              					
								<input type="number" class="form-control" name="fare" placeholder=" £ 00.00">
							</div>             					
						</div>            				
					</div>			          				          
				</div>			
				<div class="modal-footer">           
					<a href="#" class="btn btn-danger" data-bs-dismiss="modal"> 
						<i class="ti ti-circle-x"></i>
						Cancel           				
					</a>           				
					<button type="submit" class="btn ms-auto btn-success" data-bs-dismiss="modal">
						<i class="ti ti-message-plus"></i>
						Save Zone
					</button>       			
				</div> 								
			</form>		
		</div>      	
	</div>    
</div>  

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBkPNpPhCg1hVZ14GUWeGpxpSaIL-qPdbU&libraries=places&callback=initAutocomplete"
    async defer></script>


<script>
	function validateForm() {                							
		var spInput = document.getElementsByName("sp")[0].value;        		
		var epInput = document.getElementsByName("ep")[0].value;        		
		var fareInput = document.getElementsByName("fare")[0].value;
		if (spInput === "" || epInput === "" || fareInput === "") {		
			alert("Please fill in all required fields.");			
			return false;			
		}		
		return true;    		
	}
	
	function initAutocomplete() {        
        var pickupInput = document.getElementById('pickup');
        var dropoffInput = document.getElementById('dropoff');

        var autocompleteOptions = {
            types: ['geocode'],
            componentRestrictions: {country: 'GB'}
        };

        var autocompletePickup = new google.maps.places.Autocomplete(pickupInput, autocompleteOptions);
        var autocompleteDropoff = new google.maps.places.Autocomplete(dropoffInput, autocompleteOptions);
        
        autocompletePickup.addListener('place_changed', function() {
            var place = autocompletePickup.getPlace();
            if (!place.geometry) {
                console.error("Place not found");
                return;
            }
        });
        
        autocompleteDropoff.addListener('place_changed', function() {
            var place = autocompleteDropoff.getPlace();
            if (!place.geometry) {
                console.error("Place not found");
                return;
            }
        });
   
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


 $('#modal-zone').on('shown.bs.modal', function () {
        initAutocomplete();
    });
	
</script>
<?php
include('footer.php');
?>