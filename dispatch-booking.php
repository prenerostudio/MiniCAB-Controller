<?php
include('header.php');
$book_id = $_GET['book_id'];
$booksql=mysqli_query($connect,"SELECT bookings.*, clients.*, booking_type.*, vehicles.* FROM bookings INNER JOIN booking_type ON bookings.b_type_id = booking_type.b_type_id INNER JOIN clients ON bookings.c_id = clients.c_id INNER JOIN vehicles ON bookings.v_id = vehicles.v_id WHERE bookings.book_id = '$book_id'");
$bookrow = mysqli_fetch_array($booksql);
?>  
<div class="page-body page_padding">
    <form method="post" action="dispatch-process.php" id="jobform" enctype="multipart/form-data">
        <div class="row row-deck row-cards">
            <div class="col-8">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">			
                            Dispatch Booking			
                        </h3>			
                    </div>										
                    <div class="card-body border-bottom py-3">
                        <div class="modal-body">
                            <div class="row">
                                <h3>Booking Type:   <?php echo $bookrow['b_type_name'];?></h3>
                                <h4>Passenger Details:</h4>
                                <div class="mb-3 col-lg-4">
                                    <h4>Customer Name: </h4>
                                    <p><?php echo $bookrow['c_name'];?></p>
                                </div>
                                <div class="mb-3 col-lg-4">
                                    <h4>Customer Phone</h4>
                                    <p><?php echo $bookrow['c_phone'];?></p>
                                </div>
                                <div class="mb-3 col-lg-4">
                                    <h4>Customer Email</h4>
                                    <p><?php echo $bookrow['c_email'];?></p>
                                </div>
                            </div>
                            <div class="row">
                                <h4>Journey Details:</h4>
                                <div class="mb-3 col-lg-4">	
                                    <h4>Pickup Location:</h4>									
                                    <p><?php echo $bookrow['pickup'];?></p>
                                </div>
                                <div class="mb-3 col-lg-4">
                                    <h4>Drop-off Location:</h4>
                                    <p><?php echo $bookrow['destination'];?></p>
                                </div>
                                <div class="mb-3 col-lg-4">
                                    <h4>Address:</h4>
                                    <p><?php echo $bookrow['address'] ?></p>
                                </div>
                                <div class="mb-3 col-lg-4">
                                    <h4>Postal Code:</h4>
                                    <p><?php echo $bookrow['postal_code'] ?></p>
                                </div>
                                <div class="mb-3 col-lg-4">
                                    <h4>No. of Passenger:</h4>
                                    <p><?php echo $bookrow['passenger'] ?></p>
                                </div>
                                <div class="mb-3 col-lg-4">
                                    <h4>Pickup Date:</h4>
                                    <p><?php echo $bookrow['pick_date'] ?></p>
                                </div>
                                <div class="mb-3 col-lg-4">
                                    <h4>Pickup Time:</h4>
                                    <p><?php echo $bookrow['pick_time'] ?></p>
                                </div>
                                <div class="mb-3 col-lg-4">
                                    <h4>Journey Type</h4>
                                    <p><?php echo $bookrow['journey_type'] ?></p>
                                </div>
                                <div class="mb-3 col-lg-4">
                                    <h4>Distance (Auto-calculated)</h4>
                                    <p><?php echo $bookrow['journey_distance'] ?></p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="mb-3 col-lg-4">
                                    <h4>Vehicle Type</h4>
                                    <p><?php echo $bookrow['v_name'] ?></p>
                                </div>
                                <div class="mb-3 col-lg-4">
                                    <h4>Luggage</h4>
                                    <p><?php echo $bookrow['luggage'] ?></p>
                                </div>
                                <div class="mb-3 col-lg-4">
                                    <h4>Child Seat</h4>
                                    <p><?php echo $bookrow['child_seat'] ?></p>
                                </div>
                                <div class="mb-3 col-lg-4">
                                    <h4>Flight Number </h4>
                                    <p><?php echo $bookrow['flight_number'] ?></p>
                                </div>
                                <div class="mb-3 col-lg-4">
                                    <h4>Delay Time </h4>
                                    <p><?php echo $bookrow['delay_time'] ?></p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="mb-3">
                                    <h4>Special Note</h4>									
                                    <p><?php echo $bookrow['note'] ?></p>
                                </div>				
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-4">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">
                            Driver Details
                        </h3>
                    </div>
                    <div class="card-body border-bottom py-3">						
                        <?php
                        session_start();
                        if(isset($_SESSION['success_msg'])){
                            echo '<h4 style="color:red; margin-top: 10px; font-size: 18px;" align="center">'.$_SESSION['success_msg'].' </h4>';
                            unset($_SESSION['success_msg']);
                            }
                            ?>
                        <div class="modal-body">
                            <div class="row">
                                <input type="hidden" name="book_id" value="<?php echo $bookrow['book_id'];?>">
                                <input type="hidden" name="c_id" value="<?php echo $bookrow['c_id'];?>">
                                <div class="mb-3 col-lg-12">
                                    <label class="form-label">Driver Name</label>
                                    <select class="form-control" name="d_id" id="driverSelect" required>
                                        <option value="">Select Driver</option>
										<?php										                                           
										$drsql = mysqli_query($connect, "SELECT * FROM `drivers`");
										while ($drrow = mysqli_fetch_array($drsql)) {
										?>
                                        <option value="<?php echo $drrow['d_id'] ?>">
											<?php echo $drrow['d_name'] ?> - <?php echo $drrow['d_phone'] ?>
                                        </option>  
										<?php
                                        }
                                        ?>
                                        <option value="0">All Drivers</option>
                                    </select>
								</div>
                                <div class="mb-3 col-lg-12">
									<label class="form-label">Driver Phone</label>
                                    <input type="text" class="form-control" name="dphone" id="driverPhone" readonly>
                                </div>
                                <div class="mb-3 col-lg-12">
                                    <label class="form-label">Driver Email</label>
                                    <input type="text" class="form-control" name="demail" id="driverEmail" readonly>
                                </div>
                                <script>
									var driverSelect = document.getElementById('driverSelect');
									var driverPhoneInput = document.getElementById('driverPhone');
									var driverEmailInput = document.getElementById('driverEmail');    
									driverSelect.addEventListener('change', function () {
									var selectedDriverId = driverSelect.value;
										$.ajax({
											type: 'POST',
											url: 'get-driver-details.php',
											data: { d_id: selectedDriverId },
											success: function (response) {
												var data = JSON.parse(response);
												driverPhoneInput.value = data.phone;	       
												driverEmailInput.value = data.email;	   
											},            
											error: function () {										
											}       
										});
									});
                                </script>				
                            </div>			
                            <div class="row">
                                <div class="mb-3">
                                    <label class="form-label">Booking Note</label>
                                    <textarea class="form-control" rows="5" name="job_note"></textarea>
                                </div>
                            </div>
                            <div class="row">
                                <h4>Pricing Section</h4>
                                <div class="mb-3 col-lg-4">
                                    <label class="form-label">Jouney Fare</label>
                                    <input type="text" class="form-control" name="journey_fare" id="journeyFare" value="<?php echo $bookrow['journey_fare'] ?>" readonly>
                                </div>
                                <div class="mb-3 col-lg-4">
                                    <label class="form-label">Bookinng Fee </label>
                                    <input type="text" class="form-control" name="booking_fee" value="<?php echo $bookrow['booking_fee'] ?>">
                                </div>
                                <div class="mb-3 col-lg-4">
                                    <label class="form-label">Car Park </label>
                                    <input type="text" class="form-control" name="car_parking" value="<?php echo $bookrow['car_parking'] ?>">
                                </div>
                                <div class="mb-3 col-lg-4">
                                    <label class="form-label">Waiting Charges </label>
                                    <input type="text" class="form-control" name="waiting" value="<?php echo $bookrow['waiting'] ?>">
                                </div>
                                <div class="mb-3 col-lg-4">
									<label class="form-label">Tolls </label>
                                    <input type="text" class="form-control" name="tolls" value="<?php echo $bookrow['tolls'] ?>">
                                </div>
                                <div class="mb-3 col-lg-4">
									<label class="form-label">Extra </label>
                                    <input type="text" class="form-control" name="extra" value="<?php echo $bookrow['extra'] ?>">
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <a href="all-bookings.php" class="btn btn-danger">
                                <i class="ti ti-circle-x"></i>
                                Cancel
                            </a>
                            <button type="submit" class="btn btn-success ms-auto"  onclick="validateForm()">
                                <i class="ti ti-plane-tilt"></i>
                                Dispatch Booking
							</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
	</form>	
</div>   
<script>    
    function validateForm() {
        var selectedDriver = document.getElementById("driverSelect").value;        
        if (selectedDriver === "") {
            alert("Please select a driver before dispatching job.");
        } else {           
            document.getElementById("jobform").submit();
        }
    }
</script>
<?php
include('footer.php');
?>