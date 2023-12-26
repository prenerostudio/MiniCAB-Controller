<?php
include('header.php');
?>     
<div class="page-header d-print-none page_padding">	
   
		<div class="row g-2 align-items-center">        
			<div class="col">            
				<!-- Page pre-title -->                
				<div class="page-pretitle">                
					Overview                
				</div>                
				<h2 class="page-title">                
					Fares Corrections Section              
				</h2>              
			</div>
			
		</div>
	
</div>          
<div class="page-body page_padding">          
	
		<div class="row row-deck row-cards">
			<div class="card">					
	<div class="card-header">						
		<h2 class="page-title">              					
			Fare Requests List             						
		</h2>					
										
	</div>            			
	<div class="card-body">            			
		<div id="table-default" class="table-responsive">            					
			<table class="table card-table table-vcenter text-nowrap datatable" id="fare-tbl">                   												
				<thead>                   															
					<tr align="center">                          																		
						<th class="w-1">ID</th>                         																				
						<th class="w-1">Job</th>                          																				
						<th >Driver</th>                         																				
						<th>Journey Fare</th>                         																				
						<th>Extra Waiting</th> 
						
						<th>Parking</th> 
						<th>Tolls</th> 
						<th>Status</th> 
						
						<th></th>                       																			
					</tr>                     																
				</thead>                    														
				<tbody> 															
					<?php
					$n = 0;
					$fsql=mysqli_query($connect,"SELECT fares.*, jobs.*, drivers.*, bookings.* FROM fares, jobs, drivers, bookings WHERE fares.job_id = jobs.job_id AND fares.d_id = drivers.d_id AND jobs.book_id = bookings.book_id ORDER BY fares.fare_id DESC");											
					while($frow = mysqli_fetch_array($fsql)){
						$n++;
					?>																								
					<tr align="center">                         																	
						<td>																				
							<?php echo $n; ?>																					
						</td>                          																				
						<td style="width: 10%;">														
									Booking ID:<?php echo $frow['job_id'];?><br>
							<?php echo $frow['pickup']; ?> ------> <?php echo $frow['destination']; ?>
							
								
						</td>                        																				
						<td>																					
							<?php echo $frow['d_name']; ?>																				
						</td>                        																				
						<td>                           																				<?php echo $frow['journey_fare']; ?>
						</td> 
						
						<td>                           																				<?php echo $frow['extra_waiting']; ?>	
							
						</td> 
						
						<td>                           																				<?php echo $frow['parking']; ?>	
							
						</td> 
						<td>                          																					<?php echo $frow['tolls']; ?>
							
						</td>
						<td>                          																					<?php echo $frow['fare_status']; ?>
							
						</td>
						
						<td class="text-end">
							<?php
						
						if($frow['fare_status']=='Corrected'){
							?>
														
								<button class="btn align-text-top" disabled>
									<i class="ti ti-eye" style="font-size: 16px; margin-right: 10px;"></i>
									Edit
								</button>								
							
							<?php
						}else{
							?>
							
						
							<a href="correction-details.php?id=<?php echo $frow['fare_id']; ?>">							
								<button class="btn align-text-top">
									<i class="ti ti-eye" style="font-size: 16px; margin-right: 10px;"></i>
									Edit
								</button>								
							</a>	
							<?php
							}
						?>
							
							<?php
						
						if($frow['fare_status']=='Corrected'){
							?>
							
														
								<button class="btn btn-success align-text-top" disabled>
									<i class="ti ti-checks" style="font-size: 16px; margin-right: 10px;"></i>
									Approve
								</button>											
							
							
							<?php
						}else{
							?>
							<a href="approve-fares.php?id=<?php echo $frow['fare_id']; ?>">								
								<button class="btn btn-success align-text-top">
									<i class="ti ti-checks" style="font-size: 16px; margin-right: 10px;"></i>
									Approve
								</button>											
							</a>
							<?php
							}
						?>
							
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

<?php	
include('footer.php');	
?>