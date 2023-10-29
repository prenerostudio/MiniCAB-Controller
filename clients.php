<?php
include('header.php');
?>          	
<div class="card">			
	<div class="card-header">				
		<h2 class="page-title">              		
			Clients List             			
		</h2>		
		<div class="col-auto ms-auto d-print-none">        
			<div class="btn-list">            				                  
				<a href="#" class="btn d-none d-sm-inline-block" data-bs-toggle="modal" data-bs-target="#modal-client">    
					<svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M12 5l0 14" /><path d="M5 12l14 0" /></svg>                   
					Add New Client                  
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
						<th class="w-1">Pic</th>                          													
						<th>Name</th>                         													
						<th>Phone</th>                         													
						<th>Gender</th>                         													
						<th>Language</th>                         													
						<th>National ID</th>							
						<th>Action</th>                       												
					</tr>                     										
				</thead>                    									
				<tbody> 										
					<?php																																
					$csql=mysqli_query($connect,"SELECT * FROM `clients`");					
					while($crow = mysqli_fetch_array($csql)){							
					?>																		
					<tr align="center">                         											
						<td>													
							<?php echo $crow['c_id']; ?>													
						</td>                          													
						<td style="width: 10%;">							
							<?php							
						if (!$crow['c_pic']) {																
							?>																	
							<img src="img/clients/user-1.jpg" alt="Driver dp" style="width: 60px; border-radius: 30px;">							
							<?php							
						} else{                                            						
							?>                                         							
							<img src="<?php echo $crow['c_pic'];?>" alt="Driver dp" style="width: 60px; border-radius: 30px;">				
							<?php                                         																						
						}                                          																							
							?>							
						</td>                        																	
						<td>																		
							<?php echo $crow['c_name']; ?>																	
						</td>                        																
						<td>                           														
							<?php echo $crow['c_phone']; ?>                     														
						</td>                         													
						<td>                          														
							<?php echo $crow['c_gender']; ?>                     														
						</td>                         													
						<td>                           														
							<?php echo $crow['c_language']; ?>                      														
						</td>                          													
						<td>                            														
							<?php echo $crow['c_ni']; ?>                        														
						</td>                 									
						<td class="text-end">                            								
						
							<a href="client-details.php?id=<?php echo $crow['c_id']; ?>">							
							<button class="btn align-text-top">View</button>
							</a>
							
							<a href="del-client.php?id=<?php echo $crow['c_id']; ?>">
							<button class="btn btn-danger align-text-top">Delete</button>
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
    
</div>



<!-------------------------------
----------Add Client-------------
-------------------------------->
<div class="modal modal-blur fade" id="modal-client" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">    
		<div class="modal-content">        
			<div class="modal-header">            
				<h5 class="modal-title">Add New Client</h5>            
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>          
			</div> 
			<form method="post" action="client-process.php" enctype="multipart/form-data">
			<div class="modal-body">
				
				<div class="row">              
					<div class="col-lg-6">
				<div class="mb-3">              
					<label class="form-label">Client Name</label>              
					<input type="text" class="form-control" name="cname" placeholder="Passenger Name">            
				</div> 
						</div>              
					<div class="col-lg-6">                
						<div class="mb-3">                  
							<label class="form-label">Email</label>              
					<input type="text" class="form-control" name="cemail" placeholder="hello@example.com">      
						</div>             
					</div>            
				</div>
				
				<div class="row">              
					<div class="col-lg-6">
				<div class="mb-3">              
					<label class="form-label">Password</label>              
					<input type="password" class="form-control" name="cpass" placeholder="xxxxxxxx">            
				</div> 
						</div>              
					<div class="col-lg-6">                
						<div class="mb-3">                  
							<label class="form-label">Phone</label>              
					<input type="text" class="form-control" name="cphone" placeholder="+44 20 7123 4567">      
						</div>             
					</div>            
				</div>
								
				<div class="row">              										
					<div class="col-lg-6">										
						<div class="mb-3">              									
							<label class="form-label">Gender</label>              					                  												
							<select class="form-select" name="cgender">                    														
								<option value="" selected>Select Gender</option>                    														
								<option>Male</option>                    														
								<option>Female</option>  														
								<option>Transgender</option> 												
							</select>             										
						</div> 					
					</div>              					
					<div class="col-lg-6">                						
						<div class="mb-3">                  							
							<label class="form-label">Language</label>              					
							<select class="form-select" name="clang">                    								
								<option value="" selected>Select Language</option>                    								      
								<?php						
								$lsql=mysqli_query($connect,"SELECT * FROM `language`");									
								while($lrow = mysqli_fetch_array($lsql)){										
								?>																											
								<option>
									<?php echo $lrow['language'] ?>
								</option>
								<?php									
								}										
								?>												
							</select> 						
						</div>             					
					</div>            				
				</div>								
				<div class="row">              					
					<div class="col-lg-6">			
						<div class="mb-3">              					
							<label class="form-label">Postal Code</label>              												
							<input type="text" class="form-control" name="pc" placeholder="xx xxx">				 
						</div> 						
					</div>              					
					<div class="col-lg-6">                					
						<div class="mb-3">                  						
							<label class="form-label">Picture</label>              					
							<input type="file" class="form-control" name="cpic">      						
						</div>             					
					</div>            				
				</div>
												
				<div class="row">              				
					<div class="col-lg-6">				
						<div class="mb-3">              					
							<label class="form-label">Company Name</label>              					
							<input type="text" class="form-control" name="ccn" placeholder="Your Company Name">            				
						</div> 
					</div>              
					<div class="col-lg-6">                
						<div class="mb-3">                  						
							<label class="form-label">National ID</label>              					
							<input type="text" class="form-control" name="cni">        						
						</div>             									
					</div>            								
				</div>																          				          															
				</div>          			
				<div class="modal-body">				
					<div class="row">              					             					
						<div class="col-lg-12">               						
							<div>                 							
								<label class="form-label">Address</label>                  							
								<textarea class="form-control" rows="3" name="caddress"></textarea>               						
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
						Add New Client  
						
					</button>
					     			
				</div> 				
			</form>		
		</div>      	
	</div>    
</div>




<?php
include('footer.php');
?>