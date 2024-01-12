<?php
include('header.php');	
?> 
<div class="page-header d-print-none page_padding pb-3">		   		
	<div class="row g-2 align-items-center">        	
		<div class="col">            								
			<div class="page-pretitle">                			
				Overview                				
			</div>                			
			<h2 class="page-title">                			
				Pricing Section                				
			</h2>              			
		</div>		
			
	</div>	
</div>
 <script>
        function updateValues() {
            // Get the input values
            var input1_4p = parseFloat(document.getElementsByName("1-4p")[0].value);

            // Define percentages
            var percentage_1_4e = 1.2;  // 20%
            var percentage_5_6p = 1.3;  // 30%
            var percentage_7p = 1.4;    // 10%
			var percentage_8p = 1.5;    // 10%
			var percentage_9p = 1.6;    // 10%
			var percentage_10_14p = 1.7;
			var percentage_15_16p = 1.8;// 10%
            // Add more percentages as needed

            // Perform calculations
            var result_1_4e = input1_4p * percentage_1_4e;
            var result_5_6p = input1_4p * percentage_5_6p;
            var result_7p = input1_4p * percentage_7p;
			 var result_8p = input1_4p * percentage_8p;
			 var result_9p = input1_4p * percentage_9p;
			 var result_10_14p = input1_4p * percentage_10_14p;
			 var result_15_16p = input1_4p * percentage_15_16p;
            // Add more calculations as needed

            // Update readonly input fields
            document.getElementsByName("1-4e")[0].value = result_1_4e.toFixed(2);
            document.getElementsByName("5-6p")[0].value = result_5_6p.toFixed(2);
            document.getElementsByName("7p")[0].value = result_7p.toFixed(2);
			 document.getElementsByName("8p")[0].value = result_8p.toFixed(2);
			 document.getElementsByName("9p")[0].value = result_9p.toFixed(2);
			 document.getElementsByName("10_14p")[0].value = result_10_14p.toFixed(2);
			 document.getElementsByName("15_16p")[0].value = result_15_16p.toFixed(2);
            // Update more readonly input fields as needed
        }
    </script>
<div class="row row-deck row-cards"> 	 	    	                                                                                       
	<div class="col-md-12">                	
		<div class="card">                  		
			<div class="card-header">                  			
				<ul class="nav nav-tabs card-header-tabs nav-fill" data-bs-toggle="tabs">                    				
					<li class="nav-item">                      					
						<a href="#tabs-mile" class="nav-link active" data-bs-toggle="tab">							                          					
							<i class="ti ti-brand-speedtest" style="font-size: 28px;"></i>                         							
							Price Per Mile				
						</a>                     
					</li>                      					
					<li class="nav-item">                       					
						<a href="#tabs-loc" class="nav-link" data-bs-toggle="tab">	
							<i class="ti ti-map-pin" style="font-size: 28px;"></i>
							
							Location Prices					
						</a>                     					
					</li>  
					<li class="nav-item">                       					
						<a href="#tabs-post" class="nav-link" data-bs-toggle="tab">							                         						
							<i class="ti ti-map-search" style="font-size: 28px;"></i>
							Postcode Area Prices					
						</a>                     					
					</li>  					
					<li class="nav-item">                       					
						<a href="#tabs-meet" class="nav-link" data-bs-toggle="tab">							                         						
							<i class="ti ti-route-alt-left" style="font-size: 28px;"></i>
							Meet & Greet Charges					
						</a>                     					
					</li>  
				</ul>                			
			</div>                 			
			<div class="card-body">                  			
				<div class="tab-content"> 					
					<!--Price by Miles-->
					<div class="tab-pane active show" id="tabs-mile">						           	
							<div class="card">				
								<div class="row g-0">                    							
									<div class="col-12 col-md-12 d-flex flex-column">        										
										<div class="card-body">            									
											<h2 class="mb-4">Mileage rate</h2>  
											<hr>
											<h3>Mile range: £ per mile rate incl. 12% MiniCAB commission (and VAT)</h3>							
											<p align="justify">Enter your mileage rates for each Petrol, Diesel & Hybrid vehicle type<br><br>
												Note that Per Mile Price mileage rates apply to the total distance from your office to the pickup point to the drop-off point unless you have set a Free Pickup Postcode Area. When you edit the mileage ranges and rates, the Price Per Mile Calculator will show you how your pricing relates to typical distances, factoring in any uplifts for larger vehicle sizes, so you can evaluate how competitive you are.
											</p>
											<form method="post" action="mp_process.php" enctype="multipart/form-data">
												<table class="table table-responsive" id="myTable">  
													<thead>        
														<tr>          
															<th><p>From (miles)</p></th>          
															<th><p>To (miles)</p></th>          
															<th><p align="center"><span>1-4</span><br>Passenger</p></th>          
															<th><p align="center"><span>1-4</span><br>Estate</p></th>          
															<th><p align="center"><span>5-6</span><br>Passenger</p></th>          
															<th><p align="center"><span>7</span><br>Passenger</p></th>          
															<th><p align="center"><span>8</span><br>Passenger</p></th>          
															<th><p align="center"><span>9</span><br>Passenger</p></th>          
															<th><p align="center"><span>10-14</span><br>Passenger</p></th>          
															<th><p align="center"><span>15-16</span><br>Passenger</p></th>        
														</tr>      
													</thead>      
													<tbody>        
														<tr>          
															<td><input type="text" class="form-control" name="from" required></td>          
															<td><input type="text" class="form-control" name="to" required></td>          
															<td><input type="text" class="form-control" name="1-4p" oninput="updateValues()" required></td>          
															<td><input type="text" class="form-control" name="1-4e" readonly></td>          
															<td><input type="text" class="form-control" name="5-6p" readonly></td>          
															<td><input type="text" class="form-control" name="7p" readonly></td>          
															<td><input type="text" class="form-control" name="8p" readonly></td>          
															<td><input type="text" class="form-control" name="9p" readonly></td>          
															<td><input type="text" class="form-control" name="10_14p" readonly></td>          
															<td><input type="text" class="form-control" name="15_16p" readonly></td>        
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
																<button type="submit" class="btn btn-danger">Save Records</button>          
															</td>        
														</tr>      
													</tfoot>    
												</table>  
											</form>																						
											<table class="table table-responsive">
												<thead>        
														<tr>          
															<th style="background: #FFFFFF; color: #3A3A3A;"><p>From (miles)</p></th>          
															<th style="background: #FFFFFF; color: #3A3A3A;"><p>To (miles)</p></th>          
															<th style="background: #FFFFFF; color: #3A3A3A;"><p align="center"><span>1-4</span><br>Passenger</p></th>          
															<th style="background: #FFFFFF; color: #3A3A3A;"><p align="center"><span>1-4</span><br>Estate</p></th>          
															<th style="background: #FFFFFF; color: #3A3A3A;"><p align="center"><span>5-6</span><br>Passenger</p></th>          
															<th style="background: #FFFFFF; color: #3A3A3A;"><p align="center"><span>7</span><br>Passenger</p></th>          
															<th style="background: #FFFFFF; color: #3A3A3A;"><p align="center"><span>8</span><br>Passenger</p></th>          
															<th style="background: #FFFFFF; color: #3A3A3A;"><p align="center"><span>9</span><br>Passenger</p></th>          
															<th style="background: #FFFFFF; color: #3A3A3A;"><p align="center"><span>10-14</span><br>Passenger</p></th>          
															<th style="background: #FFFFFF; color: #3A3A3A;"><p align="center"><span>15-16</span><br>Passenger</p></th>        
														</tr>      
													</thead>											  
												<tbody>												
													<?php												  
													$pmsql=mysqli_query($connect,"SELECT * FROM `price_mile` ");					
													while($pmrow = mysqli_fetch_array($pmsql)){													  
													?>												
													<tr align="center">												  
														<td><?php echo $pmrow['start_from'];?></td>												  
														<td><?php echo $pmrow['end_to'];?></td>												  
														<td><?php echo $pmrow['1_4p'];?></td>												  
														<td><?php echo $pmrow['1_4e'];?></td>												  
														<td><?php echo $pmrow['5_6p'];?></td>												  
														<td><?php echo $pmrow['7p'];?></td>												  
														<td><?php echo $pmrow['8p'];?></td>												  
														<td><?php echo $pmrow['9p'];?></td>												  
														<td><?php echo $pmrow['10_14p'];?></td>												  
														<td><?php echo $pmrow['15_16p'];?></td>												
													</tr>												  
													<?php					
													}						
													?>												  											  
												</tbody>											
											</table>											
										</div>
									</div>            									
								</div>         							
						</div>
					</div> 						
					<!--Price by Locations-->										
					<div class="tab-pane" id="tabs-loc">                    										
						<div class="card-body">				
							<h2 class="mb-4">Add a location price for a 4-seater</h2>
							<p align="justify">Enter your Location Prices for each Petrol, Diesel & Hybrid vehicle type<br><br>
								Location Prices lets you define fixed prices between any 2 zones within the UK, regardless of your base location or mileage rates. So if you want to offer a competitive, fixed rate to customers between other cities & towns and your area, just enter 2 full postcodes and how many miles - as the crow flies - around each one the price would apply. For instance, you could enter the full postcode for a rail station in both a nearby city and one in the centre of your own city/town.<br><br>
								Note that any Location Prices covering a particular route will take priority over any existing Per Mile Price (PMP) and minimum fare for that same route. However, it will be overridden by any Postcode Area Price for that route.<br><br>Enter your price for a 4 passenger saloon vehicle below and we will automatically create prices for other vehicles sizes based upon your % or £ uplifts for each vehicle size
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
														<i class="ti ti-plus"></i>   Add
													</button>
												</td>									
											</tr>								
										</tbody>								
									</table>							
								</form>												
							</div>										
						</div>   	
						
						      <script>
        // Function to initialize the map
        function initMap() {
            // Create an initial map with default coordinates
            var map = new google.maps.Map(document.getElementById('post_map'), {
                center: { lat: 0, lng: 0 },
                zoom: 10
            });

            // Function to update the map based on input values
            function updateMap() {
                var stPostcode = $('input[name="st_post"]').val();
                var fnCode = $('input[name="fn_code"]').val();

                // Geocode the postcodes to get coordinates
                geocodeAddress(stPostcode, function(stCoordinates) {
                    geocodeAddress(fnCode, function(fnCoordinates) {
                        // Update the map center and redraw circles
                        map.setCenter(stCoordinates);
                        drawCircle(map, stCoordinates);
                        drawCircle(map, fnCoordinates);
                    });
                });
            }

            // Function to geocode a postcode to get coordinates
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

            // Function to draw a circle on the map
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

            // Call updateMap when input values change
            $('input[name="st_post"], input[name="fn_code"]').on('input', updateMap);
        }

        // Call the initMap function when the page is loaded
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
					</div>   					
					<!--Price by Postcodes-->					
					<div class="tab-pane" id="tabs-post">                    																		
						<script>       
							function updateprice() {           
								// Get the input values          
								var input1_4pass = parseFloat(document.getElementsByName("1-4pass")[0].value);            
								// Define percentages            
								var percentage_1_4es = 1.2;  // 20%            
								var percentage_5_6pass = 1.3;  // 30%            
								var percentage_7pass = 1.4;    // 10%			
								var percentage_8pass = 01.5;    // 10%			
								var percentage_9pass = 1.6;    // 10%			
								var percentage_10_14pass = 1.7;			
								var percentage_15_16pass = 1.8;// 10%            
								// Add more percentages as needed            
								// Perform calculations            
								var result_1_4es = input1_4pass * percentage_1_4es;            
								var result_5_6pass = input1_4pass * percentage_5_6pass;            
								var result_7pass = input1_4pass * percentage_7pass;			 
								var result_8pass = input1_4pass * percentage_8pass;			 
								var result_9pass = input1_4pass * percentage_9pass;			 
								var result_10_14pass = input1_4pass * percentage_10_14pass;			 
								var result_15_16pass = input1_4pass * percentage_15_16pass;            
								// Add more calculations as needed								
            
								// Update readonly input fields            
								document.getElementsByName("1-4es")[0].value = result_1_4es.toFixed(2);            
								document.getElementsByName("5-6pass")[0].value = result_5_6pass.toFixed(2);            
								document.getElementsByName("7pass")[0].value = result_7pass.toFixed(2);			 
								document.getElementsByName("8pass")[0].value = result_8pass.toFixed(2);			 
								document.getElementsByName("9pass")[0].value = result_9pass.toFixed(2);			 
								document.getElementsByName("10_14pass")[0].value = result_10_14pass.toFixed(2);			 
								document.getElementsByName("15_16pass")[0].value = result_15_16pass.toFixed(2);
            
								// Update more readonly input fields as needed        
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
							<p>Postcode Area Pricing lets you define fixed prices between any 2 or more postcode areas within the UK, regardless of your base location or mileage rates. So if you want to offer a competitive, fixed rate to minicabit customers to/from/between popular base postcode areas, just enter the first section of any single or group of postcodes.<br><br>
							<ul>							
								<li>From one postcode to another (eg. NW5 to SE11)</li>
								<li>From one postcode to many postcodes (eg. NW5 to SE10, SE11)</li>
								<li>From many postcodes to many postcodes (eg. NW5, NW6 to SE10, SE11)</li>							
							</ul><br><br>
							Enter your price for a 4 passenger saloon vehicle below and prices will automatically be created for other vehicle sizes based upon your % or £ uplifts.<br><br>
							Note that any Postcode Area Prices covering a particular route will take priority over any existing Location Price, Per Mile Price (PMP) and minimum fare for that same route.
							</p>
							<hr>																					
							<form method="post" action="pp_process.php" enctype="multipart/form-data">  																		
								<table class="table">  																										
									<tbody>  									
										<tr>          										
											<td><p>Pickup (Postcode)</p></td>          											
											<td><p>Dropoff (Postcode)</p></td>          											
											<td><p align="center"><span>1-4</span><br>Passenger</p></td>          											
											<td><p align="center"><span>1-4</span><br>Estate</p></td>          											
											<td><p align="center"><span>5-6</span><br>Passenger</p></td>          											
											<td><p align="center"><span>7</span><br>Passenger</p></td>          											
											<td><p align="center"><span>8</span><br>Passenger</p></td>          											
											<td><p align="center"><span>9</span><br>Passenger</p></td>          											
											<td><p align="center"><span>10-14</span><br>Passenger</p></td>          											
											<td><p align="center"><span>15-16</span><br>Passenger</p></td>        											
										</tr> 										
										<tr>          										
											<td>
												<input type="text" class="form-control" name="pickup" required id="postcode-input" autocomplete="off" />
												 
    
												<div id="suggestions-container"></div>

    
												<script>
        
													// Dummy data for postal code suggestions (replace this with your actual data)

													const postalCodeSuggestions = [
			"W8", "NW6", "W5", "TW3", "TW4", "TW9", "UB10", "WC1", "W9", "EN1", "EN2", "EN5", "IG11", "HA2", "BR1", "GL1", "E5", "E6", "E7", "E8", "E9", "EC1", "EC4", "E15", "E17", "E2", "E3", "E4", "E1", "E10", "E11", "E12", "E13", "E14", "CR0", "SE13", "SE14", "SE15", "SE16", "SE17", "SE18", "SE19", "SE2", "SE21", "SE22", "SW16", "SW18", "SW19", "SW2", "SW11", "SW12", "SW13", "SW14", "SW15", "SW3", "SW4", "SW6", "SW7", "SW8", "SW9", "NW10", "NW11", "NW2", "NW3", "NW4", "N2", "N20", "N21", "N22", "N3", "N4", "N5", "N6", "N7", "N8", "M60", "SE1", "SE10", "SE12", "SE23", "SE24", "SE25", "SE26", "SE3", "SE4", "SE6", "SE7", "SE8", "SE9", "N1", "N10", "N11", "N12", "N13", "N14", "N15", "N16", "N17", "N18", "N19", "TW10", "TW12", "TW13", "NW5", "NW7", "NW8", "W1", "W10", "W11", "W13", "W14", "W2", "W3", "W4", "W6", "W7", "TW5", "TW7", "TW8", "TW9", "UB1", "UB2", "UB3", "UB4", "UB5", "UB6", "WC1", "WC2", "EN3", "EN4", "IG1", "IG3", "IG6", "IG8", "IG8", "GU8", "HA0", "HA1", "HA3", "HA4", "HA5", "BN2", "BR2", "BR3", "BR4", "BR5", "BR6", "BR7", "GU16", "GU22", "GU27", "GU1", "GU12", "HA6", "HA7", "HA8", "HA9", "GU29", "GU3", "GU30", "GU32", "GU34", "GU35", "GU5", "G2", "EC2", "EC3", "E16", "E18", "E1", "CR4", "CR5", "CR8", "DA14", "DA15", "DA16", "DA17", "SE17", "SE19", "SE20", "SE20", "SW19", "SW1"					
        ];

        
													const postcodeInput = document.getElementById("postcode-input");
        
													const suggestionsContainer = document.getElementById("suggestions-container");

        
													// Event listener for input changes
        
													postcodeInput.addEventListener("input", function() {
            
														const inputText = this.value.trim();
            
														filterSuggestions(inputText);
        
													});

        
													// Function to filter and display suggestions
        
													function filterSuggestions(input) {
            
														const filteredSuggestions = postalCodeSuggestions.filter(suggestion =>
                
																				suggestion.startsWith(input)
            
																												);

            displaySuggestions(filteredSuggestions);
														
        }

        // Function to display suggestions in the container
        function displaySuggestions(suggestions) {
            if (suggestions.length > 0) {
                const suggestionHTML = suggestions.map(suggestion =>
                    `<div class="suggestion" onclick="selectSuggestion('${suggestion}')">${suggestion}</div>`
                ).join('');

                suggestionsContainer.innerHTML = suggestionHTML;
                suggestionsContainer.style.display = "block";
            } else {
                suggestionsContainer.innerHTML = "";
                suggestionsContainer.style.display = "none";
            }
        }

        // Function to select a suggestion and fill the input field
        function selectSuggestion(suggestion) {
            postcodeInput.value = suggestion;
            suggestionsContainer.style.display = "none";
        }

        // Close suggestions container when clicking outside of it
        document.addEventListener("click", function(event) {
            if (!event.target.matches("#postcode-input") && !event.target.matches(".suggestion")) {
                suggestionsContainer.style.display = "none";
            }
        });
    </script>
											</td>          											
											<td>
												<input type="text" class="form-control" name="dropoff" required />
											</td>          											
											<td>
												<input type="text" class="form-control" name="1-4pass" oninput="updateprice()" required />
											</td>          											
											<td>
												<input type="text" class="form-control" name="1-4es" readonly>
											</td>          											
											<td>
												<input type="text" class="form-control" name="5-6pass" readonly>
											</td>          											
											<td>
												<input type="text" class="form-control" name="7pass" readonly>
											</td>          											
											<td>
												<input type="text" class="form-control" name="8pass" readonly>
											</td>          											
											<td>
												<input type="text" class="form-control" name="9pass" readonly>
											</td>          											
											<td>
												<input type="text" class="form-control" name="10_14pass" readonly>
											</td>          											
											<td>
												<input type="text" class="form-control" name="15_16pass" readonly>
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
										<th style="background: #FFFFFF; color: #3A3A3A;"><p>Pickup</p></th>          										
										<th style="background: #FFFFFF; color: #3A3A3A;"><p>Dropoff</p></th>          										
										<th style="background: #FFFFFF; color: #3A3A3A;"><p align="center"><span>1-4</span><br>Passenger</p></th>
										<th style="background: #FFFFFF; color: #3A3A3A;"><p align="center"><span>1-4</span><br>Estate</p></th>
										<th style="background: #FFFFFF; color: #3A3A3A;"><p align="center"><span>5-6</span><br>Passenger</p></th>										
										<th style="background: #FFFFFF; color: #3A3A3A;"><p align="center"><span>7</span><br>Passenger</p></th>										
										<th style="background: #FFFFFF; color: #3A3A3A;"><p align="center"><span>8</span><br>Passenger</p></th>										
										<th style="background: #FFFFFF; color: #3A3A3A;"><p align="center"><span>9</span><br>Passenger</p></th>          								
										<th style="background: #FFFFFF; color: #3A3A3A;"><p align="center"><span>10-14</span><br>Passenger</p></th>										
										<th style="background: #FFFFFF; color: #3A3A3A;"><p align="center"><span>15-16</span><br>Passenger</p></th>										
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
										<td><?php echo $pmrow['1_4p'];?></td>												  										
										<td><?php echo $pmrow['1_4e'];?></td>												  										
										<td><?php echo $pmrow['5_6p'];?></td>												  										
										<td><?php echo $pmrow['7p'];?></td>												  										
										<td><?php echo $pmrow['8p'];?></td>												  										
										<td><?php echo $pmrow['9p'];?></td>												  										
										<td><?php echo $pmrow['10_14p'];?></td>												  										
										<td><?php echo $pmrow['15_16p'];?></td>																						
									</tr>												  									
									<?php														
									}															
									?>												  											  									
								</tbody>																			
							</table>																		
						</div>				
					</div>										
					<!--Meet & Greet Charges-->
					
					<div class="tab-pane" id="tabs-meet">                    						
						<div class="card-body">            																	
							<h2 class="mb-4">
								Meet & Greet Charges
							</h2>    														
							<p align="justify">
								When picking up a <strong>MiniCAB</strong> customer at the airport, we expect that the driver is available to meet & greet the customer as they arrive and direct them to the car. The price that you appear for on the site should therefore include any meet and greet charges you may have. Using the below tool you can add any fees you may have and these will automatically be added on top of any price you appear for on the minicaboffice.com website regardless of whether this has been calculated via by mileage, location or postcode area pricing.<br><br>
								This flat fee will apply for your selected location as well as 0.2 miles around the location to ensure that the charge still applies for nearby locations also.<br><br>
								If you charge a meet and greet charge for a location that you can’t find below, please request this via email to admin@minicaboffice.com.<br><br>
								Please add reasonable pickup charges for these airports, as relevant. Any requests to add reasonable pickup charges for other venues can be sent to admin@minicaboffice.com, for the MiniCAB  team to consider.</p>					
							<div class="row">												
								<table class="table">						
									<tbody>						
										<tr>							
											<td>Pickup Locations</td>							
											<td>Pickup Charges</td>							  
											<td></td>							
										</tr>										
										<form action="mg_process.php" method="post">																
											<tr>				
												<td style="width: 50%;">
													<input type="text" name="pickup" class="form-control" required />
												</td>					
												<td>												
													<div class="input-group mb-3"> 
														<div class="input-group-prepend"> 		
															<span class="input-group-text">
																£
															</span>  		
														</div> 		
														<input type="text" name="price" class="form-control" aria-label="Amount (to the nearest pound)" required />
																									
													</div>											
												</td>							  											
												<td>												
													<button type="submit" class="btn btn-success" style="width: 100%;">
														<i class="ti ti-plus"></i>
														Add
													</button>											
												</td>																	
											</tr>																					
										</form>						 									
									</tbody>														
								</table>							
							</div>
							
							<div class="row">												
								<table class="table table-responsive">						
									<tbody>						
										<tr>	
											<td>ID</td>
											<td>Pickup Locations</td>							
											<td>Pickup Charges</td>							  
											<td></td>							
										</tr>																						
										<?php																				
										$n=0;																				
										$mgsql=mysqli_query($connect,"SELECT * FROM `mg_charges`");													
										while($mgrow = mysqli_fetch_array($mgsql)){										
											$n++;										
										?>																											
										<tr>	
											<td style="width: 4%;">											
												<?php echo $n; ?>											
											</td>
											<td style="width: 50%;">											
												<?php echo $mgrow['pickup_location'] ?>											
											</td>											
											<td>													
												<?php echo $mgrow['pickup_charges'] ?>											
											</td>												
											<td>													
												<a href="del-mg.php?mg_id=<?php echo $mgrow['mg_id'];?>">														
													<button class="btn btn-danger">Delete</button>													
												</a>												
											</td>											
										</tr>																					
										<?php										
										}											
										?>				
									</tbody>														
								</table>							
							</div>
																			
																			
				
						</div>   
						
						
						
                      
					
					</div>
					
					
					
			
				</div>                
		
			</div>             
	
		</div>           

	</div>


</div>

<?php
include('footer.php');
?>