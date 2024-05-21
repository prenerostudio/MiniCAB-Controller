<?php
include('header.php');
include('config.php');

$d_id = $_POST['d_id'];
$start_date = $_POST['start_date']; 
$end_date = $_POST['end_date'];

$sql = "SELECT invoice.*, jobs.book_id, jobs.job_note, jobs.job_status, clients.c_name, clients.c_email, clients.c_phone, drivers.d_name, drivers.d_email, drivers.d_phone, bookings.b_type_id, bookings.pickup, bookings.stops, bookings.destination, bookings.passenger, bookings.pick_time, bookings.pick_date, bookings.journey_type, bookings.v_id, booking_type.* FROM invoice INNER JOIN jobs ON invoice.job_id = jobs.job_id INNER JOIN clients ON invoice.c_id = clients.c_id INNER JOIN drivers ON invoice.d_id = drivers.d_id INNER JOIN bookings ON jobs.book_id = bookings.book_id INNER JOIN booking_type ON bookings.b_type_id = booking_type.b_type_id WHERE invoice.invoice_date BETWEEN '$start_date' AND '$end_date' AND invoice.d_id = '$d_id'";
$result = $connect->query($sql);
if ($result->num_rows > 0) {    	
?>     
<div class="page-header d-print-none page_padding">         
	<div class="row g-2 align-items-center">    
		<div class="col">        
			<h2 class="page-title">            
				Driver Report                
			</h2>            
		</div>        		        
		<div class="col-auto ms-auto d-print-none">        
			<button type="button" class="btn btn-primary" onclick="javascript:window.print();">            
				<i class="ti ti-printer"></i>                
				Print Report
			</button>            
		</div>        
	</div>                 
</div>

<div class="page-body page_padding">          			
	<div class="row row-deck row-cards">							
		<div class="col-md-12">        				
			<div class="card">         										
				<div class="card-body">					               
					<h2 class="mb-4">
						Invoices Report from 		
						<?php echo $start_date;?> 		
						to 		
						<?php echo $end_date;?>
					</h2>        										   					
					<div class="row mb-3">											
						<div class="card">												
							<div class="card-body border-bottom py-3">								
								<div id="table-adriver" class="table-responsive">									        
									<table class='table table-responsive'>          
										<tr>            
											<th>Invoice ID</th>
											<th>Driver</th>
											<th>Job Details</th>              
											<th>Customer</th>     
											<th>Total Pay</th>               
											<th>Driver Commission</th>               
											<th>Invoice Status</th>                
											<th>Invoice Date</th>            
										</tr>
										<?php   
											while ($row = $result->fetch_assoc()) {		
										?>       
										<tr>                
											<td>
												<?php echo $row['invoice_id'];?>
											</td> 
											<td>
												<strong style="text-transform: capitalize;">
													<?php echo $row['d_name'];?>
												</strong>
											</td> 
											<td>
												<?php echo $row['pickup'];?> | 
												<?php echo $row['destination'];?>
											</td>
											<td>
												<strong style="text-transform:capitalize;">
													<?php echo $row['c_name'];?>
												</strong>
											</td>                     
											<td>
												<?php echo $row['total_pay'];?>
											</td>                
											<td>
												<?php echo $row['driver_commission'];?>
											</td>                
											<td>
												<?php echo $row['invoice_status'];?>
											</td>               
											<td>
												<?php echo $row['invoice_date'];?>
											</td>										
										</tr>										
										<?php										
											}
										?>    
									</table>
									<?php						   					
						   } else {    							
	echo "No Results Found!";	
}
$connect->close();
									?>
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