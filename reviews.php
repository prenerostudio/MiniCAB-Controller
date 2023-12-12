<?php
include('header.php');
?>       	
<div class="card">					
	<div class="card-header">						
		<h2 class="page-title">              					
			Customer Reviews List             						
		</h2>					
										
	</div>            			
	<div class="card-body">            			
		<div id="table-default" class="table-responsive">            					
			<table class="table card-table table-vcenter text-nowrap datatable" id="rev_table">                   												
				<thead>                   															
					<tr align="center">                          																		
						<th class="w-1">ID</th>                         																				
						<th class="w-1">Customer Name</th>		
						<th>Booking </th>  
						<th>Driver </th>
						<th>Reviews</th>
						<th></th>                       																			
					</tr>                     																
				</thead>                    														
				<tbody> 															
					<?php
					$asql=mysqli_query($connect,"SELECT reviews.*, bookings.pickup, bookings.destination, bookings.journey_type, bookings.book_time, bookings.book_date, drivers.d_name, clients.c_name FROM jobs, reviews, bookings, clients, drivers WHERE reviews.job_id = jobs.job_id AND jobs.book_id = bookings.book_id AND reviews.d_id = drivers.d_id AND reviews.c_id = clients.c_id");											
					while($arow = mysqli_fetch_array($asql)){																
					?>																								
					<tr align="center">                         																	
						<td>																				
							<?php echo $arow['rev_id']; ?>																					
						</td>                          																				
						<td >														
								<?php echo $arow['c_name']; ?>								
						</td>                        																				
						<td>																					
							<?php echo $arow['pickup']; ?> | <?php echo $arow['destination']; ?> | <?php echo $arow['book_date']; ?> | <?php echo $arow['book_time']; ?>																						
						</td>                        																				
						<td>                           																					
							<?php echo $arow['d_name']; ?>
						</td>                         																				
						<td style="width: 10%;">                          																					
							<?php echo $arow['rev_msg']; ?>
						</td>                         																				
																								
						<td class="text-end">	
							
							<a href="del-review.php?id=<?php echo $arow['rev_id']; ?>">
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
		$('#rev_table').DataTable();   
	});   
	
		
</script> 
<?php
include('footer.php');
?>