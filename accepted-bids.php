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
				Accepted Bids Section                				
			</h2>              			
		</div>						
	</div>	
</div>
<div class="page-body page_padding">          
	<div class="row row-deck row-cards">			      	
		<div class="col-12">            					
			<div class="card">                							
				<div class="card-header">                    									
					<h3 class="card-title">All Accepted Bid List</h3>                  										
				</div>                  				
				<div class="card-body border-bottom py-3">				
					<div id="table-default" class="table-responsive">            										
						<table class="table table-responsive">						
							<thead>                   													
								<tr>                          																
									<th class="w-1">ID</th>
									<th>Booking Details</th>
									<th>Driver Name</th>
									<th>Bid Amount</th>									
									<th>Time</th>
									<th> </th>
								</tr>                     													
							</thead>                    												
							<tbody> 													
								<?php								
								$n=0;
								$bidsql=mysqli_query($connect,"SELECT bids.*, bookings.*, booking_type.*, drivers.* FROM bids JOIN bookings ON bids.book_id = bookings.book_id JOIN booking_type ON bookings.b_type_id = booking_type.b_type_id JOIN drivers ON bids.d_id = drivers.d_id WHERE  bids.bidding_status = 1");
								while($bidrow = mysqli_fetch_array($bidsql)){
									$n++		
								?>																					
								<tr>                         														
									<td>																
										<?php echo $n; ?>																
									</td>
									<td style="width: 40%;">
										<?php echo $bidrow['pickup']; ?>  | 
										<?php echo $bidrow['destination']; ?> | 
										<?php echo $bidrow['pick_date']; ?> | 										
										<?php echo $bidrow['pick_time']; ?>										
									</td>									
									<td>
										ID: <?php echo $bidrow['d_id']; ?><br>
										Driver Name: <?php echo $bidrow['d_name']; ?><br>
										Driver Phone: <?php echo $bidrow['d_phone']; ?><br>
									</td> 									
									<td>																				
										<span style="font-size: 28px;"> £ 												
											<?php echo $bidrow['bid_amount']; ?>												
										</span>										
									</td>                        																	
									<td>									
										<?php echo $bidrow['bid_date']; ?>									
									</td>
									<td>										
										<a href="dispatch-booking.php?book_id=<?php  echo $bidrow['book_id'] ?>">
												<button class="btn btn-success"><i class="ti ti-plane-tilt"></i>Dispatch Job</button>
											</a>							
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
		</div>s
	</div>
</div>        
<?php
include('footer.php');
?>