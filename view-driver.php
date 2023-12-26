<?php
include('header.php');
$d_id = $_GET['d_id'];
$dsql=mysqli_query($connect,"SELECT drivers.*, vehicles.* FROM drivers, vehicles WHERE drivers.v_id = vehicles.v_id AND drivers.d_id ='$d_id'");
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
					</ul>                  
				</div>
				<div class="card-body">                
					<div class="tab-content">                    
						<div class="tab-pane active show" id="tabs-profile">                        
							<div class="col-12">            								
								<div class="card">				
									<div class="card-body border-bottom py-3">									
										<h2 class="mb-4">Customer Profile</h2>						
										<h3 class="card-title">Profile Details</h3>
										<div class="row align-items-center">								
											<div class="col-auto">							
												<span class="avatar avatar-xl" 
													  style="background-image: url(img/drivers/<?php echo $drow['d_pic'];?>);
															 background-size:contain; width: 200px;
															 height: 250px;"></span>
											</div>
											<div class="col-auto">
												<form action="update-driver-img.php" method="post" enctype="multipart/form-data">
													<input type="hidden" value="<?php echo $drow['d_id']; ?>" name="d_id">
													<input type="file" name="fileToUpload" id="fileToUpload" class="btn">	
													<button type="submit" class="btn btn-info">Upload Image </button>
												</form>					
											</div>						
											<div class="col-auto">							
												<a href="#" class="btn btn-ghost-danger">													
													Delete avatar                       							
												</a>							
											</div>
										</div>															
										<h3 class="card-title mt-4">Business Profile</h3>
										<form method="post" action="update-driver.php" enctype="multipart/form-data">
											<div class="row g-3">
												<div class="col-md-4">
													<div class="mb-3">
														<div class="form-label">Driver Name</div> 
														<input type="hidden" class="form-control" value="<?php echo $drow['d_id']; ?>" name="d_id">  																	
														<input type="text" class="form-control" value="<?php echo $drow['d_name']; ?>" name="dname">  															
													</div>
													<div class="mb-3">
														<div class="form-label">Email Address</div>
														<input type="text" class="form-control" value="<?php echo $drow['d_email']; ?>" name="demail" readonly>															
													</div>
													<div class="mb-3">
														<div class="form-label">Phone</div>
														<input type="text" class="form-control" value="<?php echo $drow['d_phone']; ?>" name="dphone" readonly>								
													</div>																	
													<div class="mb-3">                    													
														<div class="form-label">Gender</div>  									
														<select class="form-select" name="dgender"> 
															<option><?php echo $drow['d_gender']; ?></option> 
															<option>Male</option>
															<option>Female</option>
															<option>Transgender</option>									
														</select>  															
													</div> 								
													<div class="mb-3">
														<div class="form-label">Address</div>  								
														<textarea class="form-control" rows="3" name="daddress">
															<?php echo $drow['d_address'] ?>
														</textarea>								             						
													</div>													
												</div>
												<div class="col-md-4">
													<div class="mb-3"> 
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
													<div class="mb-3">								
														<div class="form-label">Driving Licence </div>										
														<input type="text" class="form-control" value="<?php echo $drow['d_licence']; ?>" name="dl">							
													</div>		
													<div class="mb-3">                    													
														<div class="form-label">Licence Expiry </div>								
														<input type="text" class="form-control" value="<?php echo $drow['d_licence_exp']; ?>" name="dle">							
													</div>																					
													<div class="mb-3">                    													
														<div class="form-label">PCO Licence</div>									
														<input type="text" class="form-control" value="<?php echo $drow['pco_licence'] ?>" name="pl">                     							
													</div>															
													<div class="mb-3">								
														<div class="form-label">PCO Expiry</div>  								
														<input type="text" class="form-control" value="<?php echo $drow['pco_exp'] ?>" name="ple">								             							
													</div>																					
												</div>																		
												<div class="col-md-4">
													<div class="mb-3">                    													
														<div class="form-label">Language</div>
														<select class="form-select" name="dlang">
															<option><?php echo $drow['d_language'] ?></option>
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
													<div class="mb-3">
														<div class="form-label">Vehicle</div>
														<select name="v_id" class="form-control">									
															<option value="<?php $drow['v_id'] ?>"> 
																<?php echo $drow['v_name'] ?>
															</option>								
															<?php															
																$vsql=mysqli_query($connect,"SELECT * FROM `vehicles`");					while($vrow = mysqli_fetch_array($vsql)){									
															?>																
															<option value="<?php echo $vrow['v_id'] ?>">
																<?php echo $vrow['v_name'] ?>
															</option>				
															<?php					
																	}						
															?>			
														</select>							
													</div>														
													<div class="mb-3">
														<div class="form-label">Skype ID</div>								
														<input type="text" class="form-control" value="<?php echo $drow['skype_acount'] ?>" name="sa">                      												
													</div>						
													<div class="mb-3">								
														<div class="form-label">Remarks</div>  								
														<textarea class="form-control" rows="3" name="dr">
															<?php echo $drow['d_remarks'] ?>
														</textarea>								             							
													</div>																				
													<div class="mb-3">                    													
														<div class="form-label">Date Registered</div>										
														<input type="text" class="form-control" value="<?php echo $drow['driver_reg_date'] ?>" disabled>                     							
													</div>						
												</div>                    																
											</div>															
											</div>                 
				
										<div class="card-footer bg-transparent mt-auto">                 					
											<div class="btn-list justify-content-end">                 					
												<a href="drivers.php" class="btn btn-danger">                  							
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
						
						
						
						<div class="tab-pane" id="tabs-document">							                       						
							<div class="card-body">
								<h2 class="mb-4">Driver Profile</h2>
								<div class="row mb-3">																				
									<div class="col-md-6">
										<h3 class="card-title">
											Driver Licence Photo Card (Front)
										</h3>                																
										<div class="row align-items-center">
											<div class="col-auto">
												<span class="avatar avatar-xl" style="background-image: url(img/drivers/Driving-Licence/<?php echo $drow['dl_front'];?>); background-size:cover; width: 220px; height: 160px;"></span>
											</div>															
											<div class="col-auto">
												<form action="upload-front.php" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">    
													<input type="hidden" name="d_id" value="<?php echo $d_id; ?>">    
													<input type="file" id="dl_front" name="dl_front" accept="image/*" class="form-control" required>    
													<input type="submit" value="Upload Image" name="submit" class="btn btn-info" style="margin-top: 25px;">
												</form>											
											</div>							
											<script>    
												function validateForm() {        
													var fileInput = document.getElementById('dl_front');        
													if (fileInput.files.length === 0) {            
														alert("Please select an image before submitting.");            
														return false;        
													}        
													return true;    
												}
											</script>										
										</div>										
									</div>																				
									<div class="col-md-6">										
							
										<h3 class="card-title">						
								
											Driver Licence Photo Card (Back)					
							
										</h3>                																					
							
										<div class="row align-items-center">                														
								<div class="col-auto">
									<span class="avatar avatar-xl" style="background-image: url(img/drivers/Driving-Licence/<?php echo $drow['dl_back'];?>); background-size:cover; width: 220px; height: 160px;"></span>													
							
								</div>                    											
							
								<div class="col-auto">									
									<form action="upload-back.php" method="post" enctype="multipart/form-data">
										<input type="hidden" name="d_id" value="<?php echo $d_id; ?>">										
										<input type="file" name="dl_back" accept="image/*"  class="form-control">
										<input type="submit" value="Upload Image" name="submit"  class="btn btn-info" style="margin-top: 25px;">
									</form>																										
								</div>													
							</div>  																
						</div>										
								</div>																								
								<div class="row mb-3">														
						
									<div class="col-md-6">															
							<h3 class="card-title">														
								Proof of National Insurance											
							</h3>                																				
							<div class="row align-items-center">                													
								<div class="col-auto">
									<span class="avatar avatar-xl" style="background-image: url(img/drivers/National-Insurance/<?php echo $drow['national_insurance'];?>); background-size:cover; width: 220px; height: 160px;"></span>
								</div>                    																									
								<div class="col-auto">																												
									<form action="upload-ni.php" method="post" enctype="multipart/form-data">
										<input type="hidden" name="d_id" value="<?php echo $d_id; ?>">										
										<input type="file" name="ni" accept="image/*"  class="form-control">
										<input type="submit" value="Upload Image" name="submit"  class="btn btn-info" style="margin-top: 25px;">
									</form>																			
								</div>								
							</div>  										
						</div>																												
						<div class="col-md-6">											
							<h3 class="card-title">							
								Proof of Basic Disclosure						
							</h3>                															
							<div class="row align-items-center">                							
								<div class="col-auto">																						
									<span class="avatar avatar-xl" style="background-image: url(img/drivers/Basic-Disclosure/<?php echo $drow['basic_disclosure'];?>); background-size:cover; width: 220px; height: 160px;"></span>													
								</div>                    																		
								<div class="col-auto">																				
									<form action="upload-bd.php" method="post" enctype="multipart/form-data">									
										<input type="hidden" name="d_id" value="<?php echo $d_id; ?>">
										<input type="file" name="bd" accept="image/*"  class="form-control">										
										<input type="submit" value="Upload Image" name="submit"  class="btn btn-info" style="margin-top: 25px;">
									</form>																		
								</div>							
							</div>  										
						</div>										
					</div>
																		
					<div class="row mb-3">				
						<div class="col-md-6">										
							<h3 class="card-title">							
								Proof of Right To Work in the UK						
							</h3>                																					
							<div class="row align-items-center">                														
								<div class="col-auto">
									<span class="avatar avatar-xl" style="background-image: url(img/drivers/Work-Proof/<?php echo $drow['work_proof'];?>); background-size:cover; width: 220px; height: 160px;"></span>																				
								</div>                    																										
								<div class="col-auto">																				
									<form action="upload-wp.php" method="post" enctype="multipart/form-data">									
										<input type="hidden" name="d_id" value="<?php echo $d_id; ?>">
										<input type="file" name="wp" accept="image/*"  class="form-control">										
										<input type="submit" value="Upload Image" name="submit"  class="btn btn-info" style="margin-top: 25px;">
									</form>																			
								</div>											
							</div>  										
						</div>
					
					
					
						<div class="col-md-6">					
							<h3 class="card-title">
								Passport						
							</h3>                															
							<div class="row align-items-center">                
								<div class="col-auto">															
									<span class="avatar avatar-xl" style="background-image: url(img/drivers/Passport/<?php echo $drow['passport'];?>); background-size:cover; width: 220px; height: 160px;"></span>																				
								</div>                    																		
								<div class="col-auto">																				
									<form action="upload-passport.php" method="post" enctype="multipart/form-data">
										<input type="hidden" name="d_id" value="<?php echo $d_id; ?>">										
										<input type="file" name="pass" accept="image/*"  class="form-control">
										<input type="submit" value="Upload Image" name="submit"  class="btn btn-info" style="margin-top: 25px;">
									</form>																		
								</div>													              															
							</div>  										
						</div>					
					</div>					
																			
					<div class="row mb-3">					
						<div class="col-md-6">											
							<h3 class="card-title">							
								DVLA Check Results						
							</h3>                															
							<div class="row align-items-center">                							
								<div class="col-auto">																							
									<span class="avatar avatar-xl" style="background-image: url(img/drivers/DVLA/<?php echo $drow['dvla'];?>); background-size:cover; width: 220px; height: 160px;"></span>																				
								</div>                    																		
								<div class="col-auto">																				
									<form action="upload-dvla.php" method="post" enctype="multipart/form-data">
										<input type="hidden" name="d_id" value="<?php echo $d_id; ?>">										
										<input type="file" name="dvla" accept="image/*"  class="form-control">
										<input type="submit" value="Upload Image" name="submit"  class="btn btn-info" style="margin-top: 25px;">
									</form>																				
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

</div>     


<?php
include('footer.php');
?>