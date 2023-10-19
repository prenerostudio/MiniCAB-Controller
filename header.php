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
	
	.navigation { width: 100%;
				height: 110px;
	float: left;
	background:#F16A02 ;}
  </style>
		

	</head>  
	<body >
    		
		
		<div class="page">         		
		
			<header class="navbar-expand-md">  
				<nav class="navigation">
				<ul>
					<li><a href="">Home</a></li>
					
					
					
					
					</ul>
				
				
				
				</nav>
				
				
				
			
				<div class="collapse navbar-collapse" id="navbar-menu">          
					<div class="navbar">            
						<div class="container-xl">              
							<div class="row flex-fill align-items-center">                
								<div class="col">                  
									<ul class="navbar-nav">                    
										<li class="nav-item active">                      
											<a class="#" href="dashboard.php" >                        
												<!--<span class="nav-link-icon d-md-none d-lg-inline-block">
													<i class="fa fa-home" aria-hidden="true"></i>                        
												</span> -->  
												<img src="img/drivers/user-1.jpg" style="width: 50px;">
												           
													Home                        
												
											</a>                    
										</li>
                    
										<li class="nav-item">                      
											<a class="nav-link" href="booking.php">                        
												<span class="nav-link-icon d-md-none d-lg-inline-block">
													<i class="fa fa-book" aria-hidden="true"></i>                        
												</span>                        
												<span class="nav-link-title">                          
													Bookings                        
												</span>                      
											</a>                      
										</li>
                    
										<li class="nav-item">                      
											<a class="nav-link" href="clients.php" >                        
												<span class="nav-link-icon d-md-none d-lg-inline-block">
													<i class="fa fa-users" aria-hidden="true"></i>
												</span>                       
												<span class="nav-link-title">                         
													Clients                        
												</span>                     
											</a>                   
										</li>
										
										<li class="nav-item">                      
											<a class="nav-link" href="drivers.php" >                        
												<span class="nav-link-icon d-md-none d-lg-inline-block">
													<i class="fa fa-users" aria-hidden="true"></i>
												</span>                       
												<span class="nav-link-title">                         
													Drivers                        
												</span>                     
											</a>                   
										</li>
										
										<li class="nav-item">                      
											<a class="nav-link" href="driver-map.php" >                        
												<span class="nav-link-icon d-md-none d-lg-inline-block">
													<i class="fa fa-map" aria-hidden="true"></i>
												</span>                       
												<span class="nav-link-title">                         
													Drivers Map                       
												</span>                     
											</a>                   
										</li>
										
										<li class="nav-item">                      
											<a class="nav-link" href="#" >                        
												<span class="nav-link-icon d-md-none d-lg-inline-block">
													<i class="fa fa-car" aria-hidden="true"></i>
												</span>                       
												<span class="nav-link-title">                         
													Vehicles                       
												</span>                     
											</a>                   
										</li>
										
										<li class="nav-item">                      
											<a class="nav-link" href="#" >                        
												<span class="nav-link-icon d-md-none d-lg-inline-block">
													<i class="fa fa-money-o" aria-hidden="true"></i>
												</span>                       
												<span class="nav-link-title">                         
													Payments                      
												</span>                     
											</a>                   
										</li> 					
									</ul>              
								</div>             				
								<div class="col-2 d-none d-xxl-block">              								
									<div class="my-2 my-md-0 flex-grow-1 flex-md-grow-0 order-first order-md-last">
										<div class="nav-item d-none d-md-flex me-3">              
											<div class="btn-list">                
												<a href="logout.php" class="btn">
													<i class="fa fa-sign-out" aria-hidden="true"></i>                  
													Sign Out                
												</a>												              
											</div>            
										</div>					                    									
									</div>               								
								</div>             							
							</div>           						
						</div>          					
					</div>       				
				</div>     			
			</header>      		
			<div class="page-wrapper">        			     
				<div class="page-body">         