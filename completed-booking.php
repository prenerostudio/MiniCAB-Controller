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
				Completed Jobs List             				
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
				<span class="d-none d-sm-inline">
					<span class="dropdown">						
						<button class="btn dropdown-toggle align-text-top" id="filterDropdown" data-bs-boundary="viewport" data-bs-toggle="dropdown">							
							Search Bookings						
						</button>						
						<div class="dropdown-menu dropdown-menu-end">							
							<a class="filter-item" href="#" data-filter="3"> 							
								All Bookings In 3 Hours								
							</a>							
							<a class="filter-item" href="#" data-filter="6">							
								All Bookings In 6 Hours								
							</a>							
							<a class="filter-item" href="#" data-filter="9">							
								All Bookings In 9 Hours								
							</a>							
							<a class="filter-item" href="#" data-filter="12">							
								All Bookings In 12 Hours								
							</a>							
							<a class="filter-item" href="#" data-filter="24">							
								All Bookings In 24 Hours								
							</a>							
							<a class="filter-item" href="#" data-filter="72">							
								All Bookings In 3 Days								
							</a>							
							<a class="filter-item" href="#" data-filter="168">							
								All Bookings In 7 Days								
							</a>							
							<a class="filter-item" href="#" data-filter="336">							
								All Bookings In 14 Days								
							</a>							
							<a class="filter-item" href="#" data-filter="720">							
								All Bookings In 30 Days								
							</a>							
							<a class="filter-item" href="#" data-filter="2160">							
								All Bookings In 3 Months								
							</a>							
							<a class="filter-item" href="#" data-filter="4320">							
								All Bookings In 6 Months								
							</a>							
							<a class="filter-item" href="#" data-filter="8760">							
								All Bookings In 12 Months								
							</a>																					
						</div>                            																
					</span>				
				</span> 				
				<script>					
					$(document).ready(function() {    
						$(".filter-item").click(function(event) {        
							event.preventDefault();        
							var selectedInterval = $(this).data("filter");        
							console.log("Selected Interval:", selectedInterval);							    
							$.ajax({            
								type: "GET",            
								url: "fetch-completed-booking.php",            
								data: { timeInterval: selectedInterval },            
								success: function(data) {                
									console.log("Ajax Success:", data);                
									$("#tableBody").html(data);            
								},            
								error: function(xhr, status, error) {                
									console.error("Ajax Error:", error);            
								}        
							});    
						});
					});					   
				</script>	
			</div>		
		</div>	
	</div>  
</div>
<div class="page-body page_padding">          		
	<div class="row row-deck row-cards">          				
		<div class="col-12">            					
			<div class="card">                							
				<div class="card-header">                    									
					<h3 class="card-title">
						Completed Bookings
					</h3>                  										
				</div>                  				
				<div class="card-body border-bottom py-3">				
					<div id="table-default" class="table-responsive">                  					
						<table class="table" id="table-complete">                    						
							<thead>                      							
								<tr>                        								
									<th>ID</th>                        									
									<th>Date</th>                        									
									<th>Time</th>                       									
									<th>Postcode</th>                        									
									<th>Pickup</th> 
									<th>Stops</th>
									<th>Dropoff</th> 
									<th>Passenger</th> 
									<th>Journey Type</th> 
									<th>Fare</th>						   									
									<th>Vehicle</th>						  									
									<th>Status</th>						   									
									<th>Driver</th>									
								</tr>                   								
							</thead>                  							
							<tbody class="table-tbody" id="tableBody">												
								<?php																		
								$y=0;																
								$jobsql=mysqli_query($connect,"SELECT jobs.*, clients.c_name, clients.c_email, clients.c_phone, drivers.*, booking_type.*, vehicles.*, bookings.book_id, bookings.b_type_id, bookings.pickup, bookings.stops, bookings.destination, bookings.address, bookings.postal_code, bookings.passenger, bookings.pick_date, bookings.pick_time, bookings.journey_type, bookings.v_id,  bookings.luggage, bookings.child_seat, bookings.flight_number, bookings.delay_time, bookings.note FROM jobs JOIN bookings ON jobs.book_id = bookings.book_id JOIN clients ON jobs.c_id = clients.c_id JOIN drivers ON jobs.d_id = drivers.d_id JOIN booking_type ON bookings.b_type_id = booking_type.b_type_id JOIN vehicles ON bookings.v_id = vehicles.v_id WHERE jobs.job_status = 'Completed' ORDER BY jobs.job_id DESC");									
								while($jobrow = mysqli_fetch_array($jobsql)){
									$y++;									
								?>		
								<tr>                        								
									<td>
										<?php echo $jobrow['book_id']; ?>
									</td>                        									
									<td>
										<?php echo $jobrow['pick_date'];?>
									</td>
									<td>
										<?php echo $jobrow['pick_time'];?>
									</td>
									<td>
										<?php echo $jobrow['postal_code'];?>
									</td>  									
									<td>
										<?php echo $jobrow['pickup'];?>
									</td> 
									<td>
										<?php echo $jobrow['stops'];?>
									</td>	
									<td>
										<?php echo $jobrow['destination'];?>
									</td>	
									<td>
										<?php echo $jobrow['passenger'];?>
									</td> 
									<td>
										<?php echo $jobrow['journey_type'];?>
									</td> 
									<td> 
										<?php echo $jobrow['journey_fare'];?> 
									</td>									
									<td> 
										<?php echo $jobrow['v_name'];?> 
									</td>									
									<td> 
										<div class="col-auto status">
											<span class="status-dot status-dot-animated bg-green d-block"></span>
											<span><?php echo $jobrow['job_status'];?> </span>											
										</div>
										
									</td>									
									<td> 
										<h4><?php echo $jobrow['d_name'];?></h4>
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
    $('#table-complete').DataTable({
        "order": [[ 0, "desc" ]] 
    });
});
</script>
<?php	
include('footer.php');	
?>