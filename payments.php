<?php
include('header.php');	
?>
<div class="page-header d-print-none page_padding">		   		
	<div class="row g-2 align-items-center">        			
		<div class="col">            												
			<div class="page-pretitle">                									
				Overview                							
			</div>                												
			<h2 class="page-title">                									
				Drivers Accounts              										
			</h2>              							
		</div>								
	</div>	
</div>

<div class="page-body page_padding">
	<div class="row row-deck row-cards">							
		<div class="col-md-12">        				
			<div class="card">         										
				<div class="card-body">								
					<h2 class="mb-4">
						Driver Accounts Details
					</h2>										
					<div class="row mb-3">										
						<div class="card">
							<div class="card-body border-bottom py-3">							
								<div id="table-adriver" class="table-responsive">
									<table class="table" id="table-payment">									
										<thead>										
											<tr>
												<th>ID</th>												
												<th>Driver Name</th>												
												<th>Phone</th>												
												<th>Total Jobs</th> 
												<th>Total Payment Due</th>												
												<th>Status</th>												
												<th>Actions</th>												
											</tr>											
										</thead>																				
										<tbody class="table-tbody">
											<?php	
											$x = 0;
											$isql = mysqli_query($connect, "SELECT invoice.*, jobs.book_id, drivers.*, bookings.*, booking_type.*, clients.* FROM invoice JOIN jobs ON invoice.job_id = jobs.job_id JOIN drivers ON invoice.d_id = drivers.d_id JOIN bookings ON jobs.book_id = bookings.book_id JOIN booking_type ON bookings.b_type_id = booking_type.b_type_id JOIN clients ON jobs.c_id = clients.c_id");
											while ($irow = mysqli_fetch_array($isql)) :										
											$x++;										
											?>										
											<tr>														
												<td>															
													<?php echo $x; ?>
												</td>															
												<td>
													<?php echo $irow['d_name']; ?>
												</td>															
												<td>
													<?php echo $irow['d_phone']; ?> 
												</td>															
												<td>								
													<?php													
													$dr_id= $irow['d_id'];
													$drsql=mysqli_query($connect, "SELECT jobs.* FROM jobs WHERE jobs.d_id = '$dr_id' AND jobs.job_status = 'completed'");
													$rowcount=mysqli_num_rows($drsql);
													echo $rowcount;													
													?>														
												</td> 												
												<td>	
													<?php 
													$dr_id= $irow['d_id'];													
													$ivsql=mysqli_query($connect, "SELECT invoice.total_pay FROM invoice WHERE invoice.d_id = '$dr_id' AND invoice.invoice_status = 'unpaid'");
													while($prow = mysqli_fetch_array($ivsql)){                                
														 $total_payment += $prow['total_pay'];                          
													 }													
													echo $total_payment;							
													?>
												</td>															
												<td>
													<?php echo $irow['invoice_status']; ?>
												</td>															
												<td>		
													<a href="view-account.php?d_id=<?php $irow['d_id']; ?>">
														<button class="btn btn-info">
															<i class="ti ti-eye"></i>
															View Statement		
														</button>															
													</a>														
												</td>													
											</tr>													
											<?php endwhile; ?>												
											<?php if ($x === 0) : ?>			
											<tr>				
												<td colspan="8">														
													<p align="center">No Invoice Found!</p>						
												</td>													
											</tr>													
											<?php endif; ?>													
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
<script>	
	$(document).ready(function() {
    $('#table-payment').DataTable();
});
</script>
<?php
include('footer.php');
?>