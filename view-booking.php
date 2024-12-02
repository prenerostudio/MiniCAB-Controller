<?php
include('header.php');
$book_id = isset($_GET['book_id']) ? intval($_GET['book_id']) : 0; // Sanitize input
$booksql = mysqli_prepare($connect, "SELECT bookings.*, clients.*, booking_type.*, vehicles.* FROM bookings INNER JOIN booking_type ON bookings.b_type_id = booking_type.b_type_id INNER JOIN clients ON bookings.c_id = clients.c_id INNER JOIN vehicles ON bookings.v_id = vehicles.v_id WHERE bookings.book_id = ?");
mysqli_stmt_bind_param($booksql, 'i', $book_id);
mysqli_stmt_execute($booksql);
$result = mysqli_stmt_get_result($booksql);
$bookrow = mysqli_fetch_array($result);
?>
<div class="page-body page_padding">
    <div class="row row-deck row-cards">
        <div class="col-12">
            <div class="card">
                <div class="card-header">
                    <h3 class="card-title">Booking Details</h3>
                </div>
                <div class="card-body border-bottom py-3">
                    <form method="post" action="update-booking.php" enctype="multipart/form-data">
                        <div class="modal-body">
                            <div class="row">
                                <div class="mb-3 col-md-4">
                                    <label class="form-label">Booking Type</label>
                                    <input type="hidden" class="form-control" name="book_id" value="<?php echo htmlspecialchars($bookrow['book_id']); ?>">
                                    <input type="hidden" class="form-control" name="b_type_id" id="bookingType" value=" <?php echo htmlspecialchars($bookrow['b_type_id']); ?>"  readonly="">
                                    <input type="text" class="form-control" name="b_type_name" id="bookingTypeName" value=" <?php echo htmlspecialchars($bookrow['b_type_name']); ?>"  readonly="">
                                </div>
                            </div>
                            <div class="row">
                                <h4>Passenger Details:</h4>
                                <div class="mb-3 col-lg-4"> 
                                    <label class="form-label">Name</label>
                                    <input type="hidden" class="form-control" name="c_id" id="clientId" value="<?php echo $bookrow['c_id']; ?>"  readonly="">
                                    <input type="text" class="form-control" name="c_name" id="clientName" value="<?php echo $bookrow['c_name']; ?>"  readonly="">
                                </div>								                                
                                <div class="mb-3 col-lg-3">                                
                                    <label class="form-label">Customer Phone</label>                                    
                                    <input type="text" class="form-control" name="cphone"  value="<?php echo htmlspecialchars($bookrow['c_phone']); ?>" id="customerPhone" readonly="">
                                </div>                                
                                <div class="mb-3 col-lg-3">                                
                                    <label class="form-label">Customer Email</label>
                                    <input type="text" class="form-control" name="cemail"  value="<?php echo htmlspecialchars($bookrow['c_email']); ?>" id="customerEmail" readonly="">
                                </div>
                            </div>
                            <div class="row">
                                <h4>Journey Details:</h4>
                                <div class="mb-3 col-lg-4">
                                    <label class="form-label">Pickup Location:</label>
                                    <input type="text" id="pickup" name="pickup" class="form-control" value="<?php echo htmlspecialchars($bookrow['pickup']); ?>" required>
                                </div>
                                <div class="mb-3 col-lg-4">
                                    <label class="form-label">Drop-off Location:</label>
                                    <input type="text" id="dropoff" name="dropoff" class="form-control" value="<?php echo htmlspecialchars($bookrow['destination']); ?>" required>
                                </div>
                                <div class="col-lg-4">
                                    <div id="stops-container">                                        
										<?php if (!empty($bookrow['stops'])): ?>
										<?php
										$stops = explode(' | ', $bookrow['stops']);
										?>
										<?php foreach ($stops as $index => $stop): ?>
                                        <div class="mb-3">
                                            <label class="form-label">Stop <?php echo $index + 1; ?></label>
                                            <input type="text" class="form-control" name="stops[]" value="<?php echo htmlspecialchars(trim($stop)); ?>">
                                        </div>
										<?php endforeach; ?>
										<?php endif; ?>
                                    </div>
                                    <div class="mb-3 col-lg-2">
                                        <a id="add-stop-btn" class="btn btn-info" style="margin-top: 25px;" title="Add Stop">
                                            <i class="ti ti-plus"></i>
                                        </a>
                                    </div>
                                </div>                                
                                <div class="mb-3 col-lg-4">
                                    <label class="form-label">Address</label>
                                    <input type="text" class="form-control" name="address" value="<?php echo htmlspecialchars($bookrow['address']); ?>">
                                </div>
                                <div class="mb-3 col-lg-4">
                                    <label class="form-label">Postal Code</label>
                                    <input type="text" class="form-control" name="postal_code" value="<?php echo htmlspecialchars($bookrow['postal_code']); ?>">
                                </div>
                                <div class="mb-3 col-lg-4">
                                    <label class="form-label">No. of Passenger</label>
                                    <input type="number" class="form-control" name="passenger" value="<?php echo htmlspecialchars($bookrow['passenger']); ?>">
                                </div>
                                <div class="mb-3 col-lg-4">
									<label class="form-label">Pickup Date</label>
                                    <input type="date" class="form-control" name="pick_date" id="pick_date" value="<?php echo htmlspecialchars($bookrow['pick_date']); ?>" required>
                                </div>
                                <div class="mb-3 col-lg-4">
                                    <label class="form-label">Pickup Time</label>
                                    <input type="time" class="form-control" name="pick_time" value="<?php echo htmlspecialchars($bookrow['pick_time']); ?>" required>
								</div>
								<script>
									document.addEventListener("DOMContentLoaded", function() {
										var today = new Date().toISOString().split('T')[0];
										document.getElementById('pick_date').setAttribute('min', today);    
									});
								</script>                                
                                <div class="mb-3 col-lg-4">
                                    <div class="form-label">Journey Type</div>
                                    <div class="mb-3">
                                        <label class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="journey_type" value="One Way" <?php echo ($bookrow['journey_type'] == 'One Way') ? 'checked' : ''; ?>>
                                            <span class="form-check-label">One Way</span>
                                        </label>
                                        <label class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="journey_type" value="Return" <?php echo ($bookrow['journey_type'] == 'Return') ? 'checked' : ''; ?>>
                                            <span class="form-check-label">Return</span>
                                        </label>
                                    </div>
								</div>
                            </div>
                            <div class="row">
                                <div class="mb-3 col-lg-4">
                                    <label class="form-label">Vehicle Type</label>
                                    <select class="form-control" name="v_id" id="vehicleSelect" onchange="updateFare()">
                                        <option value="<?php echo htmlspecialchars($bookrow['v_id']); ?>">
                                            <?php echo htmlspecialchars($bookrow['v_name']); ?>
                                        </option>
										<?php
										$vsql = mysqli_query($connect, "SELECT * FROM `vehicles`");
										while ($vrow = mysqli_fetch_array($vsql)) {                                        
										?>
										<option value="<?php echo htmlspecialchars($vrow['v_id']); ?>">
                                            <?php echo htmlspecialchars($vrow['v_name']); ?>
                                        </option>
										<?php                                             
										}
										?>
									</select>
                                </div>
                                <div class="mb-3 col-lg-4">
                                    <label class="form-label">Luggage</label>
                                    <input type="text" class="form-control" name="luggage" value="<?php echo htmlspecialchars($bookrow['luggage']); ?>">
                                </div>
                                <div class="mb-3 col-lg-4">
                                    <div class="form-label">Child Seat</div>				
                                    <div>
                                        <label class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="child_seat" value="Yes" <?php echo ($bookrow['child_seat'] == 'Yes') ? 'checked' : ''; ?>>
                                            <span class="form-check-label">Yes</span>
                                        </label>
                                        <label class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="child_seat" value="No" <?php echo ($bookrow['child_seat'] == 'No') ? 'checked' : ''; ?>>
                                            <span class="form-check-label">No</span>
                                        </label>
                                    </div>
                                </div>
                                <div class="mb-3 col-lg-4">
									<label class="form-label">Flight Number </label>
                                    <input type="text" class="form-control" name="flight_number" value="<?php echo htmlspecialchars($bookrow['flight_number']); ?>">
                                </div>
                                <div class="mb-3 col-lg-4">
                                    <label class="form-label">Delay Time </label>
                                    <input type="text" class="form-control" name="delay_time" value="<?php echo htmlspecialchars($bookrow['delay_time']); ?>">
                                </div>
                            </div>
                            <div class="row">
                                <div class="mb-3">
                                    <label class="form-label">Special Note</label>
                                    <textarea class="form-control" rows="3" name="note"><?php echo htmlspecialchars($bookrow['note']); ?></textarea>
                                </div> 
                            </div>
                            <div class="row">
								<h4>Pricing Section</h4>
                                <div class="mb-3 col-lg-4">
                                    <label class="form-label">Booking Fee </label>
                                    <input type="text" class="form-control" name="booking_fee" value="<?php echo htmlspecialchars($bookrow['booking_fee']); ?>">
                                </div>
                                <div class="mb-3 col-lg-4">
                                    <label class="form-label">Car Park </label>
                                    <input type="text" class="form-control" name="car_parking" value="<?php echo htmlspecialchars($bookrow['car_parking']); ?>">
                                </div>
                                <div class="mb-3 col-lg-4">
                                    <label class="form-label">Waiting Charges </label>
                                    <input type="text" class="form-control" name="waiting" value="<?php echo htmlspecialchars($bookrow['waiting']); ?>">
                                </div>
                                <div class="mb-3 col-lg-4">
									<label class="form-label">Tolls </label>
                                    <input type="text" class="form-control" name="tolls" value="<?php echo htmlspecialchars($bookrow['tolls']); ?>">
                                </div>	
                                <div class="mb-3 col-lg-4">
                                    <label class="form-label">Extra </label>
                                    <input type="text" class="form-control" name="extra" value="<?php echo htmlspecialchars($bookrow['extra']); ?>">
                                </div>
                                <?php                               
								if( !empty($bookrow['booker_commission'])){                                
								?>				                                                              
                                <div class="mb-3 col-lg-4" id="bookerCommissionField">                                
                                    <label class="form-label">Booker Commission </label>
                                    <input type="text" class="form-control" name="booker_com" value="<?php echo htmlspecialchars($bookrow['booker_commission']); ?>">                            
                                </div>                                    
								<?php   
								} else {
								}
								?>
                                <div class="mb-3 col-lg-4">
                                    <label class="form-label">Distance (Auto-calculated)</label>
                                    <input type="text" class="form-control" name="journey_distance" id="journeyDistance" value="<?php echo htmlspecialchars($bookrow['journey_distance']); ?>" readonly>
                                </div>
                                <div class="mb-3 col-lg-4">     
                                    <label class="form-label">Journey Fare</label>
                                    <input type="text" class="form-control" name="journey_fare" id="journeyFare" value="<?php echo htmlspecialchars($bookrow['journey_fare']); ?>">
                                </div>                             
                                <div class="col-lg-4">
                                    <h4>Send Online Payment Link</h4>
                                    <p>
                                        <label>
                                            <input type="checkbox" name="Payment Link[]" value="phone">
                                            Phone Number
                                        </label>
                                        <br>
                                        <label>
                                            <input type="checkbox" name="Payment Link[]" value="email">
                                            Email Address
										</label>                                 
                                        <br>
                                    </p>
                                </div>
                            </div>
						</div>		
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-success ms-auto">
                                <i class="ti ti-message-plus"></i>
                                Update Booking
                            </button>
                            <a href="dispatch-booking.php?book_id=<?php echo htmlspecialchars($bookrow['book_id']); ?>" class="btn btn-indigo" style="margin-left: 20px;">
                                <i class="ti ti-plane-tilt"></i>
                                Dispatch Booking
                            </a>
                            <a href="javascript:void(0);" onclick="cancelBooking(<?php echo $bookrow['book_id']; ?>);" class="btn btn-danger" style="margin-left: 20px;">
                                <i class='ti ti-square-rounded-x'></i>
                                Cancel Booking
                            </a>
                            <script>
								function cancelBooking(bookId) {
									let confirmation = confirm("Are you sure you want to cancel this booking?");
									if (confirmation) {
										let reason = prompt("Please provide a reason for canceling this booking:");
										if (reason) {
											window.location.href = `cancel-booking.php?book_id=${bookId}&reason=${encodeURIComponent(reason)}`;
										} else {     
											alert("You must provide a reason for cancellation.");
										}
									}
								}
							</script>
                        </div> 
                    </form>
                    <script>
						document.addEventListener("DOMContentLoaded", function() {
							var bookingTypeSelect = document.getElementById("bookingType");
							var bookerCommissionField = document.getElementById("bookerCommissionField");
							bookingTypeSelect.addEventListener("change", function() {
								if (this.value === 3) {
									bookerCommissionField.style.display = "block";
								} else {
									bookerCommissionField.style.display = "none";
								}
							});
						});
						$(document).ready(function() {
							$('#calculateFareBtn').on('click', function(e) {
								e.preventDefault(); // Prevent the form from submitting
								var distance = parseFloat($('#journeyDistance').val());
								var pickDate = new Date($('input[name="pick_date"]').val());
								var pickTime = $('input[name="pick_time"]').val();
								var vehicleId = $('#vehicleSelect').val();
								var vehiclePricing = parseFloat(fetchVehiclePricing(vehicleId));
								var baseFare = distance * vehiclePricing;
								if (isHoliday(pickDate)) {
									baseFare *= 1.1;
								}
								var pickHour = parseInt(pickTime.split(':')[0], 10);
								if (pickHour < 9 || pickHour >= 20) {
									baseFare *= 1.05;
								}
								$('#journeyFare').val(baseFare.toFixed(2));
							});
							function fetchVehiclePricing(vehicleId) {
								$.ajax({
									type: 'POST',
									url: 'fetch_vehicle_pricing.php',
									data: { vehicleId: vehicleId },
									success: function(response) {
										var data = JSON.parse(response);
										callback(data);
									},            
									error: function() {
									}
								});
								return 15.0;
							}
							function isHoliday(date) {
								return false;
							}
						});    
						function validateForm() {
							var typeInput = document.getElementsByName("b_type_id")[0].value;
							var cidInput = document.getElementsByName("c_id")[0].value;
							var pickupInput = document.getElementsByName("pickup")[0].value;
							var dropoffInput = document.getElementsByName("dropoff")[0].value;	        	        
							var pdateInput = document.getElementsByName("pick_date")[0].value;	        	        
							var ptimeInput = document.getElementsByName("pick_time")[0].value;	        	        
							var fareInput = document.getElementsByName("journey_fare")[0].value;	        	        
							if (typeInput === "" || cidInput === "" || pickupInput === "" || dropoffInput === "" || pdateInput === "" || ptimeInput === "" || fareInput === "") {            	            
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

    <div class="row row-deck row-cards">    
        <div class="col-12">        
            <div class="card">            
                <div class="card-header">                
                    <h3 class="card-title">
                        Booking History                
                    </h3>            
                </div>                    
				<?php
				$historysql = "SELECT bookings_history.*, clients.*, booking_type.*, vehicles.* FROM bookings_history INNER JOIN booking_type ON bookings_history.b_type_id = booking_type.b_type_id INNER JOIN clients ON bookings_history.c_id = clients.c_id INNER JOIN vehicles ON bookings_history.v_id = vehicles.v_id WHERE bookings_history.book_id = ?";
				$historyresult = mysqli_prepare($connect, $historysql);
				mysqli_stmt_bind_param($historyresult, 'i', $book_id);
				mysqli_stmt_execute($historyresult);
				$result = mysqli_stmt_get_result($historyresult);                        
				while ($hbookrow = mysqli_fetch_assoc($result)) {                                    
				?>            
                <div class="card-body border-bottom py-3" style="padding-top: 15px; padding-bottom: 15px;">                
                    <div class="modal-body">
                        <div class="row">                        
                            <h2>Booking Details:</h2>                        
							<h3>Booking ID: <?php echo $hbookrow['book_id']; ?></h3>
                            <table class="table table-responsive">
                                <tr>                                
                                    <td style="width: 25%;">
                                        <strong>
                                            Booking Type:
                                        </strong>
                                    </td>                                
                                    <td style="width: 25%;">
                                        <strong>
                                            Customer Name:
                                        </strong>
                                    </td>                                
                                    <td style="width: 25%;">
                                        <strong>
                                            Customer Phone:
                                        </strong>
                                    </td>                                
                                    <td style="width: 25%;">
                                        <strong>
                                            Customer Email:
                                        </strong>
                                    </td>                                        
                                </tr>
                                <tr>                                
                                    <td>
                                        <?php echo $hbookrow['b_type_name'];?>
                                    </td>                                
                                    <td>
                                        <?php echo $hbookrow['c_name'];?>
                                    </td>                                
                                    <td>
                                        <?php echo $hbookrow['c_phone'];?>
                                    </td>                                
                                    <td>
                                        <?php echo $hbookrow['c_email'];?>
                                    </td>
                                </tr>                                                                                       
                                <tr>                                    
                                    <td>
                                        <strong>
                                            Pickup Location:
                                        </strong>
                                    </td>                                
                                    <td>
                                        <strong>
                                            Drop-off Location:
                                        </strong>
                                    </td>                                
                                    <td>
                                        <strong>
                                            Stops:
                                        </strong>
                                    </td>                                    
                                    <td> </td>                        
                                </tr>
                                <tr>
                                    <td>
                                        <?php echo $hbookrow['pickup'];?>
                                    </td>                                
                                    <td>
                                        <?php echo $hbookrow['destination'];?>
                                    </td>                                
                                    <td>
                                        <?php echo $hbookrow['stops'];?>
                                    </td>                                
                                    <td> </td>
                                </tr>                                                        
                                <tr>
                                    <td>
                                        <strong>
                                            Address:
                                        </strong>
                                    </td>                                
                                    <td>
                                        <strong>
                                            Postal Code:
                                        </strong>
                                    </td>                                
                                    <td>
                                        <strong>
                                            No. of Passengers:
                                        </strong>
                                    </td>                                
                                    <td>
                                        <strong>
                                            Journey Type:
                                        </strong>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <?php echo $hbookrow['address'];?>
                                    </td>                                
                                    <td>
                                        <?php echo $hbookrow['postal_code'];?>
                                    </td>                                
                                    <td>
                                        <?php echo $hbookrow['passenger'];?>
                                    </td>                                
                                    <td>
                                        <?php echo $hbookrow['journey_type'];?>
                                    </td>
                                </tr>                                                                                   
                                <tr>                                
                                    <td>
                                        <strong>
                                            Pickup Date:
                                        </strong>
                                    </td>                                
                                    <td>
                                        <strong>
                                            Pickup Time:
                                        </strong>
                                    </td>                                
                                    <td>
                                        <strong>
                                            Luggage:
                                        </strong>
                                    </td>
                                    <td>
                                        <strong>
                                            Child Seat:
                                        </strong>
									</td>              
                                </tr>                                                       
                                <tr>
                                    <td>
                                        <?php echo $hbookrow['pick_date'];?>
                                    </td>                                
                                    <td>
                                        <?php echo $hbookrow['pick_time'];?>
                                    </td>                                
                                    <td>
                                        <?php echo $hbookrow['luggage'];?>
                                    </td>                                
                                    <td>
                                        <?php echo $hbookrow['child_seat'];?>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <strong>
                                            Vehicle Type:
                                        </strong>
                                    </td>                                
                                    <td>
                                        <strong>
                                            Flight Number:
                                        </strong>
                                    </td>                                
                                    <td>
                                        <strong>
                                            Delay Time:
                                        </strong>
                                    </td>                                
                                    <td>
                                        <strong>
                                            Distance:
                                        </strong>
                                    </td>                          
                                </tr>
                                <tr>
                                    <td>
                                        <?php echo $hbookrow['v_name'];?>
                                    </td>                                
                                    <td>
                                        <?php echo $hbookrow['flight_number'];?>
                                    </td>                                
                                    <td>
                                        <?php echo $hbookrow['delay_time'];?>
                                    </td>                                
                                    <td>
                                        <?php echo $hbookrow['journey_distance'];?> 
                                    </td>
                                </tr>                                                                                    
                                <tr>                                
                                    <td colspan="4">
                                        <strong>
                                            Special Note:
                                        </strong>
									</td>
                                </tr>                                    
                                <tr>                                
                                    <td colspan="4">
                                        <?php echo $hbookrow['note'];?>
                                    </td>
                                </tr>											
                                <tr>                                
                                    <td>
                                        <strong>
                                            Booking Fee:
                                        </strong>
                                    </td>                                
                                    <td>
                                        <strong>
                                            Car Parking:
                                        </strong>
                                    </td>                                
                                    <td>
                                        <strong>
                                            Waiting Charges:
                                        </strong>
                                    </td>                                
                                    <td>
                                        <strong>
                                            Tolls Taxes:
                                        </strong>
                                    </td>
                                </tr>                                                            
                                <tr>                                
                                    <td>
                                        <?php echo $hbookrow['booking_fee'];?>
                                    </td>                                
                                    <td>
                                        <?php echo $hbookrow['car_parking'];?>
                                    </td>                                
                                    <td>
                                        <?php echo $hbookrow['waiting'];?>
                                    </td>                                
                                    <td>
                                        <?php echo $hbookrow['tolls'];?>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <strong>
                                            Extra Charges:
                                        </strong>
                                    </td>                                
                                    <td>
                                        <strong>
                                            Journey Fare:
                                        </strong>
                                    </td>                                
                                    <td>
                                        <strong></strong>
                                    </td>                                
                                    <td>
                                        <strong></strong>
                                    </td>
                                </tr>                            
                                <tr>                                
                                    <td>
                                        <?php echo $hbookrow['extra'];?>
                                    </td>                                
                                    <td>
                                        <?php echo $hbookrow['journey_fare'];?>
                                    </td>                                                                    
                                    <td></td>                                                                    
                                    <td></td>
                                </tr>
                            </table>
                        </div>
                    </div>            
                </div>
				<?php } ?>        
            </div>    
        </div>
    </div>	              
</div>       
<script>	
    function initAutocomplete() {                
        var pickupInput = document.getElementById('pickup');                        
        var dropoffInput = document.getElementById('dropoff');            
        var stopInput = document.getElementById('stop');    
        var journeyDistanceInput = document.getElementById('journeyDistance');		                
        var autocompleteOptions = {        
            types: ['geocode'],                            
            componentRestrictions: {country: 'GB'}        
        };				                
        var autocompletePickup = new google.maps.places.Autocomplete(pickupInput, autocompleteOptions);    
        var autocompleteDropoff = new google.maps.places.Autocomplete(dropoffInput, autocompleteOptions);    
        var autocompleteStop = new google.maps.places.Autocomplete(stopInput, autocompleteOptions); // Initialize autocomplete for stop field  
        autocompletePickup.addListener('place_changed', function () { 
        updateDistance();        
        updateJourneyFare();    
		});            
        autocompleteDropoff.addListener('place_changed', function () {        
        updateDistance();                
        updateJourneyFare();    
		});	    
        autocompleteStop.addListener('place_changed', function () { // Add listener for stop input field        
        updateDistance();                
        updateJourneyFare();            
		});   
        function handleSuggestions(predictions, inputField) {                
        var addresses = predictions.map(function(prediction) {                    
        return prediction.description;    
		});			                        
        updateAutocompleteSuggestions(inputField, addresses);            
		}				            
        function updateAutocompleteSuggestions(inputField, suggestions) {                
        var datalistId = inputField.id + '_datalist';        
        var datalist = document.getElementById(datalistId);
        if (!datalist) {                    
            datalist = document.createElement('datalist');                                        
            datalist.id = datalistId;                                        
            document.body.appendChild(datalist);        
        }                
        datalist.innerHTML = '';			                            
        suggestions.forEach(function(suggestion) {                    
        var option = document.createElement('option');                                    
        option.value = suggestion;                                    
        datalist.appendChild(option);                    
		});						                        
        inputField.setAttribute('list', datalistId);        
		}          
        function updateDistance() {                        
        var pickupPlace = autocompletePickup.getPlace();                            
        var dropoffPlace = autocompleteDropoff.getPlace();			                            
        if (pickupPlace.geometry && dropoffPlace.geometry) {                    
            calculateDistance(pickupPlace.geometry.location, dropoffPlace.geometry.location);        
		}            
		}		            
        function calculateDistance(pickupLocation, dropoffLocation) {            
        var service = new google.maps.DistanceMatrixService();            
        service.getDistanceMatrix({                
            origins: [pickupLocation],                    
            destinations: [dropoffLocation],                    
            travelMode: 'DRIVING',            
        }, 
        function(response, status) {                    
        if (status === 'OK' && response.rows.length > 0) {                    
            var distanceText = response.rows[0].elements[0].distance.text;                        
            var distanceValue = parseFloat(distanceText.replace(/[^\d.]/g, ''));            
            if (!isNaN(distanceValue)) {                						                            
                journeyDistanceInput.value = distanceValue.toFixed(2);                                
                updateJourneyFare(distanceValue);                                    
			} else {                            
                console.error('Invalid distance value:', distanceText);                            
            }                   
        } else {            					                    
            console.error('Error calculating distance:', status);                   
        }   
		});	      
		}   
	}	    
	google.maps.event.addDomListener(window, 'load', initAutocomplete);
</script>	
<?php
include('footer.php');
?>