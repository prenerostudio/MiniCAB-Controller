<?php
include('header.php');

$job_id = $_GET['job_id'];
$jobsql=mysqli_query($connect,"SELECT jobs.*, bookings.*, clients.*, drivers.*, vehicles.*, booking_type.* FROM jobs JOIN bookings ON jobs.book_id = bookings.book_id JOIN clients ON jobs.c_id = clients.c_id JOIN drivers ON jobs.d_id = drivers.d_id JOIN booking_type ON bookings.b_type_id = booking_type.b_type_id JOIN vehicles ON bookings.v_id = vehicles.v_id WHERE jobs.job_id = '$job_id'");
$jobrow = mysqli_fetch_array($jobsql);
?>  


<style>

    #mapp {
    
        height: 400px;

        width: 100%;
        
    }
    
</style>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBkPNpPhCg1hVZ14GUWeGpxpSaIL-qPdbU&callback=initMap" async defer></script>



<div class="page-body page_padding">	


    <form method="post" action="dispatch-process.php" id="jobform" enctype="multipart/form-data">
	
    
        <div class="row row-deck row-cards">						

            <div class="col-8">				
	
                <div class="card">							
		
                    <div class="card-header">									
		
                        <h3 class="card-title">
			
                            Booking Details
			
                        </h3>
			
                    </div>								
		
                    <div class="card-body border-bottom py-3">												
		
                        <div class="modal-body">																	
			
                            <div class="row">				
			
                                <h3>Booking Type:   <?php echo $jobrow['b_type_name'];?></h3>
				
                                <h4>Passenger Details:</h4>							
				
                                <div class="mb-3 col-lg-4">																
				
                                    <h4>Customer Name: </h4>
				
                                    <p><?php echo $jobrow['c_name'];?></p>
				
                                </div>								
				
                                <div class="mb-3 col-lg-4">								
				
                                    <h4>Customer Phone</h4>									
				
                                    <p><?php echo $jobrow['c_phone'];?></p>								
				
                                </div>																
				
                                <div class="mb-3 col-lg-4">								
				
                                    <h4>Customer Email</h4>									
				
                                    <p><?php echo $jobrow['c_email'];?></p>								
				
                                </div>														
				
                            </div>	
			
                            <div class="row">								
			
                                <h4>Driver Details:</h4>							
				
                                <div class="mb-3 col-lg-4">																
				
                                    <h4>Driver Name: </h4>
				
                                    <p><?php echo $jobrow['d_name'];?></p>
				
                                </div>								
				
                                <div class="mb-3 col-lg-4">								
				
                                    <h4>Driver Phone</h4>									
				
                                    <p><?php echo $jobrow['d_phone'];?></p>								
				
                                </div>																
				
                                <div class="mb-3 col-lg-4">								
				
                                    <h4>Driver Email</h4>									
				
                                    <p><?php echo $jobrow['d_email'];?></p>								
				
                                </div>														
				
                            </div>	
			
                            <div class="row">																				
			
                                
				
                                <div class="mb-3 col-lg-12">										
				
                                    <h4>Address:</h4>									
				
                                    <p><?php echo $jobrow['address'] ?></p>								
				
                                </div>
				
                                <div class="mb-3 col-lg-3">										
				
                                    <h4>Postal Code:</h4>
				
                                    <p><?php echo $jobrow['postal_code'] ?></p>								
				
                                </div>
				
                                <div class="mb-3 col-lg-3">								
				
                                    <h4>No. of Passenger:</h4>
				
                                    <p><?php echo $jobrow['passenger'] ?></p>
				
                                </div> 
				
                                <div class="mb-3 col-lg-3">								
				
                                    <h4>Pickup Date:</h4>
				
                                    <p><?php echo $jobrow['pick_date'] ?></p>								
				
                                </div>								
				
                                <div class="mb-3 col-lg-3">								
				
                                    <h4>Pickup Time:</h4>									
				
                                    <p><?php echo $jobrow['pick_time'] ?></p>								
				
                                </div>								
				
                                <div class="mb-3 col-lg-3">								
				
                                    <h4>Journey Type</h4>
				
                                    <p><?php echo $jobrow['journey_type'] ?></p>								
				
                                </div>								
				
                                <div class="mb-3 col-lg-3">									
				
                                    <h4>Distance</h4>									
				
                                    <p><?php echo $jobrow['journey_distance'] ?> Miles</p>
				
                                </div>
				
                                <div class="mb-3 col-lg-3">          								
				
                                    <h4>Flight Number </h4>								
				
                                    <p><?php echo $jobrow['flight_number'] ?></p>
				
                                </div>															
				
                                <div class="mb-3 col-lg-3">          								
				
                                    <h4>Delay Time </h4>								
				
                                    <p><?php echo $jobrow['delay_time'] ?></p>							
				
                                </div>	
				
                            </div>
			
                            
			
                            <div class="row">	
			
                                <div class="mb-3 col-lg-3">    								
				
                                    <h4>Vehicle Type</h4>   									
				
                                    <p><?php echo $jobrow['v_name'] ?></p>
				
                                </div>															
				
                                <div class="mb-3 col-lg-3">				
				
                                    <h4>Luggage</h4>								
				
                                    <p><?php echo $jobrow['luggage'] ?></p>										
				
                                </div> 															
				
                                <div class="mb-3 col-lg-3">								
				
                                    <h4>Child Seat</h4>																
				
                                    <p><?php echo $jobrow['child_seat'] ?></p>                    														
				
                                </div>															
				
                                
				
                            </div>
			
                            <div class="row">							
			
                                <div class="mb-3">                 															
				
                                    <h4>Special Note</h4>								
				
                                    <p><?php echo $jobrow['note'] ?></p>								
				
                                </div> 
				
                            </div>    												
			
                        </div>          										      											
			
                    </div>                                                    				
		
                </div>              			
		
            </div>	
	
            
	
            <div class="col-4">				
	
                <div class="card">						
		
                    <div class="card-header">					
		
                        <h3 class="card-title">
			
                            Journey Details:
			
                        </h3>				
			
                    </div>				
		
                    <div class="card-body border-bottom py-3">	
		
                        
			
                        <div class="modal-body">
			
                            <div class="row">		
			
                                
				
                                <div class="mb-3 col-lg-12">																
				
                                    <h4>Pickup Location:</h4>
				
                                    <p id="pickup"><?php echo $jobrow['pickup'];?></p>
				
                                </div>
				
                                <div class="mb-3 col-lg-12">								
				
                                    <h4>Stops:</h4>									
				
                                    <p id="stop"><?php echo $jobrow['stops'];?></p>								
				
                                </div>
				
                                <div class="mb-3 col-lg-12">								
				
                                    <h4>Drop-off Location:</h4>									
				
                                    <p id="destination"><?php echo $jobrow['destination'];?></p>								
				
                                </div>	
				
                                
				
                                

                                

                                <div id="mapp"></div>



                                <script>
    
    function initMap() {

        const pickup = document.getElementById('pickup').innerText;
        
        const stop = document.getElementById('stop').innerText;
        
        const destination = document.getElementById('destination').innerText;

        const directionsService = new google.maps.DirectionsService();
        const directionsRenderer = new google.maps.DirectionsRenderer({
            polylineOptions: {
                strokeColor: 'blue',
                strokeWeight: 5
            }
        });

        const map = new google.maps.Map(document.getElementById('mapp'), {
            zoom: 7,
            center: { lat: 55.3781, lng: -3.4360 }  // Coordinates for the UK
        });

        directionsRenderer.setMap(map);

        // Add custom markers
        const pickupMarker = new google.maps.Marker({
//            position: { lat: -34.397, lng: 150.644 }, // Replace with actual coordinates
            map: map,
            title: "Pickup Location",
            icon: {
                url: 'img/car-icon.png', // Replace with your car icon URL
                scaledSize: new google.maps.Size(30, 30) // Adjust size as needed
            }
        });

        const destinationMarker = new google.maps.Marker({
//            position: { lat: -34.397, lng: 150.644 }, // Replace with actual coordinates
            map: map,
            title: "Destination",
            icon: {
                url: 'img/flag-icon.png', // Replace with your flag icon URL
                scaledSize: new google.maps.Size(30, 30) // Adjust size as needed
            }
        });

        // Check if the stop is empty
        if (stop.trim() === "") {
            const request = {
                origin: pickup,
                destination: destination,
                travelMode: google.maps.TravelMode.DRIVING
            };

            directionsService.route(request, (result, status) => {
                if (status === 'OK') {
                    directionsRenderer.setDirections(result);
                } else {
                    console.error('Directions request failed due to ' + status);
                }
            });
        } else {
            const request = {
                origin: pickup,
                destination: destination,
                waypoints: [{ location: stop }],
                travelMode: google.maps.TravelMode.DRIVING
            };

            directionsService.route(request, (result, status) => {
                if (status === 'OK') {
                    directionsRenderer.setDirections(result);
                } else {
                    console.error('Directions request failed due to ' + status);
                }
            });
        }
    }
</script>
								
							
                            </div>							
														
																									
			
                        </div>						
			
                        <div class="modal-footer">							
			
                            <a href="#" class="btn btn-danger">								
			
                                <i class="ti ti-circle-x"></i>						
				
                                Cancel Booking           														
				
                            </a>  
			
                            <a class="btn btn-success ms-auto" href="approve-jobs.php?job_id=<?php echo $jobrow['job_id'] ?>">
			
                                <i class="ti ti-plane-tilt"></i>						
				
                                Approve Booking  																
				
                            </a>						
			
                        </div> 									
			
                    </div>			
		
                </div>		
		
            </div>															
	
        </div>
	
    </form>	
</div>   
<script>
    function validateForm() {        
        var selectedDriver = document.getElementById("driverSelect").value;        
        if (selectedDriver === "") {            
            alert("Please select a driver before dispatching job.");
        } else {           
            document.getElementById("jobform").submit();
        }
    }
</script>
<?php
include('footer.php');
?>