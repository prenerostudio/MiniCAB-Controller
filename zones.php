<?php
include('header.php');
?>       	
<div class="card">					
	<div class="card-header">						
		<h2 class="page-title">              					
			Zones List             						
		</h2>					
		<div class="col-auto ms-auto d-print-none">										
			<div class="btn-list">                                 			
				<a href="#" class="btn d-none d-sm-inline-block" data-bs-toggle="modal" data-bs-target="#modal-zone">
					<svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M12 5l0 14" /><path d="M5 12l14 0" /></svg>                   					
					Add New Zone                  					
				</a>                 				
			</div>              			
		</div>								
	</div>            			
	<div class="card-body">            			
		<div id="table-default" class="table-responsive">            					
			<table class="table card-table table-vcenter text-nowrap datatable">                   												
				<thead>                   															
					<tr align="center">                          																		
						<th class="w-1">ID</th>                         																				
						<th class="w-1">Starting Point</th>                          																				
						<th >Ending Point</th>                         																				
						<th>Distance</th>                         																				
						<th>Fare</th>                         																				
						
						<th></th>                       																			
					</tr>                     																
				</thead>                    														
				<tbody> 															
					<?php
					$zsql=mysqli_query($connect,"SELECT * FROM `zones`");											
					while($zrow = mysqli_fetch_array($zsql)){																
					?>																								
					<tr align="center">                         																	
						<td>																				
							<?php echo $zrow['zone_id']; ?>																					
						</td>                          																				
						<td style="width: 10%;">														
								<?php echo $zrow['starting_point']; ?>								
						</td>                        																				
						<td>																					
							<?php echo $zrow['end_point']; ?>																						
						</td>                        																				
						<td>                           																					
							<?php echo $zrow['distance']; ?>
						</td>                         																				
						<td>                          																					
							<?php echo $zrow['fare']; ?>
						</td>                         																				
																								
						<td class="text-end">	
							<a href="zone-detail.php?id=<?php echo $zrow['zone_id']; ?>">
							<button class="btn align-text-top">View</button>	
							</a>
							<a href="del-zone.php?id=<?php echo $zrow['zone_id']; ?>">
								<button class="btn btn-danger align-text-top">Delete</button>											</a>								

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
----------Add Zone-------------
-------------------------------->
<div class="modal modal-blur fade" id="modal-zone" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">    	
		<div class="modal-content">        		
			<div class="modal-header">            			
				<h5 class="modal-title">Add New Zone</h5>            				
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>          			
			</div> 
			<form method="post" enctype="multipart/form-data" action="zone-process.php">			
				<div class="modal-body">								
					<div class="row">              					
						<div class="col-lg-6">				
							<div class="mb-3">              					
								<label class="form-label">Starting Point</label>              					
								<input type="text" class="form-control" name="sp" placeholder="Starting Point">            				
							</div> 						
						</div>              					
						<div class="col-lg-6">                
							<div class="mb-3">                  							
								<label class="form-label">Ending Point</label>              					
								<input type="text" class="form-control" name="ep" placeholder="Ending Point">
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
					<a href="#" class="btn btn-link link-secondary" data-bs-dismiss="modal">             					
						Cancel           				
					</a>           				
					<button type="submit" class="btn ms-auto" data-bs-dismiss="modal">
						
						<svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M12 5l0 14" /><path d="M5 12l14 0" /></svg>
						Add Zone  
						
					</button>       			
				</div> 								
			</form>		
		</div>      	
	</div>    
</div>   

<?php
include('footer.php');
?>