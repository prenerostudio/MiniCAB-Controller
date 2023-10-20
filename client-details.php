<?php
include('header.php');

$c_id = $_GET['id'];

$csql=mysqli_query($connect,"SELECT * FROM `clients` WHERE `c_id`='$c_id'");											
					
$crow = mysqli_fetch_array($csql);		


?> 
<div class="container-xl">           
	<div class="card">	
		<div class="row g-0">                    		
			<div class="col-12 col-md-12 d-flex flex-column">        			
				<div class="card-body">            				
					<h2 class="mb-4">Customer Profile</h2>                				
					<h3 class="card-title">Profile Details</h3>                				
					<div class="row align-items-center">                
						<div class="col-auto">
							<span class="avatar avatar-xl" style="background-image: url(<?php echo $crow['c_pic'];  ?>)"></span>							
						</div>                    					
						<div class="col-auto">						
							<a href="#" class="btn">                    						
								Change avatar                        						
							</a>					
						</div>                      					
						<div class="col-auto">						
							<a href="#" class="btn btn-ghost-danger">                         
								Delete avatar                       
							</a>					
						</div>                   				
					</div>                				
					<h3 class="card-title mt-4">Business Profile</h3> 
					
					<form method="post" action="update-clients.php" enctype="multipart/form-data">
					<div class="row g-3">                
						<div class="col-md-4">					
							<div class="mb-3">                    						
								<div class="form-label">Customer Name</div>                        						
								<input type="text" class="form-control" value="<?php echo $crow['c_id']; ?>" name="c_id">  
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
								<div class="form-label">Address</div>  
								<textarea class="form-control" rows="3" name="caddress"><?php echo $crow['c_address'] ?></textarea>								             
							</div>															
						</div>												
						<div class="col-md-4">					
							<div class="mb-3">                    						
								<div class="form-label">Company Name</div>                        						
								<input type="text" class="form-control" value="<?php echo $crow['company_name']; ?>" name="company">
							</div>                    					
							<div class="mb-3">                    						
								<div class="form-label">National ID</div>                        						
								<input type="text" class="form-control" value="<?php echo $crow['c_ni'] ?>" name="cni">                      					
							</div>                    					
							<div class="mb-3">                    					
								<div class="form-label">Other Details</div>                        						
								<input type="text" class="form-control" value="<?php echo $crow['others'] ?>" name="others">                     
							</div>							
							
							<div class="mb-3">                    					
								<div class="form-label">Date Registered</div>                        						
								<input type="text" class="form-control" value="<?php echo $crow['reg_date'] ?>" disabled>                     
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
<?php
include('footer.php');
?>