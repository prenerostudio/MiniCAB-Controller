<?php
include('header.php');
?>       	
<div class="card">					
	<div class="card-header">						
		<h2 class="page-title">              					
			Air Ports List             						
		</h2>					
		<div class="col-auto ms-auto d-print-none">										
			<div class="btn-list">                                 			
				<a href="#" class="btn d-none d-sm-inline-block" data-bs-toggle="modal" data-bs-target="#modal-ap">
					<svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M12 5l0 14" /><path d="M5 12l14 0" /></svg>                   					
					Add Destination                					
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
						<th class="w-1">Airport Name</th>                          																				
						<th >Address</th>                         																				
						<th>City</th>                         																				
						<th>Code</th>                         																				
						
						<th></th>                       																			
					</tr>                     																
				</thead>                    														
				<tbody> 															
					<?php
					$asql=mysqli_query($connect,"SELECT * FROM `airports`");											
					while($arow = mysqli_fetch_array($asql)){																
					?>																								
					<tr align="center">                         																	
						<td>																				
							<?php echo $arow['ap_id']; ?>																					
						</td>                          																				
						<td style="width: 10%;">														
								<?php echo $arow['ap_name']; ?>								
						</td>                        																				
						<td>																					
							<?php echo $arow['ap_address']; ?>																						
						</td>                        																				
						<td>                           																					
							<?php echo $arow['ap_city']; ?>
						</td>                         																				
						<td>                          																					
							<?php echo $arow['ap_code']; ?>
						</td>                         																				
																								
						<td class="text-end">	
							<a href="airport-detail.php?id=<?php echo $arow['ap_id']; ?>">
							<button class="btn align-text-top">View</button>	
							</a>
							<a href="del-airport.php?id=<?php echo $arow['ap_id']; ?>">
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
<div class="modal modal-blur fade" id="modal-ap" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">    	
		<div class="modal-content">        		
			<div class="modal-header">            			
				<h5 class="modal-title">Add Airport</h5>            				
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>          			
			</div> 
			<form method="post" enctype="multipart/form-data" action="airport-process.php">			
				<div class="modal-body">								
					<div class="row">              					
						<div class="col-lg-6">				
							<div class="mb-3">              					
								<label class="form-label">Airport Name</label>              					
								<input type="text" class="form-control" name="ap_name" placeholder="Airport Name">            				
							</div> 						
						</div>              					
						<div class="col-lg-6">                
							<div class="mb-3">                  							
								<label class="form-label">Address</label>              					
								<input type="text" class="form-control" name="ap_address" placeholder="Address">
							</div>             				
						</div>            				
					</div>
								
					<div class="row">              					
						<div class="col-lg-6">				
							<div class="mb-3">              					
								<label class="form-label">City</label>              					
								<input type="text" class="form-control" name="ap_city" placeholder="City">
							</div> 						
						</div>              					
						<div class="col-lg-6">                
							<div class="mb-3">                  
								<label class="form-label">Code</label>              					
								<input type="text" class="form-control" name="ap_code" placeholder=" Air-0004">
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
						Add Airport  
						
					</button>       			
				</div> 								
			</form>		
		</div>      	
	</div>    
</div>   

<?php
include('footer.php');
?>