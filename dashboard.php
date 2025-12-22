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
    <script>    
        function fetchExpiringDocuments() {
            $.ajax({
                url: 'includes/cron-jobs/check_expiry_alerts.php', // PHP script that runs the check
                method: 'GET',
                success: function(response) {
                    const alerts = JSON.parse(response);
                    const alertContainer = document.getElementById('driver-expiry-alerts');
                    alertContainer.innerHTML = ''; // Clear old alerts
                    alerts.forEach(alert => {
                        const message = `${alert.document_type} for driver ID ${alert.driver_id} is expiring on ${alert.expiry_date}`;
                        alertContainer.innerHTML += createAlertHtml(message);
                    });
                }
            });
        }
        function createAlertHtml(message) {    
            return `    
                <div class="alert alert-important alert-danger alert-dismissible" role="alert">
                    <div class="d-flex">
                        <div>
                            <i class="ti ti-alert-circle" style="padding-right: 10px;"></i>
                        </div>
                        <div>${message}</div>
                    </div>
                    <a class="btn-close" data-bs-dismiss="alert" aria-label="close"></a>
                </div>`;
        }
        // Check every minute (or adjust as needed)
        setInterval(fetchExpiringDocuments, 10000);
        // Optionally run immediately on page load
        fetchExpiringDocuments();    
    </script>	
    <div id="driver-expiry-alerts"></div>
    <div class="row row-deck row-cards">   
        <div class="col-lg-5">			            
            <div class="card">                   
                <?php               
                include('includes/drivers/count-online-drivers.php');                              
                include('includes/drivers/count-offline-drivers.php');                              
                include('includes/drivers/count-pob-drivers.php');                                                              
                ?>               
                <div class="card-body">                
                    <h3 class="card-title">                                           
                        Zones List:  (Online Drivers:  <?php echo $online_driver_count; ?>)  | (Onboard Drivers: <?php echo $pob_driver_count; ?>) | (Inactive Drivers: <?php echo $offline_driver_count; ?>)
                    </h3>		
                    <div>						
                        <?php
                        $zonesQuery = "SELECT * FROM zones";			
                        $zonesResult = $connect->query($zonesQuery);			
                        // Fetch latest driver locations along with driver names and their vehicles			
                        $driversQuery = "SELECT dl.d_id, dl.latitude, dl.longitude, d.d_name, dv.v_make FROM driver_location dl INNER JOIN (SELECT d_id, MAX(time) AS latest_timestamp FROM driver_location GROUP BY d_id) latest ON dl.d_id = latest.d_id AND dl.time = latest.latest_timestamp INNER JOIN drivers d ON dl.d_id = d.d_id LEFT JOIN driver_vehicle dv ON dl.d_id = dv.d_id";			
                        $driversResult = $connect->query($driversQuery);			
                        // Store drivers' data in an array			
                        $drivers = [];			
                        while ($row = $driversResult->fetch_assoc()) {    			
                            $drivers[$row['d_id']] = [        
				'latit`ude' => $row['latitude'],        
				'longitude' => $row['longitude'],        
				'name' => $row['d_name'],        
				'vehicle' => $row['v_make'] ?? 'Unknown' // Handle null values    
                            ];
			}			
                        // Display zone table			
                        echo "<table class='table table-responsive zones-table'>";			
                        echo "<tr><th>Zone</th><th>Number of Drivers</th><th>Drivers List</th><th>Vehicles in Zone</th></tr>";			
                        while ($zone = $zonesResult->fetch_assoc()) {    			
                            $driverCount = 0;    			
                            $driversInZone = [];    			
                            $vehiclesInZone = [];							    			
                            foreach ($drivers as $d_id => $driver) {        			
                                if (            				
                                    $driver['latitude'] >= $zone['lat_min'] && $driver['latitude'] <= $zone['lat_max'] &&      					
                                    $driver['longitude'] >= $zone['lng_min'] && $driver['longitude'] <= $zone['lng_max']					
                                ) {            					
                                    $driverCount++;            				
                                    $driversInZone[] = "{$driver['name']}";            				
                                    $vehiclesInZone[] = "{$driver['vehicle']}";        				
                                }    				
                            }    				                                
                            $driverList = $driverCount > 0 ? implode(', ', $driversInZone) : 'None';    				                            
                            $vehicleList = $driverCount > 0 ? implode(', ', $vehiclesInZone) : 'None';    				                            
                            echo "<tr>
                                    <td>{$zone['zone_name']}</td>
                                    <td>{$driverCount}</td>
                                    <td>{$driverList}</td>
                                    <td>{$vehicleList}</td>
                                  </tr>";					
                        }				                                    
                        echo "</table>";				                        
                        ?>							                  					
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
                                    $drsql=mysqli_query($connect,"SELECT drivers.* FROM drivers WHERE drivers.`status` = 'pob' OR drivers.`status` = 'On Ride' OR drivers.`status` = 'Reached on Dropoff' OR drivers.`status` = 'Way to Pickup'");
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
                                            <span class="badge bg-success me-1"></span>											
                                            <?php echo $drrow['status']; ?>
                                        </td>
                                    </tr>								
                                    <?php									                                        
                                    }									
                                    ?>
                                </tbody>
                            </table>
                        </div>                        
                        <script>			
                            
                            function loadDriverListPOB() {
                                var xhttp = new XMLHttpRequest();	
                                xhttp.onreadystatechange = function() {	        	
                                if (this.readyState == 4 && this.status == 200) {	            	
                                    document.getElementById("driverListPOB").innerHTML = this.responseText;	
                                }	    	
                            };
                                xhttp.open("GET", "includes/drivers/update_driver_list_pob.php", true);	
                                xhttp.send();	
                            }    
                            loadDriverListPOB();    
                            setInterval(loadDriverListPOB, 1000);
                        </script>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-lg-4">
            <div class="card">
                <div class="card-body">
                    <div class="d-flex align-items-center">
                        <div class="subheader">Active users</div>
                    </div>                  					
                    <div id="driverList">    						
                        <?php include('includes/drivers/update_driver_list.php'); ?>					
                    </div>					
                    <script>						
                        function updateTimers() {    							
                            const timers = document.querySelectorAll('.timer');    							
                            timers.forEach(timer => {        								
                                const startTime = parseInt(timer.dataset.start);        	
                                const now = Date.now();        	
                                const diff = now - startTime;								        	
                                const hours = Math.floor(diff / (1000 * 60 * 60));        	
                                const minutes = Math.floor((diff % (1000 * 60 * 60)) / (1000 * 60));        	
                                const seconds = Math.floor((diff % (1000 * 60)) / 1000);        	
                                timer.textContent =            	
                                    `${String(hours).padStart(2, '0')}:${String(minutes).padStart(2, '0')}:${String(seconds).padStart(2, '0')}`;		
                            });	
                        }	    
                        function updateavTimers() {    							    
                            const avtimers = document.querySelectorAll('.avtimer');    							
                            avtimers.forEach(avtimer => {        								
                                const startTime = parseInt(avtimer.dataset.start);        	
                                const now = Date.now();        	
                                const diff = now - startTime;								        	
                                const hours = Math.floor(diff / (1000 * 60 * 60));        	
                                const minutes = Math.floor((diff % (1000 * 60 * 60)) / (1000 * 60));        	
                                const seconds = Math.floor((diff % (1000 * 60)) / 1000);        	
                                avtimer.textContent =            	
                                    `${String(hours).padStart(2, '0')}:${String(minutes).padStart(2, '0')}:${String(seconds).padStart(2, '0')}`;		
                            });
                        }	
                        setInterval(updateavTimers, 1000);
                        setInterval(updateTimers, 1000);						
                        function loadDriverList() {    
                            const xhttp = new XMLHttpRequest();    	
                            xhttp.onreadystatechange = function () {        	
                            if (this.readyState === 4 && this.status === 200) {            	
                                const container = document.getElementById("driverList");            	
                                container.style.opacity = 0.5;            	
                                setTimeout(() => {                	
                                    container.innerHTML = this.responseText;                		
                                    container.style.opacity = 1;                		
                                    updateTimers();  
                                    updateavTimers();		
                                    if (typeof $ !== 'undefined' && $.fn.DataTable) {                    		
                                        $('#table-active').DataTable();                 		
                                    }            		
                                }, 100);         	
                            }    	
                        };    
                            xhttp.open("GET", "includes/drivers/update_driver_list.php", true);    	
                            xhttp.send();	
                        }						
                        function scheduleDriverListUpdate() {    
                            loadDriverList();    	
                            setTimeout(scheduleDriverListUpdate, 5000);	
                        }
                        window.onload = () => {    
                            updateTimers();    	
                            scheduleDriverListUpdate();	
                        };      
                    </script>                		
                </div>
            </div>
        </div>
        <div class="col-12">
            <div class="card">
                <div class="card-header">
                    <h3 class="card-title">Today's Jobs	</h3>
                    <div class="col-auto ms-auto d-print-none">
                        <div class="btn-list">
                            <span class="d-none d-sm-inline">			
                                <span class="dropdown">				
                                    <button class="btn dropdown-toggle align-text-top" id="filterDropdown" data-bs-boundary="viewport" data-bs-toggle="dropdown">
                                        Search Bookings
                                    </button>
                                    <div class="dropdown-menu dropdown-menu-end">
                                        <a class="filter-item" href="#" data-filter="3">
                                            All Bookings In 3 Hours
										</a>
                                        <a class="filter-item" href="#" data-filter="6">
                                            All Bookings In 6 Hours
                                        </a>
                                        <a class="filter-item" href="#" data-filter="9">
                                            All Bookings In 9 Hours
                                        </a>
                                        <a class="filter-item" href="#" data-filter="12">
                                            All Bookings In 12 Hours
                                        </a>
                                        <a class="filter-item" href="#" data-filter="24">
                                            All Bookings In 24 Hours
                                        </a>
                                        <a class="filter-item" href="#" data-filter="72">
                                            All Bookings In 3 Days
                                        </a>
                                        <a class="filter-item" href="#" data-filter="168">
                                            All Bookings In 7 Days
                                        </a>
                                        <a class="filter-item" href="#" data-filter="336">
                                            All Bookings In 14 Days
                                        </a>
                                        <a class="filter-item" href="#" data-filter="720">
                                            All Bookings In 30 Days
                                        </a>
                                        <a class="filter-item" href="#" data-filter="2160">
                                            All Bookings In 3 Months
                                        </a>
                                        <a class="filter-item" href="#" data-filter="4320">
                                            All Bookings In 6 Months
										</a>
                                        <a class="filter-item" href="#" data-filter="8760">
                                            All Bookings In 12 Months
                                        </a>
                                    </div>
                                </span>
                            </span>
                            <script>								
                                $(document).ready(function() {
                                    $(".filter-item").click(function(event) {	
                                    event.preventDefault();        	
                                    var selectedInterval = $(this).data("filter");        								        	
                                    console.log("Selected Interval:", selectedInterval);					        	
                                    $.ajax({	            	
                                        type: "GET",	            	
                                        url: "includes/bookings/fetch-next-data.php",            									            	
                                        data: { timeInterval: selectedInterval },		            	
                                        success: function(data) {	        	
                                    console.log("Ajax Success:", data);	        	
                                    $("#tableBody").html(data);	    	
                                },           
                                        error: function(xhr, status, error) {	       	
                                    console.error("Ajax Error:", error);    	
                                }       
                                    });	   	
                                });    
                                });                           
                            </script>			
                        </div>			
                    </div>		
                </div>		
                <div class="card-body border-bottom py-3">		
                    <div class="table-responsive">
                        <?php
                        $bsql = mysqli_query($connect, "SELECT
                                bookings.*,
                                clients.*,
                                booking_type.*,
                                vehicles.*
                            FROM bookings
                            LEFT JOIN clients ON bookings.c_id = clients.c_id
                            INNER JOIN booking_type ON bookings.b_type_id = booking_type.b_type_id
                            LEFT JOIN vehicles ON bookings.v_id = vehicles.v_id
                            WHERE bookings.booking_status <> 'Booked'
                            ORDER BY bookings.book_id DESC");
                        if (mysqli_num_rows($bsql) > 0) {
                        ?>
                        <table class="table" id="table-dashboard">    
                            <thead>        
                                <tr>            
                                    <th>ID</th>            
                                    <th>Date Pickup</th>            
                                    <th>Time Pickup</th>            
                                    <th>Post Code</th>            
                                    <th>Pickup</th>            
                                    <th>Stops</th>            
                                    <th>Dropoff</th>            
                                    <th>Passenger</th>            
                                    <th>Journey Type</th>            
                                    <th>Fare</th>            
                                    <th>Vehicle</th>            
                                    <th>Actions</th>        
                                </tr>    
                            </thead>
                            <tbody class="table-tbody">                                        
                                <?php 
                                while ($brow = mysqli_fetch_assoc($bsql)) {                              
                                    // Calculate pickup proximity            
                                    $pickup_datetime = strtotime($brow['pick_date'] . ' ' . $brow['pick_time']);            
                                    $time_diff = ($pickup_datetime - time()) / 60;            
                                    $row_class = ($time_diff <= 10) ? 'near-pickup' : '';                                           
                                ?>        
                                <tr class="<?= $row_class ?>">                                               
                                    <td>
                                        <?= $brow['book_id'] ?>
                                    </td>            
                                    <td>
                                        <?= $brow['pick_date'] ?>
                                    </td>            
                                    <td>
                                        <?= $brow['pick_time'] ?>
                                    </td>            
                                    <td>
                                        <?= $brow['postal_code'] ?>
                                    </td>            
                                    <td>
                                        <?= $brow['pickup'] ?>
                                    </td>            
                                    <td>
                                        <?= $brow['stops'] ?>
                                    </td>            
                                    <td>
                                        <?= $brow['destination'] ?>
                                    </td>            
                                    <td>
                                        <?= $brow['passenger'] ?>
                                    </td>            
                                    <td>
                                        <?= $brow['journey_type'] ?>
                                    </td>            
                                    <td>
                                        <?= $brow['journey_fare'] ?>
                                    </td>            
                                    <td>
                                        <?= $brow['v_name'] ?>
                                    </td>                                               
                                    <td style="width: 12%;">                
                                        <form class="dispatchForm">                                                               
                                            <input type="hidden" name="book_id" value="<?= $brow['book_id'] ?>">                    
                                            <input type="hidden" name="c_id" value="<?= $brow['c_id'] ?>">                    
                                            <input type="hidden" name="journey_fare" value="<?= $brow['journey_fare'] ?>">                    
                                            <input type="hidden" name="booking_fee" value="<?= $brow['booking_fee'] ?>">                                                                
                                            <div class="input-group mb-2">
                                                <select class="form-control" name="d_id" required>                            
                                                    <option value="">Select Driver</option>                                                                               
                                                        <?php                            
                                                        $drsql = mysqli_query($connect, "SELECT d_id, d_name, d_phone FROM drivers WHERE acount_status = 1");                            
                                                        while ($dr = mysqli_fetch_assoc($drsql)) {                            
                                                        ?>                                
                                                    <option value="<?= $dr['d_id'] ?>">                                                                    
                                                        <?= $dr['d_id'] ?> - <?= $dr['d_name'] ?> - <?= $dr['d_phone'] ?>                                
                                                    </option>                            
                                                        <?php } ?>                                                                           
                                                </select>                                                                       
                                                <button class="btn btn-bitbucket" type="submit">                            
                                                    <i class="ti ti-plane-tilt"></i>                        
                                                </button>                                                                   
                                            </div>                
                                        </form>            
                                    </td>                                           
                                </tr>        
                                    <?php } ?>
                            </tbody>
                        </table>

                        <?php                                                                                                                
                            } else {                            
                                echo '<p>No booking found.</p>';                                                          
                            }                         
                        ?>
                    </div>									
                </div>		
            </div>	
        </div>	
    </div>	
</div>
<audio id="dispatchSound">
    <source src="sounds/dispatch_ding.mp3" type="audio/mpeg">
</audio>
<script>
$(document).on("submit", ".dispatchForm", function (e) {
    e.preventDefault();
    let form = this;
    let formData = new FormData(form);
    Swal.fire({
        title: "Dispatching Job...",
        text: "Please wait",
        allowOutsideClick: false,
        didOpen: () => Swal.showLoading()
    });
    $.ajax({
        url: "includes/jobs/dispatch-process.php",
        type: "POST",
        data: formData,
        contentType: false,
        processData: false,
        dataType: "json",
        success: function (response) {
            if (response.status === "success") {
                // 🔊 Play sound
                var ding = document.getElementById("dispatchSound");
                if (ding) ding.play();
                Swal.fire({
                    icon: "success",
                    title: "Job Dispatched!",
                    text: "Driver assigned successfully.",
                    timer: 1500,
                    showConfirmButton: false
                });
                setTimeout(() => {
                    location.reload();
                }, 1600);
            } else {
                Swal.fire({
                    icon: "error",
                    title: "Failed!",
                    text: response.message
                });
            }
        },
        error: function (xhr) {
            Swal.fire({
                icon: "error",
                title: "Server Error!",
                text: "dispatch-process.php did not return JSON"
            });
            console.log(xhr.responseText);
        }
    });
});
   
</script>
<?php	
include('footer.php');	
?>