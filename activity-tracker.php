<div class="card-body">
	<h2 class="mb-4">	
		Driver Activity Tracker
	</h2>										
	<div class="row mb-3">										
		<div class="card">
			<div class="card-body border-bottom py-3">						
				<div id="table-adriver" class="table-responsive">											
					<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBkPNpPhCg1hVZ14GUWeGpxpSaIL-qPdbU"></script>
					<?php
					$driver_status_result = $connect->query("SELECT status FROM drivers WHERE d_id = $d_id");
					$driver_status = $driver_status_result->fetch_assoc()['status'];					
					$coordinates = [];
					$location_result = $connect->query("SELECT latitude, longitude FROM driver_location WHERE d_id = $d_id ORDER BY time ASC");
					while ($row = $location_result->fetch_assoc()) {    
						$coordinates[] = ['lat' => floatval($row['latitude']), 'lng' => floatval($row['longitude'])];
					}
					$start_point = $coordinates[0];
					$end_point = end($coordinates);
					?>					
					<div id="mapa" style="height: 500px;"></div>					
					<script>    
						function initMap() {        							        
							var map = new google.maps.Map(document.getElementById('mapa'), {            
								zoom: 13,            
								center: <?php echo json_encode($start_point); ?>        
							});								        								        
								var coordinates = <?php echo json_encode($coordinates); ?>;        
								var polyline = new google.maps.Polyline({            
								path: coordinates,            
								geodesic: true,            
								strokeColor: '#FF0000',            
								strokeOpacity: 1.0,            
								strokeWeight: 2        
							});
							polyline.setMap(map);							        							        
							var startMarker = new google.maps.Marker({            
								position: <?php echo json_encode($start_point); ?>,            
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
									bounds.extend(coord);            
								});            
								map.fitBounds(bounds);        
							}    
						}					
						window.onload = initMap;
					</script>																				
				</div>							
			</div> 			
		</div>		
	</div>	
</div>
<script>	
	$(document).ready(function() {
    $('#table-logs').DataTable();
});
</script>