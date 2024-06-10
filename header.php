<?php

include('config.php');
include('session.php');
?>
<!doctype html>
<html lang="en">  
	<head>    	
		<meta charset="utf-8"/>    		
		<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover"/>    		
		<meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    		
		<title>Dashboard - MiniCAB Taxi Booking Service.</title>		
		
		<link rel="icon" href="img/car-icon.png" type="image/x-icon"/>    		
		<link rel="shortcut icon" href="img/car-icon.png" type="image/x-icon"/>    		
		<!-- CSS files -->    		
		<link href="css/tabler.min.css" rel="stylesheet"/>    		
		<link href="css/tabler-flags.min.css" rel="stylesheet"/>    		
		<link href="css/tabler-payments.min.css" rel="stylesheet"/>    		
		<link href="css/tabler-vendors.min.css" rel="stylesheet"/>    		
		<link href="css/demo.min.css" rel="stylesheet"/>		 		
		<link href="css/style.css" rel="stylesheet"/>		
		
	
		<link href="vendor/datatables.net-bs5/css/dataTables.bootstrap5.min.css" rel="stylesheet" type="text/css" />
		<link href="vendor/datatables.net-responsive-bs5/css/responsive.bootstrap5.min.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@tabler/icons-webfont@latest/tabler-icons.min.css" />
		<!-- Include jQuery -->
		<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
		<link href="vendor/datatables.net-buttons-bs5/css/buttons.bootstrap5.min.css" rel="stylesheet" type="text/css" />


		<link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css" />				
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@tabler/icons-webfont@latest/tabler-icons.min.css" />		
	
												
		
		
		<script>			
			document.addEventListener("DOMContentLoaded", function() {    			
				const addStopButton = document.getElementById('add-stop-btn');        
				const stopsContainer = document.getElementById('stops-container');        
				let stopCount = 0;    
				addStopButton.addEventListener('click', function() {        
					stopCount++;        
					const newStopInput = document.createElement('input');        
					newStopInput.type = 'text';        
					newStopInput.className = 'form-control mb-3 col-lg-3 stop-autocomplete';        
					newStopInput.placeholder = 'Enter stop location';        
					newStopInput.name = 'stop_' + stopCount;         
					newStopInput.id = 'stop_' + stopCount;         
					stopsContainer.appendChild(newStopInput);        
					const autocompleteOptions = {            
						types: ['geocode'],            
						componentRestrictions: {country: 'GB'}        
					};        
					new google.maps.places.Autocomplete(newStopInput, autocompleteOptions);    
				});
			});										
		</script>					  		
	</head>  		
	<body>			
		<script src="js/demo-theme.min.js"></script> 								
		<div class="page">				
			<div class="sticky-top">      											
				<header class="navbar navbar-expand-md d-print-none" >        					
					<div class="container-xl">          					
						<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbar-menu" aria-controls="navbar-menu" aria-expanded="false" aria-label="Toggle navigation">
							<span class="navbar-toggler-icon"></span>         						
						</button>        						
						<h1 class="navbar-brand navbar-brand-autodark d-none-navbar-horizontal pe-0 pe-md-3">
							<a href="dashboard.php">            								
								<img src="img/logo.png" width="110" height="32" alt="MiniCAB" class="navbar-brand-image">
							</a>         						
						</h1>          						
						<div class="navbar-nav flex-row order-md-last">         						
							<div class="nav-item d-none d-md-flex me-3">         							
								<div class="btn-list">								
									<a href="new-drivers.php" class="btn btn-indigo">
										<i class="ti ti-users-group"></i>            										
										New Drivers         									
									</a>									
									<a href="fare-corrections.php" class="btn btn-danger">
										<i class="ti ti-receipt-pound"></i>            										
										Fare Corrections          									
									</a> 									
									<a href="upcoming-bookings.php" class="btn btn-instagram">
										<i class="ti ti-alarm-plus"></i>            										
										Upcoming Jobs          									
									</a> 
									<a href="driver-tracker.php" class="btn btn-cyan">
										<i class="ti ti-user-search"></i>            										
										Driver Tracker          									
									</a>              									
									<a href="add-booking.php" class="btn btn-indigo">
										<i class="ti ti-bookmark-plus"></i>
										Create New Booking              									
									</a>              								
								</div>            							
							</div>           
							<div class="d-none d-md-flex">              							
								<a href="dashboard.php?theme=dark" class="nav-link px-0 hide-theme-dark" title="Enable dark mode" data-bs-toggle="tooltip" data-bs-placement="bottom">
									<i class="ti ti-moon"></i>            								
								</a>            								
								<a href="dashboard.php?theme=light" class="nav-link px-0 hide-theme-light" title="Enable light mode" data-bs-toggle="tooltip" data-bs-placement="bottom">									
									<i class="ti ti-sun"></i>            								
								</a>								          							
							</div>           														
							<div class="nav-item dropdown">
								<a href="#" class="nav-link d-flex lh-1 text-reset p-0" data-bs-toggle="dropdown" aria-label="Open user menu">                								
									<span class="avatar avatar-sm" style="background-image: url(img/users/<?php echo $user_pic;?>)"></span>               									
									<div class="d-none d-xl-block ps-2">                									
										<div><?php echo $_SESSION['first_name'].' '.$_SESSION['last_name']; ?></div>
										<div class="mt-1 small text-secondary"><?php echo $designation;?></div>
									</div>             								
								</a>             								
								<div class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
									<a href="all-users.php" class="dropdown-item">All Users</a>
									<a href="#" class="dropdown-item">Add New User</a>
									<div class="dropdown-divider"></div>                									
									<a href="profile-setting.php" class="dropdown-item">Settings</a>
									<a href="logout.php" class="dropdown-item">Logout</a>
								</div>            							
							</div>          						
						</div>        					
					</div>      				
				</header>																				
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
												Bookings Section												
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
											</a>											
											<a class="dropdown-item" href="upcoming-bookings.php">
												<i class="ti ti-alarm-plus"></i>
												Upcoming Bookings												
											</a>                        													
											<a class="dropdown-item" href="inprocess-bookings.php">
												<i class="ti ti-address-book"></i>
												Booking InProcess												
											</a>                        											
											<a class="dropdown-item" href="completed-booking.php">
												<i class="ti ti-bookmarks-filled"></i>
												Completed Bookings
											</a>											
											<a class="dropdown-item" href="cancelled-booking.php">
												<i class="ti ti-bookmarks-off"></i>
												Cancelled Bookings
											</a> 											
										</div>                    										
									</li>					
									<li class="nav-item dropdown">									
										<a class="nav-link dropdown-toggle" href="#navbar-booking" data-bs-toggle="dropdown" data-bs-auto-close="outside" role="button" aria-expanded="false">
											<span class="nav-link-icon d-md-none d-lg-inline-block">
												<i class="ti ti-gavel"></i>
											</span>											
											<span class="nav-link-title">											
												Bids Section
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
												Customers Section												
											</span>                      											
										</a>					
										<div class="dropdown-menu">
											<a class="dropdown-item" href="customers.php">
												<i class="ti ti-users-group"></i>
												Customers Accounts												
											</a>                        											
											<a class="dropdown-item" href="bookers.php">
												<i class="ti ti-users-group"></i>
												Bookers Accounts												
											</a>
											<a class="dropdown-item" href="#">
												<i class="ti ti-users-group"></i>
												Delete Accounts Requests
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
												New Comer Drivers
											</a>                      											
											<a class="dropdown-item" href="drivers.php">
												<i class="ti ti-steering-wheel"></i>
												Active Drivers
											</a>									
											<a class="dropdown-item" href="inactive-drivers.php">
												<i class="ti ti-car-off"></i>
												Inactive Drivers
											</a>											
											<a class="dropdown-item" href="driver-tracker.php">
												<i class="ti ti-user-search"></i>
												Driver Tracker
											</a>
											<a class="dropdown-item" href="fare-corrections.php">
												<i class="ti ti-credit-card-refund"></i>
												Fare Corrections
											</a>											
											<a class="dropdown-item" href="#">											
												<i class="ti ti-receipt"></i>												
												Reviews                        												
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
											</a>                        											
											<a class="dropdown-item" href="airports.php">
												<i class="ti ti-plane-tilt"></i>
												Airports												
											</a>                        											
											<a class="dropdown-item" href="destinations.php">
												<i class="ti ti-map-2"></i>												
												Destinations												
											</a>
											<a class="dropdown-item" href="railway_stations.php">
												<i class="ti ti-train"></i>												
												Railway Stations												
											</a>
										</div>                    										
									</li>					
									<li class="nav-item dropdown">                      									
										<a class="nav-link dropdown-toggle" href="#navbar-report" data-bs-toggle="dropdown" data-bs-auto-close="outside" role="button" aria-expanded="false">
											<span class="nav-link-icon d-md-none d-lg-inline-block">
												<i class="ti ti-credit-card-pay"></i>
											</span>                        											
											<span class="nav-link-title">
												Reports                       												
											</span>                      											
										</a>                      										
										<div class="dropdown-menu">
											<a class="dropdown-item" href="driver-reports.php">											
												<i class="ti ti-report"></i>												
												Driver Reports												
											</a>                        											
											<a class="dropdown-item" href="customer-report.php">											
												<i class="ti ti-report"></i>
												Customer Reports												
											</a>                        											
											<a class="dropdown-item" href="booker-report.php">											
												<i class="ti ti-report"></i>												
												Booker Reports	
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
			</div>							
			<div class="page-wrapper">