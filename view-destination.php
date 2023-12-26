<?php
include('header.php');

$des_id = $_GET['des_id'];

$dsql=mysqli_query($connect,"SELECT * FROM `destinations` WHERE `des_id`='$des_id'");											
					
$drow = mysqli_fetch_array($dsql);		


?> 
<div class="container-xl">           
	<div class="card">	
		<div class="row g-0">                    		
			<div class="col-12 col-md-12 d-flex flex-column">        			
				<div class="card-body">            				
					<h2 class="mb-4">Destination Details</h2>                				
					               				
					
					
					<form method="post" action="update-destination.php" enctype="multipart/form-data">
					<div class="row g-3">                
						<div class="col-md-6">					
							<div class="mb-3">                    						
								<div class="form-label">Destination Name</div>                        						
								<input type="hidden" class="form-control" value="<?php echo $drow['des_id']; ?>" name="des_id">  
								<input type="text" class="form-control" value="<?php echo $drow['des_name']; ?>" name="des_name">  
							</div>                    					
							<div class="mb-3">                    						
								<div class="form-label">Address</div>                        						
								<input type="text" class="form-control" value="<?php echo $drow['des_address']; ?>" name="des_address">
							</div>                    					
														
																	
						</div>																
						<div class="col-md-6">					
							<div class="mb-3">                    					
								<div class="form-label">City</div>                        						
								<input type="text" class="form-control" value="<?php echo $drow['des_city']; ?>" name="des_city">  
							</div>                    					
							<div class="mb-3">                    						
								<div class="form-label">Code</div>                        						
								<input type="text" class="form-control" value="<?php echo $drow['des_code']; ?>" name="des_code">
							</div>														
															
																						
						</div>												
						                    
					</div>                                       
					                                   
				</div>                 
				<div class="card-footer bg-transparent mt-auto">                 
					<div class="btn-list justify-content-end">                 
						<a href="airports.php" class="btn">                  
						<i class="ti ti-circle-x"></i>
						Cancel                
						</a>                  
						 
							<button type="submit" class="btn btn-primary"><i class="ti ti-360"></i>Update</button>
						                    
					                  
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