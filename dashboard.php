<?php
include('header.php');
?>     

        <!-- Page header -->
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
              <!-- Page title actions -->
              <div class="col-auto ms-auto d-print-none">
                <div class="btn-list">
                  <span class="d-none d-sm-inline">
                    <a href="#" class="btn">
						 <i class="ti ti-user-search" style="margin-right: 10px;"></i>
                     Driver Tracking
                    </a>
                  </span>
                  <a href="#" class="btn btn-primary d-none d-sm-inline-block" data-bs-toggle="modal" data-bs-target="#modal-report">
                   <i class="ti ti-bookmark-plus" style="margin-right: 10px;"></i>
                    Create New Booking
                  </a>
                  <a href="#" class="btn btn-primary d-sm-none btn-icon" data-bs-toggle="modal" data-bs-target="#modal-report" aria-label="Create new report">
                    <i class="ti ti-bookmark-plus"></i>
                  </a>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- Page body -->
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
              <div class="col-sm-6 col-lg-3">
                <div class="card">
                  <div class="card-body">
                    <div class="d-flex align-items-center">
                      <div class="subheader">Active users</div>
                      
                    </div>
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
                        <th><button class="table-sort" data-sort="sort-id">ID</button></th>
                        <th><button class="table-sort" data-sort="sort-date">Date</button></th>
                        <th><button class="table-sort" data-sort="sort-time">Time</button></th>
                        <th><button class="table-sort" data-sort="sort-passenger">Passenger</button></th>
                        <th><button class="table-sort" data-sort="sort-pickup">Pickup</button></th>
                        <th><button class="table-sort" data-sort="sort-dropoff">Dropoff</button></th>
                        <th><button class="table-sort" data-sort="sort-fare">Fare</button></th>
						   <th><button class="table-sort" data-sort="sort-vehicle">Vehicle</button></th>
						   <th><button class="table-sort" data-sort="sort-status">Status</button></th>
						   <th><button class="table-sort" data-sort="sort-driver">Driver</button></th>
                      </tr>
                    </thead>
                    <tbody class="table-tbody">
						<?php		
									$n=0;
									$jobsql=mysqli_query($connect,"SELECT jobs.*, clients.c_name, clients.c_email, clients.c_phone, bookings.book_id, bookings.pickup, bookings.destination, bookings.passenger, bookings.luggage, bookings.book_date, bookings.book_time, bookings.journey_type, drivers.d_name, 
	vehicles.v_name FROM jobs, clients, bookings, drivers, vehicles WHERE jobs.book_id = bookings.book_id AND jobs.c_id = clients.c_id AND jobs.d_id = drivers.d_id AND jobs.job_status = 'waiting' AND drivers.v_id = vehicles.v_id ORDER BY jobs.job_id DESC");
									while($jobrow = mysqli_fetch_array($jobsql)){	
										$n++;
																								
									?>		
						
						
                      <tr>
                        <td class="sort-name">Steel Vengeance</td>
                        <td class="sort-city">Cedar Point, United States</td>
                        <td class="sort-type">RMC Hybrid</td>
                        <td class="sort-score">100,0%</td>
                        <td class="sort-date" data-date="1628122643">August 05, 2021</td>
                        <td class="sort-quantity">74</td>
                        <td class="sort-progress" data-progress="30">
                          <div class="row align-items-center">
                            <div class="col-12 col-lg-auto">30%</div>
                            <div class="col">
                              <div class="progress" style="width: 5rem">
                                <div class="progress-bar" style="width: 30%" role="progressbar" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100" aria-label="30% Complete">
                                  <span class="visually-hidden">30% Complete</span>
                                </div>
                              </div>
                            </div>
                          </div>
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
        
<?php	
include('footer.php');	
?>