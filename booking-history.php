<?php
include('header.php');
?>  
<div class="page-header d-print-none page_padding">		   		
	<div class="row g-2 align-items-center">        
			<div class="col">            				             
				<div class="page-pretitle">                
					Overview                
				</div>                
				<h2 class="page-title">                
					Booking Section                
				</h2>              
			</div>
			<div class="col-auto ms-auto d-print-none">            
				<div class="btn-list">                
					<span class="d-none d-sm-inline">
						<a href="all-bookings.php" class="btn">						
							<i class="ti ti-user-search" style="margin-right: 10px;"></i>                     
							All Booking                   
						</a>                  
					</span> 
					<span class="d-none d-sm-inline">
						<a href="cancelled-booking.php" class="btn btn-danger">						
							<i class="ti ti-user-search" style="margin-right: 10px;"></i>                     
							Cancelled History                   
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
						<h3 class="card-title">Completed Bookings List</h3>                  					
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
											<button class="table-sort">Status</button>
										</th>                      
									</tr>                   
								</thead>                  
								<tbody class="table-tbody">					
									<?php										
									$y=0;								
									$bsql=mysqli_query($connect,"SELECT bookings.*, clients.c_name, clients.c_email, clients.c_phone, booking_type.*, vehicles.v_name FROM bookings, clients, booking_type, vehicles WHERE bookings.c_id = clients.c_id AND bookings.booking_status = 'Booked' AND bookings.b_type_id = booking_type.b_type_id AND bookings.v_id = vehicles.v_id ORDER BY bookings.book_id DESC");									
									while($brow = mysqli_fetch_array($bsql)){											
										$y++;
									?>														                     
									<tr>                        
										<td class="sort-id"><?php echo $y; ?></td>                        
										<td class="sort-date"><?php echo $brow['pick_date'] ?></td>                       
										<td class="sort-time"><?php echo $brow['pick_time'] ?></td>                       
										<td class="sort-passenger"><?php echo $brow['passenger'] ?></td>  
										<td class="sort-pickup" style="width: 15%;"><?php echo $brow['pickup'] ?></td>                       

										<td class="sort-drpoff" style="width: 15%;"><?php echo $brow['destination'] ?></td>
										<td class="sort-fare"> <?php echo $brow['journey_fare'] ?> </td>
										<td class="sort-vehicle"> <?php echo $brow['v_name'] ?> </td>
										
										<td> 
											
											
										
											
											
												<button class="btn btn-info" disabled>
													<i class="ti ti-eye"></i>Booked
												</button>
												
											
											
											
											
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