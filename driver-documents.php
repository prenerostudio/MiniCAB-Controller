<?php
include('header.php');
$d_id = $_GET['id'];
$dsql=mysqli_query($connect,"SELECT * FROM `drivers` WHERE `d_id` = '$d_id'");	
$drow = mysqli_fetch_array($dsql);	
?> 
<div class="container-xl">           
	<div class="card">		
		<div class="row g-0">                    						
			<div class="col-12 col-md-12 d-flex flex-column">        									
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
								<div class="col-auto">		
									<form action="upload-front.php" method="post" enctype="multipart/form-data">
										<input type="hidden" name="d_id" value="<?php echo $d_id; ?>">										
										<input type="file" name="dl_front" accept="image/*"  class="form-control">
										<input type="submit" value="Upload Image" name="submit"  class="btn btn-info" style="margin-top: 25px;">
									</form>
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
																			
					<div class="row" style="padding-top: 25px;">														
						<div style="width: 50%; float: left;">															
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
						<div style="width: 50%; float: left;">											
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
																		
					<div class="row" style="padding-top: 25px;">				
						<div style="width: 50%; float: left;">										
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
					
					
					
						<div style="width: 50%; float: left;">					
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
																			
					<div class="row" style="padding-top: 25px;">					
						<div style="width: 50%; float: left;">											
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
<?php
include('footer.php');
?>