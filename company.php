<?php
include('header.php');

$usql=mysqli_query($connect,"SELECT * FROM `company` WHERE `user_id`='$myId'");				
$urow = mysqli_fetch_array($usql);
?> 
<div class="container-xl">           
	<div class="card">	
		<div class="row g-0">                    		
			<div class="col-12 col-md-12 d-flex flex-column">        			
				<div class="card-body">            				
					<h2 class="mb-4">Company Profile</h2>                				
					<h3 class="card-title">Company Logo</h3>                				
					<div class="row align-items-center">                
						<div class="col-auto">
							<span class="avatar avatar-xl" style="background-image: url('img/companies/<?php echo $urow['com_logo']; ?>')"></span>			
						</div>                    					
						<div class="col-auto">		
							<form action="update-logo.php" method="post" enctype="multipart/form-data">
								<input type="hidden" value="<?php echo $urow['company_id']; ?>" name="company_id">
								<input type="file" name="fileToUpload" id="fileToUpload" class="btn">
								<button type="submit" class="btn btn-info">
									Upload Image 
								</button>
							</form>
						</div>                      					
						<div class="col-auto">						
							<a href="#" class="btn btn-ghost-danger">                         
								Delete Logo                       
							</a>					
						</div>                   				
					</div>														
					<form method="post" action="update-company.php" enctype="multipart/form-data">
						<div class="row g-3">						
							<div class="col-md-4">							
								<h3 class="card-title mt-4">
									Company Profile
								</h3> 							
								<div class="mb-3">                    						
									<div class="form-label"> Company Name</div>
									<input type="hidden" class="form-control" value="<?php echo $urow['company_id']; ?>" name="company_id">
									<input type="text" class="form-control" value="<?php echo $urow['com_name']; ?>" name="cname">
								</div>
								<div class="mb-3">				
									<div class="form-label">Company Phone</div>
									<input type="text" class="form-control" value="<?php echo $urow['com_phone']; ?>" name="cphone">
								</div>				
								<div class="mb-3">								
									<div class="form-label">Company Contact Email</div>
									<input type="text" class="form-control" value="<?php echo $urow['com_c_email']; ?>" name="cemail">
								</div>							
								<div class="mb-3">								
									<div class="form-label">Company Admin Email</div>
									<input type="text" class="form-control" value="<?php echo $urow['com_a_email']; ?>" name="aemail">
								</div>							
								<div class="mb-3">								
									<div class="form-label">Company Admin Phone</div>
									<input type="text" class="form-control" value="<?php echo $urow['com_a_phone']; ?>" name="aphone">
								</div>							
								<div class="mb-3">							
									<div class="form-label">Company Web</div>
									<input type="text" class="form-control" value="<?php echo $urow['com_web']; ?>" name="cweb">
								</div>						
							</div>						
							<div class="col-md-4">
								<h3 class="card-title mt-4">
									Fiscal Data
								</h3> 															
								<div class="mb-3">
									<div class="form-label">Company Licence</div>
									<input type="text" class="form-control" value="<?php echo $urow['com_licence']; ?>" name="clicence">
								</div>
								<div class="mb-3">
									<div class="form-label">VAT </div>
									<input type="text" class="form-control" value="<?php echo $urow['com_vat']; ?>" name="cvat">
								</div>
								<div class="mb-3">
									<div class="form-label">Company Register Number</div>
									<input type="text" class="form-control" value="<?php echo $urow['com_r_num'] ?>" name="cnum">
								</div>							
								<div class="mb-3">								
									<div class="form-label">Client Tax By Default in %</div>
									<input type="text" class="form-control" value="<?php echo $urow['com_tax'] ?>" name="ctax">
								</div>
							</div>
							<div class="col-md-4">							
								<h3 class="card-title mt-4">
									Company Profile
								</h3>
								<div class="mb-3">								
									<div class="form-label">Company Address</div>
									<input type="text" class="form-control" value="<?php echo $urow['com_address']; ?>" name="caddress">
								</div>							
								<div class="mb-3">								
									<div class="form-label">Zip Code</div>
									<input type="text" class="form-control" value="<?php echo $urow['com_zip'] ?>" name="czip">
								</div>							
								<div class="mb-3">								
									<div class="form-label">City</div>
									<input type="text" class="form-control" value="<?php echo $urow['com_city'] ?>" name="city">
								</div>							
								<div class="mb-3">								
									<div class="form-label">Country</div>
									<input type="text" class="form-control" value="<?php echo $urow['com_country'] ?>" name="country">
								</div>							
								<div class="mb-3">								
									<div class="form-label">Language</div>								
									<input type="text" class="form-control" value="<?php echo $urow['com_language'] ?>" name="clang">							
								</div>							
								<div class="mb-3">
									<div class="form-label">Currency</div>
									<input type="text" class="form-control" value="<?php echo $urow['com_currency'] ?>" name="currency">
								</div>					
								<div class="mb-3">
									<div class="form-label">TimeZone</div>
									<input type="text" class="form-control" value="<?php echo $urow['com_time_zone'] ?>" name="time_zone">
								</div>
							</div>
						</div>
						<div class="card-footer bg-transparent mt-auto">					
							<div class="btn-list justify-content-end">						
								<a href="dashboard.php" class="btn">							
									Cancel						
								</a>						 							
								<button type="submit" class="btn btn-primary">
									Update
								</button>	
							</div>				
						</div>					
					</form>											
				</div>									               			
			</div>              
		</div>            
	</div>         
</div>
<?php
include('footer.php');
?>