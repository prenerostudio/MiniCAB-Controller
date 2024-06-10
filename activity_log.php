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
				Activity Logs		
			</h2>			
		</div>					
	</div>	
</div>          

<div class="page-body page_padding">	       			
	<div class="col-12">		
		<div class="card">				
			<div class="card-header">						
				<h3 class="card-title">				
					Activity Logs List				
				</h3>							
			</div>			
			<div class="card-body border-bottom py-3">						
				<div id="table-default" class="table-responsive">                  								
					<table class="table" id="logs">										
						<thead>                      												
							<tr>                        														
								<th>ID</th>								
								<th> Time </th>																	
								<th> Activity Title </th>																
								<th> Activity Details </th>																
								<th> User </th>   															
							</tr>													
						</thead>						
						<tbody class="table-tbody">												
							<?php														
							$y=0;														
							$actsql=mysqli_query($connect,"SELECT activity_log.*, users.* FROM activity_log JOIN users ON activity_log.user_id = users.user_id WHERE activity_log.user_type = 'user' ORDER BY activity_log.log_id DESC");
							while($actrow = mysqli_fetch_array($actsql)){							
								$y++;															
							?>    							
							<tr>							
								<td>
									<?php echo $y; ?>
								</td>										
								<td>
									<?php echo $actrow['timestamp'] ?>
								</td>										
								<td> 
									<?php echo $actrow['activity_type'] ?> 
								</td>										
								<td> 
									<?php echo $actrow['details'] ?> 
								</td>										
								<td> 
									<?php echo $actrow['first_name'];?> <?php echo $actrow['last_name'];?> 
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
<script>
	$(document).ready(function() {    
		$('#logs').DataTable();
	});
</script>
<?php	
include('footer.php');	
?>