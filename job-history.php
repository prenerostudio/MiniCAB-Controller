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
					<h3 class="card-title">Completed Jobs</h3>
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
							<tbody class="table-tbody">									
								<?php																		
								$y=0;																
								$jobsql=mysqli_query($connect,"SELECT jobs.*, bookings.*, clients.*, drivers.*, booking_type.*, vehicles.* FROM jobs, bookings,	clients, drivers, booking_type, vehicles WHERE jobs.book_id = bookings.book_id AND jobs.c_id = clients.c_id AND jobs.d_id = drivers.d_id AND bookings.b_type_id = booking_type.b_type_id AND bookings.v_id = vehicles.v_id AND jobs.job_status = 'Completed' ORDER BY jobs.job_id DESC");
								while($jobrow = mysqli_fetch_array($jobsql)){											
									$y++;
								?>														                     
								<tr>                        								
									<td class="sort-id"><?php echo $y; ?></td>									
									<td class="sort-date"><?php echo $jobrow['pick_date']; ?></td>
									<td class="sort-time"><?php echo $jobrow['pick_time']; ?></td>
									<td class="sort-passenger"><?php echo $jobrow['passenger']; ?></td>
									<td class="sort-pickup"><?php echo $jobrow['pickup']; ?></td>
									<td class="sort-drpoff"><?php echo $jobrow['destination']; ?></td>
									<td class="sort-fare"> <?php echo $jobrow['journey_fare']; ?> </td>
									<td class="sort-vehicle"> <?php echo $jobrow['v_name']; ?> </td>
									<td class="sort-status"> <?php echo $jobrow['job_status']; ?> </td>
									<td class="sort-driver"> <?php echo $jobrow['d_name']; ?> </td>
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