<?php
include('header.php');
?>       	
<div class="card">					
	<div class="card-header">						
		<h2 class="page-title">              					
			Vehicles List             						
		</h2>					
		<div class="col-auto ms-auto d-print-none">										
			<div class="btn-list">                                 			
				<a href="#" class="btn d-none d-sm-inline-block" data-bs-toggle="modal" data-bs-target="#modal-vehicle">
					<svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M12 5l0 14" /><path d="M5 12l14 0" /></svg>                   					
					Add New Vehicle                  					
				</a>                 				
			</div>              			
		</div>								
	</div>            			
	<div class="card-body">            			
		<div id="table-default" class="table-responsive">            					
			<table class="table card-table table-vcenter text-nowrap datatable" id="vehicle_table">                   												
				<thead>                   															
					<tr align="center">                          																		
						<th class="w-1">ID</th>                         																				
						<th class="w-1">Pic</th>                          																				
						<th >Name</th>                         																				
						<th>Seat</th>                         																				
						<th>Bags</th>                         																				
						<th>Wheel Chair</th>                         																				
						<th>Trailer</th>
						<th>Booster</th>
						<th>Baby Sitter</th>
						<th>Pricing</th>
						<th></th>                       																			
					</tr>                     																
				</thead>                    														
				<tbody> 															
					<?php
					$vsql=mysqli_query($connect,"SELECT * FROM `vehicles`");											
					while($vrow = mysqli_fetch_array($vsql)){																
					?>																								
					<tr align="center">                         																	
						<td>																				
							<?php echo $vrow['v_id']; ?>																					
						</td>                          																				
						<td style="width: 10%;">														
							<?php															
						if (!$vrow['v_img']) {																							
							?>																									
							<img src="img/drivers/user-1.jpg" alt="Driver dp" style="width: 60px; border-radius: 30px;">
							<?php															
						} else{                                            													
							?>                                         															
							<img src="<?php echo $vrow['v_img'];?>" alt="Driver dp" style="width: 60px; border-radius: 30px;">
							<?php
						}                                          																							
							?>										
						</td>                        																				
						<td>																					
							<?php echo $vrow['v_name']; ?>																						
						</td>                        																				
						<td>                           																					
							<?php echo $vrow['v_seat']; ?>
						</td>                         																				
						<td>                          																					
							<?php echo $vrow['v_bags']; ?>
						</td>                         																				
						<td>                           																					
							<?php echo $vrow['v_wchair']; ?>															
						</td>                          																				
						<td>                            																					
							<?php echo $vrow['v_trailer']; ?>															
						</td>	
						<td>                            																					
							<?php echo $vrow['v_booster']; ?>															
						</td>	
						<td>                            																					
							<?php echo $vrow['v_baby']; ?>															
						</td>	
						<td>                            																					
							<?php echo $vrow['v_pricing']; ?>															
						</td>	
						<td class="text-end">	
							<a href="vehicle-details.php?id=<?php echo $vrow['v_id']; ?>">
							<button class="btn align-text-top">View</button>	
							</a>
							<button class="btn btn-danger align-text-top">Delete</button>																			
						</td>                       																			
					</tr>                              																	
					<?php																				
					}																				
					?>																					
				</tbody>                    													
			</table>                			
		</div>            		
	</div>        	
</div>    



<!-------------------------------
----------Add Vehicle-------------
-------------------------------->
<div class="modal modal-blur fade" id="modal-vehicle" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">    	
		<div class="modal-content">        		
			<div class="modal-header">            			
				<h5 class="modal-title">Add New Vehicle</h5>            				
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>          			
			</div> 
			<form method="post" enctype="multipart/form-data" action="vehicle-process.php">			
				<div class="modal-body">								
					<div class="row">              					
						<div class="col-lg-6">				
							<div class="mb-3">              					
								<label class="form-label">Vehicle Name</label>              					
								<input type="text" class="form-control" name="vname" placeholder="Vehicle Name">            				
							</div> 						
						</div>              					
						<div class="col-lg-6">                
							<div class="mb-3">                  							
								<label class="form-label">No. of Seats</label>              					
								<input type="number" class="form-control" name="seats">
							</div>             				
						</div>            				
					</div>								
					<div class="row">              					
						<div class="col-lg-6">				
							 <div class="mb-3">								                                                        
								 <label class="form-check form-switch">                              
									 <input class="form-check-input" type="checkbox" name="bags" value="Yes">                             
									 <span class="form-check-label">Air Bags</span>                            
								 </label>								 
								  <label class="form-check form-switch">                              
									 <input class="form-check-input" type="checkbox" name="wchair" value="Yes">                             
									 <span class="form-check-label">Wheel CHair</span>                            
								 </label>								 
								  <label class="form-check form-switch">                              
									 <input class="form-check-input" type="checkbox" name="trailer" value="Yes">                             
									 <span class="form-check-label">Trailer</span>                            
								 </label>								 								                          
							</div> 												
						</div>              					
						<div class="col-lg-6">                
							<div class="mb-3">
							 <label class="form-check form-switch">                              
									 <input class="form-check-input" type="checkbox" name="booster" value="Yes" >                             
									 <span class="form-check-label">Booster</span>                            
								 </label>								 
								 <label class="form-check form-switch">                              
									 <input class="form-check-input" type="checkbox" name="babyc" value="Yes" >                             
									 <span class="form-check-label">Baby Carriers</span>                            
								 </label>																					
							</div>          					
						</div>            				
					</div>				
					<div class="row">              					
						<div class="col-lg-6">				
							<div class="mb-3">                  							
								<label class="form-label">Pricing </label>              					
								<input type="number" class="form-control" name="pricing">      						
							</div> 					
						</div>              					
						<div class="col-lg-6">                
							<div class="mb-3">                  							
								<label class="form-label">Image</label>              					
								<input type="file" class="form-control" name="v_img">      						
							</div>             					
						</div>            				
					</div>														          				          
				</div>          							        			
				<div class="modal-footer">           
					<a href="#" class="btn btn-link link-secondary" data-bs-dismiss="modal">             					
						Cancel           				
					</a>           				
					<button type="submit" class="btn ms-auto" data-bs-dismiss="modal">						
						<svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M12 5l0 14" /><path d="M5 12l14 0" /></svg>
						Add New Vehicles						
					</button>       			
				</div> 								
			</form>		
		</div>      	
	</div>    
</div>   


<script>  
	$(document).ready(function(){       
		$('#vehicle_table').DataTable();   
	});   
</script> 


<?php
include('footer.php');
?>