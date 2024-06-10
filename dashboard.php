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
					<div class="ratio ratio-21x9">							
						<div>											
							<?php							
							$query = "SELECT `longitude`, `latitude` FROM `drivers`";				
							$result = mysqli_query($connect, $query);				
							if ($result) { 					
								$userLocations = array();						
								while ($row = mysqli_fetch_assoc($result)) {											
									$location = array(							
										'lat' => $row['latitude'],							
										'lng' => $row['longitude']																
									); 						
									$userLocations[] = $location;					
								}					
								mysqli_free_result($result);				
							} else {					
								echo "Error executing the query: " . mysqli_error($connect);
							}											
							?>										
							<div id="map"></div>							
							<script src="https://unpkg.com/leaflet/dist/leaflet.js"></script>
							<script>
								document.addEventListener('DOMContentLoaded', function () {								
									var map = L.map('map');       									
									L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {            
										attribution: 'Map data &copy; contributors',            
										maxZoom: 30        
									}).addTo(map);        									
									var carIcon = L.icon({										            
										iconUrl: 'img/car-icon.png',            
										iconSize: [80, 80],            
										iconAnchor: [30, 30],            
										popupAnchor: [0, -30]        
									});									        
									var firstLocation = <?php echo json_encode($userLocations[0]); ?>;        
									var initialLatLng = L.latLng(firstLocation.lat, firstLocation.lng);        
									map.setView(initialLatLng, 12);									        
									var userLocations = <?php echo json_encode($userLocations); ?>;        
									userLocations.forEach(function (user) {            
										var marker = L.marker([user.lat, user.lng], { icon: carIcon }).addTo(map);
										marker.bindPopup("Loading..."); 
										marker.on('click', function () {
											var driverId = user.d_id;                
											fetchDriverDetails(driverId)                    
												.then(function (driverDetails) {                
												marker.setPopupContent("Driver Details: " + driverDetails);                    
											})                    
												.catch(function (error) {                        
												console.error('Error fetching driver details:', error);                        
												marker.setPopupContent("Error fetching details");                    
											});            
										});        
									});									        									        
									function fetchDriverDetails(driverId) {            
										return new Promise(function (resolve, reject) {
											var endpoint = 'your-backend-endpoint.php?driverId=' + driverId;
											fetch(endpoint)                    												
												.then(function (response) {                        
												if (!response.ok) {                            
													throw new Error('Network response was not ok');                        
												}                        
												return response.text();                    
											})                    
												.then(function (data) {                        
												resolve(data);                    
											})                    
												.catch(function (error) {                        
												reject(error);                    											
											});            
										});        
									}    
								});
							</script>
						</div>					
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
									$drsql=mysqli_query($connect,"SELECT * FROM `drivers` WHERE `status`='pob'");
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
											<span class="badge bg-success me-1"></span> <?php echo $drrow['status']; ?>
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
							setInterval(loadDriverListPOB, 5000); 						
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
										<?php echo $x ?>                
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
						setInterval(loadDriverList, 5000); 					
					</script>              					
				</div>					                								
			</div>              						
		</div>               			
		<div class="col-12">            					
			<div class="card">
				<div class="card-header">
					<h3 class="card-title">Today's Jobs	</h3>
				</div>
				<div class="card-body border-bottom py-3">
					<table class="table" id="table-job">													
						<thead>								
							<tr>          								
								<th>ID</th>            					
								<th>Date</th>                
								<th>Time</th>                
								<th>Passenger</th>                
								<th>Pickup</th>								
								<th>Stops</th>                
								<th>Dropoff</th>                
								<th>Fare</th>                
								<th>Vehicle</th>                
								<th>Status</th>                
								<th>Driver</th>            
							</tr>        
						</thead>        
						<tbody>            
							<?php            
							$y = 0;            
							$jobsql = mysqli_query($connect, "SELECT jobs.*, clients.c_name, clients.c_email, clients.c_phone, bookings.*, drivers.*, booking_type.*, vehicles.* FROM jobs JOIN clients ON jobs.c_id = clients.c_id JOIN bookings ON jobs.book_id = bookings.book_id JOIN drivers ON jobs.d_id = drivers.d_id JOIN booking_type ON bookings.b_type_id = booking_type.b_type_id JOIN vehicles ON bookings.v_id = vehicles.v_id WHERE jobs.job_status <> 'completed' ORDER BY jobs.job_id DESC");            
							while($jobrow = mysqli_fetch_array($jobsql)){                
								$y++;            
							?>            
							<tr>                
								<td><?php echo $jobrow['book_id']; ?></td>                
								<td><?php echo $jobrow['pick_date'];?></td>                
								<td><?php echo $jobrow['pick_time'];?></td>                
								<td><?php echo $jobrow['passenger'];?></td>                
								<td><?php echo $jobrow['pickup'];?></td>
								<td><?php echo $jobrow['stops'];?></td>                
								<td><?php echo $jobrow['destination'];?></td>                
								<td><?php echo $jobrow['journey_fare'];?></td>                
								<td><?php echo $jobrow['v_name'];?></td>                
								<td><?php echo $jobrow['job_status'];?></td>                
								<td><?php echo $jobrow['d_name'];?></td>            
							</tr>            
							<?php            
							}            
							?>        
						</tbody>    
					</table>					  									
					<script>   					
						$(document).ready(function() {    
							$('#table-job').DataTable();
						});
						function loadJobList() {       							        
							var xhttp = new XMLHttpRequest();      
							xhttp.onreadystatechange = function() {         
								if (this.readyState == 4 && this.status == 200) {               
									document.querySelector("#table-default .table-tbody").innerHTML = this.responseText;
								}     
							};       
							xhttp.open("GET", "update_job_list.php", true);       
							xhttp.send();   
						}   						   
						loadJobList();   
						setInterval(loadJobList, 5000); 
					</script>                  					
				</div>                                                    				
			</div>              			
		</div>		
	</div>	
</div>        

<?php	
include('footer.php');	
?>