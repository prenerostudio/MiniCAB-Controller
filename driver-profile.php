<?php
include('header.php');

$d_id = $_GET['id'];
$dsql=mysqli_query($connect,"SELECT * FROM `drivers` WHERE `d_id`='$d_id'");
$drow = mysqli_fetch_array($dsql);		
?> 
<div class="container">
	<div class="row row-deck row-cards"> 	 	    	                                                                                       	
		<div class="col-md-12">                			
			<div class="card">                  					
				<div class="card-header">                  							
					<ul class="nav nav-tabs card-header-tabs nav-fill" data-bs-toggle="tabs">                    									
						<li class="nav-item" style="background: #3046CC;">                      											
							<a href="#tabs-today" class="nav-link active" data-bs-toggle="tab">															
								<i class="ti ti-database-heart"></i>                          														
								Driver Details											
							</a>                     					
						</li>                      										
						<li class="nav-item">                       					
							<a href="#tabs-pre" class="nav-link" data-bs-toggle="tab">							
								<i class="ti ti-license"></i>							
								Driver Documents											
							</a>                     										
						</li>                     					                  								
					</ul>                						
				</div>                 						
				<div class="card-body">                  							
					<div class="tab-content">                   									
						<div class="tab-pane active show" id="tabs-today">
							<div class="container-xl">           								
								<div class="card">												
									<div class="row g-0">                    																
										<div class="col-12 col-md-12 d-flex flex-column">
											<div class="card-body">            																				
												<h2 class="mb-4">Driver Profile</h2>
												<div class="row align-items-center">												
													<div class="col-auto">				
														<span class="avatar avatar-xl" style="background-image: url(<?php echo $drow['d_pic'];?>);				  
																							  background-size:cover; width: 220px; height: 160px;"></span>													
													</div> 																								
													<div class="col-auto">											
														<form action="update-status.php" method="post">
															<input type="hidden" name="d_id" value="<?php echo $d_id; ?>">
															<button type="submit" class="btn btn-info">Approve </button>
														</form>																					
													</div> 																								
													<div class="col-auto">													
														<a href="#" class="btn btn-ghost-danger">
															Decline
														</a>																							
													</div>     																				
												</div>                																				
												<h3 class="card-title mt-4">Profile Details | ID #: <?php echo $drow['d_id']; ?></h3>		
												<div class="row g-3">                						
													<div class="col-md-4">												
														<div class="mb-3">                    														
															<div class="form-label">Driver Name</div>		
															<input type="text" class="form-control" value="<?php echo $drow['d_name']; ?>" name="dname" readonly>  						
														</div>                    												
														<div class="mb-3">                    														
															<div class="form-label">Gender</div>                        														
															<input type="text" class="form-control" value="<?php echo $drow['d_gender']; ?>" name="dgender" readonly>
														</div>                    												
														<div class="mb-3">                    														
															<div class="form-label">Language</div>                        														
															<input type="text" class="form-control" value="<?php echo $drow['d_language']; ?>" name="dlang" readonly>
														</div>														
														<div class="mb-3">                    														
															<div class="form-label">Vehicle</div>         								
															<select class="form-control" name="v_id">									
																<option value="<?php echo $drow['v_id']; ?>">
																	<?php																											
																	$vid=$drow['v_id'];																				
																	$vhsql=mysqli_query($connect,"SELECT * FROM `vehicles` WHERE `v_id`='$vid'");						
																	$vhrow = mysqli_fetch_array($vhsql);																				
																	echo $vhrow['v_name'];																				
																	?>
																</option>																									
															</select>								                   							
														</div>																
													</div>																					
													<div class="col-md-4">												
														<div class="mb-3">                    													
															<div class="form-label">Email Address</div>                        														
															<input type="text" class="form-control" value="<?php echo $drow['d_email']; ?>" name="demail" readonly>
														</div>                    												
														<div class="mb-3">                    														
															<div class="form-label">Phone </div>                        														
															<input type="text" class="form-control" value="<?php echo $drow['d_phone']; ?>" name="dphone" readonly>
														</div>																					
														<div class="mb-3">                    						
								
															<div class="form-label">Skype Account</div>                        						
								
															<input type="text" class="form-control" value="<?php echo $drow['skype_acount'] ?>" name="skype" readonly>                   
															
							
														</div>								
							
														<div class="mb-3">                    						
								
															<div class="form-label">Special Remarks</div>  
								
															<textarea class="form-control" rows="3" name="remarks" readonly><?php echo $drow['d_remarks'] ?></textarea>								             
							
														</div>															
						
													</div>												
						
													<div class="col-md-4">					
							
														<div class="mb-3">                    						
								
															<div class="form-label">Licence</div>                        						
								
															<input type="text" class="form-control" value="<?php echo $drow['d_licence']; ?>" name="dlicence" readonly>
							
														</div>                    					
							
														<div class="mb-3">                    						
								
															<div class="form-label">Licence Expiring Date</div>                        						
								
															<input type="text" class="form-control" value="<?php echo $drow['d_licence_exp'] ?>" name="lexp" readonly>                      					
							
														</div>                    					
							
														<div class="mb-3">                    					
								
															<div class="form-label">PCO Licence</div>                        						
								
															<input type="text" class="form-control" value="<?php echo $drow['pco_licence'] ?>" name="pco" readonly>                     
							
														</div>							
							
														<div class="mb-3">                    					
								
															<div class="form-label">PCO Licence Expiring Date</div>                        						
								
															<input type="text" class="form-control" value="<?php echo $drow['pco_exp'] ?>" name="pcoexp" readonly>                     
							
														</div>
							
														<div class="mb-3">                    					
								
															<div class="form-label">Date Registered</div>                        						
								
															<input type="text" class="form-control" value="<?php echo $drow['driver_reg_date'] ?>" disabled>                     
							
														</div>
						
													</div>                    
					
												</div>                                       
					
											</div>                 
				
																			
					           
			
										</div>              
		
									</div>            
	
								</div>         

							</div>
						
						
						
						
					
						</div>                    
					
						
						
						
						
						
						
						<div class="tab-pane" id="tabs-pre">
                    
						<div class="card-body">            												
					<h2 class="mb-4">Driver Profile</h2>      																
					<div class="row">														
						<div style="width: 50%; float: left;">																	
							<h3 class="card-title">														
								Driver Licence Photo Card (Front)													
							</h3>                									
							<div class="row align-items-center">                																				
								<div class="col-auto">																							
									<span class="avatar avatar-xl" style="background-image: url(img/drivers/Driving-Licence/<?php echo $drow['dl_front'];?>); background-size:cover; width: 220px; height: 160px;"></span>														
								</div>                    																										
							
							</div>				
						</div>														
						<div style="width: 50%; float: left;">										
							<h3 class="card-title">						
								Driver Licence Photo Card (Back)					
							</h3>                																					
							<div class="row align-items-center">                														
								<div class="col-auto">
									<span class="avatar avatar-xl" style="background-image: url(img/drivers/Driving-Licence/<?php echo $drow['dl_back'];?>); background-size:cover; width: 220px; height: 160px;"></span>													
							
								</div>                    											
							
																				
							</div>  																
						</div>					
					</div>
																			
					<div class="row" style="padding-top: 25px;">														
						<div style="width: 50%; float: left;">															
							<h3 class="card-title">														
								Proof of National Insurance											
							</h3>                																				
							<div class="row align-items-center">                													
								<div class="col-auto">
									<span class="avatar avatar-xl" style="background-image: url(img/drivers/National-Insurance/<?php echo $drow['national_insurance'];?>); background-size:cover; width: 220px; height: 160px;"></span>
								</div>                    																									
															
							</div>  										
						</div>																												
						<div style="width: 50%; float: left;">											
							<h3 class="card-title">							
								Proof of Basic Disclosure						
							</h3>                															
							<div class="row align-items-center">                							
								<div class="col-auto">																						
									<span class="avatar avatar-xl" style="background-image: url(img/drivers/Basic-Disclosure/<?php echo $drow['basic_disclosure'];?>); background-size:cover; width: 220px; height: 160px;"></span>													
								</div>                    																		
														
							</div>  										
						</div>										
					</div>
																		
					<div class="row" style="padding-top: 25px;">				
						<div style="width: 50%; float: left;">										
							<h3 class="card-title">							
								Proof of Right To Work in the UK						
							</h3>                																					
							<div class="row align-items-center">                														
								<div class="col-auto">
									<span class="avatar avatar-xl" style="background-image: url(img/drivers/Work-Proof/<?php echo $drow['work_proof'];?>); background-size:cover; width: 220px; height: 160px;"></span>																				
								</div>                    																										
																		
							</div>  										
						</div>
					
					
					
						<div style="width: 50%; float: left;">					
							<h3 class="card-title">
								Passport						
							</h3>                															
							<div class="row align-items-center">                
								<div class="col-auto">															
									<span class="avatar avatar-xl" style="background-image: url(img/drivers/Passport/<?php echo $drow['passport'];?>); background-size:cover; width: 220px; height: 160px;"></span>																				
								</div>                    																		
																				              															
							</div>  										
						</div>					
					</div>					
																			
					<div class="row" style="padding-top: 25px;">					
						<div style="width: 50%; float: left;">											
							<h3 class="card-title">							
								DVLA Check Results						
							</h3>                															
							<div class="row align-items-center">                							
								<div class="col-auto">																							
									<span class="avatar avatar-xl" style="background-image: url(img/drivers/DVLA/<?php echo $drow['dvla'];?>); background-size:cover; width: 220px; height: 160px;"></span>																				
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