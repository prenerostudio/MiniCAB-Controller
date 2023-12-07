<?php

include('header.php');
		
?> 

 <script>
        function updateValues() {
            // Get the input values
            var input1_4p = parseFloat(document.getElementsByName("1-4p")[0].value);

            // Define percentages
            var percentage_1_4e = 0.2;  // 20%
            var percentage_5_6p = 0.3;  // 30%
            var percentage_7p = 0.4;    // 10%
			var percentage_8p = 0.5;    // 10%
			var percentage_9p = 0.6;    // 10%
			var percentage_10_14p = 0.7;
			var percentage_15_16p = 0.8;// 10%
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
					<li class="nav-item" style="background: #3046CC;">                      					
						<a href="#tabs-mile" class="nav-link active" data-bs-toggle="tab">							                          					
							<i class="ti ti-brand-speedtest" style="width: 32px; height: 32px;"></i>                         							
							Price Per Mile				
						</a>                     
					</li>                      					
					<li class="nav-item">                       					
						<a href="#tabs-loc" class="nav-link" data-bs-toggle="tab">							                         						
							<i class="ti ti-license" style="width: 32px; height: 32px;"></i>
							Location Prices					
						</a>                     					
					</li>  
					<li class="nav-item">                       					
						<a href="#tabs-post" class="nav-link" data-bs-toggle="tab">							                         						
							<i class="ti ti-license" style="width: 32px; height: 32px;"></i>
							Postcode Area Prices					
						</a>                     					
					</li>  					
					<li class="nav-item">                       					
						<a href="#tabs-meet" class="nav-link" data-bs-toggle="tab">							                         						
							<i class="ti ti-license" style="width: 32px; height: 32px;"></i>
							Meet & Greet Charges					
						</a>                     					
					</li>  
				</ul>                			
			</div>                 			
			<div class="card-body">                  			
				<div class="tab-content">                   				
					<div class="tab-pane active show" id="tabs-mile">						           	
							<div class="card">				
								<div class="row g-0">                    							
									<div class="col-12 col-md-12 d-flex flex-column">        										
										<div class="card-body">            									
											<h2 class="mb-4">Mileage rate</h2>  
											<hr>
											<h3>Mile range: £ per mile rate incl. 12% MiniCAB commission (and VAT)</h3>
											<hr>																			
  
											<form method="post" action="mp_process.php" enctype="multipart/form-data">
  
												<table class="table table-responsive" id="myTable">
  
													<thead>
        
														<tr>
          
															<th><p>From</p></th>
          
															<th><p>To</p></th>
          
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
          
															<td><input type="text" class="form-control" name="from"></td>
          
															<td><input type="text" class="form-control" name="to"></td>
          
															<td><input type="text" class="form-control" name="1-4p" oninput="updateValues()"></td>
          
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
          
															<th style="background: #FFFFFF; color: #3A3A3A;"><p>From</p></th>
          
															<th style="background: #FFFFFF; color: #3A3A3A;"><p>To</p></th>
          
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
										<div class="card-body">            									
											<h2 class="mb-4">Mileage rate</h2>  
											<hr>
											<h3>Mile range: £ per mile rate incl. 12% MiniCAB commission (and VAT)</h3>
											<hr>	
											
											<p>The minimum price you charge for each vehicle size, regardless of how short the trip is. Please contact admin@minicaboffice.com if you want to change your minimum fares. </p>
											
											
											
											<h3>Uplift pricing</h3>
											<hr>
											<p>The pricing for your larger sized vehicles is based on your 4-seater saloon car pricing and will be applied to the your mileage, Location Price and Postcode Area Price rates. <br> Below you can choose if this uplift is based on either:</p>
											<ol>
												<li>A (£) flat fee more than your saloon car pricing</li>
												<li>A (%) uplift over your saloon prices</li>
											
											
											
											</ol> 
											<div class="uplift__pricing">
                                                    <div class="d-flex border-bottom mt-3">
                                                        <div class="text-center grow-1">
                                                            <h2>1-4</h2>
                                                            <p>ESTATE</p>
                                                        </div>

                                                        <div class="text-center grow-1">
                                                            <h2>5-6</h2>
                                                            <p>PASSENGERS</p>
                                                        </div>

                                                        <div class="text-center grow-1">
                                                            <h2>7</h2>
                                                            <p>PASSENGERS</p>
                                                        </div>

                                                        <div class="text-center grow-1">
                                                            <h2>8</h2>
                                                            <p>PASSENGERS</p>
                                                        </div>

                                                        <div class="text-center grow-1">
                                                            <h2>9</h2>
                                                            <p>PASSENGERS</p>
                                                        </div>

                                                        <div class="text-center grow-1">
                                                            <h2>10-14</h2>
                                                            <p>PASSENGERS</p>
                                                        </div>

                                                        <div class="text-center grow-1">
                                                            <h2>15-16</h2>
                                                            <p>PASSENGERS</p>
                                                        </div>
                                                    </div>

                                                    <div class="d-flex mt-3">
                                                        <div class="form-group d-flex align-items-center grow-1 mr-3 justify-content-center multiplayers">
                                                            <input type="radio" name="per_mile_prices[1][1][estate_luggage_multiplayer_type]" value="1" checked="" data-gtm-form-interact-field-id="1">

                                                            <input type="text" name="per_mile_prices[1][1][estate_luggage_multiplayer]" class="form-control mx-2 price" data-capacity="4" data-type="%" value="10">

                                                            <p class="fs-14-600">%</p>
                                                        </div>

                                                        <div class="form-group d-flex align-items-center grow-1 mr-3 justify-content-center multiplayers">
                                                            <input type="radio" name="per_mile_prices[1][1][multiplayer_type_6]" value="1" checked="">

                                                            <input type="text" name="per_mile_prices[1][1][multiplayer_6]" class="form-control mx-2 price" data-capacity="6" data-type="%" value="25">

                                                            <p class="fs-14-600">%</p>
                                                        </div>

                                                        <div class="form-group d-flex align-items-center grow-1 mr-3 justify-content-center multiplayers">
                                                            <input type="radio" name="per_mile_prices[1][1][multiplayer_type_7]" value="1" checked="">

                                                            <input type="text" name="per_mile_prices[1][1][multiplayer_7]" class="form-control mx-2 price" data-capacity="7" data-type="%" value="40">

                                                            <p class="fs-14-600">%</p>
                                                        </div>

                                                        <div class="form-group d-flex align-items-center grow-1 mr-3 justify-content-center multiplayers">
                                                            <input type="radio" name="per_mile_prices[1][1][multiplayer_type_8]" value="1" checked="">

                                                            <input type="text" name="per_mile_prices[1][1][multiplayer_8]" class="form-control mx-2 price" data-capacity="8" data-type="%" value="50">

                                                            <p class="fs-14-600">%</p>
                                                        </div>

                                                        <div class="form-group d-flex align-items-center grow-1 mr-3 justify-content-center multiplayers">
                                                            <input type="radio" name="per_mile_prices[1][1][multiplayer_type_9]" value="1" checked="">

                                                            <input type="text" name="per_mile_prices[1][1][multiplayer_9]" class="form-control mx-2 price" data-capacity="9" data-type="%" value="75">

                                                            <p class="fs-14-600">%</p>
                                                        </div>

                                                        <div class="form-group d-flex align-items-center grow-1 mr-3 justify-content-center multiplayers">
                                                            <input type="radio" name="per_mile_prices[1][1][multiplayer_type_14]" value="1" checked="">

                                                            <input type="text" name="per_mile_prices[1][1][multiplayer_14]" class="form-control mx-2 price" data-capacity="14" data-type="%" value="100">

                                                            <p class="fs-14-600">%</p>
                                                        </div>

                                                        <div class="form-group d-flex align-items-center grow-1 multiplayers">
                                                            <input type="radio" name="per_mile_prices[1][1][multiplayer_type_16]" value="1" checked="">

                                                            <input type="text" name="per_mile_prices[1][1][multiplayer_16]" class="form-control mx-2 price" data-capacity="16" data-type="%" value="150">

                                                            <p class="fs-14-600">%</p>
                                                        </div>
                                                    </div>

                                                    <div class="d-flex ">
                                                        <div class="form-group d-flex align-items-center grow-1 mr-3 justify-content-center multiplayers">
                                                            <input type="radio" name="per_mile_prices[1][1][estate_luggage_multiplayer_type]" value="2" data-gtm-form-interact-field-id="0">

                                                            <input type="text" name="per_mile_prices[1][1][estate_luggage_multiplayer]" class="form-control mx-2 price" data-capacity="4" data-type="+" value="10" disabled="disabled">

                                                            <h3 class="fs-14-600">£</h3>
                                                        </div>

                                                        <div class="form-group d-flex align-items-center grow-1 mr-3 justify-content-center multiplayers">
                                                            <input type="radio" name="per_mile_prices[1][1][multiplayer_type_6]" value="2">

                                                            <input type="text" name="per_mile_prices[1][1][multiplayer_6]" class="form-control mx-2 price" data-capacity="6" data-type="+" disabled="disabled" value="25">

                                                            <h3 class="fs-14-600">£</h3>
                                                        </div>

                                                        <div class="form-group d-flex align-items-center grow-1 mr-3 justify-content-center multiplayers">
                                                            <input type="radio" name="per_mile_prices[1][1][multiplayer_type_7]" value="2">

                                                            <input type="text" name="per_mile_prices[1][1][multiplayer_7]" class="form-control mx-2 price" data-capacity="7" data-type="+" disabled="disabled" value="40">

                                                            <h3 class="fs-14-600">£</h3>
                                                        </div>

                                                        <div class="form-group d-flex align-items-center grow-1 mr-3 justify-content-center multiplayers">
                                                            <input type="radio" name="per_mile_prices[1][1][multiplayer_type_8]" value="2">

                                                            <input type="text" name="per_mile_prices[1][1][multiplayer_8]" class="form-control mx-2 price" data-capacity="8" data-type="+" disabled="disabled" value="50">

                                                            <h3 class="fs-14-600">£</h3>
                                                        </div>

                                                        <div class="form-group d-flex align-items-center grow-1 mr-3 justify-content-center multiplayers">
                                                            <input type="radio" name="per_mile_prices[1][1][multiplayer_type_9]" value="2">

                                                            <input type="text" name="per_mile_prices[1][1][multiplayer_9]" class="form-control mx-2 price" data-capacity="9" data-type="+" disabled="disabled" value="75">

                                                            <h3 class="fs-14-600">£</h3>
                                                        </div>

                                                        <div class="form-group d-flex align-items-center grow-1 mr-3 justify-content-center multiplayers">
                                                            <input type="radio" name="per_mile_prices[1][1][multiplayer_type_14]" value="2">

                                                            <input type="text" name="per_mile_prices[1][1][multiplayer_14]" class="form-control mx-2 price" data-capacity="14" data-type="+" disabled="disabled" value="100">

                                                            <h3 class="fs-14-600">£</h3>
                                                        </div>

                                                        <div class="form-group d-flex align-items-center grow-1 multiplayers">
                                                            <input type="radio" name="per_mile_prices[1][1][multiplayer_type_16]" value="2">

                                                            <input type="text" name="per_mile_prices[1][1][multiplayer_16]" class="form-control mx-2 price" data-capacity="16" data-type="+" disabled="disabled" value="150">

                                                            <h3 class="fs-14-600">£</h3>
                                                        </div>
                                                    </div>

                                                    <div class="d-flex ">
                                                        <div class="form-group d-flex grow-1 mr-3 justify-content-center align-items-start">
                                                            <div class="invalid-feedback d-block" id="err_uplift_4e_1_1"></div>
                                                        </div>

                                                        <div class="form-group d-flex align-items-center grow-1 mr-3 justify-content-center">
                                                            <div class="invalid-feedback d-block" id="err_uplift_6_1_1"></div>
                                                        </div>

                                                        <div class="form-group d-flex align-items-center grow-1 mr-3 justify-content-center">
                                                            <div class="invalid-feedback d-block" id="err_uplift_7_1_1"></div>
                                                        </div>

                                                        <div class="form-group d-flex align-items-center grow-1 mr-3 justify-content-center">
                                                            <div class="invalid-feedback d-block" id="err_uplift_8_1_1"></div>
                                                        </div>

                                                        <div class="form-group d-flex align-items-center grow-1 mr-3 justify-content-center">
                                                            <div class="invalid-feedback d-block" id="err_uplift_9_1_1"></div>
                                                        </div>

                                                        <div class="form-group d-flex align-items-center grow-1 mr-3 justify-content-center">
                                                            <div class="invalid-feedback d-block" id="err_uplift_14_1_1"></div>
                                                        </div>

                                                        <div class="form-group d-flex align-items-center grow-1">
                                                            <div class="invalid-feedback d-block" id="err_uplift_16_1_1"></div>
                                                        </div>
                                                    </div>
                                                </div>											
											<p>The minimum price you charge for each vehicle size, regardless of how short the trip is. Please contact admin@minicaboffice.com if you want to change your minimum fares. </p>
											
					
  
											

  
										
											
											
			
										</div> 
										
										
										
										
									</div>            	
								</div>         
							</div>																													
					      																		
					</div> 
						
											
											
						
					
					
					<div class="tab-pane" id="tabs-loc">
                    
					
						<div class="card-body">            												
					
							<h2 class="mb-4">Driver Profile</h2>      																
					
							<div class="row">														
						
								<div style="width: 50%; float: left;">																	
							
									<h3 class="card-title">														
								
										Driver Licence Photo Card (Front)													
							
									</h3>                									
							
									<div class="row align-items-center">                																		
										
								<div class="col-auto">																							
									<span class="avatar avatar-xl" style="background-image: url(img/drivers/Driving-Licence/<?php echo $drow['dl_front'];?>); background-size:cover; width: 220px; height: 160px;"></span>														
								</div>                    																										
								<div class="col-auto">		
									<form action="upload-front.php" method="post" enctype="multipart/form-data">
										<input type="hidden" name="d_id" value="<?php echo $d_id; ?>">										
										<input type="file" name="dl_front" accept="image/*"  class="form-control">
										<input type="submit" value="Upload Image" name="submit"  class="btn btn-info" style="margin-top: 25px;">
									</form>
								</div>
							</div>				
						</div>														
						<div style="width: 50%; float: left;">										
							<h3 class="card-title">						
								Driver Licence Photo Card (Back)					
							</h3>                																					
							<div class="row align-items-center">                														
								<div class="col-auto">
									<span class="avatar avatar-xl" style="background-image: url(img/drivers/Driving-Licence/<?php echo $drow['dl_back'];?>); background-size:cover; width: 220px; height: 160px;"></span>													
							
								</div>                    											
							
								<div class="col-auto">									
									<form action="upload-back.php" method="post" enctype="multipart/form-data">
										<input type="hidden" name="d_id" value="<?php echo $d_id; ?>">										
										<input type="file" name="dl_back" accept="image/*"  class="form-control">
										<input type="submit" value="Upload Image" name="submit"  class="btn btn-info" style="margin-top: 25px;">
									</form>																										
								</div>													
							</div>  																
						</div>					
					</div>
																			
					<div class="row" style="padding-top: 25px;">														
						<div style="width: 50%; float: left;">															
							<h3 class="card-title">														
								Proof of National Insurance											
							</h3>                																				
							<div class="row align-items-center">                													
								<div class="col-auto">
									<span class="avatar avatar-xl" style="background-image: url(img/drivers/National-Insurance/<?php echo $drow['national_insurance'];?>); background-size:cover; width: 220px; height: 160px;"></span>
								</div>                    																									
								<div class="col-auto">																												
									<form action="upload-ni.php" method="post" enctype="multipart/form-data">
										<input type="hidden" name="d_id" value="<?php echo $d_id; ?>">										
										<input type="file" name="ni" accept="image/*"  class="form-control">
										<input type="submit" value="Upload Image" name="submit"  class="btn btn-info" style="margin-top: 25px;">
									</form>																			
								</div>								
							</div>  										
						</div>																												
						<div style="width: 50%; float: left;">											
							<h3 class="card-title">							
								Proof of Basic Disclosure						
							</h3>                															
							<div class="row align-items-center">                							
								<div class="col-auto">																						
									<span class="avatar avatar-xl" style="background-image: url(img/drivers/Basic-Disclosure/<?php echo $drow['basic_disclosure'];?>); background-size:cover; width: 220px; height: 160px;"></span>													
								</div>                    																		
								<div class="col-auto">																				
									<form action="upload-bd.php" method="post" enctype="multipart/form-data">									
										<input type="hidden" name="d_id" value="<?php echo $d_id; ?>">
										<input type="file" name="bd" accept="image/*"  class="form-control">										
										<input type="submit" value="Upload Image" name="submit"  class="btn btn-info" style="margin-top: 25px;">
									</form>																		
								</div>							
							</div>  										
						</div>										
					</div>
																		
					<div class="row" style="padding-top: 25px;">				
						<div style="width: 50%; float: left;">										
							<h3 class="card-title">							
								Proof of Right To Work in the UK						
							</h3>                																					
							<div class="row align-items-center">                														
								<div class="col-auto">
									<span class="avatar avatar-xl" style="background-image: url(img/drivers/Work-Proof/<?php echo $drow['work_proof'];?>); background-size:cover; width: 220px; height: 160px;"></span>																				
								</div>                    																										
								<div class="col-auto">																				
									<form action="upload-wp.php" method="post" enctype="multipart/form-data">									
										<input type="hidden" name="d_id" value="<?php echo $d_id; ?>">
										<input type="file" name="wp" accept="image/*"  class="form-control">										
										<input type="submit" value="Upload Image" name="submit"  class="btn btn-info" style="margin-top: 25px;">
									</form>																			
								</div>											
							</div>  										
						</div>
					
					
					
						<div style="width: 50%; float: left;">					
							<h3 class="card-title">
								Passport						
							</h3>                															
							<div class="row align-items-center">                
								<div class="col-auto">															
									<span class="avatar avatar-xl" style="background-image: url(img/drivers/Passport/<?php echo $drow['passport'];?>); background-size:cover; width: 220px; height: 160px;"></span>																				
								</div>                    																		
								<div class="col-auto">																				
									<form action="upload-passport.php" method="post" enctype="multipart/form-data">
										<input type="hidden" name="d_id" value="<?php echo $d_id; ?>">										
										<input type="file" name="pass" accept="image/*"  class="form-control">
										<input type="submit" value="Upload Image" name="submit"  class="btn btn-info" style="margin-top: 25px;">
									</form>																		
								</div>													              															
							</div>  										
						</div>					
					</div>					
																			
					<div class="row" style="padding-top: 25px;">					
						<div style="width: 50%; float: left;">											
							<h3 class="card-title">							
								DVLA Check Results						
							</h3>                															
							<div class="row align-items-center">                							
								<div class="col-auto">																							
									<span class="avatar avatar-xl" style="background-image: url(img/drivers/DVLA/<?php echo $drow['dvla'];?>); background-size:cover; width: 220px; height: 160px;"></span>																				
								</div>                    																		
								<div class="col-auto">																				
									<form action="upload-dvla.php" method="post" enctype="multipart/form-data">
										<input type="hidden" name="d_id" value="<?php echo $d_id; ?>">										
										<input type="file" name="dvla" accept="image/*"  class="form-control">
										<input type="submit" value="Upload Image" name="submit"  class="btn btn-info" style="margin-top: 25px;">
									</form>																				
								</div>											
							</div>  										
						</div>															
					</div>																
				</div>   
						
						
						
                      
					</div>   
					
					<div class="tab-pane" id="tabs-post">
                    
						<div class="card-body">            												
					<h2 class="mb-4">Driver Profile</h2>      																
					<div class="row">														
						<div style="width: 50%; float: left;">																	
							<h3 class="card-title">														
								Driver Licence Photo Card (Front)													
							</h3>                									
							<div class="row align-items-center">                																				
								<div class="col-auto">																							
									<span class="avatar avatar-xl" style="background-image: url(img/drivers/Driving-Licence/<?php echo $drow['dl_front'];?>); background-size:cover; width: 220px; height: 160px;"></span>														
								</div>                    																										
								<div class="col-auto">		
									<form action="upload-front.php" method="post" enctype="multipart/form-data">
										<input type="hidden" name="d_id" value="<?php echo $d_id; ?>">										
										<input type="file" name="dl_front" accept="image/*"  class="form-control">
										<input type="submit" value="Upload Image" name="submit"  class="btn btn-info" style="margin-top: 25px;">
									</form>
								</div>
							</div>				
						</div>														
						<div style="width: 50%; float: left;">										
							<h3 class="card-title">						
								Driver Licence Photo Card (Back)					
							</h3>                																					
							<div class="row align-items-center">                														
								<div class="col-auto">
									<span class="avatar avatar-xl" style="background-image: url(img/drivers/Driving-Licence/<?php echo $drow['dl_back'];?>); background-size:cover; width: 220px; height: 160px;"></span>													
							
								</div>                    											
							
								<div class="col-auto">									
									<form action="upload-back.php" method="post" enctype="multipart/form-data">
										<input type="hidden" name="d_id" value="<?php echo $d_id; ?>">										
										<input type="file" name="dl_back" accept="image/*"  class="form-control">
										<input type="submit" value="Upload Image" name="submit"  class="btn btn-info" style="margin-top: 25px;">
									</form>																										
								</div>													
							</div>  																
						</div>					
					</div>
																			
					<div class="row" style="padding-top: 25px;">														
						<div style="width: 50%; float: left;">															
							<h3 class="card-title">														
								Proof of National Insurance											
							</h3>                																				
							<div class="row align-items-center">                													
								<div class="col-auto">
									<span class="avatar avatar-xl" style="background-image: url(img/drivers/National-Insurance/<?php echo $drow['national_insurance'];?>); background-size:cover; width: 220px; height: 160px;"></span>
								</div>                    																									
								<div class="col-auto">																												
									<form action="upload-ni.php" method="post" enctype="multipart/form-data">
										<input type="hidden" name="d_id" value="<?php echo $d_id; ?>">										
										<input type="file" name="ni" accept="image/*"  class="form-control">
										<input type="submit" value="Upload Image" name="submit"  class="btn btn-info" style="margin-top: 25px;">
									</form>																			
								</div>								
							</div>  										
						</div>																												
						<div style="width: 50%; float: left;">											
							<h3 class="card-title">							
								Proof of Basic Disclosure						
							</h3>                															
							<div class="row align-items-center">                							
								<div class="col-auto">																						
									<span class="avatar avatar-xl" style="background-image: url(img/drivers/Basic-Disclosure/<?php echo $drow['basic_disclosure'];?>); background-size:cover; width: 220px; height: 160px;"></span>													
								</div>                    																		
								<div class="col-auto">																				
									<form action="upload-bd.php" method="post" enctype="multipart/form-data">									
										<input type="hidden" name="d_id" value="<?php echo $d_id; ?>">
										<input type="file" name="bd" accept="image/*"  class="form-control">										
										<input type="submit" value="Upload Image" name="submit"  class="btn btn-info" style="margin-top: 25px;">
									</form>																		
								</div>							
							</div>  										
						</div>										
					</div>
																		
					<div class="row" style="padding-top: 25px;">				
						<div style="width: 50%; float: left;">										
							<h3 class="card-title">							
								Proof of Right To Work in the UK						
							</h3>                																					
							<div class="row align-items-center">                														
								<div class="col-auto">
									<span class="avatar avatar-xl" style="background-image: url(img/drivers/Work-Proof/<?php echo $drow['work_proof'];?>); background-size:cover; width: 220px; height: 160px;"></span>																				
								</div>                    																										
								<div class="col-auto">																				
									<form action="upload-wp.php" method="post" enctype="multipart/form-data">									
										<input type="hidden" name="d_id" value="<?php echo $d_id; ?>">
										<input type="file" name="wp" accept="image/*"  class="form-control">										
										<input type="submit" value="Upload Image" name="submit"  class="btn btn-info" style="margin-top: 25px;">
									</form>																			
								</div>											
							</div>  										
						</div>
					
					
					
						<div style="width: 50%; float: left;">					
							<h3 class="card-title">
								Passport						
							</h3>                															
							<div class="row align-items-center">                
								<div class="col-auto">															
									<span class="avatar avatar-xl" style="background-image: url(img/drivers/Passport/<?php echo $drow['passport'];?>); background-size:cover; width: 220px; height: 160px;"></span>																				
								</div>                    																		
								<div class="col-auto">																				
									<form action="upload-passport.php" method="post" enctype="multipart/form-data">
										<input type="hidden" name="d_id" value="<?php echo $d_id; ?>">										
										<input type="file" name="pass" accept="image/*"  class="form-control">
										<input type="submit" value="Upload Image" name="submit"  class="btn btn-info" style="margin-top: 25px;">
									</form>																		
								</div>													              															
							</div>  										
						</div>					
					</div>					
																			
					<div class="row" style="padding-top: 25px;">					
						<div style="width: 50%; float: left;">											
							<h3 class="card-title">							
								DVLA Check Results						
							</h3>                															
							<div class="row align-items-center">                							
								<div class="col-auto">																							
									<span class="avatar avatar-xl" style="background-image: url(img/drivers/DVLA/<?php echo $drow['dvla'];?>); background-size:cover; width: 220px; height: 160px;"></span>																				
								</div>                    																		
								<div class="col-auto">																				
									<form action="upload-dvla.php" method="post" enctype="multipart/form-data">
										<input type="hidden" name="d_id" value="<?php echo $d_id; ?>">										
										<input type="file" name="dvla" accept="image/*"  class="form-control">
										<input type="submit" value="Upload Image" name="submit"  class="btn btn-info" style="margin-top: 25px;">
									</form>																				
								</div>											
							</div>  										
						</div>															
					</div>																
				</div>   
						
						
						
                      
					</div>
					
					<div class="tab-pane" id="tabs-meet">
                    
						<div class="card-body">            												
					<h2 class="mb-4">Driver Profile</h2>      																
					<div class="row">														
						<div style="width: 50%; float: left;">																	
							<h3 class="card-title">														
								Driver Licence Photo Card (Front)													
							</h3>                									
							<div class="row align-items-center">                																				
								<div class="col-auto">																							
									<span class="avatar avatar-xl" style="background-image: url(img/drivers/Driving-Licence/<?php echo $drow['dl_front'];?>); background-size:cover; width: 220px; height: 160px;"></span>														
								</div>                    																										
								<div class="col-auto">		
									<form action="upload-front.php" method="post" enctype="multipart/form-data">
										<input type="hidden" name="d_id" value="<?php echo $d_id; ?>">										
										<input type="file" name="dl_front" accept="image/*"  class="form-control">
										<input type="submit" value="Upload Image" name="submit"  class="btn btn-info" style="margin-top: 25px;">
									</form>
								</div>
							</div>				
						</div>														
						<div style="width: 50%; float: left;">										
							<h3 class="card-title">						
								Driver Licence Photo Card (Back)					
							</h3>                																					
							<div class="row align-items-center">                														
								<div class="col-auto">
									<span class="avatar avatar-xl" style="background-image: url(img/drivers/Driving-Licence/<?php echo $drow['dl_back'];?>); background-size:cover; width: 220px; height: 160px;"></span>													
							
								</div>                    											
							
								<div class="col-auto">									
									<form action="upload-back.php" method="post" enctype="multipart/form-data">
										<input type="hidden" name="d_id" value="<?php echo $d_id; ?>">										
										<input type="file" name="dl_back" accept="image/*"  class="form-control">
										<input type="submit" value="Upload Image" name="submit"  class="btn btn-info" style="margin-top: 25px;">
									</form>																										
								</div>													
							</div>  																
						</div>					
					</div>
																			
					<div class="row" style="padding-top: 25px;">														
						<div style="width: 50%; float: left;">															
							<h3 class="card-title">														
								Proof of National Insurance											
							</h3>                																				
							<div class="row align-items-center">                													
								<div class="col-auto">
									<span class="avatar avatar-xl" style="background-image: url(img/drivers/National-Insurance/<?php echo $drow['national_insurance'];?>); background-size:cover; width: 220px; height: 160px;"></span>
								</div>                    																									
								<div class="col-auto">																												
									<form action="upload-ni.php" method="post" enctype="multipart/form-data">
										<input type="hidden" name="d_id" value="<?php echo $d_id; ?>">										
										<input type="file" name="ni" accept="image/*"  class="form-control">
										<input type="submit" value="Upload Image" name="submit"  class="btn btn-info" style="margin-top: 25px;">
									</form>																			
								</div>								
							</div>  										
						</div>																												
						<div style="width: 50%; float: left;">											
							<h3 class="card-title">							
								Proof of Basic Disclosure						
							</h3>                															
							<div class="row align-items-center">                							
								<div class="col-auto">																						
									<span class="avatar avatar-xl" style="background-image: url(img/drivers/Basic-Disclosure/<?php echo $drow['basic_disclosure'];?>); background-size:cover; width: 220px; height: 160px;"></span>													
								</div>                    																		
								<div class="col-auto">																				
									<form action="upload-bd.php" method="post" enctype="multipart/form-data">									
										<input type="hidden" name="d_id" value="<?php echo $d_id; ?>">
										<input type="file" name="bd" accept="image/*"  class="form-control">										
										<input type="submit" value="Upload Image" name="submit"  class="btn btn-info" style="margin-top: 25px;">
									</form>																		
								</div>							
							</div>  										
						</div>										
					</div>
																		
					<div class="row" style="padding-top: 25px;">				
						<div style="width: 50%; float: left;">										
							<h3 class="card-title">							
								Proof of Right To Work in the UK						
							</h3>                																					
							<div class="row align-items-center">                														
								<div class="col-auto">
									<span class="avatar avatar-xl" style="background-image: url(img/drivers/Work-Proof/<?php echo $drow['work_proof'];?>); background-size:cover; width: 220px; height: 160px;"></span>																				
								</div>                    																										
								<div class="col-auto">																				
									<form action="upload-wp.php" method="post" enctype="multipart/form-data">									
										<input type="hidden" name="d_id" value="<?php echo $d_id; ?>">
										<input type="file" name="wp" accept="image/*"  class="form-control">										
										<input type="submit" value="Upload Image" name="submit"  class="btn btn-info" style="margin-top: 25px;">
									</form>																			
								</div>											
							</div>  										
						</div>
					
					
					
						<div style="width: 50%; float: left;">					
							<h3 class="card-title">
								Passport						
							</h3>                															
							<div class="row align-items-center">                
								<div class="col-auto">															
									<span class="avatar avatar-xl" style="background-image: url(img/drivers/Passport/<?php echo $drow['passport'];?>); background-size:cover; width: 220px; height: 160px;"></span>																				
								</div>                    																		
								<div class="col-auto">																				
									<form action="upload-passport.php" method="post" enctype="multipart/form-data">
										<input type="hidden" name="d_id" value="<?php echo $d_id; ?>">										
										<input type="file" name="pass" accept="image/*"  class="form-control">
										<input type="submit" value="Upload Image" name="submit"  class="btn btn-info" style="margin-top: 25px;">
									</form>																		
								</div>													              															
							</div>  										
						</div>					
					</div>					
																			
					<div class="row" style="padding-top: 25px;">					
						<div style="width: 50%; float: left;">											
							<h3 class="card-title">							
								DVLA Check Results						
							</h3>                															
							<div class="row align-items-center">                							
								<div class="col-auto">																							
									<span class="avatar avatar-xl" style="background-image: url(img/drivers/DVLA/<?php echo $drow['dvla'];?>); background-size:cover; width: 220px; height: 160px;"></span>																				
								</div>                    																		
								<div class="col-auto">																				
									<form action="upload-dvla.php" method="post" enctype="multipart/form-data">
										<input type="hidden" name="d_id" value="<?php echo $d_id; ?>">										
										<input type="file" name="dvla" accept="image/*"  class="form-control">
										<input type="submit" value="Upload Image" name="submit"  class="btn btn-info" style="margin-top: 25px;">
									</form>																				
								</div>											
							</div>  										
						</div>															
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