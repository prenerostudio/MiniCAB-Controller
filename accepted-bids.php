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
									<th class="w-1">Booking Details</th>
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
								while($bidrow = mysqli_fetch_array($bidsql)){																	$n++		
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

<div class="modal modal-blur fade" id="modal-bid" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">    	
		<div class="modal-content">        		
			<div class="modal-header">            			
				<h5 class="modal-title">Add New Bid</h5>            				
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>          			
			</div> 
			<form method="post" enctype="multipart/form-data" action="bid-process.php">			
				<div class="modal-body">								
				
									
					<div class="row">   
						<div class="col-lg-12">                						
							<div class="mb-3">                  							
								<label class="form-label">Booking Available for Bids</label>              				
								<select class="form-select" name="book_id">                     								
									<option value="" selected>Select Bookings</option>                    								    
									<?php						
									$bsql=mysqli_query($connect,"SELECT	bookings.*, clients.c_name, clients.c_email, clients.c_phone, vehicles.v_name FROM bookings, clients, vehicles WHERE bookings.c_id = clients.c_id AND bookings.v_id = vehicles.v_id AND bookings.bid_status = 0 AND bookings.booking_status = 'Pending'");
									while($brow = mysqli_fetch_array($bsql)){									
									?>																											
									<option value="<?php echo $brow['book_id'] ?>"><?php echo $brow['pickup'] ?> | <?php echo $brow['destination'] ?> | <?php echo $brow['book_date'] ?> | <?php echo $brow['book_time'] ?></option>
									<?php
									}									
									?>												
								</select> 						
							</div>             					
						</div>  
					             					
						          				
					</div>
							          				          
				</div>          			
				<div class="modal-body">
					<div class="row">              					             
						<div class="col-lg-12">               						
							<div>                 							
								<label class="form-label">Bid Note</label>                  							
								<textarea class="form-control" rows="3" name="bid_note"></textarea>               						
							</div>              					
						</div>   					
						 				
					</div>          			
				</div>        			
				<div class="modal-footer">           
					<a href="#" class="btn btn-link link-secondary" data-bs-dismiss="modal">             					
						Cancel           				
					</a>           				
					<button type="submit" class="btn btn-success" data-bs-dismiss="modal">
						
						<i class="ti ti-copy-plus"></i>
						Add Booking for Bid 
						
					</button>       			
				</div> 								
			</form>		
		</div>      	
	</div>    
</div>
<?php
include('footer.php');
?>