<?php
include('header.php');
?>		
<div class="col-md-12">                
		<div class="card">                  		
			<div class="card-header">                   			
				<ul class="nav nav-tabs card-header-tabs nav-fill" data-bs-toggle="tabs">                    				
					<li class="nav-item" style="background: #163B8F;">                      					
						<a href="#tabs-dasboard" class="nav-link active" data-bs-toggle="tab">
							<i class="ti ti-home-down" style="font-size: 24px;"></i>                    							
							Dashboard
						</a>                     
					</li>                      
					                					                  
				</ul>                
			</div>
                 			
			<div class="card-body">                  			
				<div class="tab-content">                   				
					<div class="tab-pane active show" id="tabs-dasboard">                    
						<div class="row row-deck row-cards"> 							
							<div class="col-lg-6" style="float: left;">    		
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
	
							<div class="col-lg-3" style="float: left;">    
								<div class="card">        
									<div class="card-body">            				
										<h3 class="card-title">Drivers Onboard</h3>                
										<div class="table-responsive">                   				
											<table class="table card-table table-vcenter text-nowrap datatable">                   					
												<thead>                   						
													<tr>                          							
														<th class="w-1">ID</th>                         						       
														<th>Driver</th>                							
														<th>Status</th>	                     
													</tr>                     
												</thead>                    
												<tbody> 
													<?php																		
													$drsql=mysqli_query($connect,"SELECT * FROM `drivers` WHERE `status`='pob'");
													while($drrow = mysqli_fetch_array($drsql)){														
													?>													
													<tr>                         							
														<td>								
															<?php echo $drrow['d_id']; ?>							
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
								
							<div class="col-lg-3" style="float: left;">    		
								<div class="card">        			
									<div class="card-body">            				
										<h3 class="card-title">Drivers Waiting</h3>                				
										<div class="table-responsive">                   				
											<table class="table card-table table-vcenter text-nowrap datatable">                   					
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
													$drvsql=mysqli_query($connect,"SELECT * FROM `drivers` WHERE `status`='online'");							
													while($drvrow = mysqli_fetch_array($drvsql)){
														$n++;
													?>													
													<tr>                         						
														<td>								
															<?php echo $n ?>							
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
							</div>   						
						</div>				
					</div>
                    										
				                                     
				</div>                  			
			</div>                	
	</div>              
</div>
<div class="row">
<div class="row row-deck row-cards"> 	 	    	                                                                                       
	<div class="col-md-12">                	
		<div class="card">                  		
			<div class="card-header">                  			
				<ul class="nav nav-tabs card-header-tabs" data-bs-toggle="tabs">                    				
					<li class="nav-item" style="background: #3046CC;">                      					
						<a href="#tabs-today" class="nav-link active" data-bs-toggle="tab">							                          						
							<i class="ti ti-book-upload" style="font-size: 24px;"></i>                       							
							Today's Booking						
						</a>                     
					</li>                      					
					                					                  				
				</ul>                			
			</div>                 			
			<div class="card-body">                  			
				<div class="tab-content">                   				
					<div class="tab-pane active show" id="tabs-today">                    
						<div class="table-responsive">                   				
							<table class="table card-table table-vcenter text-nowrap datatable" id="jobs_table">                   					
								<thead>                   						
									<tr>                          							
										<th class="w-1">ID</th>                         							
										<th class="w-1">Date</th>                          							
										<th style="background:rgba(227,136,137,0.61);">Time</th>                         							
										<th style="background:rgba(227,136,137,0.61);">Passenger</th>                         							
										<th style="width: 15%;">Pickup</th>                         							
										<th style="width: 15%;">Destination</th>                         							
										<th style="background:rgba(227,136,137,0.61);">Fare</th>                        							
										<th>Vehicle</th>                       							
										<th>Note</th>                       							
										<th>Status</th>                       							
										<th style="background:rgba(227,136,137,0.61);">Driver</th>                       							
										<!--<th>Action</th>-->                       						
									</tr>                     					
								</thead>                    					
								<tbody> 						
									<?php		
									$n=0;
									$jobsql=mysqli_query($connect,"SELECT jobs.*, clients.c_name, clients.c_email, clients.c_phone, bookings.book_id, bookings.pickup, bookings.destination, bookings.passenger, bookings.luggage, bookings.book_date, bookings.book_time, bookings.journey_type, drivers.d_name, 
	vehicles.v_name FROM jobs, clients, bookings, drivers, vehicles WHERE jobs.book_id = bookings.book_id AND jobs.c_id = clients.c_id AND jobs.d_id = drivers.d_id AND jobs.job_status = 'waiting' AND drivers.v_id = vehicles.v_id ORDER BY jobs.job_id DESC");
									while($jobrow = mysqli_fetch_array($jobsql)){	
										$n++;
																								
									?>													
									<tr>                         						
										<td>							
											<?php echo $n; ?>						
										</td>                          							
										<td>								
											<span class="text-secondary">									
												<?php echo $jobrow['book_date']; ?>								
											</span>						
										</td>                        							
										<td style="background:rgba(227,136,137,0.61);">								
											<?php echo $jobrow['book_time']; ?>							
										</td>                        							
										<td style="background:rgba(227,136,137,0.61);">                           								
											<?php echo $jobrow['c_name']; ?>                     							
										</td>                         							
										<td>                          								
											<?php echo $jobrow['pickup']; ?>                     							
										</td>                         							
										<td>                           								
											<?php echo $jobrow['destination']; ?>                      							
										</td>                          							
										<td style="background:rgba(227,136,137,0.61);">                            								
											<?php echo $jobrow['fare']; ?>                        							
										</td>                          							
										<td>Car</td>   							
										<td><?php echo $jobrow['note']; ?>  </td>							
										<td><?php echo $jobrow['job_status']; ?>  </td>							
										<td style="background:rgba(227,136,137,0.61);"><?php echo $jobrow['d_name']; ?> </td>
										<!--<td class="text-end">                            								
											<span class="dropdown">                              									
												<button class="btn align-text-top">Dispatch</button>								
											</span>                         							
										</td>  -->                     						
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
	</div>


<script>  
	$(document).ready(function(){       
		$('#jobs_table').DataTable();   
	});   
	
		
</script> 
<?php		
include('footer.php');		
?>