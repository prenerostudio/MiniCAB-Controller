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
								 <span class="badge badge-sm bg-green-lt text-uppercase ms-auto">0</span>
							</a>
							<a class="dropdown-item" href="upcoming-bookings.php">
								<i class="ti ti-alarm-plus"></i>
								Upcoming Bookings
								 <span class="badge badge-sm bg-green-lt text-uppercase ms-auto">0</span>
							</a>
							<a class="dropdown-item" href="inprocess-bookings.php">
								<i class="ti ti-address-book"></i>
								Booking InProcess
								 <span class="badge badge-sm bg-green-lt text-uppercase ms-auto">0</span>
							</a>
							<a class="dropdown-item" href="completed-booking.php">
								<i class="ti ti-bookmarks-filled"></i>
								Completed Bookings
								 <span class="badge badge-sm bg-green-lt text-uppercase ms-auto">0</span>
							</a>
							<a class="dropdown-item" href="cancelled-booking.php">
								<i class="ti ti-bookmarks-off"></i>
								Cancelled Bookings
								 <span class="badge badge-sm bg-green-lt text-uppercase ms-auto">0</span>
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
								<i class="ti ti-user-shield"></i>
							</span>
							<span class="nav-link-title">
								Companies
							</span>
						</a>						
						<div class="dropdown-menu">
							<a class="dropdown-item" href="companies.php">
								<i class="ti ti-users-group"></i>
								Active Companies
								<span class="badge badge-sm bg-green-lt text-uppercase ms-auto">0</span>
							</a>
							<a class="dropdown-item" href="blocked-companies.php">
								<i class="ti ti-users-group"></i>
								Blocked Companies
								<span class="badge badge-sm bg-green-lt text-uppercase ms-auto">0</span>
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
								<span class="badge badge-sm bg-green-lt text-uppercase ms-auto">0</span>
							</a>
							<a class="dropdown-item" href="bookers.php">
								<i class="ti ti-users-group"></i>
								Bookers Accounts
								<span class="badge badge-sm bg-green-lt text-uppercase ms-auto">0</span>
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
								<span class="badge badge-sm bg-green-lt text-uppercase ms-auto">0</span>
							</a>
							<a class="dropdown-item" href="drivers.php">
								<i class="ti ti-steering-wheel"></i>
								Active Drivers
								<span class="badge badge-sm bg-green-lt text-uppercase ms-auto">0</span>
							</a>
							<a class="dropdown-item" href="inactive-drivers.php">
								<i class="ti ti-car-off"></i>
								Inactive Drivers
								<span class="badge badge-sm bg-green-lt text-uppercase ms-auto">0</span>
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
								<span class="badge badge-sm bg-green-lt text-uppercase ms-auto">0</span>
							</a>							
							<a class="dropdown-item" href="airports.php">							
								<i class="ti ti-plane-tilt"></i>								
								Airports
								<span class="badge badge-sm bg-green-lt text-uppercase ms-auto">0</span>
							</a>							
							<a class="dropdown-item" href="destinations.php">							
								<i class="ti ti-map-2"></i>								
								Destinations
								<span class="badge badge-sm bg-green-lt text-uppercase ms-auto">0</span>
							</a>							
							<a class="dropdown-item" href="railway_stations.php">							
								<i class="ti ti-train"></i>																
								Railway Stations
								<span class="badge badge-sm bg-green-lt text-uppercase ms-auto">0</span>
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
				</ul>                												
			</div>									
		</div>      											
	</div>										
</header>