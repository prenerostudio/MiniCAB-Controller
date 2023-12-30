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
				
					<h2 class="mb-4">Driver Booking Statements</h2>
					
					<div class="row mb-3">
					
						<div class="card">            							
						
							<div class="card-header">
							
							</div>            							
							
							<div class="card-body border-bottom py-3">                								
							
								<div id="table-adriver" class="table-responsive">
								
									<table class="table">                        									
									
										<thead>                            										
										
											<tr>                                												
											
												<th>														
												
													<button class="table-sort" data-sort="sort-id">ID</button>
													
												</th>
												
												<th>													
												
													<button class="table-sort" data-sort="sort-date">Driver Name</button>
													
												</th>
												
												<th>													
												
													<button class="table-sort" data-sort="sort-time">Phone</button>
													
												</th>
												
												<th>													
												
													<button class="table-sort" data-sort="sort-passenger">Total Jobs</button>
													
												</th> 
												<th>													
												
													<button class="table-sort" data-sort="sort-passenger">Total Payment Due</button>
													
												</th> 
												
												<th>														
												
													<button class="table-sort" data-sort="sort-passenger">Status</button>
													
												</th>												
												
												<th>														
												
													<button class="table-sort">Actions</button>
													
												</th>                            												
												
											</tr>                       											
											
										</thead>
										
										<tbody class="table-tbody">
										
											<?php											
											
											$x = 0;
											
											$isql = mysqli_query($connect, "SELECT
	invoice.*,
	jobs.book_id,
	drivers.*,
	bookings.*,
	booking_type.*,
	clients.* 
FROM
	invoice,
	jobs,
	drivers,
	bookings,
	clients,
	booking_type 
WHERE
	invoice.job_id = jobs.job_id 
	AND invoice.d_id = drivers.d_id 
	AND jobs.book_id = bookings.book_id 
	AND bookings.b_type_id = booking_type.b_type_id 
	AND jobs.c_id = clients.c_id");
														
											while ($irow = mysqli_fetch_array($isql)) :											
														
											$x++;
														
											?>
														
											<tr>
														
												<td class="sort-id">
															
													<?php echo $x; ?>												
															
												</td>									
															
												<td class="sort-time">
																
													<?php echo $irow['d_name']; ?>
															
												</td>                                  							
															
												<td class="sort-passenger">
															
													<?php echo $irow['d_phone']; ?> 
															
													
														
												</td>
															
												<td class="sort-pickup">
															
													
													<?php
													
													$dr_id= $irow['d_id'];
													$drsql=mysqli_query($connect, "SELECT jobs.* FROM jobs WHERE jobs.d_id = '$dr_id' AND jobs.job_status = 'completed'");
													$rowcount=mysqli_num_rows($drsql);
													echo $rowcount;
													
													?>
														
												</td> 
												
												<td class="sort-pickup">
															
													<?php echo $irow['total_pay']; ?>
														
												</td> 
															
												<td class="sort-pickup">								
																
													<?php echo $irow['invoice_status']; ?>							
															
												</td>															
															
												<td>				
															
													<a href="invoice.php?invoice_id=<?php echo $irow['invoice_id']; ?>">
															
														<button class="btn btn-info">
															
															<i class="ti ti-eye"></i>
																
															View Invoice
																
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



<?php
include('footer.php');
?>