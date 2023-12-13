<?php
include('header.php');

$fare_id = $_GET['id'];

$fsql=mysqli_query($connect,"SELECT
	fares.*, 
	jobs.*, 
	drivers.*, 
	bookings.*
FROM
	fares,
	jobs,
	drivers,
	bookings
WHERE
	fares.job_id = jobs.job_id AND
	fares.d_id = drivers.d_id AND
	jobs.book_id = bookings.book_id AND
	fares.fare_id ='$fare_id'");											
					
$frow = mysqli_fetch_array($fsql);		


?> 
<div class="container-xl">           
	<div class="card">	
		<div class="row g-0">                    		
			<div class="col-12 col-md-12 d-flex flex-column">        			
				<div class="card-body">            				
					<h2 class="mb-4">Fare Details</h2>                				
					               				
					
					
					<form method="post" action="update-fares.php" enctype="multipart/form-data">
					<div class="row g-3">                
						<div class="col-md-6">					
							<div class="mb-3">                    						
								<div class="form-label">Job Details</div>                        						
								<input type="hidden" class="form-control" value="<?php echo $frow['fare_id']; ?>" name="fare_id">  
								<input type="text" class="form-control" value="<?php echo $frow['pickup'].' '.$frow['destination']; ?>" readonly>  
							</div>                    					
							<div class="mb-3">                    						
								<div class="form-label">Jouney Fare</div>                        						
								<input type="text" class="form-control" value="<?php echo $frow['journey_fare']; ?>" readonly>
							</div> 
							<div class="mb-3">                    						
								<div class="form-label">Parking Charges</div>                        						
								<input type="text" class="form-control" value="<?php echo $frow['parking']; ?>" name="pkc">
							</div> 
														
																	
						</div>																
						<div class="col-md-6">					
							<div class="mb-3">                    					
								<div class="form-label">Driver Name</div>                        						
								<input type="text" class="form-control" value="<?php echo $frow['d_name']; ?>" readonly>  
							</div>                    					
							<div class="mb-3">                    						
								<div class="form-label">Extra Waiting Charges</div>                        						
								<input type="text" class="form-control" value="<?php echo $frow['extra_waiting']; ?>" name="ewc">
							</div>	
							<div class="mb-3">                    						
								<div class="form-label">Tolls</div>                        						
								<input type="text" class="form-control" value="<?php echo $frow['tolls']; ?>" name="tolls">
							</div> 
															
																						
						</div>												
						                    
					</div>                                       
					                                   
				</div>                 
				<div class="card-footer bg-transparent mt-auto">                 
					<div class="btn-list justify-content-end">                 
						<a href="fare-correction.php" class="btn">  
							<i class="ti ti-circle-x" style="margin-right: 10px; font-size: 20px;"></i>
							Cancel                  
						</a>                  
						 
							<button type="submit" class="btn btn-primary">
								<i class="ti ti-refresh" style="margin-right: 10px; font-size: 20px;"></i>
								Update Charges
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