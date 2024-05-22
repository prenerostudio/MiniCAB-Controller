<?php
include('header.php');
$d_id = $_GET['d_id'];
$dsql=mysqli_query($connect,"SELECT drivers.*, driver_documents.*, vehicle_documents.* FROM drivers JOIN driver_documents ON drivers.d_id = driver_documents.d_id JOIN vehicle_documents ON drivers.d_id = vehicle_documents.d_id WHERE drivers.d_id = '$d_id'");
$drow = mysqli_fetch_array($dsql);		
?>
<div class="page-header d-print-none page_padding">		   		
	<div class="row g-2 align-items-center">        		
		<div class="col">            										
			<div class="page-pretitle">                						
				Overview                				
			</div>                									
			<h2 class="page-title">                						
				View Driver Details              							
			</h2>              					
		</div>		
		<div class="col-auto ms-auto d-print-none">            				
			<div class="btn-list">                						
				<?php				
					if($drow['acount_status'] == 0){				
				?>								
				<a href="update-driver-status.php?d_id=<?php echo $d_id ?>" class="btn btn-primary d-none d-sm-inline-block">
					<i class="ti ti-checks"></i>                    										
					Approve Driver                 									
				</a>   				
				<?php					
					}else {									
				?>								
				<button class="btn btn-disable d-none d-sm-inline-block" disabled>
					<i class="ti ti-checks"></i>                    										
					Verified Driver                 									
				</button>  
				<?php				
					}				
				?>							              					                							
			</div>              					
		</div>			
	</div>	
</div>
<div class="page-body page_padding">          		
	<div class="row row-deck row-cards">					
		<div class="col-md-12">        
			<div class="card">            
				<div class="card-header">                
					<ul class="nav nav-tabs card-header-tabs" data-bs-toggle="tabs">                    
						<li class="nav-item">                        
							<a href="#tabs-profile" class="nav-link active" data-bs-toggle="tab">							
								<i class="ti ti-user-scan"></i>                          
								Driver Profile
							</a>                      
						</li>                      
						<li class="nav-item">
							<a href="#tabs-document" class="nav-link" data-bs-toggle="tab">							
								<i class="ti ti-calendar-user"></i>                          
								Driver Documents
							</a>                      
						</li>
						<li class="nav-item">
							<a href="#tabs-vdocument" class="nav-link" data-bs-toggle="tab">							
								<i class="ti ti-car-garage"></i>                          
								Vehicle Documents
 							</a>                      
						</li>
						<li class="nav-item">
							<a href="#tabs-vehicle" class="nav-link" data-bs-toggle="tab">							
								<i class="ti ti-car-garage"></i>                          
								Driver Vehicles
							</a>                      
						</li>
						<li class="nav-item">
							<a href="#tabs-statement" class="nav-link" data-bs-toggle="tab">							
								<i class="ti ti-calendar-user"></i>                          
								Driver Account Statement
							</a>                      
						</li>
						<li class="nav-item">
							<a href="#tabs-bank" class="nav-link" data-bs-toggle="tab">							
								<i class="ti ti-calendar-user"></i>                          
							Bank Details
							</a>                      
						</li>
					</ul>                  
				</div>
				<div class="card-body">                
					<div class="tab-content">                    
						<div class="tab-pane active show" id="tabs-profile">                        
							<div class="col-12">            								
								<div class="card">				
									<div class="card-body border-bottom py-3">									
										<h2 class="mb-4">Driver Profile</h2>						
										<h3 class="card-title">Profile Details</h3>
										<div class="row align-items-center">								
											<div class="col-auto">							
												<span class="avatar avatar-xl" 
													  style="background-image: url(img/drivers/<?php echo $drow['d_pic'];?>);
															 background-size:100% 100%; width: 150px;
															 height: 150px;"></span>
											</div>
											<div class="col-auto">
												<form action="update-driver-img.php" method="post" enctype="multipart/form-data">
													<input type="hidden" value="<?php echo $drow['d_id']; ?>" name="d_id">
													<input type="file" name="fileToUpload" id="fileToUpload" class="btn">	
													<button type="submit" class="btn btn-info">Upload Image </button>
												</form>					
											</div>						
											<div class="col-auto">							
												<a href="del-driver-img.php?d_id=<?php echo $d_id; ?>" class="btn btn-ghost-danger">													
													Delete avatar                       							
												</a>							
											</div>
										</div>
										<h3 class="card-title mt-4">
											Personel Informations
										</h3>										
										<form method="post" action="update-driver.php" enctype="multipart/form-data">
											<div class="row g-3">
												<div class="mb-3 col-md-4">											
													<div class="form-label">Driver Name</div>					
													<input type="hidden" class="form-control" value="<?php echo $drow['d_id']; ?>" name="d_id"> 							
													<input type="text" class="form-control" value="<?php echo $drow['d_name']; ?>" name="dname">
												</div>					
												<div class="mb-3 col-md-4">												
													<div class="form-label">Email Address</div>
													<input type="text" class="form-control" value="<?php echo $drow['d_email']; ?>" name="demail">
												</div>
												<div class="mb-3 col-md-4">												
													<div class="form-label">Phone</div>
													<input type="text" class="form-control" value="<?php echo $drow['d_phone']; ?>" name="dphone" readonly>													
												</div>			
												<div class="mb-3 col-md-4">
													<div class="form-label">Gender</div>
													<select class="form-select" name="dgender">
														<option><?php echo $drow['d_gender']; ?></option> 
														<option>Male</option>
														<option>Female</option>
														<option>Transgender</option>
													</select>													
												</div>			
												<div class="mb-3 col-md-4">												
													<div class="form-label">Address</div>						
													<input type="text" class="form-control" value="<?php echo $drow['d_address'] ?>" name="daddress">
															
																			             						
													
												</div>													
												
												<div class="mb-3 col-md-4"> 
												
													<div class="form-label">Licence Authority </div>  
													
													<select class="form-select" name="dauth">			
													
														<option>
														
															<?php echo $drow['licence_authority']; ?>
															
														</option>									
														
														<option>London</option>									
														
														<option>Bermingham</option>
														
														<option>Ireland</option>								
														
													</select>        															
													
												</div>																
												
												<div class="mb-3 col-md-4">								
												
													<div class="form-label">Post Code </div>	
													
													<input type="text" class="form-control" value="<?php echo $drow['d_licence']; ?>" name="dl">							
													
												</div>		
													
												
												<div class="mb-3 col-md-4">	
												
													<div class="form-label">Language</div>
													
													<select class="form-select" name="dlang">
													
														<option>
														
															<?php echo $drow['d_language']; ?>
															
														</option>
														
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
											
											
											
											<div class="card-footer bg-transparent mt-auto">
											
												<div class="btn-list justify-content-end">
												
													<a href="new-drivers.php" class="btn btn-danger">
														Cancel												
													</a>												
													
													<button type="submit" class="btn btn-success">
														<i class="ti ti-360"></i>
														Update												
													</button>											
												
												</div>										
											
											</div>																				
										
										</form>
											
											
											
										
									</div>													
																						
									
								</div>	   								

							</div>							

						</div>         						

									
						
					
					
					
						<div class="tab-pane" id="tabs-document">						
							<?php	
								include('driver-document-section.php');	
							?>							
						</div>

					
					
						<div class="tab-pane" id="tabs-vdocument">
							<?php
							
							include('driver-vehicle-document-section.php');
							?>
						</div>
					
					
					
					
						<div class="tab-pane" id="tabs-vehicle">						
							<div class="card-body">						
								<div class="row g-2 align-items-center">        			
									<div class="col">            								
										<div class="page-pretitle">                					
											Overview                				
										</div>                				
										<h2 class="page-title">                					
											Vehicle Section                				
										</h2>              
									</div>			
										
								</div>								
								<div class="row mb-3">								
									<div class="card">            															
										<div class="card-header">
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
																<button class="table-sort" data-sort="sort-date">Vehicle Type</button>
															</th>
															<th>													
																<button class="table-sort" data-sort="sort-time">Make & Model, Color</button>
															</th>
															<th>													
																<button class="table-sort" data-sort="sort-passenger">Registration #</button>
															</th> 													
																											
															<th>														
																<button class="table-sort">Actions</button>
															</th>                            												
														</tr>                       											
													</thead>
													<tbody class="table-tbody">
														<?php											
														$x = 0;
														$vhsql = mysqli_query($connect, "SELECT driver_vehicle.*, vehicles.* FROM driver_vehicle, vehicles WHERE driver_vehicle.v_id = vehicles.v_id AND driver_vehicle.d_id = $d_id");
														while ($vhrow = mysqli_fetch_array($vhsql)) :											
														$x++;
														?>
														<tr>
															<td class="sort-id">
																<?php echo $x; ?>												
															</td>									
															<td class="sort-time">
																<?php echo $vhrow['v_name']; ?>
															</td>                                  							
															<td class="sort-passenger">
																<?php echo $vhrow['v_make']; ?> -
																<?php echo $vhrow['v_model']; ?> - 
																<?php echo $vhrow['v_color']; ?>
															</td>
															<td class="sort-pickup">
																<?php echo $vhrow['v_reg_num']; ?>
															</td> 
																													
															<td>				
																<a href="vehicle-details.php?dv_id=<?php echo $vhrow['dv_id']; ?>">
																	<button class="btn btn-info">
																		<i class="ti ti-eye"></i>
																		View
																	</button>
																</a>
															</td>
														</tr>                          						
														<?php endwhile; ?>                         							
														<?php if ($x === 0) : ?>
														<tr>                                   							
															<td colspan="8">							
																<p align="center">
																	<a href="add-vehicle.php?d_id=<?php echo $d_id; ?>" class="btn btn-primary d-none d-sm-inline-block">  
																		<i class="ti ti-car"></i>	
																		Add Vehicle                 					
																	</a> 
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
						
					
					
						<div class="tab-pane" id="tabs-statement">
							<div class="card-body">
								<h2 class="mb-4">Driver Booking Statements</h2>
								<div class="row mb-3">
									<div class="card">            							
										<div class="card-header">
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
																<button class="table-sort" data-sort="sort-date">Job Completion Date</button>
															</th>
															<th>													
																<button class="table-sort" data-sort="sort-time">Job Details</button>
															</th>
															<th>													
																<button class="table-sort" data-sort="sort-passenger">Total Pay</button>
															</th> 													
															<th>														
																<button class="table-sort" data-sort="sort-passenger">Status</button>
															</th>												
															<th>														
																<button class="table-sort">Actions</button>
															</th>                            												
														</tr>                       											
													</thead>
													<tbody class="table-tbody">
														<?php											
														$x = 0;
														$isql = mysqli_query($connect, "SELECT invoice.*, jobs.book_id, drivers.*, bookings.*, booking_type.*, clients.* FROM invoice JOIN jobs ON invoice.job_id = jobs.job_id JOIN drivers ON invoice.d_id = drivers.d_id JOIN bookings ON jobs.book_id = bookings.book_id JOIN clients ON jobs.c_id = clients.c_id JOIN booking_type ON bookings.b_type_id = booking_type.b_type_id WHERE invoice.d_id = $d_id");
														while ($irow = mysqli_fetch_array($isql)) :											
														$x++;
														?>
														<tr>
															<td class="sort-id">
																<?php echo $x; ?>												
															</td>									
															<td class="sort-time">
																<?php echo $irow['invoice_date']; ?>
															</td>                                  							
															<td class="sort-passenger">
																Booking ID: <?php echo $irow['book_id']; ?> <br>
																<?php echo $irow['pickup']; ?> - <?php echo $irow['destination']; ?>
															</td>
															<td class="sort-pickup">
																<?php echo $irow['total_pay']; ?>
															</td> 
															<td class="sort-pickup">								
																<?php echo $irow['invoice_status']; ?>							
															</td>															
															<td>				
																<a href="invoice.php?invoice_id=<?php echo $irow['invoice_id']; ?>">
																	<button class="btn btn-info">
																		<i class="ti ti-eye"></i>
																		View Invoice
																	</button>
																</a>
															</td>
														</tr>                          						
														<?php endwhile; ?>                         							
														<?php if ($x === 0) : ?>
													
														<tr>                                   							
														
															<td colspan="8">							
															
																<p align="center">No Booking Found!</p>
															
													
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
																				
					
					
						<div class="tab-pane" id="tabs-bank">												
							<div class="card-body">														
								<div class="row g-2 align-items-center">        											
									<div class="col">
										<div class="page-pretitle">
											Overview                														
										</div>                				
										<h2 class="page-title">                					
											Bank Details Section                				
										</h2>              
									</div>													
								</div>								
								<div class="row mb-3">								
									<div class="card">            															
										<div class="card-header">
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
																<button class="table-sort" data-sort="sort-date">Bank Name</button>
															</th>
															<th>													
																<button class="table-sort" data-sort="sort-time">Account Number</button>
															</th>
															<th>													
																<button class="table-sort" data-sort="sort-passenger">Sort Code</button>
															</th> 													
																											
															<th>														
																<button class="table-sort">Actions</button>
															</th>                            												
														</tr>                       											
													</thead>
													<tbody class="table-tbody">
														<?php											
														$x = 0;
														$bsql = mysqli_query($connect, "SELECT drivers.*, driver_bank_details.* FROM drivers JOIN driver_bank_details ON drivers.d_id = driver_bank_details.d_id WHERE drivers.d_id = $d_id");
														while ($brow = mysqli_fetch_array($bsql)) :											
														$x++;
														?>
														<tr>
															<td class="sort-id">
																<?php echo $x; ?>												
															</td>									
															<td class="sort-time">
																<?php echo $brow['bank_name']; ?>
															</td>                                  							
															<td class="sort-passenger">
																<?php echo $brow['account_number']; ?>
																
															</td>
															<td class="sort-pickup">
																<?php echo $brow['sort_code']; ?>
															</td> 
																													
															<td>				
																<a href="edit-driver-bank.php?d_bank_id=<?php echo $brow['d_bank_id']; ?>">
																	<button class="btn btn-info">
																		<i class="ti ti-eye"></i>
																		Edit
																	</button>
																</a>
																<a href="del-driver-bank.php?d_bank_id=<?php echo $brow['d_bank_id'];?>& d_id=<?php echo $brow['d_id'];?>">
																	<button class="btn btn-danger">
																		<i class="ti ti-basket"></i>
																		Delete
																	</button>
																</a>
															</td>
														</tr>                          						
														<?php endwhile; ?>                         							
														<?php if ($x === 0) : ?>
														<tr>                                   							
															<td colspan="8">							
																<p align="center">
																	<a href="add-driver-bank.php?d_id=<?php echo $d_id; ?>" class="btn btn-primary d-none d-sm-inline-block">  
																		<i class="ti ti-car"></i>	
																		Add Bank Details                					
																	</a> 
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
                   
					
				
					</div>                 
				
			
				</div>               
			
		
			</div>             
		
	
		</div>										              								
	

	</div>	

</div>
<?php
include('footer.php');
?>