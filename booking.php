<?php
include('header.php');
?>          	
<div class="card">			
	<div class="card-header">				
		<h2 class="page-title">              		
			Bookings List             			
		</h2>		
		<div class="col-auto ms-auto d-print-none">        
			<div class="btn-list">            				                
				<a href="#" class="btn d-none d-sm-inline-block" data-bs-toggle="modal" data-bs-target="#modal-booking">
					<svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M12 5l0 14" /><path d="M5 12l14 0" /></svg>      
					Add New Booking                  
				</a>                                 
			</div>            
		</div>		
	</div>    		
	<div class="card-body">            			
		<div id="table-default" class="table-responsive">    				
			<table class="table card-table table-vcenter text-nowrap datatable" id="booking_table">                   								
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
						<th>Action</th>                       												
					</tr>                     										
				</thead>                    									
				<tbody> 										
					<?php										
					$booksql=mysqli_query($connect,"SELECT bookings.*, clients.c_name, clients.c_email, clients.c_phone, vehicles.v_name FROM bookings, clients, vehicles WHERE bookings.c_id = clients.c_id AND bookings.v_id = vehicles.v_id AND bookings.booking_status = 'Pending'");
					while($bookrow = mysqli_fetch_array($booksql)){										
					?>																		
					<tr>                         											
						<td>																				
							<?php echo $bookrow['book_id']; ?>													
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
							<?php echo $bookrow['booking_status']; ?> 
						</td>		
						<td class="text-end">						
							<span class="dropdown">							
								<a href="booking-details.php?id=<?php echo $bookrow['book_id'] ?>" class="btn d-none btn-instagram d-sm-inline-block">
    Booking Details
</a>

								<a href="dipatch-booking.php?id=<?php echo $bookrow['book_id'] ?>" class="btn btn-facebook d-none d-sm-inline-block">						
									Dispatch									
								</a>																			
							</span>                         														
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