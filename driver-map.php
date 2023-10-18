<?php
include('header.php');
?>
<div class="container-xl">         
	<div class="card">				
		<div class="card-header">								
			<h2 class="page-title">              			
				Drivers Locations             			
			</h2>										
		</div>            		
		<div class="card-body">           					
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
				<div id="mapd"></div>																				
				<script src="https://unpkg.com/leaflet/dist/leaflet.js"></script>  										
				<script>  				
					document.addEventListener('DOMContentLoaded', function () {					
						var map = L.map('mapd');   								    													
						L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {     														
							attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors',							
							maxZoom: 25    														
						}).addTo(map);    							    													
						var firstLocation = <?php echo json_encode($userLocations[0]); ?>;    													
						var initialLatLng = L.latLng(firstLocation.lat, firstLocation.lng);													
						map.setView(initialLatLng, 12);    							    													
						var userLocations = <?php echo json_encode($userLocations); ?>;    													
						userLocations.forEach(function(user) {     														
							var marker = L.marker([user.lat, user.lng]).addTo(map);														
						});  							
					});					
				</script>						                    														
			</div>			            
		</div>
	</div>
</div>
<?php
include('footer.php');
?>