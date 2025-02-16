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
                Dashboard
            </h2>
		</div>
    </div>	
</div>          
<div class="page-body page_padding">
    <div class="row row-deck row-cards">
        <div class="col-lg-6">
			<div class="card">	
                <div class="card-body">
                    <h3 class="card-title">
                        Locations
					</h3>                    
					<div>           
						<?php
						// Fetch all zones
						$zonesQuery = "SELECT * FROM zones";
						$zonesResult = $connect->query($zonesQuery);
						// Fetch the latest driver locations
						$driversQuery = "SELECT dl.d_id, dl.latitude, dl.longitude FROM driver_location dl INNER JOIN (SELECT d_id, MAX(time) AS latest_timestamp FROM driver_location GROUP BY d_id) latest ON dl.d_id = latest.d_id AND dl.time = latest.latest_timestamp";
						$driversResult = $connect->query($driversQuery);
						$drivers = [];
						while ($row = $driversResult->fetch_assoc()) {    
							$drivers[] = $row;
						}
						// Display zone table
						echo "<table class='table scrollable-table'>";
						echo "<tr><th>Zone</th><th>Number of Drivers</th><th>Drivers ID</th></tr>";
						while ($zone = $zonesResult->fetch_assoc()) {    
							$driverCount = 0;    
							$driversInZone = [];    
							foreach ($drivers as $driver) {        
								if (            
									$driver['latitude'] >= $zone['lat_min'] && $driver['latitude'] <= $zone['lat_max'] &&            
									$driver['longitude'] >= $zone['lng_min'] && $driver['longitude'] <= $zone['lng_max']        
								) {            
									$driverCount++;            
									$driversInZone[] = $driver['d_id'];        
								}    
							}    
							$driverList = implode(', ', $driversInZone);    
							echo "<tr>            			
								<td>{$zone['zone_name']}</td>
            					<td>{$driverCount}</td>
            					<td>{$driverList}</td>
          						</tr>";
						}
						echo "</table>";
						?>
                    </div>
				</div>
            </div>
        </div>
        <div class="col-sm-6 col-lg-3">
            <div class="card">
                <div class="card-body">
                    <div class="d-flex align-items-center">
                        <div class="subheader">
                            Driver Onboard
                        </div>
                    </div>
                    <div class="table-responsive">
                        <div id="driverListPOB">
                            <table class="table table-responsive" id="table-pob">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Driver</th>
                                        <th>Status</th>
                                    </tr>
                                </thead>
                                <tbody>
									<?php
                                    $n=0;
                                    $drsql=mysqli_query($connect,"SELECT drivers.* FROM drivers WHERE drivers.`status` = 'pob' OR drivers.`status` = 'On Ride' OR drivers.`status` = 'Reached on Dropoff' OR drivers.`status` = 'Way to Pickup'");
                                    while($drrow = mysqli_fetch_array($drsql)){
                                        $n++;
                                        ?>
                                    <tr>
                                        <td>
											<?php echo $n; ?>
										</td>
                                        <td>
                                            <span class="text-secondary">
												<?php echo $drrow['d_name']; ?>
                                            </span>
										</td>
                                        <td>					
                                            <span class="badge bg-success me-1"></span>
											<?php echo $drrow['status']; ?>
                                        </td>
                                    </tr>
									<?php
									}
									?>
                                </tbody>
                            </table>
                        </div>
                        <script>
							$(document).ready(function() {
								$('#table-pob').DataTable();
							});
							function loadDriverListPOB() {
								var xhttp = new XMLHttpRequest();
								xhttp.onreadystatechange = function() {	        
									if (this.readyState == 4 && this.status == 200) {	            
										document.getElementById("driverListPOB").innerHTML = this.responseText;
									}	    
								};
								xhttp.open("GET", "update_driver_list_pob.php", true);
								xhttp.send();
							}    
							loadDriverListPOB();    
							setInterval(loadDriverListPOB, 1000);
						</script>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-lg-3">
            <div class="card">
                <div class="card-body">
                    <div class="d-flex align-items-center">
                        <div class="subheader">Active users</div>
                    </div>
                    <div id="driverList">
                        <table class="table" id="table-active">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Driver</th>
                                    <th>Status</th>
                                </tr>
							</thead>
                            <tbody>
                                <?php
                                $x=0;
                                $drvsql=mysqli_query($connect,"SELECT * FROM `drivers` WHERE `status`='online'");
                                while($drvrow = mysqli_fetch_array($drvsql)){
                                    $x++;
                                    ?>
                                <tr>
                                    <td>
										<?php echo $x; ?>
                                    </td>
                                    <td>
                                        <span class="text-secondary">
											<?php echo $drvrow['d_name']; ?>
                                        </span>
                                    </td>
                                    <td>
                                        <span class="badge bg-success me-1"></span>
										<?php echo $drvrow['status']; ?>
                                    </td>
                                </tr>
								<?php
								}
                                ?>
                            </tbody>
						</table>
                    </div>
                    <script> 
						$(document).ready(function() {
							$('#table-active').DataTable();
						}); 
						function loadDriverList() {
							var xhttp = new XMLHttpRequest();
							xhttp.onreadystatechange = function() {
								if (this.readyState == 4 && this.status == 200) {
									document.getElementById("driverList").innerHTML = this.responseText;
								}
							};
							xhttp.open("GET", "update_driver_list.php", true);
							xhttp.send();
						}
						loadDriverList();
						setInterval(loadDriverList, 1000);
					</script>
                </div>
            </div>
        </div>
        <div class="col-12">
            <div class="card">
                <div class="card-header">
                    <h3 class="card-title">Today's Jobs	</h3>
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
											url: "fetch-next-data.php",            									            
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
                <div class="card-body border-bottom py-3">		
                    <div class="table-responsive">						
                        <?php
                        $bsql = mysqli_query($connect, "SELECT bookings.*, clients.c_name, clients.c_email, clients.c_phone, booking_type.*, vehicles.* FROM bookings, clients, booking_type, vehicles WHERE bookings.c_id = clients.c_id AND bookings.b_type_id = booking_type.b_type_id AND bookings.v_id = vehicles.v_id AND bookings.booking_status <> 'Booked' ORDER BY bookings.book_id DESC");
                        if (mysqli_num_rows($bsql) > 0) {
						?>
                        <table class="table" id="table-dashboard">
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
                            <tbody class="table-tbody">							                                
								<?php						
								$y = 0;					                                                                       
								while ($brow = mysqli_fetch_array($bsql)) {										                                    
									$y++;  				
                                    $pickup_datetime = strtotime($brow['pick_date'] . ' ' . $brow['pick_time']);				
                                    $current_datetime = time();                				
                                    $time_diff = ($pickup_datetime - $current_datetime) / 60;				
                                    $row_class = ($time_diff <= 10) ? 'near-pickup' : '';       								
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
                                    <td style="width: 12%;">				
                                        <form method="post" action="dispatch-process.php">    					
                                            <input type="hidden" value="<?php echo $brow['book_id']; ?>" name="book_id">					
                                            <input type="hidden" value="<?php echo $brow['c_id']; ?>" name="c_id">					
                                            <input type="hidden" value="<?php echo $brow['journey_fare']; ?>" name="journey_fare">					
                                            <input type="hidden" value="<?php echo $brow['booking_fee']; ?>" name="booking_fee">					
                                            <div class="mb-3">					
                                                <div class="input-group mb-2">						
                                                    <select class="form-control" name="d_id" required>						
                                                        <option value="">Select Driver</option>														
														<?php
                                                        $drsql = mysqli_query($connect, "SELECT drivers.* FROM drivers WHERE drivers.acount_status = 1");
                                                        while ($drrow = mysqli_fetch_array($drsql)) {                   
														?>							
                                                        <option value="<?php echo $drrow['d_id']; ?>">															
															<?php echo $drrow['d_id'] ?> - 
															<?php echo $drrow['d_name'] ?> - 
															<?php echo $drrow['d_phone'] ?>
                                                        </option>														
														<?php
                                                        }							
                                                        ?>							
                                                    </select>								
                                                    <button class="btn btn-bitbucket" type="submit">						
                                                        <i class="ti ti-plane-tilt"></i>							
                                                    </button>						
                                                </div>						
                                            </div>						
                                        </form>					
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
        $('#table-dashboard').DataTable({        
            "order": [[ 0, "desc" ]]     
        });
});
</script>
<?php	
include('footer.php');	
?>