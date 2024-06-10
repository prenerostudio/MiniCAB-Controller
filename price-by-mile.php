<div class="card">
	<div class="row g-0">	
		<div class="col-12 col-md-12 d-flex flex-column">										
			<div class="card-body">												
				<h2 class="mb-4">Mileage rate</h2>														
				<hr>														
				<h3>Mile range: £ per mile rate incl. 12% MiniCAB commission (and VAT)</h3>				
				<p align="justify">
					Enter your mileage rates for each Petrol, Diesel & Hybrid vehicle type<br><br>
					Note that Per Mile Price mileage rates apply to the total distance from your office to the pickup point to the drop-off point unless you have set a Free Pickup Postcode Area. When you edit the mileage ranges and rates, the Price Per Mile Calculator will show you how your pricing relates to typical distances, factoring in any uplifts for larger vehicle sizes, so you can evaluate how competitive you are.
				</p>														
				<form method="post" action="mp_process.php" enctype="multipart/form-data">				
					<table class="table table-responsive" id="myTable">								
						<thead>																		
							<tr>         																				
								<th>								
									<p>From (miles)</p>									
								</th>																						
								<th>								
									<p>To (miles)</p>									
								</th>																						
								<th>								
									<p align="center">									
										<span>1-4</span>										
										<br>Passenger										
									</p>									
								</th>																						
								<th>								
									<p align="center">									
										<span>1-4</span>										
										<br>Estate										
									</p>									
								</th>																						
								<th>								
									<p align="center">									
										<span>5-6</span>										
										<br>Passenger										
									</p>									
								</th>																						
								<th>								
									<p align="center">									
										<span>7</span><br>										
										Passenger										
									</p>									
								</th>																						
								<th>								
									<p align="center">									
										<span>8</span><br>										
										Passenger										
									</p>									
								</th>																						
								<th>								
									<p align="center">									
										<span>9</span><br>										
										Passenger										
									</p>									
								</th>																	
								<th>								
									<p align="center">									
										<span>10-14</span><br>										
										Passenger										
									</p>									
								</th>																	
								<th>								
									<p align="center">									
										<span>15-16</span><br>										
										Passenger										
									</p>									
								</th>																						
							</tr>																				
						</thead>																		
						<tbody>																		
							<tr> 																				
								<td>								
									<input type="text" class="form-control" name="from" required>
								</td>																		
								<td>								
									<input type="text" class="form-control" name="to" required>									
								</td>																		
								<td>								
									<input type="text" class="form-control" name="1-4p" oninput="updateValues()" required>
								</td>																	
								<td>								
									<input type="text" class="form-control" name="1-4e" readonly>
								</td>																						
								<td>								
									<input type="text" class="form-control" name="5-6p" readonly>
								</td>																						
								<td>								
									<input type="text" class="form-control" name="7p" readonly>									
								</td>																						
								<td>								
									<input type="text" class="form-control" name="8p" readonly>									
								</td>																						
								<td>								
									<input type="text" class="form-control" name="9p" readonly>									
								</td>																						
								<td>								
									<input type="text" class="form-control" name="10_14p" readonly>
								</td>
								<td>								
									<input type="text" class="form-control" name="15_16p" readonly>
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
							<th style="background: #FFFFFF; color: #3A3A3A;">							
								<p>From (miles)</p>								
							</th>																				
							<th style="background: #FFFFFF; color: #3A3A3A;">							
								<p>To (miles)</p>								
							</th>																				
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