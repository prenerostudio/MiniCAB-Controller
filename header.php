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
    
		<title>MiniCab - Taxi Dispatch System</title>
    	
		<meta name="msapplication-TileColor" content="#0054a6"/>    
		<meta name="theme-color" content="#0054a6"/>    
		<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent"/>    
		<meta name="apple-mobile-web-app-capable" content="yes"/>    
		<meta name="mobile-web-app-capable" content="yes"/>    
		<meta name="HandheldFriendly" content="True"/>    
		<meta name="MobileOptimized" content="320"/>    	
	
		
		<link rel="icon" href="img/icon.png" type="image/x-icon"/>    
		
		<link rel="shortcut icon" href="img/icon.png" type="image/x-icon"/>
   	
		<!-- CSS files -->    
		
		<link href="css/tabler.min.css" rel="stylesheet"/>    		
		<link href="css/tabler-flags.min.css" rel="stylesheet"/>    		
		<link href="css/tabler-payments.min.css" rel="stylesheet"/>    		
		<link href="css/tabler-vendors.min.css" rel="stylesheet"/>    		
		<link href="css/demo.min.css" rel="stylesheet"/>				
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css">  
		<link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css" />								
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>              		 
		<script src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>           
		<script src="https://cdn.datatables.net/1.10.12/js/dataTables.bootstrap.min.js"></script>                     
		<link rel="stylesheet" href="https://cdn.datatables.net/1.10.12/css/dataTables.bootstrap.min.css" />  
		
		
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@tabler/icons-webfont@latest/tabler-icons.min.css" />

		<style>   
			#map {    
				height: 100%;  
			}	
			#mapd {    
				height: 500px; 
			}		
			/* Center icon and text vertically */     
			.nav-link {         
				display: flex;        
				flex-direction: column;         
				align-items: center;         
				text-align: center;		
				color: white;			      
			}		
			.nav-link:hover{		
				color: #F16A02;	
			}	
			.nav_icon { 				
				width: 50px;
				
			}
			.paginate_button {
  display: inline-block;
}

.paginate_button a {
  color: black;
  float: left;
  padding: 8px 16px;
  text-decoration: none;
  transition: background-color .3s;
  border: 1px solid #ddd;
  margin: 0 4px;
}
			.pagination_button a:active {
  background-color: #4CAF50;
  color: white;
  border: 1px solid #4CAF50;
}
		</style>	
		 <script>
        function printInvoice() {
            window.print();
        }
    </script>
	</head>  	
	<body >    					
		<div class="page">         						
			<header class="navbar-expand-md">  							
				<nav class="navbar navbar-expand-lg navbar-light bg-light ">                              
					<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">                
						<span class="navbar-toggler-icon"></span>            
					</button>                        
					<div class="collapse navbar-collapse " id="navbarNav" style="background: url('img/header_bg.jpg'); background-position: center; background-size: cover;">                
						<ul class="navbar-nav">							
							<li class="nav-item">                        
								<a class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#modal-booking">							
									<img src="img/icons/plus.png"  alt="" class="nav_icon">                            
									<br><strong>Add Booking</strong>                        
								</a>                    
							</li>                    
							<li class="nav-item">                        
								<a class="nav-link" href="dashboard.php">							
									<img src="img/icons/home.png"  alt="" class="nav_icon">                            
									<br><strong>Dashboard</strong>                        
								</a>                    
							</li>                    
							<li class="nav-item">                        
								<a class="nav-link" href="booking.php">                           
									<img src="img/icons/booking.png" alt="" class="nav_icon">							
									<br><strong>Bookings</strong>                        
								</a>                    
							</li>                    
							<li class="nav-item">                        
								<a class="nav-link" href="company.php">                            
									<img src="img/icons/company.png" alt="" class="nav_icon">							
									<br><strong>Company</strong>                        
								</a>                    
							</li>					
							<li class="nav-item">                        
								<a class="nav-link" href="bids.php">                            
									<img src="img/icons/reservation.png" alt="" class="nav_icon">							
									<br><strong>Bids</strong>                        
								</a>                    
							</li>					
							<li class="nav-item">                        
								<a class="nav-link" href="clients.php">                            
									<img src="img/icons/client.png" alt="" class="nav_icon">							
									<br><strong>Clients</strong>                        
								</a>                    
							</li>					
							<li class="nav-item">                        
								<a class="nav-link" href="drivers.php">                            
									<img src="img/icons/drivers.png" alt="" class="nav_icon">							
									<br><strong>Drivers</strong>                        
								</a>                    
							</li>					
							<li class="nav-item">                        
								<a class="nav-link" href="driver-map.php">                            
									<img src="img/icons/map.png" alt="" class="nav_icon">							
									<br><strong>Driver Map</strong>                        
								</a>                    
							</li>					
							<li class="nav-item">                        
								<a class="nav-link" href="vehicle.php">                            
									<img src="img/icons/vehicles.png" alt="" class="nav_icon">							
									<br><strong>Vehicles</strong>                        
								</a>                    
							</li>

													
							<li class="nav-item">                       
								<a class="nav-link" href="pricing.php">                           
									<img src="img/icons/affilliate.png" alt="" class="nav_icon">							
									<br>Pricing                       
								</a>                   
							</li>
					
							<li class="nav-item">                        
								<a class="nav-link" href="zones.php">                            
									<img src="img/icons/zones.png" alt="" class="nav_icon">							
									<br>Zones                        
								</a>                    
							</li>					
							<li class="nav-item">                        
								<a class="nav-link" href="airports.php">                            
									<img src="img/icons/airport.png" alt="" class="nav_icon">							
									<br>Airports                        
								</a>                    
							</li>					
							<li class="nav-item">                        
								<a class="nav-link" href="destinations.php">                            
									<img src="img/icons/destinations.png" alt="" class="nav_icon">							
									<br>Destinations                        
								</a>                    
							</li>

							
					<!--<li class="nav-item">
                        <a class="nav-link" href="#">
                            <img src="img/icons/special-dates.png" alt="" class="nav_icon">
							<br>Special Dates
                        </a>
                    </li>-->
					<!--<li class="nav-item">
                        <a class="nav-link" href="#">
                            <img src="img/icons/promotions.png" alt="" class="nav_icon">
							<br>Promotions
                        </a>
                    </li>-->
					<!--<li class="nav-item">
                        <a class="nav-link" href="#">
                            <img src="img/icons/coupons.png" alt="" class="nav_icon">
							<br>Coupons
                        </a>
                    </li>-->
					
							<!--<li class="nav-item">                        
								<a class="nav-link" href="calender.php">                            
									<img src="img/icons/calendar.png" alt="" class="nav_icon">							
									<br>Calender                        
								</a>                    
							</li>-->
					<!--<li class="nav-item">
                        <a class="nav-link" href="#">
                            <img src="img/icons/frontend.png" alt="" class="nav_icon">
							<br>Frontend
                        </a>
                    </li>-->
					
							<li class="nav-item">
                     
								<a class="nav-link" href="payments.php">
                       
									<img src="img/icons/payment.png" alt="" class="nav_icon">
						
									<br>Payments
                       
								</a>
                  
							</li>
					
							<!--<li class="nav-item">
                      
								<a class="nav-link" href="#">
                         
									<img src="img/icons/statistics.png" alt="" class="nav_icon">
							
									<br>Statistics
                       
								</a>
                  
							</li>-->
					
							<li class="nav-item">
                        
								<a class="nav-link" href="reviews.php">
                            
									<img src="img/icons/reviews.png" alt="" class="nav_icon">
							
									<br>Reviews
                        
								</a>
                    
							</li>
					
							<li class="nav-item">
                        
								<a class="nav-link" href="logout.php">
                            
									<img src="img/icons/logout.png" alt="" class="nav_icon">
							
									<br>Logout
                        
								</a>
                    
							</li>
					

						</ul>
            
					</div>
        

				</nav>

				
			
				     			
		
			</header>      		
		
			<div class="page-wrapper">        			     
				
				<div class="page-body">         