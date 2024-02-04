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
				Upcoming Jobs List             				
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
								<a class="filter-item" href="#" data-filter="3"> All Bookings In 3 Hours</a>
								<a class="filter-item" href="#" data-filter="6">All Bookings In 6 Hours</a>
								<a class="filter-item" href="#" data-filter="9">All Bookings In 9 Hours</a>
								<a class="filter-item" href="#" data-filter="12">All Bookings In 12 Hours</a>
								<a class="filter-item" href="#" data-filter="24">All Bookings In 24 Hours</a>
								<a class="filter-item" href="#" data-filter="72">All Bookings In 3 Days</a>
								<a class="filter-item" href="#" data-filter="168">All Bookings In 7 Days</a>
								<a class="filter-item" href="#" data-filter="336">All Bookings In 14 Days</a>
								<a class="filter-item" href="#" data-filter="720">All Bookings In 30 Days</a>
								<a class="filter-item" href="#" data-filter="2160">All Bookings In 3 Months</a>
								<a class="filter-item" href="#" data-filter="4320">All Bookings In 6 Months</a>
								<a class="filter-item" href="#" data-filter="8760">All Bookings In 12 Months</a>
							</div>                            
					</span>           					
				</span> 				
				<script>					
					$(document).ready(function() {    
						$(".filter-item").click(function(event) {        
							event.preventDefault();        
							var selectedInterval = $(this).data("filter");        
							console.log("Selected Interval:", selectedInterval);        
							// No need to check if selectedInterval is undefined or null        
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
					<h3 class="card-title">Upcoming Bookings</h3>                  										
				</div>                  				
				<div class="card-body border-bottom py-3">				
					<div id="table-default" class="table-responsive">                  					
						<table class="table">                    						
							<thead>                      							
								<tr>                        								
									<th>									
										<button class="table-sort" data-sort="sort-id">ID</button>										
									</th>                        									
									<th>									
										<button class="table-sort" data-sort="sort-date">Date</button>										
									</th>                        									
									<th>									
										<button class="table-sort" data-sort="sort-time">Time</button>										
									</th>                       									
									<th>									
										<button class="table-sort" data-sort="sort-passenger">Passenger</button>
									</th>                        									
									<th>									
										<button class="table-sort" data-sort="sort-pickup">Pickup</button>
									</th> 
									<th>									
										<button class="table-sort" data-sort="sort-stops">Stops</button>
									</th>
									<th>									
										<button class="table-sort" data-sort="sort-dropoff">Dropoff</button>
									</th>                       									
									<th>									
										<button class="table-sort" data-sort="sort-fare">Fare</button>										
									</th>						   									
									<th>									
										<button class="table-sort" data-sort="sort-vehicle">Vehicle</button>
									</th>						  									
									<th>									
										<button class="table-sort" data-sort="sort-status">Status</button>
									</th>						   									
									<th>									
										<button class="table-sort" data-sort="sort-driver">Driver</button>
									</th>									
																		
								</tr>                   								
							</thead>                  							
							<tbody class="table-tbody" id="tableBody">												
								<?php																		
								$y=0;																
								$jobsql=mysqli_query($connect,"SELECT
	jobs.*, 
	clients.c_name, 
	clients.c_email, 
	clients.c_phone, 
	drivers.*, 
	booking_type.*, 
	vehicles.*, 
	bookings.book_id, 
	bookings.b_type_id, 
	bookings.pickup, 
	bookings.stops, 
	bookings.destination, 
	bookings.address, 
	bookings.postal_code, 
	bookings.passenger, 
	bookings.pick_date, 
	bookings.pick_time, 
	bookings.journey_type, 
	bookings.v_id, 
	bookings.luggage, 
	bookings.child_seat, 
	bookings.flight_number, 
	bookings.delay_time, 
	bookings.note
FROM
	jobs,
	clients,
	bookings,
	drivers,
	booking_type,
	vehicles
WHERE
	jobs.book_id = bookings.book_id AND
	jobs.c_id = clients.c_id AND
	jobs.d_id = drivers.d_id AND
	jobs.job_status = 'Completed' AND
	bookings.b_type_id = booking_type.b_type_id AND
	bookings.v_id = vehicles.v_id
ORDER BY
	jobs.job_id DESC
");									
								while($jobrow = mysqli_fetch_array($jobsql)){
									$y++;									
								?>														                     								
								<tr>                        								
									<td class="sort-id"><?php echo $y; ?></td>                        									
									<td class="sort-date"><?php echo $jobrow['pick_date'] ?></td>
									<td class="sort-time"><?php echo $jobrow['pick_time'] ?></td>
									<td class="sort-passenger"><?php echo $jobrow['passenger'] ?></td>  									
									<td class="sort-pickup"><?php echo $jobrow['pickup'] ?></td> 
									<td class="sort-drpoff"><?php echo $jobrow['stops'] ?></td>	
									<td class="sort-drpoff"><?php echo $jobrow['destination'] ?></td>									
									<td class="sort-fare"> <?php echo $jobrow['journey_fare'] ?> </td>									
									<td class="sort-vehicle"> <?php echo $jobrow['v_name'] ?> </td>									
									<td class="sort-status"> <button class="btn btn-indigo"><?php echo $jobrow['job_status'] ?> </button></td>									
									<td class="sort-driver"> <?php echo $jobrow['d_name'] ?> </td>
																	
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
	document.addEventListener("DOMContentLoaded", function() {    		
		const list = new List('table-default', {      					
			sortClass: 'table-sort',      							
			listClass: 'table-tbody',      							
			valueNames: [ 'sort-id', 'sort-date', 'sort-time', 'sort-fare',						      								
						 'sort-driver'      	
						]					
		}); 			
	})	
</script>
<?php	
include('footer.php');	
?>