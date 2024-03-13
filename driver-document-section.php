<div class="card-body">		
	<h2 class="mb-4">Driver Document Section</h2>									
	<div class="row mb-3">									
		<div class="col-md-6">											
			<h3 class="card-title">													
				Driver Licence Photo Card (Front)														
			</h3>                																

										
			<div class="row align-items-center">
										
			
				<div class="col-auto">
											
				
					<span class="avatar avatar-xl" style="background-image: url(img/drivers/Driving-Licence/<?php echo $drow['dl_front'];?>); background-size:contain; width: 220px; height: 160px;"></span>
											
					
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
            
												<span class="avatar avatar-xl" style="background-image: url(img/drivers/Driving-Licence/<?php echo $drow['dl_back'];?>); background-size:contain; width: 220px; height: 160px;"></span>													
        
											</div>                    											
        
											<div class="col-auto">									
            
												<form action="upload-back.php" method="post" enctype="multipart/form-data" onsubmit="return validateForm('dl_back')">
                
													<input type="hidden" name="d_id" value="<?php echo $d_id; ?>">										
                
													<input type="file" id="dl_back" name="dl_back" accept="image/*" class="form-control" required>
                
													<input type="submit" value="Upload Image" name="submit" class="btn btn-info" style="margin-top: 25px;">
            
												</form>																										
        
											</div>													
    
										</div>  																

									</div>

									

									<script>
    
										function validateForm(inputId) {
        
											var fileInput = document.getElementById(inputId);
        
											if (fileInput.files.length === 0) {
            
												alert("Please select an image before submitting.");
            
												return false;
        
											}
        
											return true;
    
										}

									</script>
										

								</div>																								
								
								<div class="row mb-3">														
						
									
									
									<div class="col-md-6">															
							
										<h3 class="card-title">														
								
											PCO License										
							
										</h3>                																				
							
										<div class="row align-items-center">                													
								
											<div class="col-auto">
									
												<span class="avatar avatar-xl" style="background-image: url(img/drivers/National-Insurance/<?php echo $drow['national_insurance'];?>); background-size:contain; width: 220px; height: 160px;"></span>
								
											</div>                    																									
								
											<div class="col-auto">																												
									
												<form action="upload-ni.php" method="post" enctype="multipart/form-data" onsubmit="return validateForm('ni')">
										
													<input type="hidden" name="d_id" value="<?php echo $d_id; ?>">										
										
													<input type="file" id="ni" name="ni" accept="image/*"  class="form-control" required>
										
													<input type="submit" value="Upload Image" name="submit"  class="btn btn-info" style="margin-top: 25px;">
									
												</form>																			
								
											</div>								
							
										</div>  										
						
									</div>																												
						
									<div class="col-md-6">											
							
										<h3 class="card-title">							
								
											Proof of Address						
							
										</h3>                															
							
										<div class="row align-items-center">                							
								
											<div class="col-auto">																						
									
												<span class="avatar avatar-xl" style="background-image: url(img/drivers/Basic-Disclosure/<?php echo $drow['basic_disclosure'];?>); background-size:contain; width: 220px; height: 160px;"></span>													
								
											</div>                    																		
								
											<div class="col-auto">																				
									
												<form action="upload-bd.php" method="post" enctype="multipart/form-data" onsubmit="return validateForm('bd')">									
										
													<input type="hidden" name="d_id" value="<?php echo $d_id; ?>">
										
													<input type="file" id="bd" name="bd" accept="image/*"  class="form-control" required>										
										
													<input type="submit" value="Upload Image" name="submit"  class="btn btn-info" style="margin-top: 25px;">
									
												</form>																		
								
											</div>							
							
										</div>  										
						
									</div>										
					
								</div>
																		
				
								<div class="row mb-3">				
						
									<div class="col-md-6">										
							
										<h3 class="card-title">							
								
											Proof of Address 2						
							
										</h3>                																					
							
										<div class="row align-items-center">                														
								
											<div class="col-auto">
									
												<span class="avatar avatar-xl" style="background-image: url(img/drivers/Work-Proof/<?php echo $drow['work_proof'];?>); background-size:contain; width: 220px; height: 160px;"></span>																				
								
											</div>                    																										
								
											<div class="col-auto">																				
									
												<form action="upload-wp.php" method="post" enctype="multipart/form-data" onsubmit="return validateForm('wp')">									
										
													<input type="hidden" name="d_id" value="<?php echo $d_id; ?>">
										
													<input type="file" id="wp" name="wp" accept="image/*"  class="form-control" required>							
													
										
													<input type="submit" value="Upload Image" name="submit"  class="btn btn-info" style="margin-top: 25px;">
									
												</form>																			
								
											</div>											
							
										</div>  										
						
									</div>
					
					
					
						
									<div class="col-md-6">					
						
										<h3 class="card-title">
							
											DVLA 						
							
										</h3>                															
							
										
										<div class="row align-items-center">                
								
											<div class="col-auto">															
									
												<span class="avatar avatar-xl" style="background-image: url(img/drivers/Passport/<?php echo $drow['passport'];?>); background-size:contain; width: 220px; height: 160px;"></span>																				
								
											</div>                    																		
								
											<div class="col-auto">																				
									
												<form action="upload-passport.php" method="post" enctype="multipart/form-data" onsubmit="return validateForm('pass')">
										
													<input type="hidden" name="d_id" value="<?php echo $d_id; ?>">										
										
													<input type="file" id="pass" name="pass" accept="image/*"  class="form-control" required>
										
													<input type="submit" value="Upload Image" name="submit"  class="btn btn-info" style="margin-top: 25px;">
									
												</form>																		
								
											</div>													              															
							
										</div>  										
						
									</div>					
					
								</div>					
																			
					
								<div class="row mb-3">					
						
									<div class="col-md-6">											
							
										<h3 class="card-title">							
								
										National Insurance
							
										</h3>                															
							
										<div class="row align-items-center">                							
								
											<div class="col-auto">																							
									
												<span class="avatar avatar-xl" style="background-image: url(img/drivers/DVLA/<?php echo $drow['dvla'];?>); background-size:contain; width: 220px; height: 160px;"></span>																				
								
											</div>                    																		
								
											<div class="col-auto">																				
									
												<form action="upload-dvla.php" method="post" enctype="multipart/form-data" onsubmit="return validateForm('dvla')">
										
													<input type="hidden" name="d_id" value="<?php echo $d_id; ?>">										
										
													<input type="file" id="dvla" name="dvla" accept="image/*"  class="form-control" required>
										
													<input type="submit" value="Upload Image" name="submit"  class="btn btn-info" style="margin-top: 25px;">
									
												</form>																				
								
											</div>											
							
										</div>  										
						
									</div>		
									
									<div class="col-md-6">											
							
										<h3 class="card-title">							
								
										Extra
							
										</h3>                															
							
										<div class="row align-items-center">                							
								
											<div class="col-auto">																							
									
												<span class="avatar avatar-xl" style="background-image: url(img/drivers/DVLA/<?php echo $drow['dvla'];?>); background-size:contain; width: 220px; height: 160px;"></span>																				
								
											</div>                    																		
								
											<div class="col-auto">																				
									
												<form action="upload-dvla.php" method="post" enctype="multipart/form-data" onsubmit="return validateForm('dvla')">
										
													<input type="hidden" name="d_id" value="<?php echo $d_id; ?>">										
										
													<input type="file" id="dvla" name="dvla" accept="image/*"  class="form-control" required>
										
													<input type="submit" value="Upload Image" name="submit"  class="btn btn-info" style="margin-top: 25px;">
									
												</form>																				
								
											</div>											
							
										</div>  										
						
									</div>
					
								</div>																
				
							</div>