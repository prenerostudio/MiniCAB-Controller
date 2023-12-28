<?php
session_start(); 
include('config.php');
ini_set("display_errors","off");
$myId = $_SESSION['user_id'];
	
if (!isset($_SESSION['email'])) {	
	$_SESSION['first_name'] = $fname;
	$_SESSION['last_name'] = $lname;
	$_SESSION['msg'] = "You must log in first";
	header('location: index.php');
}
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
	
		<link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css" />		
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@tabler/icons-webfont@latest/tabler-icons.min.css" />
		
		
	</head>  
	<body>
		<script src="js/demo-theme.min.js"></script>    		
		<div class="page">		
			<div class="sticky-top">      
				<!-- Navbar -->      
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
									<a href="upcoming-jobs.php" class="btn btn-instagram">           
										<i class="ti ti-user-search"></i>            
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
								<a href="dashboard.php?theme=dark" class="nav-link px-0 hide-theme-dark" title="Enable dark mode" data-bs-toggle="tooltip"
		   data-bs-placement="bottom">               
									<i class="ti ti-moon"></i>            
								</a>            
								<a href="dashboard.php?theme=light" class="nav-link px-0 hide-theme-light" title="Enable light mode" data-bs-toggle="tooltip"
		   data-bs-placement="bottom">               
									<i class="ti ti-sun"></i>            
								</a>             
								<div class="nav-item dropdown d-none d-md-flex me-3">              
									<a href="#" class="nav-link px-0" data-bs-toggle="dropdown" tabindex="-1" aria-label="Show notifications">                                  
										<i class="ti ti-bell"></i>                 
										<span class="badge bg-red"></span>               
									</a>              
									<div class="dropdown-menu dropdown-menu-arrow dropdown-menu-end dropdown-menu-card">              
										<div class="card">              
											<div class="card-header">               
												<h3 class="card-title">Last updates</h3>              
											</div>                   
											<div class="list-group list-group-flush list-group-hoverable">
												<div class="list-group-item">                        
													<div class="row align-items-center">
														<div class="col-auto">
															<span class="status-dot status-dot-animated bg-red d-block"></span>
														</div>                         
														<div class="col text-truncate">
															<a href="#" class="text-body d-block">Example 1</a>                          
															<div class="d-block text-secondary text-truncate mt-n1">                              
																Change deprecated html tags to text decoration classes (#29604)
															</div>                          
														</div>                          
														<div class="col-auto">                            
															<a href="#" class="list-group-item-actions">
																<i class="ti ti-star"></i>
															</a>                         
														</div>                       
													</div>                      
												</div>
                                                                                      
											</div>                 
										</div>               
									</div>              
								</div>          
							</div>
           							
							<div class="nav-item dropdown">             								
								<a href="#" class="nav-link d-flex lh-1 text-reset p-0" data-bs-toggle="dropdown" aria-label="Open user menu">                
									<span class="avatar avatar-sm" style="background-image: url(static/avatars/000m.jpg)"></span>               
									<div class="d-none d-xl-block ps-2">                
										<div><?php echo $_SESSION['first_name'].' '.$_SESSION['last_name']; ?></div>
										<div class="mt-1 small text-secondary">UI Designer</div>               
									</div>             
								</a>             
								<div class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">                
									<a href="#" class="dropdown-item">Status</a>                
									<a href="#" class="dropdown-item">Profile</a>                
									<a href="#" class="dropdown-item">Feedback</a>                
									<div class="dropdown-divider"></div>                
									<a href="#" class="dropdown-item">Settings</a>                
									<a href="#" class="dropdown-item">Logout</a>              
								</div>            
							</div>          
						</div>        
					</div>      
				</header>												
				
				<header class="navbar-expand-md">        
					<div class="collapse navbar-collapse" id="navbar-menu">          
						<div class="navbar">
							<div class="container-xl">
								<div class="row flex-fill align-items-center">                
									<div class="col">                  
										<ul class="navbar-nav">                    
											<!--<li class="nav-item">                      
												<a class="nav-link" href="#" >                        
													<span class="nav-link-icon d-md-none d-lg-inline-block">
														<i class="ti ti-library-plus"></i>                        
													</span>                        
													<span class="nav-link-title">                         
														Add Booking                        
													</span>                      
												</a>                    
											</li>	-->				  
											<li class="nav-item">                      
												<a class="nav-link" href="dashboard.php" >                        
													<span class="nav-link-icon d-md-none d-lg-inline-block">
														<i class="ti ti-home"></i>                        
													</span>                        
													<span class="nav-link-title">                          
														Dashboard                        
													</span>                      
												</a>                    
											</li>											                    											                   
											<li class="nav-item">                      
												<a class="nav-link" href="company.php">                        
													<span class="nav-link-icon d-md-none d-lg-inline-block">
														<i class="ti ti-building-bank"></i>                      
													</span>                        
													<span class="nav-link-title">                          
														Company                        
													</span>                      
												</a>                    
											</li>
																						
											<li class="nav-item dropdown">                      
												<a class="nav-link dropdown-toggle" href="#navbar-booking" data-bs-toggle="dropdown" data-bs-auto-close="outside" role="button" aria-expanded="false" >                       
													<span class="nav-link-icon d-md-none d-lg-inline-block">
														<i class="ti ti-bookmarks"></i>                       
													</span>                      
													<span class="nav-link-title">                        
														Bookings Section                        
													</span>                      
												</a>
                      
												<div class="dropdown-menu">                        
													<a class="dropdown-item" href="all-bookings.php"> 
														<i class="ti ti-bookmarks" style="margin-right: 10px;"></i>
														All Bookings                        
													</a>                        
													<a class="dropdown-item" href="bid-bookings.php">
														<i class="ti ti-bookmarks" style="margin-right: 10px;"></i>
														Bid Bookings                        
													</a>                        
													<a class="dropdown-item" href="drivers-bid.php">
														<i class="ti ti-bookmarks" style="margin-right: 10px;"></i> 
														Bids From Drivers                        
													</a>                        
													<a class="dropdown-item text-pink" href="job-history.php">                         
														<i class="ti ti-bookmarks" style="margin-right: 10px;"></i>                        
														Job History                        
													</a>                      
												</div>                    
											</li>			                    																	
											<li class="nav-item dropdown">                      
												<a class="nav-link dropdown-toggle" href="#navbar-client" data-bs-toggle="dropdown" data-bs-auto-close="outside" role="button" aria-expanded="false" >                        
													<span class="nav-link-icon d-md-none d-lg-inline-block">
														<i class="ti ti-user-shield"></i>                       
													</span>                        
													<span class="nav-link-title">                         
														Clients Section                        
													</span>                      
												</a>
                      
												<div class="dropdown-menu">                        
													<a class="dropdown-item" href="customers.php"> 
														<i class="ti ti-users-group" style="margin-right: 10px;"></i>
														Customers                        
													</a>                        
													<a class="dropdown-item" href="bookers.php">
														<i class="ti ti-users-group" style="margin-right: 10px;"></i>
														Bookers                        
													</a>
													<a class="dropdown-item text-pink" href="#">
														<i class="ti ti-building" style="margin-right: 10px;"></i>
														Company Accounts                        
													</a>                      
												</div>                    
											</li>																

											<li class="nav-item dropdown">                      
												<a class="nav-link dropdown-toggle" href="#navbar-driver" data-bs-toggle="dropdown" data-bs-auto-close="outside" role="button" aria-expanded="false" >                        
													<span class="nav-link-icon d-md-none d-lg-inline-block">
														<i class="ti ti-user-pin"></i>                       
													</span>                      
													<span class="nav-link-title">                       
														Drivers                       
													</span>                     
												</a>                     
												<div class="dropdown-menu">                        
													<a class="dropdown-item" href="drivers.php">
														<i class="ti ti-steering-wheel" style="margin-right: 10px;"></i>
														Active Drivers                        
													</a>                        
													<a class="dropdown-item" href="new-drivers.php">
														<i class="ti ti-user-shield" style="margin-right: 10px;"></i>
														New Comer Drivers                        
													</a>
                        
													<a class="dropdown-item" href="inactive-drivers.php">
														<i class="ti ti-car-off" style="margin-right: 10px;"></i>
														Inactive Driver                        
													</a>                        
													<a class="dropdown-item text-pink" href="driver-tracker.php">                         
														<i class="ti ti-user-search" style="margin-right: 10px;"></i>
														Driver Tracker                        
													</a>													
													<a class="dropdown-item text-pink" href="fare-corrections.php">                         
														<i class="ti ti-credit-card-refund" style="margin-right: 10px;"></i>
														Fare Corrections                        
													</a>						  						  
													<a class="dropdown-item text-pink" href="#">                         
														<i class="ti ti-receipt" style="margin-right: 10px;"></i>
														Reviews                        
													</a>                      
												</div>                    
											</li>
																					
											<li class="nav-item">                      
												<a class="nav-link" href="vehicles.php" >                        
													<span class="nav-link-icon d-md-none d-lg-inline-block">
														<i class="ti ti-car-garage"></i>                        
													</span>                        
													<span class="nav-link-title">                          
														Vehicles                        
													</span>                      
												</a>                    
											</li>
																						
											<li class="nav-item">                      
												<a class="nav-link" href="pricing.php" >                        
													<span class="nav-link-icon d-md-none d-lg-inline-block">
														<i class="ti ti-coin-pound"></i>                        
													</span>                        
													<span class="nav-link-title">                         
														Pricing                        
													</span>                      
												</a>                    
											</li>											

											<li class="nav-item dropdown">                      
												<a class="nav-link dropdown-toggle" href="#navbar-help" data-bs-toggle="dropdown" data-bs-auto-close="outside" role="button" aria-expanded="false" >                        
													<span class="nav-link-icon d-md-none d-lg-inline-block">
														<i class="ti ti-map-down"></i>                        
													</span>                        
													<span class="nav-link-title">                         
														Destinations                        
													</span>                      
												</a>                      
												<div class="dropdown-menu">                        
													<a class="dropdown-item" href="zones.php">
														<i class="ti ti-map-pins" style="margin-right: 10px;"></i>
														Zones                        
													</a>                        
													<a class="dropdown-item" href="airports.php">
														<i class="ti ti-plane-tilt" style="margin-right: 10px;"></i>
														Airports                        
													</a>                        
													<a class="dropdown-item" href="destinations.php">
														<i class="ti ti-map-2" style="margin-right: 10px;"></i>
														Destinations                        
													</a>                                              
												</div>                    
											</li>				
											
											<li class="nav-item">                      
												<a class="nav-link" href="#" >                        
													<span class="nav-link-icon d-md-none d-lg-inline-block">
														<i class="ti ti-credit-card-pay"></i>                        
													</span>                        
													<span class="nav-link-title">                          
														Payments                        
													</span>                      
												</a>                    
											</li>                                   
										
										</ul>                
								</div>								              
							</div>						
							</div>      					
						</div>      				
					</div>					
				</header>			
			</div>				
			<div class="page-wrapper">