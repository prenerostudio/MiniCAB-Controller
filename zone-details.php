<?php
include('header.php');

$zone_id = $_GET['z_id'];

$zsql=mysqli_query($connect,"SELECT * FROM `zones` WHERE `zone_id`='$zone_id'");											
					
$zrow = mysqli_fetch_array($zsql);		


?> 
<div class="container-xl">           
	<div class="card">	
		<div class="row g-0">                    		
			<div class="col-12 col-md-12 d-flex flex-column">        			
				<div class="card-body">            				
					<h2 class="mb-4">Zone Details</h2>                				
					               				
					
					
					<form method="post" action="update-zone.php" enctype="multipart/form-data">
					<div class="row g-3">                
						<div class="col-md-6">					
							<div class="mb-3">                    						
								<div class="form-label">Starting Point</div>                        						
								<input type="hidden" class="form-control" value="<?php echo $zrow['zone_id']; ?>" name="zone_id">  
								<input type="text" class="form-control" value="<?php echo $zrow['starting_point']; ?>" name="sp">  
							</div>                    					
							<div class="mb-3">                    						
								<div class="form-label">Distance</div>                        						
								<input type="text" class="form-control" value="<?php echo $zrow['distance']; ?>" name="dis">
							</div>                    					
														
																	
						</div>																
						<div class="col-md-6">					
							<div class="mb-3">                    					
								<div class="form-label">Ending Point</div>                        						
								<input type="text" class="form-control" value="<?php echo $zrow['end_point']; ?>" name="ep">  
							</div>                    					
							<div class="mb-3">                    						
								<div class="form-label">Fare</div>                        						
								<input type="text" class="form-control" value="<?php echo $zrow['fare']; ?>" name="fare">
							</div>														
															
																						
						</div>												
						                    
					</div>                                       
					                                   
				</div>                 
				<div class="card-footer bg-transparent mt-auto">                 
					<div class="btn-list justify-content-end">                 
						<a href="zones.php" class="btn">                  
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