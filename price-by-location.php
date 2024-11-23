
<div class="card-body">							

    <h2 class="mb-4">	

        Add a location price for a 4-seater		
	
    </h2>								

    <p align="justify">	

        Enter your Location Prices for each Petrol, Diesel & Hybrid vehicle type<br><br>		
	
        Location Prices lets you define fixed prices between any 2 zones within the UK, regardless of your base location or mileage rates. So if you want to offer a competitive, fixed rate to customers between other cities & towns and your area, just enter 2 full postcodes and how many miles - as the crow flies - around each one the price would apply. For instance, you could enter the full postcode for a rail station in both a nearby city and one in the centre of your own city/town.<br><br>		
	
        Note that any Location Prices covering a particular route will take priority over any existing Per Mile Price (PMP) and minimum fare for that same route. However, it will be overridden by any Postcode Area Price for that route.<br><br>Enter your price for a 4 passenger saloon vehicle below and we will automatically create prices for other vehicles sizes based upon your % or £ uplifts for each vehicle size.
	
    </p>								

    <div class="row">								

        <form method="post" action="pbl-process.php">										
	
            <table class="table table-responsive">											
	
                <tbody>													
		
                    <tr>									  					
		
                        <td>						
			
                            <strong> Vehicle Type </strong> 							
			
                        </td>
			
                        <td>						
			
                            <strong> Start Postcode </strong>							
			
                        </td>										 						
			
                        <td>&nbsp;</td>									  						
			
                        <td style="width: 8%;">						
			
                            <strong>Radius</strong>							
			
                        </td>																
			
                        <td>&nbsp;</td>									  						
			
                        <td>						
			
                            <strong>Finish Postcode</strong>							
			
                        </td>																
			
                        <td>&nbsp;</td>									  						
			
                        <td style="width: 8%;">						
			
                            <strong>Radius</strong>							
			
                        </td>										 						
			
                        <td>&nbsp;</td>									 						
			
                        <td>						
			
                            <strong>Single Price</strong>							
			
                        </td>																									
			
                    </tr>														
		
                    <tr>									  					
		
                        <td>1-4 Passenger</td>									  						
			
                        <td>						
			
                            <input type="text" class="form-control" name="st_post" required>							
			
                        </td>									  						
			
                        <td>Within</td>									  						
			
                        <td>						
			
                            <input type="text" class="form-control" name="st_mile" required>							
			
                        </td>									  						
			
                        <td>Miles</td>									  						
			
                        <td>						
			
                            <input type="text" class="form-control" name="fn_code" required>							
			
                        </td>																
			
                        <td>Within</td>									  						
			
                        <td>						
			
                            <input type="text" class="form-control" name="fn_mile" required>							
			
                        </td>																
			
                        <td>Miles</td>									  						
			
                        <td>						
			
                            <input type="text" class="form-control" name="single_price" required>							
			
                        </td>															
			
                    </tr>														
		
                    <tr>									  								
		
                        <td colspan="10" style="height: 250px;">						
			
                            <div id="post_map"> </div>																			
			
                        </td>												
			
                    </tr>														
		
                    <tr>														
		
                        <td>&nbsp;</td>															
			
                        <td>&nbsp;</td>															
			
                        <td>&nbsp;</td>															
			
                        <td>&nbsp;</td>															
			
                        <td>&nbsp;</td>								
			
                        <td>&nbsp;</td>																
			
                        <td>&nbsp;</td>									 						
			
                        <td>&nbsp;</td>																
			
                        <td>&nbsp;</td>									 						
			
                        <td>						
			
                            <button class="btn btn-info">							
			
                                <i class="ti ti-plus"></i>   								
				
                                Add								
				
                            </button>							
			
                        </td>															
			
                    </tr>													
		
                </tbody>												
		
            </table>										
	
        </form>														
	
    </div>											
</div>												      
<script>								          					        

    function initMap() {            								            	

        var map = new google.maps.Map(document.getElementById('post_map'), {                		
	
            center: { lat: 52.374490, lng: -0.713289 },                			
	
            zoom: 10            			
	
        });								   								            		
	
        function updateMap() {                		
	
        var stPostcode = $('input[name="st_post"]').val();                			
	
        var fnCode = $('input[name="fn_code"]').val();  					               			
	
        geocodeAddress(stPostcode, function(stCoordinates) {                    			
	
        geocodeAddress(fnCode, function(fnCoordinates) {				
	
        map.setCenter(stCoordinates);                        					
	
        drawCircle(map, stCoordinates);                        					
	
        drawCircle(map, fnCoordinates);                    					
	
    });                				

    });            			

    }								            								            		

        function geocodeAddress(postcode, callback) {                		
	
        var geocoder = new google.maps.Geocoder();                			
	
        geocoder.geocode({ 'address': postcode }, function (results, status) {                    			
	
        if (status === 'OK') {                        				
	
            var location = results[0].geometry.location;                        					
	
            var coordinates = { lat: location.lat(), lng: location.lng() };					
	
            callback(coordinates);                    					
	
        } else {                        				
	
            console.error('Geocode was not successful for the following reason: ' + status);					
	
        }                				
	
    });            			

    }								            								            		

        function drawCircle(map, coordinates) {                		
	
        var circle = new google.maps.Circle({                    			
	
            strokeColor: '#FF0000',                    				
	
            strokeOpacity: 0.8,                    				
	
            strokeWeight: 2,                    				
	
            fillColor: '#FF0000',                    				
	
            fillOpacity: 0.35,                    				
	
            map: map,                    				
	
            center: coordinates,                    				
	
            radius: 10000                				
	
        });            			
	
    }								            						            		
	
    
        $('input[name="st_post"], input[name="fn_code"]').on('input', updateMap);
	
    }        							        	

    google.maps.event.addDomListener(window, 'load', initMap);    	
</script>						
<div class="card-body">

    <h2 class="mb-4">Locations</h2>								

    <div class="row">																

        <table class="table table-responsive">										
	
            <tbody>											
	
                <tr>														
		
                    <td>					
		
                        <strong>ID</strong>						
			
                    </td>									 					
		
                    <td>					
		
                        <strong>Vehicle Type</strong> 						
			
                    </td>									  					
		
                    <td>					
		
                        <strong>Start Postcode</strong>						
			
                    </td>										
		
                    <td>					
		
                        <strong>Finish Postcode</strong>						
			
                    </td>																			 					
		
                    <td>					
		
                        <strong>Single Price</strong>						
			
                    </td>														
		
                </tr>													
		
		<?php														

                $n=0;														
		
                $pblsql=mysqli_query($connect,"SELECT * FROM `price_by_location`");				
		
                while($pblrow = mysqli_fetch_array($pblsql)){					
		
                    $n++;															
		
                    ?>										
		
                <tr>									 				
		
                    <td><?php echo $n ?></td>			 					
		
                    <td><?php echo $pblrow['vehicle_type']; ?></td>								  					
		
                    <td><?php echo $pblrow['st_post']; ?></td>													
		
                    <td><?php echo $pblrow['fn_post']; ?></td>					
		
                    <td><?php echo $pblrow['single_price']; ?></td>					
		
                </tr>													
		
		<?php														

                }															
		
                ?>				
		
            </tbody>											
	
        </table>									
	
    </div>											
</div>