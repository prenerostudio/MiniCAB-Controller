<?php
include('header.php');
?>		
<div class="col-md-12">                
	<div class="card">                  			
		<div class="card-header">                  					
			<ul class="nav nav-tabs card-header-tabs nav-fill" data-bs-toggle="tabs">                    							
				<li class="nav-item" style="background: #163B8F;">                      									
					<a href="#tabs-dasboard" class="nav-link active" data-bs-toggle="tab">					
						<svg xmlns="http://www.w3.org/2000/svg" class="icon me-2" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M5 12l-2 0l9 -9l9 9l-2 0" /><path d="M5 12v7a2 2 0 0 0 2 2h10a2 2 0 0 0 2 -2v-7" /><path d="M9 21v-6a2 2 0 0 1 2 -2h2a2 2 0 0 1 2 2v6" /></svg>
						Bookings for Bids						
					</a>                     					
				</li>                      				
				<li class="nav-item">                       				
					<a href="#tabs-tracking" class="nav-link" data-bs-toggle="tab">							                         					
						<svg xmlns="http://www.w3.org/2000/svg" class="icon me-2" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M8 7a4 4 0 1 0 8 0a4 4 0 0 0 -8 0" /><path d="M6 21v-2a4 4 0 0 1 4 -4h4a4 4 0 0 1 4 4v2" /></svg>                          						
						All Bids From Drivers						
					</a>                     					
				</li>                     					                  				
			</ul>                			
		</div>
        				
		<div class="card-body">                  					
			<div class="tab-content">                   							
				<div class="tab-pane active show" id="tabs-dasboard">                    				
					<div class="row row-deck row-cards"> 
						
						<div class="card-header">				
		<h2 class="page-title">              		
			Bids List             			
		</h2>		
		<div class="col-auto ms-auto d-print-none">        
			<div class="btn-list">            				                
				<a href="#" class="btn d-none d-sm-inline-block" data-bs-toggle="modal" data-bs-target="#modal-booking">
					<svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M12 5l0 14" /><path d="M5 12l14 0" /></svg>      
					Add New Bid                  
				</a>                                 
			</div>            
		</div>		
	</div> 
						
						
						
						<div id="table-default" class="table-responsive">            				
							<table class="table card-table table-vcenter text-nowrap datatable">                   												
								<thead style="background: #051650; color: white;">                   														
									<tr>                          																
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
									$booksql=mysqli_query($connect,"SELECT booking_bid.*, clients.c_name, clients.c_email, clients.c_phone, bookings.*, vehicles.v_name FROM booking_bid, bookings, clients, vehicles WHERE booking_bid.book_id = bookings.book_id AND bookings.c_id = clients.c_id AND booking_bid.bid_status = 'Open' AND bookings.v_id = vehicles.v_id");									
									while($bookrow = mysqli_fetch_array($booksql)){
									?>																						
									<tr>                         															
										<td>																	
											<?php echo $bookrow['bid_book_id']; ?>						
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
										                         							
										<td><?php echo $bookrow['v_name']; ?> </td>   							
										<td>
											<?php echo $bookrow['note']; ?>  </td>							
										<td><div class="btn btn-success"><?php echo $bookrow['bid_status']; ?> </div> </td>							
										
										                  						
									</tr>                              						
									<?php									
									}									
									?>										
								</tbody>                    				
							</table>
                </div>
							
						</div>				
					</div>
                    										
					<div class="tab-pane" id="tabs-tracking">
                    
								<div id="table-default" class="table-responsive">
            
				<table class="table card-table table-vcenter text-nowrap datatable">                   					
								<thead style="background: #051650; color: white;">                   						
									<tr >                          							
										<th class="w-1">ID</th>                         							
										<th class="w-1">Booking Details</th>                          							
										<th>Driver Name</th>                         							
										<th>Bid Amount</th>                         							
										                    							
										<th>Time</th>                       							
										<th> </th>                       							
										                  							
										                      						
									</tr>                     					
								</thead>                    					
								<tbody> 						
									<?php																											
									$bidsql=mysqli_query($connect,"SELECT bids.*, drivers.d_name, drivers.d_email, drivers.d_phone, bookings.*, booking_bid.* FROM bids, drivers, booking_bid, bookings WHERE bids.bid_book_id = booking_bid.bid_book_id AND bids.d_id = drivers.d_id AND booking_bid.book_id = bookings.book_id");
									while($bidrow = mysqli_fetch_array($bidsql)){																			
									?>													
									<tr>                         						
										<td>							
											<?php echo $bidrow['bid_id']; ?>						
										</td>                          							
										<td style="width: 40%;">												
											<?php echo $bidrow['pickup']; ?>  | <?php echo $bidrow['destination']; ?> | <?php echo $bidrow['book_date']; ?> | <?php echo $bidrow['book_time']; ?>
										</td>
										<td>								
											<?php echo $bidrow['d_name']; ?>							
										</td> 
										<td>
											<span class=" btn btn-instagram"> £ 	
											<?php echo $bidrow['bid_amount']; ?>
												</span>	
										</td>                        							
										<td>                           								
											<?php echo $bidrow['bid_date']; ?>                     							
										</td>                         							
															
										<td><div class="btn btn-success">Assign Job </div> </td>							
										
										                  						
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

<?php		
include('footer.php');		
?>