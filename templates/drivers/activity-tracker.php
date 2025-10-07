<div class="card-body">
    <h2 class="mb-4">Driver Activity Tracker</h2>										
    <div class="row mb-3">
        <div class="card">
            <div class="card-body border-bottom py-3">
                <div id="table-adriver" class="table-responsive">			
                    <?php
                    // Fetch driver status and last reset time
                    $driver_status_result = $connect->query("SELECT status, last_reset FROM drivers WHERE d_id = $d_id");
                    $driver_data = $driver_status_result->fetch_assoc();
                    $driver_status = $driver_data['status'];
                    $last_reset = strtotime($driver_data['last_reset']);
                    // Reset driver journey if 24h passed
                    if (time() - $last_reset >= 24 * 60 * 60) {    
                        $connect->query("UPDATE drivers SET last_reset = NOW() WHERE d_id = $d_id");    
                        $connect->query("DELETE FROM driver_location WHERE d_id = $d_id");                        
                    }
                    // Default map location (London)
                    $default_coordinate = ['lat' => 51.5074, 'lng' => -0.1278];
                    ?>
                    <div id="mapa" style="height:500px;"></div>
                    <script>
                        let map, polyline, startMarker, endMarker, driverMarker;
                            function initMap() {    
                                const startPoint = <?php echo json_encode($default_coordinate); ?>;  
                            map = new google.maps.Map(document.getElementById("mapa"), {
                                zoom: 13,
                                center: startPoint
                            });
                            // Start marker (only static at beginning)
                            startMarker = new google.maps.Marker({
                                position: startPoint,
                                map: map,
                                title: "Start Location"
                            });
                            // Draw initial polyline
                            polyline = new google.maps.Polyline({
                                path: [],
                                geodesic: true,
                                strokeColor: "#FF0000",
                                strokeOpacity: 1.0,
                                strokeWeight: 2,
                                map: map
                            });
                            // First load
                            fetchDriverData();
                            // Refresh every 10 seconds
                            setInterval(fetchDriverData, 10000);
                        }
                        // Smooth marker movement
                        function moveMarker(marker, newPosition) {
                            const currentPos = marker.getPosition();
                            const deltaLat = (newPosition.lat() - currentPos.lat()) / 20;
                            const deltaLng = (newPosition.lng() - currentPos.lng()) / 20;

                            let i = 0;
                            const interval = setInterval(() => {
                                i++;
                                marker.setPosition({
                                    lat: currentPos.lat() + deltaLat * i,
                                    lng: currentPos.lng() + deltaLng * i
                                });
                                if (i >= 20) clearInterval(interval);
                            }, 50);
                        }
                        // Fetch driver data from PHP
                        function fetchDriverData() {
                            fetch("includes/drivers/get-driver-data.php?d_id=<?php echo $_GET['d_id']; ?>") 
                                .then(res => res.json())
                                .then(data => {
                                    if (!data || !data.coordinates) return;
                                    const coordinates = data.coordinates;
                                    const driverStatus = data.driver_status;
                                    const endPoint = data.end_point;
                                    const latestPos = coordinates[coordinates.length - 1];
                                    // Update polyline path
                                    polyline.setPath(coordinates);
                                    // Update/move live driver marker
                                    if (!driverMarker) {
                                        driverMarker = new google.maps.Marker({
                                            position: latestPos,
                                            map: map,
                                            icon: {
                                                url: "https://maps.google.com/mapfiles/ms/icons/blue-dot.png"
                                            },
                                            title: "Driver Current Location"
                                        });
                                    } else {
                                        moveMarker(driverMarker, new google.maps.LatLng(latestPos.lat, latestPos.lng));
                                    }
                                    // If driver is offline, show end marker
                                    if (driverStatus === "offline") {
                                        if (!endMarker) {
                                            endMarker = new google.maps.Marker({
                                                position: endPoint,
                                                map: map,
                                                title: "End Location (Driver Offline)"
                                            });
                                        } else {
                                            endMarker.setPosition(endPoint);
                                        }
                                    }
                                    // Fit bounds to all points
                                    const bounds = new google.maps.LatLngBounds();
                                    coordinates.forEach(c => bounds.extend(new google.maps.LatLng(c.lat, c.lng)));
                                    map.fitBounds(bounds);
                                })
                                .catch(err => console.error("Error fetching driver data:", err));
                        }
                        window.addEventListener("load", initMap);
                    </script>
                </div>
            </div>
        </div>
    </div>	
</div>