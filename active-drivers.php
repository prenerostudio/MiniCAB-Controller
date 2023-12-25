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
				Drivers Section                				
			</h2>              			
		</div>		
		<div class="col-auto ms-auto d-print-none">            		
			<div class="btn-list">                			
				<a href="#" class="btn btn-primary d-none d-sm-inline-block" data-bs-toggle="modal" data-bs-target="#modal-customer">  											
					<i class="ti ti-user-plus"></i>                    					
					Add New Customer                  					
				</a>                  				
				<a href="#" class="btn btn-primary d-sm-none btn-icon" data-bs-toggle="modal" data-bs-target="#modal-customer" aria-label="Create new report">                    				
					<i class="ti ti-bookmark-plus"></i>                  					
				</a>                				
			</div>              			
		</div>		
	</div>	
</div>
<div class="page-body page_padding">          	
	<div class="row row-deck row-cards">			
		<div class="card">        
			<div class="card-header">            
				<ul class="nav nav-tabs card-header-tabs" data-bs-toggle="tabs">                
					<li class="nav-item">                    
						<a href="#drivers" class="nav-link active" data-bs-toggle="tab">								
							<i class="ti ti-steering-wheel" style="margin-right: 10px;"></i>                        
							Active Drivers
						</a>                      
					</li>                      
					<li class="nav-item">                       
						<a href="#new-drivers" class="nav-link" data-bs-toggle="tab">						
							<i class="ti ti-user-shield" style="margin-right: 10px;"></i>                        
							New Driver Requests
						</a>                   
					</li>						
					<li class="nav-item">                      
						<a href="#inactive" class="nav-link" data-bs-toggle="tab">						
							<i class="ti ti-car-off" style="margin-right: 10px;"></i>                         
							Inactive Drivers
						</a>                     
					</li>                   
				</ul>                 
			</div>               
			<div class="card-body">              
				<div class="tab-content">              
					<div class="tab-pane active show" id="drivers">                                             
						<div class="col-12">            								
							<div class="card">                										
								<div class="card-header">
									<h3 class="card-title">Active Drivers List</h3>				
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
										
														<button class="table-sort" data-sort="sort-date">Image</button>
									
													</th>                        									
									
													<th>									
										
														<button class="table-sort" data-sort="sort-time">Name</button>
									
													</th>                       									
									
													<th>									
										
														<button class="table-sort" data-sort="sort-passenger">Email</button>
									
													</th>                        									
									
													<th>									
										
														<button class="table-sort" data-sort="sort-pickup">Phone</button>
									
													</th>                        									
									
													<th>									
										
														<button class="table-sort" data-sort="sort-dropoff">Gender</button>
									
													</th>									
									
													<th>									
										
														<button class="table-sort" data-sort="sort-dropoff">Licence 
															Authority</button>
									
													</th>							
									
													<th>									
										
														<button class="table-sort">Actions</button>
									
													</th>                      									
								
												</tr>                   								
							
											</thead>                  							
							
											<tbody class="table-tbody">												
								
												<?php																		
								
												$x=0;																
								
												$adsql=mysqli_query($connect,"SELECT drivers.* FROM drivers WHERE 
												drivers.acount_status = 1 ORDER BY drivers.d_id DESC");						
												
								
												$adrow = mysqli_fetch_array($adsql);
												
												if($adrow){
																			
												
													while($adrow){
									
													
														$x++;								
								
												
												?>								
								
												<tr>                        								
									
													<td class="sort-id">
										
														<?php echo $x; ?>
									
													</td>
									
													<td class="sort-date">									
										
														<?php																
									
													if (!$adrow['d_pic']) {
										
														?>																	
										
														<img src="img/clients/user-1.jpg" alt="Driver Img" style="width: 60px; height: 60px; border-radius: 30px;">	
										
														<?php
									
													} else{															
									
														?>																
										
														<img src="img/drivers/<?php echo $adrow['d_pic'];?>" alt="Driver Img" style="width: 60px; height: 60px; border-radius: 30px;">
										
														<?php
								
													}			
										
														?>											
									
													</td>                       										
									
													<td class="sort-time">
										
														<?php echo $adrow['d_name']; ?>
								
													</td>                       										
								
													<td class="sort-passenger">
										
														<?php echo $adrow['d_email']; ?>
									
													</td>  										
									
													<td class="sort-pickup">
										
														<?php echo $adrow['d_phone']; ?>
									
													</td>                       										
									
													<td class="sort-drpoff">
										
														<?php echo $adrow['d_gender']; ?>
									
													</td>										
									
													<td class="sort-drpoff">											
										
														<?php echo $adrow['licence_authority'] ?>							
														
									
													</td>	
									
													<td> 									
										
														<a href="view-driver.php?d_id=<?php echo $adrow['d_id']; ?>">
											
															<button class="btn btn-info">
												
																<i class="ti ti-eye"></i>View
											
															</button>												
										
														</a>

										
														<a href="del-customer.php?c_id=<?php echo $adrow['c_id']; ?>">
											
															<button class="btn btn-danger">
												
																<i class="ti ti-square-rounded-x"></i>Delete
											
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
			
							</div>              			
		
						</div>
                      
					</div>

					<div class="tab-pane" id="new-drivers">
                    
						<div class="col-12">            					
			
							<div class="card">                							
				
								<div class="card-header">                    									
					
									<h3 class="card-title">New Drivers Request List</h3>
				
								</div>                  				
				
								
								<div class="card-body border-bottom py-3">				
					
									<div id="table-ndriver" class="table-responsive">                  					
						
										<table class="table">                    						
							
											<thead>                      							
								
												<tr>									
									
													<th>									
										
														<button class="table-sort" data-sort="sort-id">ID</button>
									
													</th>                        									
									
													<th>									
										
														<button class="table-sort" data-sort="sort-date">Image</button>
									
													</th>                        									
									
													<th>									
										
														<button class="table-sort" data-sort="sort-time">Name</button>
									
													</th>                       									
									
													<th>									

														<button class="table-sort" data-sort="sort-passenger">Email</button>
									
													</th>                        									
									
													<th>									
										
														<button class="table-sort" data-sort="sort-pickup">Phone</button>
									
													</th>                        									
									
													<th>									
										
														<button class="table-sort" data-sort="sort-dropoff">Gender</button>
									
													</th>									
									
													<th>									
										
														<button class="table-sort" data-sort="sort-dropoff">Licence Authority</button>
									
													</th>							
									
													<th>									
										
														<button class="table-sort">Actions</button>
									
													</th>                      									
								
												</tr>                   								
							
											</thead>                  							
							
											<tbody class="table-tbody">												
								
												<?php																		
								
												$x=0;																
								
												$dsql=mysqli_query($connect,"SELECT drivers.* FROM drivers WHERE 
												drivers.acount_status = 0 ORDER BY drivers.d_id DESC");								
								$drow = mysqli_fetch_array($dsql);
												if($drow){
																			
												while($drow){
									
													$y++;								
							
												?>								
							
												<tr>                        								
								
													<td class="sort-id">
									
														<?php echo $x; ?>
								
													</td>
									
													<td class="sort-date">									
										
														<?php																
								
													if (!$drow['d_pic']) {
										
														?>																	
										
														<img src="img/clients/user-1.jpg" alt="Driver Img" style="width: 60px; height: 60px; border-radius: 30px;">	
										
														<?php
									
													} else{															
										
														?>																
										
														<img src="img/drivers/<?php echo $drow['d_pic'];?>" alt="Driver Img" style="width: 60px; height: 60px; border-radius: 30px;">
										
														<?php
									
													}			
										
														?>											
									
													</td>                       										
									
													<td class="sort-time">
										
														<?php echo $drow['d_name']; ?>
									
													</td>                       										
									
													<td class="sort-passenger">
										
														<?php echo $drow['d_email']; ?>
									
													</td>  										
									
													<td class="sort-pickup">
										
														<?php echo $drow['d_phone']; ?>
									
													</td>                       										
									
													<td class="sort-drpoff">
										
														<?php echo $drow['d_gender']; ?>
									
													</td>										
									
													<td class="sort-drpoff">											
										
														<?php echo $drow['licence_authority'] ?>									
									
													</td>	
									
													<td> 									
										
														<a href="view-driver.php?d_id=<?php echo $drow['d_id']; ?>">
											
															<button class="btn btn-info">
											
																<i class="ti ti-eye"></i>View
											
															</button>												
										
														</a>

										
														<a href="del-customer.php?c_id=<?php echo $drow['c_id']; ?>">
											
															<button class="btn btn-danger">
											
																<i class="ti ti-square-rounded-x"></i>Delete
											
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
			
							</div>              			
		
						</div>
                      
					</div>
					
					<div class="tab-pane" id="inactive">
                       
						<div class="col-12">            					
			
							<div class="card">                							
			
								<div class="card-header">                    									
					
									<h3 class="card-title">InActive Drivers List</h3>
				
								</div>                  				
				
								<div class="card-body border-bottom py-3">				
				
									<div id="table-customer" class="table-responsive">                  					
						
										<table class="table">                    						
							
											<thead>                      							
								
												<tr>									
									
													<th>									
										
														<button class="table-sort" data-sort="sort-id">ID</button>
									
													</th>                        									
									
													<th>									
										
														<button class="table-sort" data-sort="sort-date">Image</button>
								
													</th>                        									
								
													<th>									
										
														<button class="table-sort" data-sort="sort-time">Name</button>
									
													</th>                       									
									
													<th>									
										
														<button class="table-sort" data-sort="sort-passenger">Email</button>
									
													</th>                        									
									
													<th>									
										
														<button class="table-sort" data-sort="sort-pickup">Phone</button>
									
													</th>                        									
									
													<th>									
										
														<button class="table-sort" data-sort="sort-dropoff">Gender</button>
									
													</th>									
									
													<th>									
										
														<button class="table-sort" data-sort="sort-dropoff">Licence Authority</button>
									
													</th>							
									
													<th>									
										
														<button class="table-sort">Actions</button>
									
													</th>                      									
								
												</tr>                   								
							
											</thead>                  							
							
											<tbody class="table-tbody">												
								
												<?php																		
								
												$x=0;																
								
												$dsql=mysqli_query($connect,"SELECT drivers.* FROM drivers WHERE 
												drivers.acount_status = 2 ORDER BY drivers.d_id DESC");	
												$drow = mysqli_fetch_array($dsql);
												if($drow){
																			
												while($drow){
									
													$x++;									
								
												?>								
								
												<tr>                        								
									
													<td class="sort-id">
										
														<?php echo $x; ?>
									
													</td>
									
													<td class="sort-date">									
										
														<?php																
									
													if (!$drow['d_pic']) {
										
														?>																	
										
														<img src="img/clients/user-1.jpg" alt="Driver Img" style="width: 60px; height: 60px; border-radius: 30px;">	
										
														<?php
									
													} else{															
										
														?>																
										
														<img src="img/drivers/<?php echo $drow['d_pic'];?>" alt="Driver Img" style="width: 60px; height: 60px; border-radius: 30px;">
										
														<?php
									
													}			
										
														?>											
									
													</td>                       										
									
													<td class="sort-time">
										
														<?php echo $drow['d_name']; ?>
									
													</td>                       										
									
													<td class="sort-passenger">
										
														<?php echo $drow['d_email']; ?>
									
													</td>  										
									
													<td class="sort-pickup">
										
														<?php echo $drow['d_phone']; ?>
									
													</td>                       										
									
													<td class="sort-drpoff">
										
														<?php echo $drow['d_gender']; ?>
									
													</td>										
									
													<td class="sort-drpoff">											
										
														<?php echo $drow['licence_authority'] ?>							
														
									
													</td>	
									
													<td> 									
										
														<a href="view-driver.php?d_id=<?php echo $drow['d_id']; ?>">
											
															<button class="btn btn-info">
												
																<i class="ti ti-eye"></i>View
											
															</button>												
										
														</a>

														
										
														<a href="del-customer.php?c_id=<?php echo $drow['c_id']; ?>">
											
															<button class="btn btn-danger">
												
																<i class="ti ti-square-rounded-x"></i>Delete
											
															</button>				
										
														</a>										
									
													</td>									
								
												</tr>								
								
												<?php								
								
												}	} else{
													?>
												<tr>
												<td colspan="8"><p align="center">No Driver Found!</p></td>
												
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
----------Add Customer-------------
-------------------------------->
<div class="modal modal-blur fade" id="modal-customer" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">    	
		<div class="modal-content">        		
			<div class="modal-header">            			
				<h5 class="modal-title">Add New Customer</h5>            				
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div> 			
			<form method="post" action="customer-process.php" enctype="multipart/form-data">
				<div class="modal-body">								
					<div class="row">				
						<div class="mb-3 col-md-4">              					
							<label class="form-label">Full Name</label>              					
							<input type="text" class="form-control" name="cname" placeholder="Customer Name"> 				
						</div> 						               
						<div class="mb-3 col-md-4">                  
							<label class="form-label">Email</label>              					
							<input type="text" class="form-control" name="cemail" placeholder="hello@example.com">
						</div>			
						<div class="mb-3 col-md-4">                  						
							<label class="form-label">Phone</label>              					
							<input type="text" class="form-control" name="cphone" placeholder="+44 20 7123 4567">
						</div>							
						<div class="mb-3 col-md-4">              															
							<label class="form-label">Gender</label>
							<select class="form-select" name="cgender">												
								<option value="" selected>Select Gender</option>
								<option>Male</option>																
								<option>Female</option>								
								<option>Transgender</option>							
							</select>             																
						</div>					               												
						<div class="mb-3 col-md-4">                  													
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
						<div class="mb-3 col-md-4">              											
							<label class="form-label">Postal Code</label>									
							<input type="text" class="form-control" name="pc" placeholder="xx xxx">						
						</div> 					              											
						<div class="mb-3 col-md-4">                  												
							<label class="form-label">Picture</label>							
							<input type="file" class="form-control" name="cpic">						
						</div>
						<div class="mb-3 col-md-4">                  												
							<label class="form-label">National ID</label>							
							<input type="text" class="form-control" name="cni">						
						</div>             																					
					</div>						         												
					<div class="modal-body">									
						<div class="row">
							<div class="col-lg-12">               													
								<div class="mb-3">                 															
									<label class="form-label">Address</label>								
									<textarea class="form-control" rows="3" name="caddress"></textarea>
								</div>     							
								<div class="mb-3">                 							
									<label class="form-label">Others</label>								
									<textarea class="form-control" rows="3" name="cothers"></textarea>	
								</div> 						
							</div>   									
						</div>          							
					</div>        							
					<div class="modal-footer">           				
						<a href="#" class="btn btn-danger" data-bs-dismiss="modal">						
							Cancel           									
						</a>           																					
						<button type="submit" class="btn ms-auto btn-success" data-bs-dismiss="modal">
							<i class="ti ti-user-plus"></i> 						
							Add Customer  											
						</button>					     							
					</div> 							
					</form>								
				</div>      				
		</div>    
	</div>
<?php
include('footer.php');
?>