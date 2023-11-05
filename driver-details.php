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
							<span class="avatar avatar-xl" style="background-image: url(<?php echo $drow['d_pic'];?>); background-size:cover; width: 220px;
    height: 160px;"></span>							
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
					
					<form method="post" action="update-driver.php" enctype="multipart/form-data">
					<div class="row g-3">                
						<div class="col-md-4">					
							<div class="mb-3">                    						
								<div class="form-label">Driver Name</div>                        						
								<input type="hidden" class="form-control" value="<?php echo $drow['d_id']; ?>" name="d_id">  
								<input type="text" class="form-control" value="<?php echo $drow['d_name']; ?>" name="dname">  
							</div>                    					
							<div class="mb-3">                    						
								<div class="form-label">Gender</div>                        						
								<input type="text" class="form-control" value="<?php echo $drow['d_gender']; ?>" name="dgender">
							</div>                    					
							<div class="mb-3">                    						
								<div class="form-label">Language</div>                        						
								<input type="text" class="form-control" value="<?php echo $drow['d_language']; ?>" name="dlang">                      
							</div>							
							<div class="mb-3">                    						
								<div class="form-label">Vehicle</div>         
								<select class="form-control" name="v_id">
									<option value="<?php echo $drow['v_id']; ?>"><?php
										
										$vid=$drow['v_id'];
										
										$vhsql=mysqli_query($connect,"SELECT * FROM `vehicles` WHERE `v_id`='$vid'");											
					$vhrow = mysqli_fetch_array($vhsql);
										
										echo $vhrow['v_name'];
										
										?></option>
								
									<?php
									$vsql=mysqli_query($connect,"SELECT * FROM `vehicles`");											
					
									while($vrow = mysqli_fetch_array($vsql)){		
									?>
									<option value="<?php echo $vrow['v_id']; ?>"><?php echo $vrow['v_name']; ?></option>
								<?php
									}
										?>
								</select>
								                   
							</div>										
						</div>																
						<div class="col-md-4">					
							<div class="mb-3">                    					
								<div class="form-label">Email Address</div>                        						
								<input type="text" class="form-control" value="<?php echo $drow['d_email']; ?>" name="demail">  
							</div>                    					
							<div class="mb-3">                    						
								<div class="form-label">Phone </div>                        						
								<input type="text" class="form-control" value="<?php echo $drow['d_phone']; ?>" name="dphone">
							</div>														
							<div class="mb-3">                    						
								<div class="form-label">Skype Account</div>                        						
								<input type="text" class="form-control" value="<?php echo $drow['skype_acount'] ?>" name="skype">                     
							</div>								
							<div class="mb-3">                    						
								<div class="form-label">Special Remarks</div>  
								<textarea class="form-control" rows="3" name="remarks"><?php echo $drow['d_remarks'] ?></textarea>								             
							</div>															
						</div>												
						<div class="col-md-4">					
							<div class="mb-3">                    						
								<div class="form-label">Licence</div>                        						
								<input type="text" class="form-control" value="<?php echo $drow['d_licence']; ?>" name="dlicence">
							</div>                    					
							<div class="mb-3">                    						
								<div class="form-label">Licence Expiring Date</div>                        						
								<input type="text" class="form-control" value="<?php echo $drow['d_licence_exp'] ?>" name="lexp">                      					
							</div>                    					
							<div class="mb-3">                    					
								<div class="form-label">PCO Licence</div>                        						
								<input type="text" class="form-control" value="<?php echo $drow['pco_licence'] ?>" name="pco">                     
							</div>							
							<div class="mb-3">                    					
								<div class="form-label">PCO Licence Expiring Date</div>                        						
								<input type="text" class="form-control" value="<?php echo $drow['pco_exp'] ?>" name="pcoexp">                     
							</div>
							<div class="mb-3">                    					
								<div class="form-label">Date Registered</div>                        						
								<input type="text" class="form-control" value="<?php echo $drow['driver_reg_date'] ?>" disabled>                     
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