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
				Dashboard                				
			</h2>              			
		</div>						
	</div>	
</div>          
<div class="page-body page_padding">          
	<div class="row row-deck row-cards">          	
		<div class="col-12">            					
			<div class="card">                							
				<div class="card-header">                    									
					<h3 class="card-title">
						Completed Jobs
					</h3>
				</div>                  				
				<div class="card-body border-bottom py-3">				
					<div id="table-default" class="table-responsive">                  					
						<table class="table" id="table-history">                    						
							<thead>                      							
								<tr>                        								
									<th>ID</th>                        
									<th>Date</th>                        
									<th>Time</th>                       									
									<th>Passenger</th>                        									
									<th>Pickup</th>                        									
									<th>Dropoff</th>                       									
									<th>Fare</th>						   									
									<th>Vehicle</th>						  
									<th>Status</th>						   					
									<th>Driver</th>									
								</tr>                   
							</thead>                  
							<tbody class="table-tbody">									
								<?php																		
								$y=0;																
								$jobsql=mysqli_query($connect,"SELECT jobs.*, bookings.*, clients.*, drivers.*, booking_type.*, vehicles.* FROM jobs INNER JOIN bookings ON jobs.book_id = bookings.book_id INNER JOIN clients ON jobs.c_id = clients.c_id INNER JOIN drivers ON jobs.d_id = drivers.d_id INNER JOIN booking_type ON bookings.b_type_id = booking_type.b_type_id INNER JOIN vehicles ON bookings.v_id = vehicles.v_id WHERE jobs.job_status = 'Completed' ORDER BY jobs.job_id DESC");
								while($jobrow = mysqli_fetch_array($jobsql)){											
									$y++;
								?>														                     
								<tr>                        								
									<td>
										<?php echo $y; ?>
									</td>									
									<td>
										<?php echo $jobrow['pick_date']; ?>
									</td>
									<td>
										<?php echo $jobrow['pick_time']; ?>
									</td>
									<td>
										<?php echo $jobrow['passenger']; ?>
									</td>
									<td>
										<?php echo $jobrow['pickup']; ?>
									</td>
									<td>
										<?php echo $jobrow['destination']; ?>
									</td>
									<td> 
										<?php echo $jobrow['journey_fare']; ?> 
									</td>
									<td> 
										<?php echo $jobrow['v_name']; ?> 
									</td>
									<td> 
										<?php echo $jobrow['job_status']; ?> 
									</td>
									<td> 
										<?php echo $jobrow['d_name']; ?> 
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
    $('#table-history').DataTable();
});
</script>
<?php	
include('footer.php');	
?>