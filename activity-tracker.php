<div class="card-body">
	<h2 class="mb-4">	
		Driver Activity Tracker
	</h2>										
	<div class="row mb-3">										
		<div class="card">	
			<div class="card-body border-bottom py-3">								
				<div id="table-adriver" class="table-responsive">														
					<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBkPNpPhCg1hVZ14GUWeGpxpSaIL-qPdbU"></script>				
					<?php				
					$driver_status_result = $connect->query("SELECT status FROM drivers WHERE d_id = $d_id");   
					$driver_status = $driver_status_result->fetch_assoc()['status'];					   
					$coordinates = [];   
					$location_result = $connect->query("SELECT latitude, longitude FROM driver_location WHERE d_id = $d_id ORDER BY time ASC");   
					while ($row = $location_result->fetch_assoc()) {            
						$coordinates[] = ['lat' => floatval($row['latitude']), 'lng' => floatval($row['longitude'])];   
					}        					   
					$default_coordinate = ['lat' => 51.5074, 'lng' => -0.1278];    					   
					$start_point = !empty($coordinates) ? $coordinates[0] : $default_coordinate;    
					$end_point = !empty($coordinates) ? end($coordinates) : $default_coordinate;
					?>					
					<div id="mapa" style="height: 500px;"></div>					
					<script>       
						function initMap() {              
							var startPoint = <?php echo json_encode($start_point); ?>;    	
							var coordinates = <?php echo json_encode($coordinates); ?>;       
							var mapOptions = {          
								zoom: 13,            
								center: startPoint       
							};       
							var map = new google.maps.Map(document.getElementById('mapa'), mapOptions);       
							if (coordinates.length > 0) {          
								var polyline = new google.maps.Polyline({             
									path: coordinates,              
									geodesic: true,               
									strokeColor: '#FF0000',               
									strokeOpacity: 1.0,               
									strokeWeight: 2           
								});           
								polyline.setMap(map);          
								var startMarker = new google.maps.Marker({              
									position: startPoint,               
									map: map,               
									title: "Start Location"         
								});            
								var driverStatus = "<?php echo $driver_status; ?>";           
								if (driverStatus === 'offline') {             
									var endMarker = new google.maps.Marker({                 
										position: <?php echo json_encode($end_point); ?>,                  
										map: map,                  
										title: "End Location (Driver Offline)"              
									});
									var bounds = new google.maps.LatLngBounds();
									coordinates.forEach(function(coord) {                   
										bounds.extend(new google.maps.LatLng(coord.lat, coord.lng));            
									});               
									map.fitBounds(bounds);          
								}      
							} else {         								           
								map.setCenter(startPoint);       
							}   
						}   
						window.onload = initMap;
					</script>													
				</div>							
			</div> 			
		</div>		
	</div>	
</div>