<?php
include('header.php');
$c_id = $_GET['c_id'];
$csql=mysqli_query($connect,"SELECT * FROM `clients` WHERE `c_id`='$c_id'");
$crow = mysqli_fetch_array($csql);		
?>
<div class="page-header d-print-none page_padding">		   			
	<div class="row g-2 align-items-center">        		
		<div class="col">            										
			<div class="page-pretitle">                						
				Overview                				
			</div>                			
			<h2 class="page-title">                			
				View Customer Details              				
			</h2>              			
		</div>		
		<div class="col-auto ms-auto d-print-none">            		
			<div class="btn-list">                			
				<?php
				if($crow['acount_status']==0){
					?>				
				<a href="update-customer-status.php?id=<?php echo $c_id ?>" class="btn btn-primary d-none d-sm-inline-block">
					<i class="ti ti-checks"></i>                    					
					Approve Customer                 					
				</a>   
					<?php
				}else {					
					?>				
				<button class="btn btn-disable d-none d-sm-inline-block" disabled>  									
					<i class="ti ti-checks"></i>                    					
					Verified Customer                 					
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
		<div class="col-12">            					
			<div class="card">                															
				<div class="card-body border-bottom py-3">				
					<h2 class="mb-4">Customer Profile</h2>                									
					<h3 class="card-title">Profile Details</h3>                														
					<div class="row align-items-center">
						<div class="col-auto">
							<span class="avatar avatar-xl" 
								  style="background-image: url(img/customers/<?php echo $crow['c_pic'];?>); 
										 background-size:cover; width: 220px; height: 160px;"></span>	
						</div>					
						<div class="col-auto">						
							<form action="update-customer-img.php" method="post" enctype="multipart/form-data">
								<input type="hidden" value="<?php echo $crow['c_id']; ?>" name="c_id">								
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
					<form method="post" action="update-customer.php" enctype="multipart/form-data">					
						<div class="row g-3">                						
							<div class="col-md-4">												
								<div class="mb-3">                    														
									<div class="form-label">Customer Name</div>
									<input type="hidden" class="form-control" value="<?php echo $crow['c_id']; ?>" name="c_id">
									<input type="text" class="form-control" value="<?php echo $crow['c_name']; ?>" name="cname">  
								</div>                    					
								<div class="mb-3">                    														
									<div class="form-label">Email Address</div>
									<input type="text" class="form-control" value="<?php echo $crow['c_email']; ?>" name="cemail" readonly>
								</div>                    												
								<div class="mb-3">                    														
									<div class="form-label">Phone</div>								
									<input type="text" class="form-control" value="<?php echo $crow['c_phone']; ?>" name="cphone" readonly>
								</div>									
								<div class="mb-3">                    														
									<div class="form-label">Address</div>  								
									<textarea class="form-control" rows="3" name="caddress"><?php echo $crow['c_address'] ?></textarea>
								</div>													
							</div>																						
							<div class="col-md-4">
								<div class="mb-3">
									<div class="form-label">Gender</div>
									<input type="text" class="form-control" value="<?php echo $crow['c_gender']; ?>" name="cgender">
								</div>                    												
								<div class="mb-3">                    						
									<div class="form-label">Language </div>
									<input type="text" class="form-control" value="<?php echo $crow['c_language']; ?>" name="clang">
								</div>																					
								<div class="mb-3">                    						
									<div class="form-label">Postal Code</div>
									<input type="text" class="form-control" value="<?php echo $crow['postal_code'] ?>" name="postal_code">
								</div>															
								<div class="mb-3">                    														
									<div class="form-label">Other Details</div>  								
									<textarea class="form-control" rows="3" name="others"><?php echo $crow['others'] ?></textarea>
								</div>																					
							</div>																		
							<div class="col-md-4">																			
								<div class="mb-3">                    						
									<div class="form-label">National ID</div>
									<input type="text" class="form-control" value="<?php echo $crow['c_ni'] ?>" name="cni">
								</div>
								<div class="mb-3">                    													
									<div class="form-label">Date Registered</div>
									<input type="text" class="form-control" value="<?php echo $crow['reg_date'] ?>" disabled>
								</div>						
							</div>                    					
						</div>
						</div>                 				
					<div class="card-footer bg-transparent mt-auto">                 
						<div class="btn-list justify-content-end">                 
							<a href="drivers.php" class="btn">                  
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