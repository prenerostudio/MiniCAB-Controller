<?php
include('header.php');
$book_id = $_GET['id'];
$bsql=mysqli_query($connect,"SELECT bookings.*, clients.c_name, clients.c_email, clients.c_phone FROM bookings, clients WHERE bookings.c_id = clients.c_id AND bookings.book_id = '$book_id'");											
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
										<td>Distance </td>									
										<td> <?php echo $brow['journey_distance']; ?> KM</td>								
									</tr>
									<tr>									
										<td>Fare </td>									
										<td>£ <?php echo $brow['journey_fare']; ?></td>								
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
							
							<script>
   function updateVehicleId() {
    // Get the selected driver ID from the dropdown
    var selectedDriverId = document.getElementsByName("d_id")[0].value;

    // AJAX request to fetch the v_id and vehicle name based on the selected driver ID
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            // Split the response into an array
            var responseArray = this.responseText.split("|");

            // Update the v_id textfield
            document.getElementsByName("v_id")[0].value = responseArray[0];

            // Update the vehicle textfield
            document.getElementsByName("vehicle")[0].value = responseArray[1];
        }
    };
    xhr.open("GET", "get_vehicle_id.php?d_id=" + selectedDriverId, true);
    xhr.send();
}

</script>
							<div class="col-md-6">
								<h3>Driver Details</h3>																
								<div class="mb-3">
									<input type="hidden" class="form-control" name="book_id" value="<?php echo $brow['book_id'] ?>">									
									<input type="hidden" class="form-control" name="c_id" value="<?php echo $brow['c_id'] ?>">						
								</div>			
								<div class="row">								
									<div class="mb-3">												
										<div class="form-label">Driver Name</div>
										<select name="d_id" class="form-control" required onchange="updateVehicleId()">
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
									<div class="mb-3">																				
									<input type="hidden" class="form-control" name="v_id">
								</div>
									<div class="mb-3">											
									<div class="form-label">Vehicle Name</div>  									
									<input type="text" class="form-control" name="vehicle">
								</div>
									<div class="mb-3">											
									<div class="form-label">Journey Distance</div>  									
									<input type="text" class="form-control" name="journey_distance" value="<?php echo $brow['journey_distance'];?>" readonly>
								</div>
									<div class="mb-3">											
									<div class="form-label">Journey Fare</div>  									
									<input type="text" class="form-control" name="journey_fare" value="<?php echo $brow['journey_fare'];?>">
								</div>
									
									<div class="mb-3">											
									<div class="form-label">Payment Method</div>  	
										<select class="form-control" name="pay_method">
											<option>Select Payment Method</option>
											<option>Cash</option>
											<option>Card</option>
											<option>Pay Later</option>
										
										
										
										</select>
									
								</div>
									
									<div class="mb-3">											
									<div class="form-label">Note</div>  									
									<textarea rows="3" class="form-control" name="note"></textarea>
								</div>
								</div>
								
							</div>						
						</div>       																
						</div>                 									
					<div class="card-footer bg-transparent mt-auto">                 					
						<div class="btn-list justify-content-end">                 						
							<a href="booking.php" class="btn">  
								<i class="ti ti-circle-x" style="font-size: 16px; margin-right: 10px;"></i>
								Cancel                  						
							</a>                  						 							
							<button type="submit" class="btn btn-primary">
								<i class="ti ti-brand-telegram" style="font-size: 16px; margin-right: 10px;"></i>
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