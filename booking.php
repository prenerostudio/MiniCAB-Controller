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



<!-------------------------------
----------Add Booking-------------
-------------------------------->
<div class="modal modal-blur fade" id="modal-booking" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document" >    	
		<div class="modal-content">        		
			<div class="modal-header">            			
				<h5 class="modal-title">Add New Booking</h5>            				
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>          			
			</div> 			
			<form method="post" action="booking-process.php" enctype="multipart/form-data">
				<div class="modal-body">								
					<div class="row">              					
						<div class="col-lg-6">				
							<div class="mb-3">              					
								<label class="form-label">Pickup </label>              					
								<input type="text" class="form-control" name="pickup">            				
							</div> 						
						</div>              					
						<div class="col-lg-6">                
							<div class="mb-3">                  							
								<label class="form-label">Destination</label>              					
								<input type="text" class="form-control" name="destination">      						
							</div>             					
						</div>            				
					</div>								
					<div class="row">              
						<div class="col-lg-6">				
							<div class="mb-3">              					
								<label class="form-label">Vehicle</label>              					
								<select class="form-select" name="v_id">			
									<option value="" selected>Select Vehicle</option>  						
									<?php														
									$vsql=mysqli_query($connect,"SELECT * FROM `vehicles`");																	
									while($vrow = mysqli_fetch_array($vsql)){																		
									?>
									<option value="<?php echo $vrow['v_id']; ?>">									
										<?php echo $vrow['v_name'] ?>								
									</option>								
									<?php																	
									}																		
									?>									 																			
								</select>            				
							</div> 												
							<div class="mb-3">                            
								<div class="form-label">Journey Type</div>                            
								<div>                              
									<label class="form-check form-check-inline">                                
										<input class="form-check-input" type="radio" name="journey_type" checked="" value="One Way">                                
										<span class="form-check-label">One Way</span>                              
									</label>                              
									<label class="form-check form-check-inline">                                
										<input class="form-check-input" type="radio" name="journey_type" value="Return">                                
										<span class="form-check-label">Return</span>                              
									</label>                             
								</div>                          
							</div>												
							<div class="row">              										
								<div class="col-lg-6">									
									<div class="mb-3">              												
										<label class="form-label">No. of Passenger</label>				
										<input type="number" class="form-control" name="passenger">				 						
									</div> 											
								</div>              										
								<div class="col-lg-6">                											
									<div class="mb-3">                  													
										<label class="form-label">Luggage</label>              												
										<input type="text" class="form-control" name="luggage">      												
									</div>             										
								</div>            								
							</div>					
							<div class="mb-3">                 							
								<label class="form-label">Special Note</label>                  															
								<textarea class="form-control" rows="3" name="note"></textarea>               													
							</div>  																									
						</div>              					
						<div class="col-lg-6"> 
							<h4>Passenger Details:</h4>						
							<div class="mb-3">                  
								<label class="form-label">Name</label>              												
								
								<select class="form-control" name="c_id">
									<option>Select Customer</option>
									<?php
									$clsql=mysqli_query($connect,"SELECT * FROM `clients`");																	
									while($clrow = mysqli_fetch_array($clsql)){	
									?>
									<option value="<?php echo $clrow['c_id'] ?>"><?php echo $clrow['c_name'] ?></option>
								<?php
									}
										?>
								
								</select>
							</div> 												
													
							<div class="row">
								<div class="col-md-6">						
									<div class="mb-3">                  							
										<label class="form-label">Pickup Date</label>							
										<input type="date" class="form-control" name="pdate">      						
									</div>							
								</div>
								<div class="col-md-6">						
									<div class="mb-3">                  							
										<label class="form-label">Pickup Time</label>              					
										<input type="time" class="form-control" name="ptime">      						
									</div>																															
								</div>							
							</div>						
							<!--<div class="mb-3">
								<div class="form-label">Bidding</div>                            
								<div>                              
									<label class="form-check form-check-inline">                                
										<input class="form-check-input" type="checkbox" name="bidding" value="Yes">                                
										<span class="form-check-label">Yes</span>                              
									</label>                              									
									<label class="form-check form-check-inline">                                									
										<input class="form-check-input" type="checkbox" name="bidding" value="No">                                
										<span class="form-check-label">No</span>                              
									</label>                              
								</div>                          
							</div>-->												
						</div>            									
					</div>					
				</div>          			
							      							
				<div class="modal-footer">           									
					<a href="#" class="btn btn-link link-secondary" data-bs-dismiss="modal">             											
						Cancel           									
					</a>           																			
					<button type="submit" class="btn ms-auto" data-bs-dismiss="modal">												
						<svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M12 5l0 14" /><path d="M5 12l14 0" /></svg>						
						Add New Booking  											
					</button>					     							
				</div> 							
			</form>		
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