<?php
include('header.php');
?>		
<div class="col-md-12">                
		<div class="card">                  		
			<div class="card-header">                   			
				<ul class="nav nav-tabs card-header-tabs nav-fill" data-bs-toggle="tabs">                    				
					<li class="nav-item" style="background: #163B8F;">                      					
						<a href="#tabs-dasboard" class="nav-link active" data-bs-toggle="tab">
							<svg xmlns="http://www.w3.org/2000/svg" class="icon me-2" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M5 12l-2 0l9 -9l9 9l-2 0" /><path d="M5 12v7a2 2 0 0 0 2 2h10a2 2 0 0 0 2 -2v-7" /><path d="M9 21v-6a2 2 0 0 1 2 -2h2a2 2 0 0 1 2 2v6" /></svg>                          							
							Dashboard
						</a>                     
					</li>                      
					                					                  
				</ul>                
			</div>
                 			
			<div class="card-body">                  			
				<div class="tab-content">                   				
					<div class="tab-pane active show" id="tabs-dasboard">                    
						<div class="row row-deck row-cards"> 							
							<div class="col-lg-6" style="float: left;">    		
								<div class="card">        			
									<div class="card-body">            				
										<h3 class="card-title">Locations</h3>                				
										<div class="ratio ratio-21x9">                					
											<div>                    												
																																						
												  <div id="map" style="height: 500px;"></div>

    <script>
        var conn = new WebSocket('ws://localhost:8080'); // Change the URL to match your WebSocket server

        conn.onopen = function(e) {
            console.log("Connection established!");
        };

        conn.onmessage = function(e) {
            // Handle incoming messages (likely driver location updates)
            var data = JSON.parse(e.data);
            // Update the map with the new location data
            // Example: Update marker positions on the map
        };
    </script>
											</div>				
										</div>        			
									</div>                		
								</div>            	
							</div>							
	
							<div class="col-lg-3" style="float: left;">    
								<div class="card">        
									<div class="card-body">            				
										<h3 class="card-title">Drivers Onboard</h3>                
										<div class="table-responsive">                   				
											<table class="table card-table table-vcenter text-nowrap datatable">                   					
												<thead>                   						
													<tr>                          							
														<th class="w-1">ID</th>                         						       
														<th>Driver</th>                							
														<th>Status</th>	                     
													</tr>                     
												</thead>                    
												<tbody> 
													<?php																		
													$drsql=mysqli_query($connect,"SELECT * FROM `drivers` WHERE `status`='online'");
													while($drrow = mysqli_fetch_array($drsql)){														
													?>													
													<tr>                         							
														<td>								
															<?php echo $drrow['d_id']; ?>							
														</td>                          							
														<td>								
															<span class="text-secondary">									
																<?php echo $drrow['d_name']; ?>								
															</span>							
														</td>                        							
														<td>								
															<span class="badge bg-success me-1"></span> Online							
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
								
							<div class="col-lg-3" style="float: left;">    		
								<div class="card">        			
									<div class="card-body">            				
										<h3 class="card-title">Drivers Waiting</h3>                				
										<div class="table-responsive">                   				
											<table class="table card-table table-vcenter text-nowrap datatable">                   					
												<thead>                   						
													<tr>                          							
														<th class="w-1">ID</th>                         						       
														<th>Driver</th>                							
														<th>Status</th>		
													</tr>                     					
												</thead>                    					
												<tbody> 												
													<?php						
													$drvsql=mysqli_query($connect,"SELECT * FROM `drivers` WHERE `status`='online'");							
													while($drvrow = mysqli_fetch_array($drvsql)){	
													?>													
													<tr>                         						
														<td>								
															<?php echo $drvrow['d_id']; ?>							
														</td>                          							
														<td>								
															<span class="text-secondary">									
																<?php echo $drvrow['d_name']; ?>								
															</span>							
														</td>                        							
														<td>								
															<span class="badge bg-success me-1"></span> Online							
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
	</div>              
</div>
<div class="row">
<div class="row row-deck row-cards"> 	 	    	                                                                                       
	<div class="col-md-12">                	
		<div class="card">                  		
			<div class="card-header">                  			
				<ul class="nav nav-tabs card-header-tabs nav-fill" data-bs-toggle="tabs">                    				
					<li class="nav-item" style="background: #3046CC;">                      					
						<a href="#tabs-today" class="nav-link active" data-bs-toggle="tab">							                          						
							<svg xmlns="http://www.w3.org/2000/svg" class="icon me-2" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M5 12l-2 0l9 -9l9 9l-2 0" /><path d="M5 12v7a2 2 0 0 0 2 2h10a2 2 0 0 0 2 -2v-7" /><path d="M9 21v-6a2 2 0 0 1 2 -2h2a2 2 0 0 1 2 2v6" /></svg>                          							
							Today's Booking						
						</a>                     
					</li>                      					
					<li class="nav-item">                       					
						<a href="#tabs-pre" class="nav-link" data-bs-toggle="tab">							                         						
							<svg xmlns="http://www.w3.org/2000/svg" class="icon me-2" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M8 7a4 4 0 1 0 8 0a4 4 0 0 0 -8 0" /><path d="M6 21v-2a4 4 0 0 1 4 -4h4a4 4 0 0 1 4 4v2" /></svg>
							Pre Booking						
						</a>                     					
					</li>                     					                  				
				</ul>                			
			</div>                 			
			<div class="card-body">                  			
				<div class="tab-content">                   				
					<div class="tab-pane active show" id="tabs-today">                    
						<div class="table-responsive">                   				
							<table class="table card-table table-vcenter text-nowrap datatable" id="jobs_table">                   					
								<thead>                   						
									<tr>                          							
										<th class="w-1">ID</th>                         							
										<th class="w-1">Date</th>                          							
										<th style="background:rgba(227,136,137,0.61);">Time</th>                         							
										<th style="background:rgba(227,136,137,0.61);">Passenger</th>                         							
										<th style="width: 15%;">Pickup</th>                         							
										<th style="width: 15%;">Destination</th>                         							
										<th style="background:rgba(227,136,137,0.61);">Fare</th>                        							
										<th>Vehicle</th>                       							
										<th>Note</th>                       							
										<th>Status</th>                       							
										<th style="background:rgba(227,136,137,0.61);">Driver</th>                       							
										<!--<th>Action</th>-->                       						
									</tr>                     					
								</thead>                    					
								<tbody> 						
									<?php																											
									$jobsql=mysqli_query($connect,"SELECT jobs.*, clients.c_name, clients.c_email, clients.c_phone, bookings.book_id, bookings.pickup, bookings.destination, bookings.passenger, bookings.luggage, bookings.book_date, bookings.book_time, bookings.journey_type, bookings.v_id, drivers.d_name, vehicles.v_name FROM jobs, clients, bookings, drivers, vehicles WHERE jobs.book_id = bookings.book_id AND jobs.c_id = clients.c_id AND jobs.d_id = drivers.d_id AND bookings.v_id = vehicles.v_id AND	jobs.job_status = 'waiting'");
									while($jobrow = mysqli_fetch_array($jobsql)){																	
																								
									?>													
									<tr>                         						
										<td>							
											<?php echo $jobrow['job_id']; ?>						
										</td>                          							
										<td>								
											<span class="text-secondary">									
												<?php echo $jobrow['book_date']; ?>								
											</span>						
										</td>                        							
										<td style="background:rgba(227,136,137,0.61);">								
											<?php echo $jobrow['book_time']; ?>							
										</td>                        							
										<td style="background:rgba(227,136,137,0.61);">                           								
											<?php echo $jobrow['c_name']; ?>                     							
										</td>                         							
										<td>                          								
											<?php echo $jobrow['pickup']; ?>                     							
										</td>                         							
										<td>                           								
											<?php echo $jobrow['destination']; ?>                      							
										</td>                          							
										<td style="background:rgba(227,136,137,0.61);">                            								
											<?php echo $jobrow['fare']; ?>                        							
										</td>                          							
										<td>Car</td>   							
										<td><?php echo $jobrow['note']; ?>  </td>							
										<td><?php echo $jobrow['job_status']; ?>  </td>							
										<td style="background:rgba(227,136,137,0.61);"><?php echo $jobrow['d_name']; ?> </td>
										<!--<td class="text-end">                            								
											<span class="dropdown">                              									
												<button class="btn align-text-top">Dispatch</button>								
											</span>                         							
										</td>  -->                     						
									</tr>                              						
									<?php									
									}									
									?>										
								</tbody>                    				
							</table>    
						
						</div>											
					</div>                    
					<div class="tab-pane" id="tabs-pre">
                    
						
                      
					</div>                                          
				</div>                  
			</div>                
		</div>             
	</div>           
</div>   
	</div>


<script>  
	$(document).ready(function(){       
		$('#jobs_table').DataTable();   
	});   
	
		
</script> 
<?php		
include('footer.php');		
?>