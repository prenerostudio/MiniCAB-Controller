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
		Postcode Area Pricing lets you define fixed prices between any 2 or more postcode areas within the UK, regardless of your base location or mileage rates. So if you want to offer a competitive, fixed rate to minicabit customers to/from/between popular base postcode areas, just enter the first section of any single or group of postcodes.<br><br>
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
						const postalCodeSuggestions = [			
							"W8", "NW6", "W5", "TW3", "TW4", "TW9", "UB10", "WC1", "W9", "EN1", "EN2", "EN5", "IG11", "HA2", "BR1", "GL1", "E5", "E6", "E7", "E8", "E9", "EC1", "EC4", "E15", "E17", "E2", "E3", "E4", "E1", "E10", "E11", "E12", "E13", "E14", "CR0", "SE13", "SE14", "SE15", "SE16", "SE17", "SE18", "SE19", "SE2", "SE21", "SE22", "SW16", "SW18", "SW19", "SW2", "SW11", "SW12", "SW13", "SW14", "SW15", "SW3", "SW4", "SW6", "SW7", "SW8", "SW9", "NW10", "NW11", "NW2", "NW3", "NW4", "N2", "N20", "N21", "N22", "N3", "N4", "N5", "N6", "N7", "N8", "M60", "SE1", "SE10", "SE12", "SE23", "SE24", "SE25", "SE26", "SE3", "SE4", "SE6", "SE7", "SE8", "SE9", "N1", "N10", "N11", "N12", "N13", "N14", "N15", "N16", "N17", "N18", "N19", "TW10", "TW12", "TW13", "NW5", "NW7", "NW8", "W1", "W10", "W11", "W13", "W14", "W2", "W3", "W4", "W6", "W7", "TW5", "TW7", "TW8", "TW9", "UB1", "UB2", "UB3", "UB4", "UB5", "UB6", "WC1", "WC2", "EN3", "EN4", "IG1", "IG3", "IG6", "IG8", "IG8", "GU8", "HA0", "HA1", "HA3", "HA4", "HA5", "BN2", "BR2", "BR3", "BR4", "BR5", "BR6", "BR7", "GU16", "GU22", "GU27", "GU1", "GU12", "HA6", "HA7", "HA8", "HA9", "GU29", "GU3", "GU30", "GU32", "GU34", "GU35", "GU5", "G2", "EC2", "EC3", "E16", "E18", "E1", "CR4", "CR5", "CR8", "DA14", "DA15", "DA16", "DA17", "SE17", "SE19", "SE20", "SE20", "SW19", "SW1"
						];						
						const postcodeInput = document.getElementById("postcode-input");						
						const suggestionsContainer = document.getElementById("suggestions-container");
						postcodeInput.addEventListener("input", function() {						
							const inputText = this.value.trim();            							
							filterSuggestions(inputText);        							
						});												
						function filterSuggestions(input) {						
							const filteredSuggestions = postalCodeSuggestions.filter(suggestion =>suggestion.startsWith(input)); 
							displaySuggestions(filteredSuggestions);
						}     													        						
						function displaySuggestions(suggestions) {            						
							if (suggestions.length > 0) {                							
								const suggestionHTML = suggestions.map(suggestion =>`<div class="suggestion" onclick="selectSuggestion('${suggestion}')">${suggestion}</div>`).join('');
								suggestionsContainer.innerHTML = suggestionHTML;                								
								suggestionsContainer.style.display = "block";							
							} else {                							
								suggestionsContainer.innerHTML = "";                								
								suggestionsContainer.style.display = "none";            								
							}        							
						}      													        						
						function selectSuggestion(suggestion) {            						
							postcodeInput.value = suggestion;            							
							suggestionsContainer.style.display = "none";        							
						}        													        						
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
			<th style="background: #FFFFFF; color: #3A3A3A;">			
				<p align="center"><span>1-4</span><br>Passenger</p>				
			</th>			
			<th style="background: #FFFFFF; color: #3A3A3A;">			
				<p align="center"><span>1-4</span><br>Estate</p>				
			</th>			
			<th style="background: #FFFFFF; color: #3A3A3A;">			
				<p align="center"><span>5-6</span><br>Passenger</p>				
			</th>													
			<th style="background: #FFFFFF; color: #3A3A3A;">			
				<p align="center"><span>7</span><br>Passenger</p>				
			</th>													
			<th style="background: #FFFFFF; color: #3A3A3A;">			
				<p align="center"><span>8</span><br>Passenger</p>				
			</th>													
			<th style="background: #FFFFFF; color: #3A3A3A;">			
				<p align="center"><span>9</span><br>Passenger</p>				
			</th>          											
			<th style="background: #FFFFFF; color: #3A3A3A;">			
				<p align="center"><span>10-14</span><br>Passenger</p>				
			</th>													
			<th style="background: #FFFFFF; color: #3A3A3A;">			
				<p align="center"><span>15-16</span><br>Passenger</p>				
			</th>													
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