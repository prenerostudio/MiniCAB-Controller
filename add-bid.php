<?php
include('header.php');
?>  
<div class="page-body page_padding">
	<div class="row row-deck row-cards">			      				
		<div class="col-6">            								
			<div class="card">                										
				<div class="card-header">                    												
					<h3 class="card-title">Add New Bid </h3>
				</div>                  								
				<div class="card-body border-bottom py-3">
					<form method="post" action="bid-process.php" enctype="multipart/form-data" onsubmit="return validateForm();">	
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
											<option value="<?php echo $brow['book_id'] ?>">
												<?php echo $brow['book_id'] ?> | 
												<?php echo $brow['pickup'] ?> | 
												<?php echo $brow['destination'] ?> | 
												<?php echo $brow['pick_date'] ?> | 
												<?php echo $brow['pick_time'] ?>
											</option>									
											<?php									
											}																		
											?>																				
										</select> 													
									</div>
								</div>								
								<div class="col-lg-12">							
									<div class="mb-3">								
										<label class="form-label">Available time</label>								
										<input type="text" class="form-control" name="av_time">							
									</div>						
								</div>								
								<div class="col-lg-12">
									<div class="mb-3">
										<label class="form-label">Bid Note</label>								
										<textarea class="form-control" rows="3" name="bid_note"></textarea>
									</div>						
								</div>																								
							</div>																																	
						</div>          										      																
						<div class="modal-footer">						
							<a href="view-driver.php?d_id=''" class="btn btn-danger">
								<i class="ti ti-circle-x"></i>														
								Cancel
							</a>
							<button type="submit" class="btn btn-success" data-bs-dismiss="modal">								
								<i class="ti ti-copy-plus"></i>						
								Add Booking for Bid					
							</button>   						
						</div> 																				
					</form>																									
					<script>    
						function validateForm() {        							        
							var vidInput = document.getElementsByName("v_id")[0].value;        
							var makeInput = document.getElementsByName("make")[0].value;							        
							var modelInput = document.getElementsByName("model")[0].value;		
							var colorInput = document.getElementsByName("color")[0].value;		
							var regInput = document.getElementsByName("reg_num")[0].value;
							        
							if (vidInput === "" || makeInput === "" || modelInput === "" || colorInput === "" || regInput === "" ) {
								alert("Please fill in all required fields.");            
								return false;        
							}							        
							return true;    
						}
					</script>				
				</div>                                                    										
			</div>              							
		</div>				
	</div>
</div>       
<?php
include('footer.php');
?>