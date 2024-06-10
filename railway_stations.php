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
				Railway Stations                							
			</h2>              					
		</div>						
	</div>	
</div>
<div class="page-body page_padding">          	
	<div class="row row-deck row-cards">					 						
		<div class="col-8">       		
			<div class="card">            			
				<div class="card-header">                				
					<h3 class="card-title">
						Railway Stations List
					</h3>            					
				</div>            				
				<div class="card-body border-bottom py-3">                				
					<div id="table-adriver" class="table-responsive">                    					
						<table class="table" id="railways">                        						
							<thead>                            							
								<tr>                                								
									<th>ID</th>
									<th>Station Name</th>
									<th>Address</th>
									<th>Actions</th>
								</tr>                       								
							</thead>                       													
							<tbody class="table-tbody">                        													
								<?php                            														
								$x = 0;                            														
								$dsql = mysqli_query($connect, "SELECT * FROM `railway_stations`");
								while ($drow = mysqli_fetch_array($dsql)) :								
								$x++;                            														
								?>								
								<tr>                            															
									<td>																	
										<?php echo $x; ?>																	
									</td>			
									<td>									
										<?php echo $drow['rail_name']; ?>											
									</td>                             									
									<td>									
										<?php echo $drow['rail_address']; ?>										
									</td>			
									<td> 									
										<a href="del-destination.php?des_id=<?php echo $drow['des_id']; ?>" class="btn btn-danger" title="Delete">						
											<i class="ti ti-square-rounded-x"></i>
										</a>													
									</td>												
								</tr>                          														
								<?php endwhile; ?>								
								<?php if ($x === 0) : ?>								
								<tr>                                   															
									<td colspan="8">																	
										<p align="center">
											No Railway Station Found!
										</p>
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
				$('#railways').DataTable();
			});		
		</script>
		<div class="col-4">		
			<div class="card">			
				<div class="card-header">				
					<h3 class="card-title">
						Railway Stations List
					</h3>
				</div>
				<div class="card-body border-bottom py-3">														
					<form method="post" enctype="multipart/form-data" action="railyway-process.php">							
						<div class="modal-body">													
							<div class="row">
								<div class="mb-3">								
									<label class="form-label">Station Name</label>									
									<input type="text" class="form-control" name="r_name" placeholder="Railway Station Name" required>									
								</div>			
								<div class="mb-3">								
									<label class="form-label">Address</label>									
									<input type="text" class="form-control" name="r_address" id="pickup" placeholder="Address" required>									
								</div>
							</div>          				          				
						</div>				        			
						<div class="modal-footer">					
							<button type="reset" class="btn btn-danger"> 						
								<i class="ti ti-circle-x"></i>						
								Cancel           									
							</button>          									
							<button type="submit" class="btn ms-auto btn-success">
								<i class="ti ti-map-pin-plus"></i>						
								Save Station											
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
		var r_nameInput = document.getElementsByName("r_name")[0].value;        		
		var r_addressInput = document.getElementsByName("r_address")[0].value;        				
		if (r_nameInput === "" || r_addressInput === "") {		
			alert("Please fill in all required fields.");			
			return false;			
		}		
		return true;    		
	}	 
	var autocompletePickup;   
	function initAutocomplete() {
        var pickupInput = document.getElementById('pickup');
        var autocompleteOptions = {
            types: ['establishment'],
            componentRestrictions: {country: 'GB'}
        };
        autocompletePickup = new google.maps.places.Autocomplete(pickupInput, autocompleteOptions);
        autocompletePickup.addListener('place_changed', function() {            
        });
    }       
    google.maps.event.addDomListener(window, 'load', initAutocomplete);	
</script>
<?php
include('footer.php');
?>