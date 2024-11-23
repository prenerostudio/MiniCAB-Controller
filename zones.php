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
	
    </div>	
</div>
<div class="page-body page_padding">          		

    <div class="row row-deck row-cards">					  									

        <div class="col-6">       				
	
            <div class="card">            						
	
                <div class="card-header">                								
		
                    <h3 class="card-title">
		
                        Zones List
			
                    </h3>            									
		
                </div>            								
		
                
		
                <div class="card-body border-bottom py-3">
		
                    <div id="table-adriver" class="table-responsive">
		
                        <table class="table" id="zones">						
			
                            <thead>
			
                                <tr>									
				
                                    <th>ID</th>									
				
                                    <th>Zone Address</th>									
				
                                    <th>Actions</th>
				
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
				
                                    <td>									
				
						<?php echo $x; ?>									

                                    </td>
				
                                    <td>
				
						<?php echo $zrow['zone_name'];?>

                                    </td>									               									
				
                                    <td>										
				
                                        <a href="del-zone.php?z_id=<?php echo $zrow['zone_id']; ?>" class="btn btn-danger" title="Delete">
					
                                            <i class="ti ti-square-rounded-x"></i>
					
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
	
        <script>	
	
    $(document).ready(function() {    

        $('#zones').DataTable();
	
    });		

        </script>
	
        <div class="col-6">       				
	
            <div class="card">            						
	
                <div class="card-header">                								
		
                    <h3 class="card-title">
		
                        Add New Zone
			
                    </h3>            									
		
                </div>            								
		
                <div class="card-body border-bottom py-3">                									
		
                    <form method="post" enctype="multipart/form-data" action="zone-process.php" onsubmit="return validateForm();" >                       
		
                        <div class="modal-body">                                                 
			
                            <div class="row">                                              
			
                                
				
                                <div class="mb-3">                                                      
				
                                    <label class="form-label">Zone Address</label>                                
				
                                    <input type="text" class="form-control" id="pickup" name="za" placeholder="Starting Point" required>            
				
                                </div>                                              
				
                                
								                                          
				
                            </div>                              
			
                            
			
                        </div>                          
			
                        <div class="modal-footer">                               
			
                            
			
                            <button type="submit" class="btn ms-auto btn-success">                        
			
                                <i class="ti ti-message-plus"></i>                        
				
                                Save Zone                    
				
                            </button>                                   
			
                        </div>                                             
			
                    </form>           											
		
                </div>       														
		
            </div>   											
	
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
    
    var autocompletePickup;
    
    var autocompleteDropoff;
    var journeyDistanceInput;
    function initAutocomplete() {
        var pickupInput = document.getElementById('pickup');
        var dropoffInput = document.getElementById('dropoff');
        journeyDistanceInput = document.getElementById('journeyDistance');
        var autocompleteOptions = {
            types: ['geocode'],
            componentRestrictions: {country: 'GB'}
        };
        autocompletePickup = new google.maps.places.Autocomplete(pickupInput, autocompleteOptions);
        autocompleteDropoff = new google.maps.places.Autocomplete(dropoffInput, autocompleteOptions);        
        autocompletePickup.addListener('place_changed', function() {
            updateDistance();
        });        
        autocompleteDropoff.addListener('place_changed', function() {
            updateDistance();
        });
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
                } else {
                    console.error('Invalid distance value:', distanceText);
                }
            } else {
                console.error('Error calculating distance:', status);
            }
        });
    }    
    google.maps.event.addDomListener(window, 'load', initAutocomplete);
</script>
<?php
include('footer.php');
?>