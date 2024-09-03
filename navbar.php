<header class="navbar-expand-md">
	<div class="collapse navbar-collapse" id="navbar-menu">
		<div class="navbar">
			<div class="col">
				<ul class="navbar-nav">
					<li class="nav-item">
						<a class="nav-link" href="dashboard.php">
							<span class="nav-link-icon d-md-none d-lg-inline-block">
								<i class="ti ti-home"></i>
							</span>
							<span class="nav-link-title">
								Dashboard
							</span>
						</a>
					</li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#navbar-booking" data-bs-toggle="dropdown" data-bs-auto-close="outside" role="button" aria-expanded="false">
							<span class="nav-link-icon d-md-none d-lg-inline-block">
								<i class="ti ti-book"></i>				
							</span>
							<span class="nav-link-title">
								Bookings
							</span>
						</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="add-booking.php">
								<i class="ti ti-bookmark-plus"></i>
								Add New Booking
							</a>
							<a class="dropdown-item" href="all-bookings.php">
								<i class="ti ti-bookmarks"></i>
								All Bookings
								<?php
								include 'count-all-bookings.php';    
								?>
								 <span class="badge badge-sm bg-green-lt text-uppercase ms-auto"> <?php echo $booking_count; ?></span>
							</a>
							<a class="dropdown-item" href="upcoming-bookings.php">
								<i class="ti ti-alarm-plus"></i>
								Upcoming Bookings
								<?php
								include 'count-upcoming-booking.php';    
								?>
								 <span class="badge badge-sm bg-green-lt text-uppercase ms-auto"><?php echo $upcoming_booking_count; ?></span>
							</a>
							<a class="dropdown-item" href="inprocess-bookings.php">
								<i class="ti ti-address-book"></i>
								Booking InProcess
								<?php
								include('count-inprocess.php');
								?>
								 <span class="badge badge-sm bg-green-lt text-uppercase ms-auto"><?php echo $inprocess_count; ?></span>
							</a>
							<a class="dropdown-item" href="completed-booking.php">
								<i class="ti ti-bookmarks-filled"></i>
								Completed Bookings
								<?php
								include('count-completed.php');
								?>
								 <span class="badge badge-sm bg-green-lt text-uppercase ms-auto"><?php echo $completed_count; ?></span>
							</a>
							<a class="dropdown-item" href="cancelled-booking.php">
								<i class="ti ti-bookmarks-off"></i>
								Cancelled Bookings
								<?php
								include('count-cancelled.php');
								?>
								 <span class="badge badge-sm bg-red-lt text-uppercase ms-auto"><?php echo $cancel_count; ?></span>
							</a>
						</div>
					</li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#navbar-booking" data-bs-toggle="dropdown" data-bs-auto-close="outside" role="button" aria-expanded="false">
							<span class="nav-link-icon d-md-none d-lg-inline-block">
								<i class="ti ti-gavel"></i>
							</span>
							<span class="nav-link-title">
								Bids
							</span>
						</a>
						<div class="dropdown-menu">						
							<a class="dropdown-item" href="add-bid.php">
								<i class="ti ti-file-plus"></i>								
								Add New Bid								
							</a>
							<a class="dropdown-item" href="bid-bookings.php">
								<i class="ti ti-file-check"></i>
								Bookings on Bid
							</a>							
							<a class="dropdown-item" href="accepted-bids.php">
								<i class="ti ti-users"></i>
								Accepted Bids
							</a>
							<a class="dropdown-item" href="time-slots.php">
								<i class="ti ti-clock-24"></i>
								Time Slots
							</a>
						</div>
					</li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#navbar-client" data-bs-toggle="dropdown" data-bs-auto-close="outside" role="button" aria-expanded="false">
							<span class="nav-link-icon d-md-none d-lg-inline-block">
								<i class="ti ti-building-store"></i>
							</span>
							<span class="nav-link-title">
								Companies
							</span>
						</a>						
						<div class="dropdown-menu">
							<a class="dropdown-item" href="companies.php">
								<i class="ti ti-building-store"></i>
								Active Companies
								<?php
								include('count-active-companies.php');
								?>
								<span class="badge badge-sm bg-green-lt text-uppercase ms-auto"><?php echo $active_company_count; ?></span>
							</a>
							<a class="dropdown-item" href="blocked-companies.php">
								<i class="ti ti-users-group"></i>
								Blocked Companies
								<?php
								include('count-block-company.php');
								?>
								<span class="badge badge-sm bg-red-lt text-uppercase ms-auto"><?php echo $block_company_count; ?></span>
							</a>
							<a class="dropdown-item" href="#">
								<i class="ti ti-users-group"></i>
								Delete Accounts Requests
								<span class="badge badge-sm bg-green-lt text-uppercase ms-auto">0</span>
							</a>
						</div>
					</li>					
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#navbar-client" data-bs-toggle="dropdown" data-bs-auto-close="outside" role="button" aria-expanded="false">
							<span class="nav-link-icon d-md-none d-lg-inline-block">
								<i class="ti ti-user-shield"></i>
							</span>
							<span class="nav-link-title">
								Customers
							</span>
						</a>						
						<div class="dropdown-menu">						
							<a class="dropdown-item" href="customers.php">
								<i class="ti ti-users-group"></i>								
								Customers Accounts
								<?php
								include('count-customers.php');
								?>
								<span class="badge badge-sm bg-green-lt text-uppercase ms-auto"><?php echo $customer_count; ?></span>
							</a>
							<a class="dropdown-item" href="bookers.php">
								<i class="ti ti-users-group"></i>
								Bookers Accounts
								<?php
								include('count-bookers.php');
								?>
								<span class="badge badge-sm bg-green-lt text-uppercase ms-auto"><?php echo $booker_count; ?></span>
							</a>
							<a class="dropdown-item" href="#">
								<i class="ti ti-users-group"></i>
								Delete Accounts Requests
								<span class="badge badge-sm bg-green-lt text-uppercase ms-auto">0</span>
							</a>
						</div>
					</li>					
					<li class="nav-item dropdown">				
						<a class="nav-link dropdown-toggle" href="#navbar-driver" data-bs-toggle="dropdown" data-bs-auto-close="outside" role="button" aria-expanded="false">
							<span class="nav-link-icon d-md-none d-lg-inline-block">
								<i class="ti ti-user-pin"></i>
							</span>
							<span class="nav-link-title">
								Drivers
							</span>
						</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="new-drivers.php">
								<i class="ti ti-user-shield"></i>
								New Drivers
								<?php
								include('count-new-drivers.php');
								?>
								<span class="badge badge-sm bg-green-lt text-uppercase ms-auto"><?php echo $new_driver_count; ?></span>
							</a>
							<a class="dropdown-item" href="drivers.php">
								<i class="ti ti-steering-wheel"></i>
								Active Drivers
								<?php
								include('count-active-drivers.php');
								?>
								<span class="badge badge-sm bg-green-lt text-uppercase ms-auto"><?php echo $active_driver_count; ?></span>
							</a>
							<a class="dropdown-item" href="inactive-drivers.php">
								<i class="ti ti-car-off"></i>
								Inactive Drivers
								<?php
								include('count-inactive-drivers.php');
								?>
								<span class="badge badge-sm bg-green-lt text-uppercase ms-auto"><?php echo $inactive_driver_count; ?></span>
							</a>
							<a class="dropdown-item" href="driver-delete-request.php">
								<i class="ti ti-user-shield"></i>
								Delete Drivers Requests
								<span class="badge badge-sm bg-green-lt text-uppercase ms-auto">0</span>
							</a>
						</div>
					</li>					
					<li class="nav-item">
						<a class="nav-link" href="vehicles.php">
							<span class="nav-link-icon d-md-none d-lg-inline-block">
								<i class="ti ti-car-garage"></i>
							</span>
							<span class="nav-link-title">
								Vehicles
							</span>
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="pricing.php">
							<span class="nav-link-icon d-md-none d-lg-inline-block">
								<i class="ti ti-coin-pound"></i>
							</span>
							<span class="nav-link-title">
								Pricing
							</span>
						</a>
					</li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#navbar-help" data-bs-toggle="dropdown" data-bs-auto-close="outside" role="button" aria-expanded="false">
							<span class="nav-link-icon d-md-none d-lg-inline-block">
								<i class="ti ti-map-down"></i>
							</span>
							<span class="nav-link-title">
								Destinations
							</span>
						</a>
						<div class="dropdown-menu">						
							<a class="dropdown-item" href="zones.php">
								<i class="ti ti-map-pins"></i>
								Zones
								<?php
								include('count-zones.php');
								?>
								<span class="badge badge-sm bg-green-lt text-uppercase ms-auto"><?php echo $zone_count; ?></span>
							</a>							
							<a class="dropdown-item" href="airports.php">							
								<i class="ti ti-plane-tilt"></i>								
								Airports
								<?php
								include('count-airports.php');
								?>
								<span class="badge badge-sm bg-green-lt text-uppercase ms-auto"><?php echo $ap_count; ?></span>
							</a>							
							<a class="dropdown-item" href="destinations.php">							
								<i class="ti ti-map-2"></i>								
								Destinations
								<?php
								include('count-dest.php');
								?>
								<span class="badge badge-sm bg-green-lt text-uppercase ms-auto"><?php echo $des_count; ?></span>
							</a>							
							<a class="dropdown-item" href="railway_stations.php">							
								<i class="ti ti-train"></i>																
								Railway Stations
								<?php
								include('count-rs.php');
								?>
								<span class="badge badge-sm bg-green-lt text-uppercase ms-auto"><?php echo $rs_count; ?></span>
							</a>							
						</div>                    																
					</li>										
					<li class="nav-item dropdown">						
						<a class="nav-link dropdown-toggle" href="#navbar-report" data-bs-toggle="dropdown" data-bs-auto-close="outside" role="button" aria-expanded="false">						
							<span class="nav-link-icon d-md-none d-lg-inline-block">							
								<i class="ti ti-credit-card-pay"></i>								
							</span>                        																		
							<span class="nav-link-title">							
								Accounts
							</span>
						</a>						
						<div class="dropdown-menu">						
							<a class="dropdown-item" href="driver-reports.php">
								<i class="ti ti-report"></i>								
								Driver Account Statement 										
							</a>														
							<a class="dropdown-item" href="customer-report.php">							
								<i class="ti ti-report"></i>								
								Customer Account Statement								
							</a>
							<a class="dropdown-item" href="booker-report.php">
								<i class="ti ti-report"></i>								
								Booker Account Statement
							</a>
						</div>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="company.php">
							<span class="nav-link-icon d-md-none d-lg-inline-block">							
								<i class="ti ti-building-bank"></i>								
							</span>                        																		
							<span class="nav-link-title">							
								Company Profile
							</span>
						</a>						
					</li>					
					<li class="nav-item">
						<a class="nav-link" href="activity_log.php">
							<span class="nav-link-icon d-md-none d-lg-inline-block">
								<i class="ti ti-activity"></i>
							</span>
							<span class="nav-link-title">							
								Activity Logs								
							</span>                      																		
						</a>					
					</li>                    
					<li class="nav-item">                    
						<a class="nav-link" href="#">                        
							<?php														                            
							$current_time = date("Y-m-d H:i:s");                            
							?>                            
							<script>        								    
								var serverTime = "<?php echo $current_time; ?>";                                
							</script>							
							<span class="nav-link-icon d-md-none d-lg-inline-block">							
								<i class="ti ti-clock"></i>							
							</span>							
							<span class="nav-link-title" id="time">														
								Current Time:													
							</span>						
						</a>
						<div class="server-time"></div>                                                                  
						<script>            							  
							function formatTime(date) {        
								let hours = date.getHours().toString().padStart(2, '0');            
								let minutes = date.getMinutes().toString().padStart(2, '0');            
								let seconds = date.getSeconds().toString().padStart(2, '0');            
								return `${hours}:${minutes}:${seconds}`;        
							}        							        
							var serverTime = new Date("<?php echo $current_time; ?>");        							
							function updateTime() {            
								serverTime.setSeconds(serverTime.getSeconds() + 1);            
								document.getElementById('time').textContent = "Current Time: " + formatTime(serverTime);
							}        
							setInterval(updateTime, 1000);    
						</script>                        
					</li>				
				</ul>                												
			</div>									
		</div>      											
	</div>										
</header>