<?php
include('header.php');

$d_id = $_GET['id'];

$dsql=mysqli_query($connect,"SELECT * FROM `drivers` WHERE `d_id`='$d_id'");											
					$drow = mysqli_fetch_array($dsql);		


?> 
<div class="container-xl">           
	<div class="card">	
		<div class="row g-0">                    		
			<div class="col-12 col-md-12 d-flex flex-column">        			
				<div class="card-body">            				
					<h2 class="mb-4">Driver Profile</h2>                				
					<h3 class="card-title">Profile Details</h3>                				
					<div class="row align-items-center">                
						<div class="col-auto">
							<span class="avatar avatar-xl" style="background-image: url(<?php echo $drow['d_pic'];  ?>)"></span>                    					
						
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
                
				
					<div class="row g-3">
                
						<div class="col-md-4">
					
							<div class="mb-3">
                    
						
								<div class="form-label">Driver Name</div>
                        
						
								<input type="text" class="form-control" value="<?php echo $drow['d_name']; ?>" name="dname">
                      
					
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
                        
						
								<input type="text" class="form-control" value="<?php echo $drow['v_id']; ?>" name="dlang" readonly>
                      
							</div>
					
					
						</div>
					
						
					
						<div class="col-md-4">
					
							<div class="col-md">
                    
					
								<div class="form-label">Email Address</div>
                        
						
								<input type="text" class="form-control" value="<?php echo $drow['d_email']; ?>" name="demail">
                      
					
							</div>
                    
					
							<div class="col-md">
                    
						
								<div class="form-label">Phone </div>
                        
						
								<input type="text" class="form-control" value="<?php echo $drow['d_phone']; ?>" name="dphone">
                      
					
							</div>
                    
					
							<div class="col-md">
                    
						
								<div class="form-label">Skype Account</div>
                        
						
								<input type="text" class="form-control" value="<?php echo $drow['skype_acount'] ?>">
                     
							</div>
					
					
						</div>
						
						
						<div class="col-md-4">
					
							<div class="mb-3">
                    
						
								<div class="form-label">Licence</div>
                        
						
								<input type="text" class="form-control" value="<?php echo $drow['d_licence']; ?>" name="dlicence">
                      
					
							</div>
                    
					
							<div class="mb-3">
                    
						
								<div class="form-label">Licence Expiring Date</div>
                        
						
								<input type="text" class="form-control" value="<?php echo $drow['d_licence_exp'] ?>">
                      
					
							</div>
                    
					
							<div class="mb-3">
                    
					
								<div class="form-label">PCO Licence</div>
                        
						
								<input type="text" class="form-control" value="<?php echo $drow['pco_licence'] ?>">
                     
							</div>
							
							<div class="mb-3">
                    
					
								<div class="form-label">PCO Licence Expiring Date</div>
                        
						
								<input type="text" class="form-control" value="<?php echo $drow['pco_exp'] ?>">
                     
							</div>
					
					
						</div>
                    
					</div>
                   

                    <h3 class="card-title mt-4">Password</h3>
                    <p class="card-subtitle">You can set a permanent password if you don't want to use temporary login codes.</p>
                    <div>
                      <a href="#" class="btn">
                        Set new password
                      </a>
                    </div>
                    <h3 class="card-title mt-4">Public profile</h3>
                    <p class="card-subtitle">Making your profile public means that anyone on the Dashkit network will be able to find
                      you.</p>
                    <div>
                      <label class="form-check form-switch form-switch-lg">
                        <input class="form-check-input" type="checkbox" >
                        <span class="form-check-label form-check-label-on">You're currently visible</span>
                        <span class="form-check-label form-check-label-off">You're
                          currently invisible</span>
                      </label>
                    </div>
                  </div>
                  <div class="card-footer bg-transparent mt-auto">
                    <div class="btn-list justify-content-end">
                      <a href="drivers.php" class="btn">
                        Cancel
                      </a>
                      <a href="#" class="btn btn-primary">
                        Submit
                      </a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
         
</div>
<?php
include('footer.php');
?>