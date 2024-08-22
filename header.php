<?php
include('session.php');
include('config.php');

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
					<div class="container">          					
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
									<a href="new-driver-web.php" class="btn btn-github position-relative">            
										<i class="ti ti-users-group"></i>            
										Drivers From WEB            
										<span class="badge bg-orange text-orange-fg badge-notification badge-pill">0</span>
									</a>       
									<a href="new-drivers.php" class="btn btn-indigo position-relative">            
										<i class="ti ti-users-group"></i>            
										New Drivers            
										<span class="badge bg-orange text-orange-fg badge-notification badge-pill">   
											0             
										</span>        
									</a>        
									<a href="fare-corrections.php" class="btn btn-danger position-relative">            
										<i class="ti ti-receipt-pound"></i>            
										Fare Corrections
										<span class="badge bg-orange text-orange-fg badge-notification badge-pill">
											0
										</span>        
									</a>        									        
									<a href="driver-tracker.php" class="btn btn-cyan">            
										<i class="ti ti-user-search"></i>            
										Driver Tracker        
									</a>
									<a href="add-booking.php" class="btn btn-indigo">            
										<i class="ti ti-bookmark-plus"></i>            
										New Booking        
									</a>   
									 <div class="server-time">
										 <?php

$current_time = date("Y-m-d H:i:s");
?>
<script>
    // Pass the server time to JavaScript
    var serverTime = "<?php echo $current_time; ?>";
</script>
        <p id="time">Current Server Time: </p>
    </div>
    <script>
        // Function to format time
        function formatTime(date) {
            let hours = date.getHours().toString().padStart(2, '0');
            let minutes = date.getMinutes().toString().padStart(2, '0');
            let seconds = date.getSeconds().toString().padStart(2, '0');
            return `${hours}:${minutes}:${seconds}`;
        }

        // Initialize with server time
        var serverTime = new Date("<?php echo $current_time; ?>");

        // Update the time every second
        function updateTime() {
            serverTime.setSeconds(serverTime.getSeconds() + 1);
            document.getElementById('time').textContent = "Current Server Time: " + formatTime(serverTime);
        }

        setInterval(updateTime, 1000); // Update time every second
    </script>
								</div>								    
								<script>    
									document.addEventListener("DOMContentLoaded", function() {
										fetch('new-drivers-count.php')            
											.then(response => response.json())            
											.then(data => {
											document.querySelector('.btn-indigo .badge').textContent = data.newDriversCount;
										})            
											.catch(error => console.error('Error fetching new drivers count:', error));    
									});									
									document.addEventListener("DOMContentLoaded", function() {
										fetch('web-driver-count.php')            
											.then(response => response.json())            
											.then(data => {
											document.querySelector('.btn-github .badge').textContent = data.webDriversCount;
										})            
											.catch(error => console.error('Error fetching new drivers count:', error));    
									});									
									document.addEventListener("DOMContentLoaded", function() {
										fetch('fare-count.php')            
											.then(response => response.json())            
											.then(data => {
											document.querySelector('.btn-danger .badge').textContent = data.faresCount;
										})            
											.catch(error => console.error('Error fetching new drivers count:', error));    
									});    
								</script>         														
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
									<a href="profile-setting.php" class="dropdown-item">Settings</a>
									<a href="logout.php" class="dropdown-item">Logout</a>
								</div>            							
							</div>          						
						</div>        					
					</div>   		
				</header>																		
				<?php
				include('navbar.php');
				?>				
			</div>							
			<div class="page-wrapper">