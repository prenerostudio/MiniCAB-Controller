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


// Fetch driver status and last reset time
$driver_status_result = $connect->query("SELECT status, last_reset FROM drivers WHERE d_id = $d_id");
$driver_data = $driver_status_result->fetch_assoc();
$driver_status = $driver_data['status'];
$last_reset = strtotime($driver_data['last_reset']);

// Check if 24 hours have passed since the last reset
if (time() - $last_reset >= 24 * 60 * 60) {
    // Reset the driver's journey
    $connect->query("UPDATE drivers SET last_reset = NOW() WHERE d_id = $d_id");
    // Optionally, clear the driver's journey data:
    // $connect->query("DELETE FROM driver_location WHERE d_id = $d_id");
}

// Retrieve the coordinates of the driver
$coordinates = [];
$location_result = $connect->query("SELECT latitude, longitude FROM driver_location WHERE d_id = $d_id ORDER BY time ASC");
while ($row = $location_result->fetch_assoc()) {
    $coordinates[] = ['lat' => floatval($row['latitude']), 'lng' => floatval($row['longitude'])];
}

$default_coordinate = ['lat' => 51.5074, 'lng' => -0.1278];
$start_point = !empty($coordinates) ? $coordinates[0] : $default_coordinate;
$end_point = !empty($coordinates) ? end($coordinates) : $default_coordinate;
?>					                    
					<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBkPNpPhCg1hVZ14GUWeGpxpSaIL-qPdbU"></script>

    <!-- PHP and Map Logic -->
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

            // Clear existing polyline if it exists
            if (window.polyline) {
                window.polyline.setMap(null);
            }

            if (coordinates.length > 0) {
                // Create the new polyline and markers
                window.polyline = new google.maps.Polyline({
                    path: coordinates,
                    geodesic: true,
                    strokeColor: '#FF0000',
                    strokeOpacity: 1.0,
                    strokeWeight: 2
                });
                window.polyline.setMap(map);

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

        // Reload the map and activity every 24 hours or on page load
        window.onload = initMap;

        // Refresh page every 24 hours to reload map and reset data
        setInterval(function() {
            location.reload();
        }, 24 * 60 * 60 * 1000);  // Refresh every 24 hours
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