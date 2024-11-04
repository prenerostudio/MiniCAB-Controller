<script>       
    function updateprice() {           					
        var input1_4pass = parseFloat(document.getElementsByName("1-4pass")[0].value);            							
        var percentage_1_4es = 1.2;  // 20%            			
        var percentage_5_6pass = 1.3;  // 30%            			
        var percentage_7pass = 1.4;    // 10%						
        var percentage_8pass = 01.5;    // 10%						
        var percentage_9pass = 1.6;    // 10%						
        var percentage_10_14pass = 1.7;						
        var percentage_15_16pass = 1.8;// 10%            	        	
        // Perform calculations            			
        var result_1_4es = input1_4pass * percentage_1_4es;            			
        var result_5_6pass = input1_4pass * percentage_5_6pass;            			
        var result_7pass = input1_4pass * percentage_7pass;			 			
        var result_8pass = input1_4pass * percentage_8pass;			 			
        var result_9pass = input1_4pass * percentage_9pass;			 			
        var result_10_14pass = input1_4pass * percentage_10_14pass;			 			
        var result_15_16pass = input1_4pass * percentage_15_16pass;            	        	
        // Update readonly input fields            			
        document.getElementsByName("1-4es")[0].value = result_1_4es.toFixed(2);            			
        document.getElementsByName("5-6pass")[0].value = result_5_6pass.toFixed(2);            			
        document.getElementsByName("7pass")[0].value = result_7pass.toFixed(2);			 			
        document.getElementsByName("8pass")[0].value = result_8pass.toFixed(2);			 			
        document.getElementsByName("9pass")[0].value = result_9pass.toFixed(2);			 			
        document.getElementsByName("10_14pass")[0].value = result_10_14pass.toFixed(2);			 			
        document.getElementsByName("15_16pass")[0].value = result_15_16pass.toFixed(2);			
    }    	
</script>					
<div class="card-body">   						
    <style>           	
        #suggestions-container {            			
            display: none;            				
            position: absolute;            				
            border: 1px solid #ccc;            				
            max-height: 150px;            				
            overflow-y: auto;            				
            width: 298px;	
            margin-top: 2px;							
            background: #FFFFFF;        				
        }								        			
        .suggestion {            			
            padding: 8px;            				
            cursor: pointer;        				
        }								        			
        .suggestion:hover {            			
            background-color: #f0f0f0;        				
        }    			
    </style>								
    <h2 class="mb-4">Postcode Area Prices (PAPs)</h2>  	
    <p>
        Postcode Area Pricing lets you define fixed prices between any 2 or more postcode areas within the UK, regardless of your base location or mileage rates. So if you want to offer a competitive, fixed rate to minicabit customers to/from/between popular base postcode areas, just enter the first section of any single or group of postcodes.        
    </p>
    <br><br>	
    <ul>								
        <li>From one postcode to another (eg. NW5 to SE11)</li>			
        <li>From one postcode to many postcodes (eg. NW5 to SE10, SE11)</li>			
        <li>From many postcodes to many postcodes (eg. NW5, NW6 to SE10, SE11)</li>										
    </ul>
    <br><br>   
    <p>
        Enter your price for a 4 passenger saloon vehicle below and prices will automatically be created for other vehicle sizes based upon your % or £ uplifts.<br><br>	
	Note that any Postcode Area Prices covering a particular route will take priority over any existing Location Price, Per Mile Price (PMP) and minimum fare for that same route.		    
    </p>	
    <hr>																					
    <form method="post" action="pp_process.php" enctype="multipart/form-data">
        <table class="table">									
            <tbody>  												
                <tr>          															
                    <td style="width: 20%;"><p>Pickup (Postcode)</p></td>          																	
                    <td style="width: 20%;"><p>Dropoff (Postcode)</p></td>							
                    <td>		
                        <p align="center">			
                            <span>1-4 Seater</span>			
                            <br>Salon  /<strong style="font-weight: 700"> Mile</strong>	
                        </p>
                    </td>
                    <td>
                        <p align="center">
                            <span>1-4 Seater</span>
                            <br>Estate  /<strong style="font-weight: 700"> Mile</strong>	
                        </p>
                    </td>
                    <td>
                        <p align="center">
                            <span>5-6 Seater</span>
                            <br>MPV  /<strong style="font-weight: 700"> Mile</strong>	
                        </p>
                    </td>
                    <td>
                        <p align="center">
                            <span>1-4 Seater</span>
                            <br>Executive Salon  /<strong style="font-weight: 700"> Mile</strong>	
                        </p>
                    </td>
                    <td>
                        <p align="center">
                            <span>8-9 Seater</span>
                            <br>Large MPV  /<strong style="font-weight: 700"> Mile</strong>	
                        </p>
                    </td>
                    <td>
                        <p align="center">
                            <span>8-9 Seater</span>
                            <br>Excutive Large MPV  /<strong style="font-weight: 700"> Mile</strong>	
                        </p>
                    </td>
                    <td>
                        <p align="center">
                            <span>10-14 Seater</span>
                            <br>MiniBus  /<strong style="font-weight: 700"> Mile</strong>	
                        </p>
                    </td>
                    <td>
                        <p align="center">
                            <span>Parcel </span>
                            <br>Courier - Delivery  /<strong style="font-weight: 700"> Mile</strong>	
                        </p>
                    </td>
                </tr> 
                <tr>
                    <td>
                        <input type="text" class="form-control" name="pickup" required id="pickup">			                        			                        			
                    </td>
                    <td>
                        <input type="text" class="form-control" name="dropoff" id="dropoff" required />
                    </td>
                    <td>
                        <input type="text" class="form-control" name="salon" required />
                    </td>
                    <td>
                        <input type="text" class="form-control" name="estate" required>
                    </td>
                    <td>
                        <input type="text" class="form-control" name="mpv" required>
                    </td>
                    <td>
                        <input type="text" class="form-control" name="esalon" required>
                    </td>
                    <td>
                        <input type="text" class="form-control" name="lmpv" required>
                    </td>
                    <td>
                        <input type="text" class="form-control" name="empv" required>
                    </td>
                    <td>
                        <input type="text" class="form-control" name="minibus" required>
                    </td>
                    <td>
                        <input type="text" class="form-control" name="delivery" required>
                    </td>
                </tr>
            </tbody>
            <tfoot>
                <tr>															
                    <td></td>																	
                    <td></td>																	
                    <td></td>																	
                    <td></td>																	
                    <td></td>																	
                    <td></td>																	
                    <td></td>																	
                    <td></td>											
                    <td></td>          																	
                    <td>            																	
                        <button type="submit" class="btn btn-danger">								
                            Save Records									
                        </button>          																				
                    </td>        																	
                </tr>      															
            </tfoot>    											
	</table>  									
    </form>																													
    <table class="table table-responsive">
        <thead>        										
            <tr>          												
                <td><p>Pickup (Postcode)</p></td>          																	
                <td><p>Dropoff (Postcode)</p></td>							
                <td>
                    <p align="center">
                        <span>1-4 Seater</span>
                        <br>Saloon  /<strong style="font-weight: 700"> Mile</strong>	
                    </p>
                </td>						
                <td>
                    <p align="center">
                        <span>1-4 Seater</span>
                        <br>Estate  /<strong style="font-weight: 700"> Mile</strong>	
                    </p>
                </td>						
                <td>
                    <p align="center">
                        <span>5-6 Seater</span>
                        <br>MPV  /<strong style="font-weight: 700"> Mile</strong>	
                    </p>
                </td>						
                <td>
                    <p align="center">
                        <span>1-4 Seater</span>
                        <br>Executive Saloon  /<strong style="font-weight: 700"> Mile</strong>	
                    </p>
                </td>						
                <td>
                    <p align="center">
                        <span>8-9 Seater</span>
                        <br>Large MPV  /<strong style="font-weight: 700"> Mile</strong>
                    </p>
                </td>						
                <td>
                    <p align="center">
                        <span>8-9 Seater</span>
                        <br>Excutive Large MPV  /<strong style="font-weight: 700"> Mile</strong>	
                    </p>
                </td>						
                <td>
                    <p align="center">
                        <span>10-14 Seater</span>
                        <br>MiniBus  /<strong style="font-weight: 700"> Mile</strong>	
                    </p>
                </td>						
                <td>
                    <p align="center">
                        <span>Parcel </span>
                        <br>Courier - Delivery  /<strong style="font-weight: 700"> Mile</strong>	
                    </p>
                </td>		
                <td>Actions</td>		
            </tr>      												
        </thead>											  										
        <tbody>																						
	<?php												  											
        $pmsql=mysqli_query($connect,"SELECT * FROM `price_postcode`");			
        while($pmrow = mysqli_fetch_array($pmsql)){			
            ?>																								
            <tr align="center">	
                <td><?php echo $pmrow['pickup'];?></td>					
                <td><?php echo $pmrow['dropoff'];?></td>					
                <td><?php echo $pmrow['saloon'];?></td>					
                <td><?php echo $pmrow['estate'];?></td>					
                <td><?php echo $pmrow['mpv'];?></td>					
                <td><?php echo $pmrow['esaloon'];?></td>					
                <td><?php echo $pmrow['lmpv'];?></td>					
                <td><?php echo $pmrow['empv'];?></td>					
                <td><?php echo $pmrow['minibus'];?></td>					
                <td><?php echo $pmrow['delivery'];?></td>			
                <td>		
                    <a class="btn btn-info button_padding" href="edit-postcode-price.php?pp_id=<?php echo $pmrow['pp_id'] ?>" title="Edit">																			
                        <i class="ti ti-pencil"></i>
                    </a>				
                    <a class="btn btn-danger button_padding" href="del-price-postcode.php?pp_id=<?php echo $pmrow['pp_id'] ?>" title="Cancel">														
                        <i class="ti ti-square-rounded-x"></i>														
                    </a>		
                </td>
            </tr>
	<?php
        }	
        ?>	
        </tbody>																				
    </table>																		
</div>	

<script>
    function initAutocomplete() {            
        var pickupInput = document.getElementById('pickup');                
        var dropoffInput = document.getElementById('dropoff');       
        var journeyDistanceInput = document.getElementById('journeyDistance');		                
        var autocompleteOptions = {        
            types: ['geocode'],  // Restrict to geocoded addresses                            
            componentRestrictions: {country: 'GB'}  // Restrict to the UK
        };				

        // Initialize Google Places autocomplete for pickup and dropoff fields                
        var autocompletePickup = new google.maps.places.Autocomplete(pickupInput, autocompleteOptions);    
        var autocompleteDropoff = new google.maps.places.Autocomplete(dropoffInput, autocompleteOptions);    

        // Add event listeners for when a place is selected
        autocompletePickup.addListener('place_changed', function () {
            updateDistance();        
            updateJourneyFare();        
        });                
        autocompleteDropoff.addListener('place_changed', function () {        
            updateDistance();        
            updateJourneyFare();        
        });

        // Function to calculate the distance between pickup and dropoff locations
        function updateDistance() {                        
            var pickupPlace = autocompletePickup.getPlace();                            
            var dropoffPlace = autocompleteDropoff.getPlace();			                            
            if (pickupPlace.geometry && dropoffPlace.geometry) {                    
                calculateDistance(pickupPlace.geometry.location, dropoffPlace.geometry.location);                
            }        
        }		            

        // Function to calculate the distance using Google DistanceMatrixService
        function calculateDistance(pickupLocation, dropoffLocation) {            
            var service = new google.maps.DistanceMatrixService();            
            service.getDistanceMatrix({                
                origins: [pickupLocation],                    
                destinations: [dropoffLocation],                    
                travelMode: 'DRIVING',            
            }, function(response, status) {                
                if (status === 'OK' && response.rows.length > 0) {                
                    var distanceText = response.rows[0].elements[0].distance.text;                    
                    var distanceValue = parseFloat(distanceText.replace(/[^\d.]/g, ''));        
                    if (!isNaN(distanceValue)) {                						                        
                        journeyDistanceInput.value = distanceValue.toFixed(2);  // Set distance in input field                         
                        updateJourneyFare(distanceValue);                        
                    } else {                        
                        console.error('Invalid distance value:', distanceText);                        
                    }               
                } else {            					                
                    console.error('Error calculating distance:', status);                
                }        
            });
        }   
    }

    // Load the initAutocomplete function on window load
    google.maps.event.addDomListener(window, 'load', initAutocomplete);  
</script>
