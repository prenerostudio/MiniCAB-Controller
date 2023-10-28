<?php
include('header.php');

$ap_id = $_GET['id'];

$asql=mysqli_query($connect,"SELECT * FROM `airports` WHERE `ap_id`='$ap_id'");											
					
$arow = mysqli_fetch_array($asql);		


?> 
<div class="container-xl">           
	<div class="card">	
		<div class="row g-0">                    		
			<div class="col-12 col-md-12 d-flex flex-column">        			
				<div class="card-body">            				
					<h2 class="mb-4">Airport Details</h2>                				
					               				
					
					
					<form method="post" action="update-airport.php" enctype="multipart/form-data">
					<div class="row g-3">                
						<div class="col-md-6">					
							<div class="mb-3">                    						
								<div class="form-label">Airport Name</div>                        						
								<input type="hidden" class="form-control" value="<?php echo $arow['ap_id']; ?>" name="ap_id">  
								<input type="text" class="form-control" value="<?php echo $arow['ap_name']; ?>" name="ap_name">  
							</div>                    					
							<div class="mb-3">                    						
								<div class="form-label">City</div>                        						
								<input type="text" class="form-control" value="<?php echo $arow['ap_city']; ?>" name="ap_city">
							</div>                    					
														
																	
						</div>																
						<div class="col-md-6">					
							<div class="mb-3">                    					
								<div class="form-label">Address</div>                        						
								<input type="text" class="form-control" value="<?php echo $arow['ap_address']; ?>" name="ap_address">  
							</div>                    					
							<div class="mb-3">                    						
								<div class="form-label">Code</div>                        						
								<input type="text" class="form-control" value="<?php echo $arow['ap_code']; ?>" name="ap_code">
							</div>														
															
																						
						</div>												
						                    
					</div>                                       
					                                   
				</div>                 
				<div class="card-footer bg-transparent mt-auto">                 
					<div class="btn-list justify-content-end">                 
						<a href="airports.php" class="btn">                  
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