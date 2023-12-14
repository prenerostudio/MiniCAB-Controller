<?php
include('header.php');

$b_id = $_GET['id'];

$bsql=mysqli_query($connect,"SELECT * FROM `bookers` WHERE `b_id`='$b_id'");											
					
$brow = mysqli_fetch_array($bsql);		


?> 
<div class="container-xl">           
	<div class="card">	
		<div class="row g-0">                    		
			<div class="col-12 col-md-12 d-flex flex-column">        			
				<div class="card-body">            				
					<h2 class="mb-4">Booker Profile</h2>                				
					<h3 class="card-title">Profile Image</h3>                				
					<div class="row align-items-center">                
					
						
												<div class="col-auto">
						

													
							<span class="avatar avatar-xl" style="background-image: url(img/bookers/<?php echo $brow['b_pic'];?>); background-size:cover; width: 220px;
   height: 160px;"></span>							
	
						
												</div>                    					
						
						
												<div class="col-auto">						
						
						
													<form action="update-booker-img.php" method="post" enctype="multipart/form-data">
								<input type="hidden" value="<?php echo $brow['b_id']; ?>" name="b_id">
							
								<input type="file" name="fileToUpload" id="fileToUpload" class="btn" required>
								
								<button type="submit" class="btn btn-info">Upload Image </button>                       						
								
							  </form>				
					
												</div>                      					
					
												<div class="col-auto">						
							
													<a href="del-booker-img.php?id=<?php echo $brow['b_id']; ?>" class="btn btn-ghost-danger">                         
								
														Delete avatar                       
							
													</a>					
						
												</div>                   				
					
											</div>                				
					<h3 class="card-title mt-4">Profile Details</h3> 
					
					<form method="post" action="update-booker.php" enctype="multipart/form-data">
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
								<div class="form-label">Other Details</div>                        						
								<input type="text" class="form-control" value="<?php echo $brow['others'] ?>" name="others">                     
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
								<div class="form-label">Address</div>  
								<textarea class="form-control" rows="3" name="baddress"><?php echo $brow['b_address'] ?></textarea>								             
							</div>															
						</div>												
						<div class="col-md-4">					
							<div class="mb-3">                    						
								<div class="form-label">Company Name</div>                        						
								<input type="text" class="form-control" value="<?php echo $brow['company_name']; ?>" name="company">
							</div>                    					
							<div class="mb-3">                    						
								<div class="form-label">National ID</div>                        						
								<input type="text" class="form-control" value="<?php echo $brow['b_ni'] ?>" name="bni">                      					
							</div>                    					
														
							
							<div class="mb-3">                    					
								<div class="form-label">Date Registered</div>                        						
								<input type="text" class="form-control" value="<?php echo $brow['booker_reg_date'] ?>" disabled>                     
							</div>
						</div>                    
					</div>                                       
					<h3 class="card-title mt-4">
						Password
					</h3>                   
					<p class="card-subtitle">
						You can set a permanent password if you don't want to use temporary login codes.
					</p>                    
					<div>                      
						<a href="#" class="btn">                       
							Set new password                     
						</a>                   
					</div>                                    
				</div>                 
				<div class="card-footer bg-transparent mt-auto">                 
					<div class="btn-list justify-content-end">                 
						<a href="bookers.php" class="btn">  
							<i class="ti ti-circle-x" style="margin-right: 10px; font-size: 20px;"></i>
							Cancel                  
						</a>                  
						 
							<button type="submit" class="btn btn-primary">
						<i class="ti ti-refresh" style="margin-right: 10px; font-size: 20px;"></i>
								Update
						</button>
						                    
					                  
					</div>                 
				</div>										
					</form>               
			</div>              
		</div>            
	</div>         
</div>
<?php
include('footer.php');
?>