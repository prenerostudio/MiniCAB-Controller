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
										<br>Salon  /<strong style="font-weight: 800"> Mile</strong>										
									</p>									
								</th>																						
								<th>								
									<p align="center">									
										<span>1-4</span>										
										<br>Estate  /<strong style="font-weight: 800"> Mile</strong>									
									</p>									
								</th>																						
								<th>								
									<p align="center">									
										<span>5-6</span>										
										<br>MPV  /<strong style="font-weight: 800"> Mile</strong>										
									</p>									
								</th>																						
								<th>								
									<p align="center">									
										<span>1-4 Seater</span><br>										
										Executive Salon  /<strong style="font-weight: 800"> Mile</strong>							
									</p>									
								</th>																						
								<th>								
									<p align="center">									
										<span>8-9 Seater</span><br>										
										Large MPV  /<strong style="font-weight: 800"> Mile</strong>									
									</p>									
								</th>																						
								<th>								
									<p align="center">									
										<span>8-9 Seater</span><br>										
										Executive Large MPV  /<strong style="font-weight: 800"> Mile</strong>								
									</p>									
								</th>																	
								<th>								
									<p align="center">									
										<span>10-14 Seater</span><br>										
										MiniBus  /<strong style="font-weight: 800"> Mile</strong>									
									</p>									
								</th>																	
								<th>								
									<p align="center">									
										<span>Parcel</span><br>										
										Courier / Delivery  /<strong style="font-weight: 800"> Mile</strong>							
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
									<input type="text" class="form-control" name="salon" required>
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
							<th style="background: #FFFFFF; color: #3A3A3A;">							
								<p>From (miles)</p>								
							</th>																				
							<th style="background: #FFFFFF; color: #3A3A3A;">							
								<p>To (miles)</p>								
							</th>																				
							<th style="background: #FFFFFF; color: #3A3A3A;">							
								<p align="center"><span>1-4 Seater</span><br>Salon  /<strong style="font-weight: 800"> Mile</strong></p>								
							</th>																				
							<th style="background: #FFFFFF; color: #3A3A3A;">							
								<p align="center"><span>1-4 Seater</span><br>Estate  /<strong style="font-weight: 800"> Mile</strong></p>								
							</th>														
							<th style="background: #FFFFFF; color: #3A3A3A;">							
								<p align="center"><span>5-6 Seater</span><br>MPV  /<strong style="font-weight: 800"> Mile</strong></p>								
							</th>													
							<th style="background: #FFFFFF; color: #3A3A3A;">							
								<p align="center"><span>1-4 Seater</span><br>Executive Salon  /<strong style="font-weight: 800"> Mile</strong></p>								
							</th>													
							<th style="background: #FFFFFF; color: #3A3A3A;">							
								<p align="center"><span>8-9 Seater</span><br>Large MPV  /<strong style="font-weight: 800"> Mile</strong></p>								
							</th>																				
							<th style="background: #FFFFFF; color: #3A3A3A;">							
								<p align="center"><span>8-9 Seater</span><br>Executive Large MPV  /<strong style="font-weight: 800"> Mile</strong></p>								
							</th>
							<th style="background: #FFFFFF; color: #3A3A3A;">							
								<p align="center"><span>10-14 Seater</span><br>MiniBus  /<strong style="font-weight: 800"> Mile</strong></p>								
							</th>
							<th style="background: #FFFFFF; color: #3A3A3A;">							
								<p align="center"><span>Parcel</span><br>Courier / Delivery  /<strong style="font-weight: 800"> Mile</strong></p>								
							</th>	
							<th></th>
						</tr>																		
					</thead>																
					<tbody>					
						<?php
						$pmsql=mysqli_query($connect,"SELECT * FROM `price_mile`");						
						while($pmrow = mysqli_fetch_array($pmsql)){						
						?>																		
						<tr align="center">																		
							<td><?php echo $pmrow['start_from'];?> Miles</td>							
							<td><?php echo $pmrow['end_to'];?> Miles</td>							
							<td>£ <?php echo $pmrow['saloon'];?></td>							
							<td>£ <?php echo $pmrow['estate'];?></td>							
							<td>£ <?php echo $pmrow['mpv'];?></td>														
							<td>£ <?php echo $pmrow['esaloon'];?></td>							
							<td>£ <?php echo $pmrow['lmpv'];?></td>							
							<td>£ <?php echo $pmrow['empv'];?></td>							
							<td>£ <?php echo $pmrow['minibus'];?></td>							
							<td>£ <?php echo $pmrow['delivery'];?></td>	
							<td>
								<a class="btn btn-info button_padding" href="del-price-by-mile.php?pm_id=<?php echo $pmrow['pm_id'] ?>" title="Edit">
												
				
									<i class="ti ti-pencil"></i>
											
				
								</a>
								<a class="btn btn-danger button_padding" href="del-price-by-mile.php?pm_id=<?php echo $pmrow['pm_id'] ?>" title="Cancel">
												
				
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
		</div>										
	</div>							
</div>