<?php
include('header.php');

$v_id = $_GET['v_id'];


$vsql=mysqli_query($connect,"SELECT * FROM `vehicles` WHERE `v_id`='$v_id'");											
					
$vrow = mysqli_fetch_array($vsql);		


?> 
<div class="container-xl">           
	<div class="card">	
		<div class="row g-0">                    		
			<div class="col-12 col-md-12 d-flex flex-column">        			
				<div class="card-body">            				
					<h2 class="mb-4">Vehicle Details</h2>                				
					             				
						<div class="row align-items-center">		
						<div class="col-auto">
							<span class="avatar avatar-xl" style="background-image: url(img/vehicles/<?php echo $vrow['v_img'];?>); background-size:contain; width: 220px;
   height: 160px;"></span>							
						</div>						
						<div class="col-auto">					
							<form action="update-vehicle-img.php" method="post" enctype="multipart/form-data">
								<input type="hidden" value="<?php echo $vrow['v_id']; ?>" name="v_id">
								<input type="file" name="fileToUpload" id="fileToUpload" class="btn">	
								<button type="submit" class="btn btn-info">Upload Image </button>
							</form>
						</div>
						<div class="col-auto">	
							<a href="del-vehicle-img.php?v_id=<?php echo $v_id; ?>" class="btn btn-ghost-danger">					
								Delete Vehicle Image                      
							</a>	
						</div>                   																	
					</div>                				
					<h3 class="card-title mt-4">Business Profile</h3> 
					
					<form method="post" action="update-vehicles.php" enctype="multipart/form-data">
					<div class="row g-3">                
						<div class="col-md-4">					
							<div class="mb-3">                    						
								<div class="form-label">Vehicle Name</div>                        						
								<input type="hidden" class="form-control" value="<?php echo $vrow['v_id']; ?>" name="v_id">  
								<input type="text" class="form-control" value="<?php echo $vrow['v_name']; ?>" name="vname">  
							</div>  
							
							<div class="mb-3">                    						
								<div class="form-label">Wheel Chair</div>   
								<select class="form-control" name="vchair">
								<option value="<?php echo $vrow['w_chair'] ?>"><?php 
									if ($vrow['v_wchair'] == 1) {
										?>    
										Yes
										<?php
									} else {
										?>    
										No
										<?php
									}
										?>	</option>
									<option value="1">Yes</option>
									<option value="0">No</option>
								
								</select>
							</div>  
							
							<div class="mb-3">                    						
								<div class="form-label">Baby Sitter</div>   
								<select class="form-control" name="vbaby">
								<option value="<?php echo $vrow['v_babyseat'] ?>"><?php 
									if ($vrow['v_babyseat'] == 1) {
										?>    
										Yes
										<?php
									} else {
										?>    
										No
										<?php
									}
										?>	</option>
									<option value="1">Yes</option>
									<option value="0">No</option>
								
								</select>
							</div>  
																	
						</div>																
						<div class="col-md-4">					
							<div class="mb-3">                    					
								<div class="form-label">No. of Seats</div>                        						
								<input type="text" class="form-control" value="<?php echo $vrow['v_seat']; ?>" name="vseat">  
							</div>  
							
							
							
							<div class="mb-3">                    					
								<div class="form-label">Pricing</div>                        						
								<input type="text" class="form-control" value="<?php echo $vrow['v_pricing'] ?>" name="vpricing">                     
							</div>
																				
						</div>												
						<div class="col-md-4">					
							<div class="mb-3">                    						
								<div class="form-label">Air Bags</div>   
								<select class="form-control" name="vbags">
								<option value="<?php echo $vrow['v_airbags']; ?>"><?php 
									if ($vrow['v_airbags'] == 1) {
										?>    
										
									Yes
									
										<?php
									} else {
										?>    
										
									No
										<?php
									}
										?>	</option>
									<option value="1">Yes</option>
									<option value="0">No</option>
								
								</select>
							</div>   
							
						
							
							<div class="mb-3">                    					
								<div class="form-label">Date Added</div>                        						
								<input type="text" class="form-control" value="<?php echo $vrow['date_added'] ?>" disabled>                     
							</div>
						</div>                    
					</div>                                       
					                               
				</div>                 
				<div class="card-footer bg-transparent mt-auto">                 
					<div class="btn-list justify-content-end">                 
						<a href="vehicle.php" class="btn">                  
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