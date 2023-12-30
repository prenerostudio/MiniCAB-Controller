<?php
include('header.php');
$b_id = $_GET['b_id'];
$bsql=mysqli_query($connect,"SELECT * FROM `bookers` WHERE `b_id`='$b_id'");
$brow = mysqli_fetch_array($bsql);		
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
				if($brow['acount_status']==0){
					?>				
				<a href="update-booker-status.php?b_id=<?php echo $b_id ?>" class="btn btn-primary d-none d-sm-inline-block">				
					<i class="ti ti-checks"></i>                    					
					Approve Booker               					
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
							<span class="avatar avatar-xl" style="background-image: url(img/bookers/<?php echo $brow['b_pic'];?>); background-size:cover; width: 220px;
   height: 160px;"></span>
						</div>					
						<div class="col-auto">					
							<form action="update-booker-img.php" method="post" enctype="multipart/form-data">
								<input type="hidden" value="<?php echo $brow['b_id']; ?>" name="b_id">
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
								
									<input type="hidden" class="form-control" value="<?php echo $brow['b_id']; ?>" name="b_id">  
								
									<input type="text" class="form-control" value="<?php echo $brow['b_name']; ?>" name="bname">  
							
								</div>                    					
							
								<div class="mb-3">                    						
								
									<div class="form-label">Email Address</div>                        						
								
									<input type="text" class="form-control" value="<?php echo $brow['b_email']; ?>" name="bemail" readonly>
							
								</div>                    					
							
								<div class="mb-3">                    						
								
									<div class="form-label">Phone</div>                        						
								
									<input type="text" class="form-control" value="<?php echo $brow['b_phone']; ?>" name="bphone" readonly>                      
							
								</div>	
								<div class="mb-3">                    						
								<div class="form-label">Address</div>  
								<textarea class="form-control" rows="3" name="baddress"><?php echo $brow['b_address'] ?></textarea>								             
							</div>
						
							</div>																
						
							<div class="col-md-4">					
							
								<div class="mb-3">                    					
								<div class="form-label">Gender</div>                        						
								<input type="text" class="form-control" value="<?php echo $brow['b_gender']; ?>" name="bgender">  
							</div>                    					
							<div class="mb-3">                    						
								<div class="form-label">Language </div>                        						
								<input type="text" class="form-control" value="<?php echo $brow['b_language']; ?>" name="blang">
							</div>														
							<div class="mb-3">                    						
								<div class="form-label">Postal Code</div>                        						
								<input type="text" class="form-control" value="<?php echo $brow['postal_code'] ?>" name="postal_code">                     
							</div>								
							<div class="mb-3">                    						
								<div class="form-label">Other Details</div>  
								<textarea class="form-control" rows="3" name="bothers"><?php echo $brow['others'] ?></textarea>								             
							</div>
								<div class="mb-3">                    						
								<div class="form-label">National ID</div>                        						
								<input type="text" class="form-control" value="<?php echo $brow['b_ni'] ?>" name="bni">                      					
							</div>
						</div>												
						<div class="col-md-4">					
							
							       
							
							<div class="mb-3">                    						
								<div class="form-label">Company Name</div>                        						
								<input type="text" class="form-control" value="<?php echo $brow['company_name'] ?>" name="com_name">                      					
							</div> 
							
							<div class="mb-3">                    						
								<div class="form-label">Commission Type</div>                        						
								<input type="text" class="form-control" value="<?php echo $brow['commision_type'] ?>" name="com_type">                      					
							</div> 
							
							<div class="mb-3">                    						
								<div class="form-label">% Commission</div>                        						
								<input type="text" class="form-control" value="<?php echo $brow['percent'] ?>" name="percent">                      					
							</div>
							<div class="mb-3">                    						
								<div class="form-label">Fixed</div>                        						
								<input type="text" class="form-control" value="<?php echo $brow['fixed'] ?>" name="fixed">                      					
							</div> 
							
							<div class="mb-3">                    					
								<div class="form-label">Date Registered</div>                        						
								<input type="text" class="form-control" value="<?php echo $brow['booker_reg_date'] ?>" disabled>                     
							</div>
						</div>                    
					</div>                                       
					                                   
				</div>                 
				<div class="card-footer bg-transparent mt-auto">                 
					<div class="btn-list justify-content-end">                 
						<a href="drivers.php" class="btn">                  
							Cancel                  
						</a>                  
						 
							<button type="submit" class="btn btn-primary">Update</button>
						                    
					                  
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