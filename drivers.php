<?php
include('header.php');
?> 




<div class="col-md-12">                	

	<div class="card">                  		
	
		<div class="card-header">                  			
		
			<ul class="nav nav-tabs card-header-tabs nav-fill" data-bs-toggle="tabs">                    				
			
				<li class="nav-item" style="background: #3046CC;">                      					
				
					<a href="#tabs-mile" class="nav-link active" data-bs-toggle="tab">							                          			
						
						
						<i class="ti ti-brand-speedtest" style="width: 32px; height: 32px;"></i>                         							
						
						All Drivers
									
						
					</a>                     
					
				</li>                      					
					
				<li class="nav-item">                       					
				
				
					<a href="#tabs-loc" class="nav-link" data-bs-toggle="tab">							                         						
					
						<i class="ti ti-license" style="width: 32px; height: 32px;"></i>
						
						Unapproved Drivers						
						
					</a>                     					
					
				</li>  
				
				
				
					  
				
			</ul>                			
			
		</div>                 			
		
		<div class="card-body">                  			
		
			<div class="tab-content">                   				
			
				<div class="tab-pane active show" id="tabs-mile">	
				
					
					
					<div class="card">					
	<div class="card-header">						
		<h2 class="page-title">              					
			Drivers List             						
		</h2>					
									
	</div>            			
	<div class="card-body">            			
		<div id="table-default" class="table-responsive">            					
			<table class="table table-responsive" id="drv-table">                   												
				<thead>                   															
					<tr align="center">                          																		
						<th class="w-1">ID</th>                         																				
						<th class="w-1">Pic</th>                          																				
						<th >Name</th>                         																				
						<th>Phone</th>                         																				
						<th>Gender</th>                         																				
						<th>Language</th>                         																				
						<th>Licence</th>
						<th></th>                       																			
					</tr>                     																
				</thead>                    														
				<tbody> 															
					<?php
					$dsql=mysqli_query($connect,"SELECT * FROM `drivers` WHERE `acount_status`= 0; ");											
					while($drow = mysqli_fetch_array($dsql)){																
					?>																								
					<tr align="center">                         																	
						<td>																				
							<?php echo $drow['d_id']; ?>																					
						</td>                          																				
						<td style="width: 10%;">														
							<?php															
						if (!$drow['d_pic']) {																							
							?>																									
							<img src="img/drivers/user-1.jpg" alt="Driver dp" style="width: 60px; border-radius: 30px;">
							<?php															
						} else{                                            													
							?>                                         															
							<img src="img/drivers/<?php echo $drow['d_pic'];?>" alt="Driver dp" style="width: 60px; border-radius: 30px;">
							<?php
						}                                          																							
							?>										
						</td>                        																				
						<td>																					
							<?php echo $drow['d_name']; ?>																						
						</td>                        																				
						<td>                           																					
							<?php echo $drow['d_phone']; ?>
						</td>                         																				
						<td>                          																					
							<?php echo $drow['d_gender']; ?>
						</td>                         																				
						<td>                           																					
							<?php echo $drow['d_language']; ?>															
						</td>                          																				
						<td>                            																					
							<?php echo $drow['d_licence']; ?>															
						</td>																			
						<td class="text-end">	
							
							<a href="driver-details.php?id=<?php echo $drow['d_id']; ?>">
							<button class="btn align-text-top">View Details</button>	
							</a>
							<a href="del-driver.php?id=<?php echo $drow['d_id']; ?>">
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
																																				
					      																		
					</div> 
						
										
					
					<div class="tab-pane" id="tabs-loc">
                    
					
						<div class="card">					
	<div class="card-header">						
		<h2 class="page-title">              					
			New Drivers List             						
		</h2>					
		<div class="col-auto ms-auto d-print-none">										
			<div class="btn-list">                                 			
				<a href="#" class="btn d-none d-sm-inline-block" data-bs-toggle="modal" data-bs-target="#modal-driver">
					<i class="ti ti-user-plus"></i>                  					
					Add New Driver                  					
				</a>                 				
			</div>              			
		</div>								
	</div>            			
	<div class="card-body">            			
		<div id="table-default" class="table-responsive">            					
			<table class="table table-responsive" id="drv-table">                   												
				<thead>                   															
					<tr align="center">                          																		
						<th class="w-1">ID</th>                         																				
						<th class="w-1">Pic</th>                          																				
						<th >Name</th>                         																				
						<th>Phone</th>                         																				
						<th>Gender</th>                         																				
						<th>Language</th>                         																				
						<th>Licence</th>
						<th></th>                       																			
					</tr>                     																
				</thead>                    														
				<tbody> 															
					<?php
					$dsql=mysqli_query($connect,"SELECT * FROM `drivers`");											
					while($drow = mysqli_fetch_array($dsql)){																
					?>																								
					<tr align="center">                         																	
						<td>																				
							<?php echo $drow['d_id']; ?>																					
						</td>                          																				
						<td style="width: 10%;">														
							<?php															
						if (!$drow['d_pic']) {																							
							?>																									
							<img src="img/drivers/user-1.jpg" alt="Driver dp" style="width: 60px; border-radius: 30px;">
							<?php															
						} else{                                            													
							?>                                         															
							<img src="img/drivers/<?php echo $drow['d_pic'];?>" alt="Driver dp" style="width: 60px; border-radius: 30px;">
							<?php
						}                                          																							
							?>										
						</td>                        																				
						<td>																					
							<?php echo $drow['d_name']; ?>																						
						</td>                        																				
						<td>                           																					
							<?php echo $drow['d_phone']; ?>
						</td>                         																				
						<td>                          																					
							<?php echo $drow['d_gender']; ?>
						</td>                         																				
						<td>                           																					
							<?php echo $drow['d_language']; ?>															
						</td>                          																				
						<td>                            																					
							<?php echo $drow['d_licence']; ?>															
						</td>																			
						<td class="text-end">	
							
							<a href="driver-details.php?id=<?php echo $drow['d_id']; ?>">
							<button class="btn align-text-top">View Details</button>	
							</a>
							<a href="del-driver.php?id=<?php echo $drow['d_id']; ?>">
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
						
						
						
                      
					</div>   
					
					
					
					
					
					
					
			</div>                
		</div>             
	</div>           
</div>













    






<!-------------------------------
----------Add Driver-------------
-------------------------------->
<div class="modal modal-blur fade" id="modal-driver" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">    	
		<div class="modal-content">        		
			<div class="modal-header">            			
				<h5 class="modal-title">Add New Driver</h5>            				
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>          			
			</div> 
			<form method="post" enctype="multipart/form-data" action="driver-process.php">			
				<div class="modal-body">								
					<div class="row">              					
						<div class="col-lg-6">				
							<div class="mb-3">              					
								<label class="form-label">Driver Name</label>              					
								<input type="text" class="form-control" name="dname" placeholder="Driver Name">            				
							</div> 						
						</div>              					
						<div class="col-lg-6">                
							<div class="mb-3">                  							
								<label class="form-label">Email</label>              					
								<input type="text" class="form-control" name="demail" placeholder="hello@example.com">
							</div>             				
						</div>            				
					</div>
								
					<div class="row">              					
						<div class="col-lg-6">				
							<div class="mb-3">              					
								<label class="form-label">Password</label>              					
								<input type="password" class="form-control" name="dpass" placeholder="xxxxxxxx">
							</div> 						
						</div>              					
						<div class="col-lg-6">                
							<div class="mb-3">                  
								<label class="form-label">Phone</label>              					
								<input type="text" class="form-control" name="dphone" placeholder="+44 20 7123 4567">
							</div>             					
						</div>            				
					</div>
									
					<div class="row">              
						<div class="col-lg-6">				
							<div class="mb-3">              					
								<label class="form-label">Gender</label>              					                  
								<select class="form-select" name="dgender">                    								
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
								<select class="form-select" name="dlang">                     								
									<option value="" selected>Select Language</option>                    								    
									<?php						
									$lsql=mysqli_query($connect,"SELECT * FROM `language`");
									while($lrow = mysqli_fetch_array($lsql)){									
									?>																											
									<option><?php echo $lrow['language'] ?></option>
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
								<label class="form-label">Vehicle</label>              												
								<select class="form-select" name="dv">                    								
									<option value="" selected>Select Vehicle</option>
									<?php						
									$vsql=mysqli_query($connect,"SELECT * FROM `vehicles`");									
									while($vrow = mysqli_fetch_array($vsql)){									
									?>																											
									<option value="<?php echo $vrow['v_id'] ?>"><?php echo $vrow['v_name'] ?></option>
									<?php
									}									
									?>												
								</select>              				
							</div> 						
						</div>              					
						<div class="col-lg-6">                
							<div class="mb-3">                  							
								<label class="form-label">Picture</label>              					
								<input type="file" class="form-control" name="dpic">      						
							</div>             					
						</div>            				
					</div>
								
					<div class="row">              					
						<div class="col-lg-6">				
							<div class="mb-3">              					
								<label class="form-label">Licence</label>              					
								<input type="text" class="form-control" name="licence" placeholder="xxxxxxxx">            				
							</div> 						
						</div>              					
						<div class="col-lg-6">                
							<div class="mb-3">                  							
								<label class="form-label">Licence Expiry</label>              					
								<input type="date" class="form-control" name="lexp">        						
							</div>             					
						</div>            				
					</div>
												
					<div class="row">              
						<div class="col-lg-6">				
							<div class="mb-3">              					
								<label class="form-label">PCO Licence</label>              					
								<input type="text" class="form-control" name="pco" placeholder="xxxxxxxx">            				
							</div> 						
						</div>              					
						<div class="col-lg-6">                
							<div class="mb-3">                  							
								<label class="form-label">PCO Licence Expiry</label>              					
								<input type="date" class="form-control" name="pcoexp">        						
							</div>             					
						</div>  										
					</div>				          				          
				</div>          			
				<div class="modal-body">
					<div class="row">              					             
						<div class="col-lg-12">               						
							<div>                 							
								<label class="form-label">Remarks</label>                  							
								<textarea class="form-control" rows="3" name="remarks"></textarea>               						
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
						Add New Driver  
						
					</button>       			
				</div> 								
			</form>		
		</div>      	
	</div>    
</div>   

<script>  
	$(document).ready(function(){       
		$('#drv-table').DataTable();   
	});   
	
		
</script> 
<?php
include('footer.php');
?>