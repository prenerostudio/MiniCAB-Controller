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
                    <span class="dropdown">		
                        <button class="btn dropdown-toggle align-text-top" id="filterDropdown" data-bs-boundary="viewport" data-bs-toggle="dropdown">
                            Search Bookings
                        </button>
                        <div class="dropdown-menu dropdown-menu-end">
                            <a class="filter-item" href="#" data-filter="3">
                                All Bookings In 3 Hours
                            </a>
                            <a class="filter-item" href="#" data-filter="6">
                                All Bookings In 6 Hours
                            </a>
                            <a class="filter-item" href="#" data-filter="9">
                                All Bookings In 9 Hours
                            </a>
                            <a class="filter-item" href="#" data-filter="12">
                                All Bookings In 12 Hours
                            </a>
                            <a class="filter-item" href="#" data-filter="24">
                                All Bookings In 24 Hours
                            </a>
                            <a class="filter-item" href="#" data-filter="72">
                                All Bookings In 3 Days
                            </a>
                            <a class="filter-item" href="#" data-filter="168">
                                All Bookings In 7 Days
                            </a>
                            <a class="filter-item" href="#" data-filter="336">
                                All Bookings In 14 Days
                            </a>
                            <a class="filter-item" href="#" data-filter="720">
                                All Bookings In 30 Days
                            </a>
                            <a class="filter-item" href="#" data-filter="2160">
                                All Bookings In 3 Months
                            </a>
                            <a class="filter-item" href="#" data-filter="4320">
                                All Bookings In 6 Months
                            </a>			
                            <a class="filter-item" href="#" data-filter="8760">
                                All Bookings In 12 Months
                            </a>
                        </div>
                    </span>
                </span>
                <script>					    					    
					$(document).ready(function() {                						        
						$(".filter-item").click(function(event) {        							        
							event.preventDefault();        							        
							var selectedInterval = $(this).data("filter");
							console.log("Selected Interval:", selectedInterval);
							$.ajax({
								type: "GET",
								url: "fetch_data.php",
								data: { timeInterval: selectedInterval },
								success: function(data) {
									console.log("Ajax Success:", data);
									$("#tableBody").html(data);
								},
								error: function(xhr, status, error) {
									console.error("Ajax Error:", error);
								}
							});
						});
					});
				</script>
            </div>
        </div>
    </div>	
</div>
<div class="page-body page_padding">          
    <div class="row row-deck row-cards">			      	
        <div class="col-12">            						
            <div class="card">     												
                <div class="card-header">						
                    <h3 class="card-title">		
                        All Bookings List			
                    </h3>		
                </div>						
                <div class="card-body border-bottom py-3">						
                    <div class="table-responsive">
                        <?php
                        $bsql = mysqli_query($connect, "SELECT bookings.*, clients.c_name, clients.c_email, clients.c_phone, booking_type.*, vehicles.* FROM bookings, clients, booking_type, vehicles WHERE bookings.c_id = clients.c_id AND bookings.b_type_id = booking_type.b_type_id AND bookings.v_id = vehicles.v_id ORDER BY bookings.book_id DESC");  
                        if (mysqli_num_rows($bsql) > 0) {
                        ?>
                        <table class="table" id="table-booking">
                            <thead>
                                <tr>                				
                                    <th>ID</th>                				
                                    <th>Date Pickup</th>                				
                                    <th>Time Pickup</th>                				
                                    <th>Post Code</th>                				
                                    <th>Pickup</th>                				
                                    <th>Stops</th>                				
                                    <th>Dropoff</th>                				
                                    <th>Passenger</th>                				
                                    <th>Journey Type</th>                				
                                    <th>Fare</th>                				
                                    <th>Vehicle</th>                				
                                    <th>Actions</th>            				
                                </tr>        				
                            </thead>        			
                            <tbody class="table-tbody" id="tableBody">				
                                <?php                                        
                                $y = 0;
                                while ($brow = mysqli_fetch_array($bsql)) {
                                    $y++;
                                    $pickup_datetime = strtotime($brow['pick_date'] . ' ' . $brow['pick_time']);
                                    $current_datetime = time();
                                    $time_diff = ($pickup_datetime - $current_datetime) / 60;
                                    $row_class = '';
                                    if ($brow['booking_status'] === 'Pending') {
                                        $row_class = ($time_diff <= 30) ? 'near-pickup-red' : 'pending-red';
                                    } elseif ($brow['booking_status'] === 'Completed') {
                                        $row_class = 'completed-green';
                                    }  elseif ($brow['booking_status'] === 'Booked') {
                                        $row_class = 'completed-green';
                                    }       
								?> 
                                <tr class="<?php echo $row_class; ?>">
                                    <td><?php echo $brow['book_id']; ?></td>
                                    <td><?php echo $brow['pick_date']; ?></td>
                                    <td><?php echo $brow['pick_time']; ?></td>
                                    <td><?php echo $brow['postal_code']; ?></td>
                                    <td><?php echo $brow['pickup']; ?></td>
                                    <td><?php echo $brow['stops']; ?></td>
                                    <td><?php echo $brow['destination']; ?></td>
                                    <td><?php echo $brow['passenger']; ?></td>
                                    <td><?php echo $brow['journey_type']; ?></td>
                                    <td><?php echo $brow['journey_fare']; ?></td>
                                    <td><?php echo $brow['v_name']; ?></td>
                                    <td style='width: 15%; background: #FFFFFF;'>
                                        <?php
                                        if ($brow['bid_status'] == 0) {
										?>
                                        <a href='open-bid.php?book_id=<?php echo $brow['book_id'] ?>'>
                                            <button class='btn btn-facebook btn-icon' title='Open Bid'>
                                                <i class='ti ti-aspect-ratio'></i>
                                            </button>
                                        </a>
										<?php
										} else {
										?>
                                        <a href='#'>
                                            <button class='btn btn-icon' disabled>
                                                <i class='ti ti-aspect-ratio'></i>
                                            </button>
                                        </a>
										<?php
										}
										?>
                                        <a href='view-booking.php?book_id=<?php echo $brow['book_id']; ?>'>
                                            <button class='btn btn-twitter btn-icon' title='View / Edit'>
                                                <i class='ti ti-eye'></i>
                                            </button>
                                        </a>
										<?php
										if ($brow['booking_status'] == 'Booked') {
										?>
                                        <a href='#'>
                                            <button class='btn btn-github btn-icon' title='Dispatched' disabled>
                                                <i class='ti ti-plane-tilt'></i>
                                            </button>
										</a>
										<?php
										} else {
										?>
                                        <a href='dispatch-booking.php?book_id=<?php echo $brow['book_id']; ?>'>
                                            <button class='btn btn-github btn-icon'  title='Dispatch'>
                                                <i class='ti ti-plane-tilt'></i>
                                            </button>
                                        </a>
										<?php
										}
										if ($brow['booking_status'] == 'Open') {		
										?>
                                        <a href='#' >
                                            <button class='btn btn-success btn-icon' title='Opened' disabled>
                                                 <i class="ti ti-folder-open"></i>
                                            </button>
                                        </a>
										<?php                                                                              
										} else {
										?>
                                        <a href='open-book.php?book_id=<?php echo $brow['book_id']; ?>'>
                                            <button class='btn btn-success btn-icon'  title='Send to Archive'>
                                                <i class="ti ti-folder-open"></i>
                                            </button>
                                        </a>
										<?php
										}
										?>
                                    </td>
                                </tr>
								<?php
								}
								?>
                            </tbody>
						</table>
						<?php
						} else {
							echo '<p>No booking found.</p>';
						}
						?>
                    </div>
                </div>
            </div>
        </div>	
    </div>
</div>
<script>	
    $(document).ready(function() {    
        $('#table-booking').DataTable({        
            "order": [[ 0, "desc" ]]     
        });		
});
</script>
<?php
include('footer.php');
?>