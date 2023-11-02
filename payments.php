<?php
include('header.php');
?>       	
<div class="card">					
	<div class="card-header">						
		<h2 class="page-title">              					
			Payments Invoices           						
		</h2>
		<div class="col-auto ms-auto d-print-none">										
			<div class="btn-list">                                 			
				<a href="#" class="btn d-none d-sm-inline-block btn-danger" data-bs-toggle="modal" data-bs-target="#modal-ap">
					<svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M12 5l0 14" /><path d="M5 12l14 0" /></svg>                   					
					Account Balance                  					
				</a> 
				<a href="#" class="btn d-none d-sm-inline-block btn-info" data-bs-toggle="modal" data-bs-target="#modal-ap">
					<svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M12 5l0 14" /><path d="M5 12l14 0" /></svg>                   					
					Payment History                  					
				</a> 
			</div>              			
		</div>
									
	</div>            			
	<div class="card-body">            			
		<div id="table-default" class="table-responsive">            					
			<table class="table card-table table-vcenter text-nowrap datatable" id="pay-tbl">                   												
				<thead>                   															
					<tr align="center">                          																		
						<th class="w-1">ID</th>                         																				
						<th class="w-1">Booking # </th>                          																				
						<th >Driver</th>                         																				
						<th>Payment Method</th>                         																				
						<th>Total Fare</th>                         																				
						
						<th></th>                       																			
					</tr>                     																
				</thead>                    														
				<tbody> 															
					<?php
					$isql=mysqli_query($connect,"SELECT invoice.*, drivers.d_name, bookings.pickup, bookings.destination, bookings.book_date, bookings.book_time, bookings.journey_type, jobs.job_id  FROM invoice, drivers, jobs, bookings WHERE invoice.job_id = jobs.job_id AND invoice.d_id = drivers.d_id AND jobs.book_id = bookings.book_id");											
					while($irow = mysqli_fetch_array($isql)){																
					?>																								
					<tr align="center">                         																	
						<td>																				
							<?php echo $irow['invoice_id']; ?>																					
						</td>                          																				
						<td style="width: 10%;">														
								<?php echo $irow['job_id']; ?> <br>	<?php echo $irow['pickup']; ?> | <?php echo $irow['destination']; ?>						
						</td>                        																				
						<td>																					
							<?php echo $irow['d_name']; ?>																						
						</td>                        																				
						<td>                           																					
							<?php echo $irow['p_method']; ?>
						</td>                         																				
						<td>                          																					
							<?php echo $irow['total_pay']; ?>
						</td>                         																				
																								
						<td class="text-end">	
							<a href="airport-detail.php?id=<?php echo $irow['invoice_id']; ?>">
							<button class="btn align-text-top">View</button>	
							</a>
							<a href="del-airport.php?id=<?php echo $irow['invoice_id']; ?>">
								<button class="btn btn-danger align-text-top">Delete</button>											</a>								

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


<script>  
	$(document).ready(function(){       
		$('#pay-tbl').DataTable();   
	});   
		
</script> 
<?php
include('footer.php');
?>