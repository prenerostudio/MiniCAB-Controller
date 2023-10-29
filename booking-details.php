<?php
include('header.php');
$book_id = $_GET['id'];
$bsql=mysqli_query($connect,"SELECT
	bookings.*, 
	clients.c_name, 
	clients.c_email, 
	clients.c_phone, 
	vehicles.v_name
FROM
	bookings,
	clients,
	vehicles
WHERE
	bookings.c_id = clients.c_id AND
	bookings.book_id = '$book_id' AND
	bookings.v_id = vehicles.v_id
");											
$brow = mysqli_fetch_array($bsql);		
?> 
<div class="container-xl">           
	<div class="card">		
		<div class="row g-0">                    				
			<div class="col-12 col-md-12 d-flex flex-column">        						
				<div class="card-body">            													
					<h2 class="mb-4">Booking Details</h2>
					<form method="post" action="update-booking.php" enctype="multipart/form-data">					
						<div class="row g-3">                						
							<div class="col-md-6">												
								<div class="mb-3">                    														
									<div class="form-label">
										Pickup
									</div>                        														
									<input type="hidden" class="form-control" value="<?php echo $brow['book_id']; ?>" name="book_id">  								
									<input type="text" class="form-control" value="<?php echo $brow['pickup']; ?>" name="pickup">  							
								</div> 							
								<div class="mb-3">                    						
									<div class="form-label">
										Destinations
									</div>                        														
									<input type="text" class="form-control" value="<?php echo $brow['destination']; ?>" name="destination">		
								</div>   							
								<div class="mb-3">                    						
									<div class="form-label">Vehicle</div>         								
									<select class="form-control" name="v_id">
										<option value="<?php echo $brow['v_id']; ?>">
											<?php echo $brow['v_name']; ?>
										</option>																	
										<?php									
										$vsql=mysqli_query($connect,"SELECT * FROM `vehicles`");
										while($vrow = mysqli_fetch_array($vsql)){											
										?>
										<option value="<?php echo $vrow['v_id']; ?>">
											<?php echo $vrow['v_name']; ?>
										</option>								
										<?php								
										}									
										?>							
									</select>								                   							
								</div>								                 												
								<div class="mb-3">                    													
									<div class="form-label">Journey Type</div>     							
									<select class="form-control"  name="journey_type">								
										<option>
											<?php echo $brow['journey_type']; ?>
										</option>									
										<option>One Way</option>									
										<option>Return</option>												
									</select>								                 							
								</div>													
								<div class="mb-3">                    														
									<div class="form-label">
										No. of Passenger
									</div>                        														
									<input type="text" class="form-control" value="<?php echo $brow['passenger']; ?>" name="passenger">
								</div> 														
								<div class="mb-3">                    													
									<div class="form-label">
										Luggage
									</div>                        														
									<input type="text" class="form-control" value="<?php echo $brow['luggage']; ?>" name="luggage">							
								</div> 																										
							</div>																						
							<div class="col-md-6">							
								<h3>Passenger Details</h3>							
							
								<div class="mb-3">                  
								<label class="form-label">Name</label>              												
								
								<select class="form-control" name="c_id">
									<option value="<?php echo $brow['c_id']; ?>"><?php echo $brow['c_name']; ?></option>
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
								
								
								<div class="mb-3">                    														
									<div class="form-label">Pickup Date</div>  								
									<input type="text" class="form-control" value="<?php echo $brow['book_date'] ?>" name="pdate">
								</div>								
								<div class="mb-3">                    														
									<div class="form-label">Pickup Time</div>  								
									<input type="text" class="form-control" value="<?php echo $brow['book_time'] ?>" name="ptime">
								</div>									
								<div class="mb-3">                    														
									<div class="form-label">
										Special Note
									</div>                        														
									<input type="text" class="form-control" value="<?php echo $brow['note']; ?>" name="note" readonly>							
								</div> 							
							</div>																					
						</div>                                       					                                    										
						</div>                 				
					<div class="card-footer bg-transparent mt-auto">                 					
						<div class="btn-list justify-content-end">                 						
							<a href="booking.php" class="btn">                  						
								Cancel                  						
							</a>                  						 							
							<button type="submit" class="btn btn-primary">
								Update
							</button>						                    					                  					
						</div>                 			
					</div>															
					</form>               			
			</div>              		
		</div>            	
	</div>         
</div>
<?php
include('footer.php');
?>