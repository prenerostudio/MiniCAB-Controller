<?php
include('header.php');
?>     
<div class="page-header d-print-none">		
	<div class="row g-2 align-items-center page_padding">        	
		<div class="col">            				
			<div class="page-pretitle">                			
				Overview                				
			</div>                			
			<h2 class="page-title">                			
				Bookings In-Process List             				
			</h2>              			
		</div>		
		<div class="col-auto ms-auto d-print-none">            		
			<div class="btn-list">                			
				<span class="d-none d-sm-inline">				
					<a href="upcoming-bookings.php" class="btn">											
						<i class="ti ti-user-search"></i>                     						
						Upcoming Booking                   						
					</a>                  					
				</span> 
				<span class="d-none d-sm-inline">				
					<a href="inprocess-bookings.php" class="btn btn-instagram">
						<i class="ti ti-user-search"></i>                     						
						Bookings InProcess                  						
					</a>                  					
				</span>
				<span class="d-none d-sm-inline">				
					<a href="completed-booking.php" class="btn btn-success">											
						<i class="ti ti-user-search"></i>                     						
						Completed Bookings                   						
					</a>                  					
				</span>
				<span class="d-none d-sm-inline">				
					<a href="cancelled-booking.php" class="btn btn-danger">											
						<i class="ti ti-user-search"></i>                     						
						Cancelled Bookings                   						
					</a>                  					
				</span>
			</div>		
		</div>	
	</div>  
</div>
<div class="page-body page_padding">          		
	<div class="row row-deck row-cards">          				
		<div class="col-12">            					
			<div class="card">                							
				<div class="card-header">                    									
					<h3 class="card-title">Bookings In-Process</h3>
				</div>                  				
				<div class="card-body border-bottom py-3">				
					<div id="table-default" class="table-responsive">
						<table class="table" id="table-inprocess">
							<thead>                      							
								<tr>                        								
									<th>ID</th>
									<th>Date</th>
									<th>Time</th>
									<th>Post Code</th>
									<th>Pickup</th> 
									<th>Stops</th>
									<th>Dropoff</th>   
									<th>Passenger</th>
									<th>Journey Type</th>
									<th>Fare</th>						   									
									<th>Vehicle</th>						  									
									<th>Status</th>						   									
									<th>Driver</th>
									<th>Action</th>
								</tr>
							</thead>							
							<tbody class="table-tbody">								
								<?php								
								$y=0;
								$jobsql=mysqli_query($connect,"SELECT jobs.*, clients.c_name, clients.c_email, clients.c_phone, bookings.*, drivers.*, booking_type.*, vehicles.* FROM jobs JOIN clients ON jobs.c_id = clients.c_id JOIN bookings ON jobs.book_id = bookings.book_id JOIN drivers ON jobs.d_id = drivers.d_id JOIN booking_type ON bookings.b_type_id = booking_type.b_type_id JOIN vehicles ON bookings.v_id = vehicles.v_id WHERE jobs.job_status <> 'Completed' AND jobs.job_status <> 'Cancelled' ORDER BY jobs.job_id DESC");
								while($jobrow = mysqli_fetch_array($jobsql)){								
									$y++;								
								?>											
								<tr>									
									<td>
										<?php echo $y; ?>
									</td>                        									
									<td>
										<?php echo $jobrow['pick_date'] ?>
									</td>
									<td>
										<?php echo $jobrow['pick_time'] ?>
									</td>
									<td>
										<?php echo $jobrow['postal_code'] ?>
									</td>  									
									<td>
										<?php echo $jobrow['pickup'] ?>
									</td> 
									<td>
										<?php echo $jobrow['stops'] ?>
									</td>	
									<td>
										<?php echo $jobrow['destination'] ?>
									</td>
									<td>
										<?php echo $jobrow['passenger'] ?>
									</td>
									<td> 
										<?php echo $jobrow['journey_type'] ?> 
									</td>
									<td> 
										<?php echo $jobrow['journey_fare'] ?> 
									</td>									
									<td> 
										<?php echo $jobrow['v_name'] ?> 
									</td>									
									<td>
																						
										<div class="col-auto status">
											<span class="status-dot status-dot-animated bg-orange d-block"></span>
											<span><?php echo $jobrow['job_status']; ?></span>									
										</div>
										
									</td>									
									<td> 
										<?php echo $jobrow['d_name'] ?>
									</td>
									<td> 
										<a href="withdraw-job.php?job_id=<?php echo $jobrow['job_id']; ?>&book_id=<?php echo $jobrow['book_id']; ?>">
											<button class="btn btn-danger">										
												<i class="ti ti-square-rounded-x"></i>
												Withdraw Job											
											</button>												
										</a>
									</td>
								</tr>																			
								<?php
								}																								
								?>                                       								
							</tbody>                 							
						</table>                						
					</div>                  					
				</div>                                                    				
			</div>              			
		</div>		
	</div>	
</div>        
<script>	
	$(document).ready(function() {
    $('#table-inprocess').DataTable();
});
</script>
<?php	
include('footer.php');	
?>