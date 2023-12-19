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
				<a href="job-history.php" class="btn d-none btn-danger d-sm-inline-block">
					<i class="ti ti-history" style="font-size: 24px;"></i>    
					Job History                  
				</a>   
				<a href="#" class="btn d-none d-sm-inline-block" data-bs-toggle="modal" data-bs-target="#modal-booking">
					<i class="ti ti-message-plus" style="font-size: 24px;"></i>
					Add New Booking                  
				</a>    
			</div>            
		</div>		
	</div>    		
	<div class="card-body">     
		<div class="row">
		<div class="col-md-4">
			<form method="post" class="search_form">
				<input type="date" class="form-control" name="start">
				
				<input type="date" class="form-control" name="from">
				
				<button class="btn btn-info">Search</button>
		
			
			</form>
			
			
			</div>
			<div class="col-md-4"></div>
			<div class="col-md-4">
				
				<div class="dropdown">
  <a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    Dropdown link
  </a>

  <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
    <a class="dropdown-item" href="#">Action</a>
    <a class="dropdown-item" href="#">Another action</a>
    <a class="dropdown-item" href="#">Something else here</a>
  </div>
</div>
			<!--<form>
				<select class="form-control">
					<option>Select</option>
					<option>All Bookings In next 3 Hours</option>
<option>All Bookings In next 6 Hours</option>
<option>All Bookings In next 9 Hours</option>
<option>All Bookings In next 12  Hours</option>
<option>All Bookings In next 24 Hours</option>
<option>All Bookings In next 3 Days</option>
<option>All Bookings In next 7 Days</option>
<option>All Bookings In next 14 Days</option>
<option>All Bookings In next 30 Days</option>
<option>All Bookings In next 3 Months</option>
<option>All Bookings In next 6 Months</option>
<option>All Bookings In next 12 Months</option>
				
					
				
				
				
				
				</select>
				
				
				
				
				</form>-->
			
			</div>
		
		
		</div>
		<div id="table-default"> 
			
			<table class="table" id="booking_table">                   								
				<thead style="background: #051650; color: white;">                   										
					<tr >                          												
						<th class="w-1">ID</th>                         													
						<th class="w-1">Date</th>                          													
						<th>Time</th>                         													
						<th>Passenger</th>                         													
						<th>Pickup</th>                         													
						<th>Destination</th>
						<th>Distance</th>
						<th>Fare</th>						                    													
						<th>Note</th>                       													
						<th>Status</th>
						<th>Action</th>                       												
					</tr>                     										
				</thead>                    									
				<tbody> 										
					<?php	
					$n=0;
					$booksql=mysqli_query($connect,"SELECT bookings.*, clients.c_name, clients.c_email, clients.c_phone FROM bookings, clients WHERE bookings.c_id = clients.c_id AND bookings.booking_status = 'Pending' ORDER BY bookings.book_id DESC");
					while($bookrow = mysqli_fetch_array($booksql)){	
						$n++;
					?>																		
					<tr>                         											
						<td>																				
							<?php echo $n; ?>													
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
							<?php echo $bookrow['journey_distance']; ?>														
						</td>
						<td>                           															
							<?php echo $bookrow['journey_fare']; ?>														
						</td>
						  													
						<td>
							<?php echo $bookrow['note']; ?>  
						</td>													
						<td>
							<?php echo $bookrow['booking_status']; ?> 
						</td>		
						<td class="text-end">						
							
								
							<div class="btn-group">
								
									<a href="booking-details.php?id=<?php echo $bookrow['book_id'] ?>" class="btn d-none btn-instagram d-sm-inline-block">
										<i class="ti ti-eye" style="font-size: 16px; margin-right: 10px;"></i>
    
									
										Booking Details

									
									</a>

								
									
									<a href="dipatch-booking.php?id=<?php echo $bookrow['book_id'] ?>" class="btn btn-facebook d-none d-sm-inline-block" style="margin-left: 10px;">						
									<i class="ti ti-brand-telegram" style="font-size: 16px; margin-right: 10px;"></i>
										Dispatch									
								
									</a>	
								
							
							</div>
							                       														
						
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