<?php
include('config.php');
?>
<!doctype html>
<html lang="en">  
	<head>    
		<meta charset="utf-8"/>    
		<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover"/>    
		<meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    
		<title>MiniCab Taxi Dispatch System</title>
    	
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
	.calendar-day {
  width: 100px;
  min-width: 100px;
  max-width: 100px;
  height: 80px;
}
.calendar-table {
  margin: 0 auto;
  width: 700px;
}
.selected {
  background-color: #eee;
}
.outside .date {
  color: #ccc;
}
.timetitle {
  white-space: nowrap;
  text-align: right;
}
.event {
  border-top: 1px solid #b2dba1;
  border-bottom: 1px solid #b2dba1;
  background-image: linear-gradient(to bottom, #dff0d8 0px, #c8e5bc 100%);
  background-repeat: repeat-x;
  color: #3c763d;
  border-width: 1px;
  font-size: .75em;
  padding: 0 .75em;
  line-height: 2em;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
  margin-bottom: 1px;
}
.event.begin {
  border-left: 1px solid #b2dba1;
  border-top-left-radius: 4px;
  border-bottom-left-radius: 4px;
}
.event.end {
  border-right: 1px solid #b2dba1;
  border-top-right-radius: 4px;
  border-bottom-right-radius: 4px;
}
.event.all-day {
  border-top: 1px solid #9acfea;
  border-bottom: 1px solid #9acfea;
  background-image: linear-gradient(to bottom, #d9edf7 0px, #b9def0 100%);
  background-repeat: repeat-x;
  color: #31708f;
  border-width: 1px;
}
.event.all-day.begin {
  border-left: 1px solid #9acfea;
  border-top-left-radius: 4px;
  border-bottom-left-radius: 4px;
}
.event.all-day.end {
  border-right: 1px solid #9acfea;
  border-top-right-radius: 4px;
  border-bottom-right-radius: 4px;
}
.event.clear {
  background: none;
  border: 1px solid transparent;
}
.table-tight > thead > tr > th,
.table-tight > tbody > tr > th,
.table-tight > tfoot > tr > th,
.table-tight > thead > tr > td,
.table-tight > tbody > tr > td,
.table-tight > tfoot > tr > td {
  padding-left: 0;
  padding-right: 0;
}
.table-tight-vert > thead > tr > th,
.table-tight-vert > tbody > tr > th,
.table-tight-vert > tfoot > tr > th,
.table-tight-vert > thead > tr > td,
.table-tight-vert > tbody > tr > td,
.table-tight-vert > tfoot > tr > td {
  padding-top: 0;
  padding-bottom: 0;
}

</style>
		

	</head>  
	<body >
    		
		
		<div class="page">         		
		
			<header class="navbar-expand-md">  
				
				    <nav class="navbar navbar-expand-lg navbar-light bg-light ">
       
            <!-- Add a brand/logo if needed -->
            <!--<a class="navbar-brand" href="#">Your Brand</a>-->
            
            <!-- Add a button to toggle the navigation items on smaller screens -->
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <!-- Create a div to hold your navigation items -->
            <div class="collapse navbar-collapse " id="navbarNav" style="background: #051650">
                <ul class="navbar-nav">
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
                        <a class="nav-link" href="#">
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
                        <a class="nav-link" href="#">
                            <img src="img/icons/affilliate.png" alt="" class="nav_icon">
							<br>Affiliate
                        </a>
                    </li>
					<li class="nav-item">
                        <a class="nav-link" href="#">
                            <img src="img/icons/zones.png" alt="" class="nav_icon">
							<br>Zones
                        </a>
                    </li>
					<li class="nav-item">
                        <a class="nav-link" href="#">
                            <img src="img/icons/airport.png" alt="" class="nav_icon">
							<br>Airports
                        </a>
                    </li>
					<li class="nav-item">
                        <a class="nav-link" href="#">
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
					<li class="nav-item">
                        <a class="nav-link" href="calender.php">
                            <img src="img/icons/calendar.png" alt="" class="nav_icon">
							<br>Calender
                        </a>
                    </li>
					<!--<li class="nav-item">
                        <a class="nav-link" href="#">
                            <img src="img/icons/frontend.png" alt="" class="nav_icon">
							<br>Frontend
                        </a>
                    </li>-->
					<li class="nav-item">
                        <a class="nav-link" href="#">
                            <img src="img/icons/payment.png" alt="" class="nav_icon">
							<br>Payments
                        </a>
                    </li>
					<li class="nav-item">
                        <a class="nav-link" href="#">
                            <img src="img/icons/statistics.png" alt="" class="nav_icon">
							<br>Statistics
                        </a>
                    </li>
					<li class="nav-item">
                        <a class="nav-link" href="#">
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