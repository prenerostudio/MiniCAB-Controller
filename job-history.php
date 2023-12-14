<?php
include('header.php');
?>          	
<div class="card">			
	<div class="card-header">				
		<h2 class="page-title">              		
			Bookings History          			
		</h2>		
		<div class="col-auto ms-auto d-print-none">        
			<div class="btn-list">            				                
				<a href="job-history.php" class="btn d-none btn-danger d-sm-inline-block">
					<i class="ti ti-history"></i>    
					Job History                  
				</a>    
				<a href="#" class="btn d-none d-sm-inline-block" data-bs-toggle="modal" data-bs-target="#modal-booking">
					<i class="ti ti-message-plus"></i>
					Add New Booking                  
				</a>    
			</div>            
		</div>		
	</div>    		
	<div class="card-body">            			
		<div id="table-default" class="table-responsive">    				
			<table class="table table-responsive" id="booking_table">                   								
				<thead style="background: #051650; color: white;">                   										
					<tr >                          												
						<th class="w-1">ID</th>                         													
						<th class="w-1">Date</th>                          													
						<th>Time</th>                         													
						<th>Passenger</th>                         													
						<th>Pickup</th>                         													
						<th>Destination</th>
						<th>Vehicle</th>                       													
						<th>Note</th>                       													
						<th>Status</th>
						                												
					</tr>                     										
				</thead>                    									
				<tbody> 										
					<?php										
					$booksql=mysqli_query($connect,"SELECT
	jobs.*, 
	clients.c_name, 
	clients.c_email, 
	clients.c_phone, 
	clients.c_address, 
	drivers.d_name, 
	drivers.d_email, 
	drivers.d_phone, 
	bookings.*, 
	vehicles.v_name, 
	vehicles.v_pricing, 
	vehicles.v_img
FROM
	jobs,
	drivers,
	clients,
	bookings,
	vehicles
WHERE
	jobs.book_id = bookings.book_id AND
	jobs.c_id = clients.c_id AND
	jobs.d_id = drivers.d_id AND
	jobs.job_status IN ('completed','cancelled') AND
	bookings.v_id = vehicles.v_id
ORDER BY
	jobs.job_id DESC");
					while($bookrow = mysqli_fetch_array($booksql)){										
					?>																		
					<tr>                         											
						<td>																				
							<?php echo $bookrow['job_id']; ?>													
						</td>                          													
						<td>														
							<span class=" btn btn-instagram">																
								<?php echo $bookrow['book_date']; ?>
							</span>												
						</td>
						<td>														
							<?php echo $bookrow['book_time']; ?>														
						</td>                        													
						<td>                           														
							<?php echo $bookrow['c_name']; ?>            		
						</td>                         													
						<td>                          														
							<?php echo $bookrow['pickup']; ?>
						</td>                         													
						<td>                           															
							<?php echo $bookrow['destination']; ?>														
						</td>                          																	
						<td>
							<?php echo $bookrow['v_name']; ?> 
						</td>   													
						<td>
							<?php echo $bookrow['note']; ?>  
						</td>													
						<td>
							<?php echo $bookrow['job_status']; ?> 
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



<script>  
	$(document).ready(function(){       
		$('#booking_table').DataTable();   
	});   
	
		
</script>

<?php
include('footer.php');
?>