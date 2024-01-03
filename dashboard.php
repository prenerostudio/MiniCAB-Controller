<?php
include('header.php');
?>     
<div class="page-header d-print-none">	
	<div class="container-xl">    
		<div class="row g-2 align-items-center">        
			<div class="col">            
				<!-- Page pre-title -->                
				<div class="page-pretitle">                
					Overview                
				</div>                
				<h2 class="page-title">                
					Dashboard                
				</h2>              
			</div>
			<div class="col-auto ms-auto d-print-none">            
				<!--<div class="btn-list">                
					<span class="d-none d-sm-inline">
						<a href="#" class="btn">						
							<i class="ti ti-user-search" style="margin-right: 10px;"></i>                     
							Driver Tracking                    
						</a>                  
					</span>                  
					<a href="#" class="btn btn-primary d-none d-sm-inline-block" data-bs-toggle="modal" data-bs-target="#modal-booking">                   
						<i class="ti ti-bookmark-plus" style="margin-right: 10px;"></i>                    
						Create New Booking                  
					</a>                  
					<a href="#" class="btn btn-primary d-sm-none btn-icon" data-bs-toggle="modal" data-bs-target="#modal-booking" aria-label="Create new report">                    
						<i class="ti ti-bookmark-plus"></i>                  
					</a>                
				</div>    -->          
			</div>
		</div>
	</div>
</div>          
<div class="page-body">          
	<div class="container-xl">
		<div class="row row-deck row-cards">
			<div class="col-lg-6">				
				<div class="card">                
					<div class="card-body">                    
						<h3 class="card-title">Locations</h3>                    
						<div class="ratio ratio-21x9">                      
							<div>							
								<div id="map"></div>								
								<script src="https://unpkg.com/leaflet/dist/leaflet.js"></script>
								<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
								<script>    								
									// Initialize the map with an initial center based on the average location of drivers
									var map = L.map('map').setView([0, 0], 10); // Default center and zoom level
									L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
										attribution: '© OpenStreetMap contributors'   										
									}).addTo(map);
									// Define the car icon									    
									var carIcon = L.icon({        
										iconUrl: 'img/icon.png',        
										iconSize: [60, 60], // Adjust the size of the icon        
										iconAnchor: [30, 30],        
										popupAnchor: [0, -30]    
									});    
									// Fetch user locations from the PHP script    
									$.getJSON('retrieve_user_locations.php', function (data) {        
										if (data.length > 0) {            
											// Calculate the average latitude and longitude            
											var avgLat = 0;            
											var avgLng = 0;											            
											data.forEach(function (location) {                
												avgLat += parseFloat(location.latitude);                
												avgLng += parseFloat(location.longitude);            
											});            
											avgLat /= data.length;            
											avgLng /= data.length;            
											// Set the map center to the average location            
											map.setView([avgLat, avgLng], 10); // Adjust the zoom level as needed            
											// Add markers for each user location with the car icon            
											data.forEach(function (location) {                
												L.marker([location.latitude, location.longitude], { icon: carIcon }).addTo(map)                    
													.bindPopup('Driver Location: ' + location.latitude + ', ' + location.longitude);            
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
							<div class="subheader">Driver Onboard</div>                                          
						</div>                    
						<div class="table-responsive">                   										
							<table class="table table-responsive">		
								<thead>                   														
									<tr>  
										<th class="w-1">ID</th>										
										<th>Driver</th>										
										<th>Status</th>	                     										
									</tr>                     									
								</thead>                    								
								<tbody> 								
									<?php																		
									$n=0;
									$drsql=mysqli_query($connect,"SELECT * FROM `drivers` WHERE `status`='pob'");
									while($drrow = mysqli_fetch_array($drsql)){													$n++;										
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
											<span class="badge bg-success me-1"></span> Online			
										</td>																				
									</tr>									
									<?php																		
									}																			
									?>														
								</tbody>                    												
							</table>                 										
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
						<table class="table table-responsive">							
							<thead>                   													
								<tr>                          															
									<th class="w-1">ID</th>
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
										<span class="badge bg-success me-1"></span> Online								
									</td>																		
								</tr>                              								
								<?php																	
								}																		
								?>																		
							</tbody>                    											
						</table>                  
					</div>					                				
				</div>              			
			</div>               

			<div class="col-12">            			
				<div class="card">                				
					<div class="card-header">                    					
						<h3 class="card-title">Today's Jobs	</h3>                  					
					</div>                  
					<div class="card-body border-bottom py-3">
						<div id="table-default" class="table-responsive">                  
							<table class="table">                    
								<thead>                      
									<tr>                        
										<th>
											<button class="table-sort" data-sort="sort-id">ID</button>
										</th>                        
										<th>
											<button class="table-sort" data-sort="sort-date">Date</button>
										</th>                        
										<th>
											<button class="table-sort" data-sort="sort-time">Time</button>
										</th>                       
										<th>
											<button class="table-sort" data-sort="sort-passenger">Passenger</button>
										</th>                        
										<th>
											<button class="table-sort" data-sort="sort-pickup">Pickup</button>
										</th>                        
										<th>
											<button class="table-sort" data-sort="sort-dropoff">Dropoff</button>
										</th>                       
										<th>
											<button class="table-sort" data-sort="sort-fare">Fare</button>
										</th>						   
										<th>
											<button class="table-sort" data-sort="sort-vehicle">Vehicle</button>
										</th>						  
										<th>
											<button class="table-sort" data-sort="sort-status">Status</button>
										</th>						   
										<th>
											<button class="table-sort" data-sort="sort-driver">Driver</button>
										</th>                      
									</tr>                   
								</thead>                  
								<tbody class="table-tbody">					
									<?php										
									$y=0;								
									$jobsql=mysqli_query($connect,"SELECT jobs.*, clients.c_name, clients.c_email, clients.c_phone, bookings.*, drivers.*, booking_type.* FROM jobs, clients, bookings, drivers, booking_type WHERE jobs.book_id = bookings.book_id  AND jobs.c_id = clients.c_id AND jobs.d_id = drivers.d_id AND jobs.job_status = 'waiting' AND bookings.b_type_id = booking_type.b_type_id ORDER BY jobs.job_id DESC");									
									while($jobrow = mysqli_fetch_array($jobsql)){											
										$y++;
									?>														                     
									<tr>                        
										<td class="sort-id"><?php echo $y; ?></td>                        
										<td class="sort-date"><?php echo $jobrow['pick_date'] ?></td>                       
										<td class="sort-time"><?php echo $jobrow['pick_time'] ?></td>                       
										<td class="sort-passenger"><?php echo $jobrow['passenger'] ?></td>  
										<td class="sort-pickup"><?php echo $jobrow['pickup'] ?></td>                       
										<td class="sort-drpoff"><?php echo $jobrow['destination'] ?></td>
										<td class="sort-fare"> <?php echo $jobrow['journey_fare'] ?> </td>
										<td class="sort-vehicle"> <?php echo $jobrow['v_name'] ?> </td>
										<td class="sort-status"> <?php echo $jobrow['job_status'] ?> </td>
										<td class="sort-driver"> <?php echo $jobrow['d_name'] ?> </td>
									</tr>											
									<?php																	
									}																
									?>                                       
								</tbody>                 
							</table>                
						</div>                  
					</div>                                                    
				</div>              
			</div>
		</div>
	</div>
</div>        
<script>	
	document.addEventListener("DOMContentLoaded", function() {    	
		const list = new List('table-default', {      			
			sortClass: 'table-sort',      				
			listClass: 'table-tbody',      				
			valueNames: [ 'sort-id', 'sort-date', 'sort-time', 'sort-fare',						      					
						 'sort-driver'      	
						]			
		}); 		
	})	
</script>
<?php	
include('footer.php');	
?>