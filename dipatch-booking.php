<?php
include('header.php');
$book_id = $_GET['id'];
$bsql=mysqli_query($connect,"SELECT bookings.*, clients.c_name, clients.c_email, clients.c_phone, vehicles.v_name FROM bookings, clients, vehicles WHERE bookings.c_id = clients.c_id AND bookings.book_id = '$book_id' AND bookings.v_id = vehicles.v_id");											
$brow = mysqli_fetch_array($bsql);		
?> 

<div class="container-xl">           
	<div class="card">			
		<div class="row g-0">                    						
			<div class="col-12 col-md-12 d-flex flex-column">        									
				<div class="card-body">					
					<h2 class="mb-4">Booking Details</h2>					
					<form method="post" action="dispatch-process.php" enctype="multipart/form-data">
						<div class="row g-3">
							<div class="col-md-6">															
								<table class="table card-table table-vcenter text-nowrap datatable">
									<tr>									
										<td>Booking ID </td>									
										<td><?php echo $brow['book_id']; ?> </td>									
									</tr>
									<tr>																		
										<td>Pickup Address </td>
										<td><?php echo $brow['pickup']; ?> </td>								
									</tr>
									<tr>									
										<td>Dropoff Address </td>									
										<td> <?php echo $brow['destination']; ?></td>								
									</tr>									
									<tr>									
										<td>Passenger Name </td>									
										<td> <?php echo $brow['c_name']; ?></td>								
									</tr>									
									<tr>									
										<td>Passenger Phone </td>									
										<td> <?php echo $brow['c_phone']; ?></td>								
									</tr>									
									<tr>
										<td>Passenger Email </td>									
										<td> <?php echo $brow['c_email']; ?></td>								
									</tr>									
									<tr>									
										<td>Vehicle </td>									
										<td> <?php echo $brow['v_name']; ?></td>								
									</tr>									
									<tr>									
										<td>Journey Type</td>									
										<td> <?php echo $brow['journey_type']; ?></td>								
									</tr>									
									<tr>									
										<td>No. of Passenger</td>									
										<td> <?php echo $brow['passenger']; ?></td>								
									</tr>									
									<tr>									
										<td>Luggage </td>									
										<td> <?php echo $brow['luggage']; ?></td>								
									</tr>
								</table>
							</div>															
							<div class="col-md-6">
								<h3>Driver Details</h3>																
								<div class="mb-3">
									<input type="hidden" class="form-control" name="book_id" value="<?php echo $brow['book_id'] ?>">									
									<input type="hidden" class="form-control" name="c_id" value="<?php echo $brow['c_id'] ?>">						
								</div>			
								<div class="row">								
									<div class="mb-3">												
										<div class="form-label">Driver Name</div>
										<select name="d_id" class="form-control" required>
											<option> Select Driver </option>										
											<?php
	$drsql=mysqli_query($connect,"SELECT * FROM `drivers` WHERE `status`='online';");
										   while($drrow = mysqli_fetch_array($drsql)){
											?>									
											<option value="<?php echo $drrow['d_id'] ?>">
												<?php echo $drrow['d_name'] ?>
											</option>								
											<?php								
										   }										
											?>
										</select>																	
									</div>	
								</div>
								<div class="mb-3">											
									<div class="form-label">Note</div>  									
									<textarea rows="3" class="form-control" name="note"></textarea>
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
								Dispatch Booking
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