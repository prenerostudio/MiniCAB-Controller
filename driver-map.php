<?php
include('header.php');
?>
         
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
				<div id="mapd" style="height: 400px;"></div>
<script src="https://unpkg.com/leaflet/dist/leaflet.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        var map = L.map('mapd');
        L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
            attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors',
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
            
            // Add a popup to the marker
            marker.bindPopup("Loading..."); // Placeholder content

            // Add click event to the marker
            marker.on('click', function () {
                // Fetch driver details using AJAX
                var driverId = user.d_id;
                fetchDriverDetails(driverId)
                    .then(function (driverDetails) {
                        // Update the marker's popup content
                        marker.setPopupContent("Driver Details: " + driverDetails);
                    })
                    .catch(function (error) {
                        console.error('Error fetching driver details:', error);
                        marker.setPopupContent("Error fetching details");
                    });
            });
        });

        // Function to fetch driver details using AJAX
        function fetchDriverDetails(driverId) {
            return new Promise(function (resolve, reject) {
                // Use AJAX or fetch API to get driver details from the server
                // Replace the following with your actual endpoint
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

<?php
include('footer.php');
?>