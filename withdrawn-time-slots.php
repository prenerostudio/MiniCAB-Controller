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
				Time Slots For Drivers			
			</h2>		
		</div>		
	</div>	
</div>
<div class="page-body page_padding">          
	<div class="row row-deck row-cards">			      		
		<div class="col-12">            							
			<div class="card">                										
				<div class="card-header">		
					<h3 class="card-title">					
						All Time Slots For Drivers					
					</h3>                  														
				</div>                  								
				<div class="card-body border-bottom py-3">								
					<div class="table-responsive">					
						<table class="table table-responsive" id="slots">						
							<thead>							
								<tr>														
									<th>ID</th>									
									<th>Date</th>									
									<th>Start Time</th>									
									<th>End Date</th>
									<th>Status</th>									
									<th>Action</th> 								
								</tr>									
							</thead>								
							<tbody>
								<?php								
								$n=0;								
								$atsql=mysqli_query($connect,"SELECT time_slots.*, drivers.* FROM time_slots LEFT JOIN drivers ON time_slots.d_id = drivers.d_id WHERE time_slots.ts_status = 3 ORDER BY time_slots.ts_id DESC");
								while($atrow = mysqli_fetch_array($atsql)){
									$n++
								?>			
								<tr>		
									<td>										
										<?php echo $n; ?>
									</td>									
									<td>									
										<?php echo $atrow['ts_date'];?>		
									</td>									
									<td>									
										<?php echo $atrow['start_time'];?>
									</td>									
									<td>					
										<span>										
											<?php echo $atrow['end_time'];?>
										</span>									
									</td>									
									<td>	
										<?php 
											if($atrow['ts_status']==0){
										?>
										
										<div class="col-auto status">
											<span class="status-dot status-dot-animated bg-orange d-block"></span>
											<span>Pending</span>									
										</div>
										<?php
									
											}elseif($atrow['ts_status']==1){
										?>
										
										<div class="col-auto status">
											<span class="status-dot status-dot-animated bg-green d-block"></span>
											<span>Accepted</span>									
										</div>
										<?php
									
											}elseif($atrow['ts_status']==2){
										?>
										
										<div class="col-auto status">
											<span class="status-dot status-dot-animated bg-red d-block"></span>
											<span>Cancelled</span>									
										</div>
										<?php
									
											}elseif($atrow['ts_status']==3){
										?>
										
										<div class="col-auto status">
											<span class="status-dot status-dot-animated bg-orange d-block"></span>
											<span>Withdrawn</span>									
										</div>
										<?php
									
											}else{
										?>
										
										<div class="col-auto status">
											<span class="status-dot status-dot-animated bg-green d-block"></span>
											<span>Completed</span>									
										</div>
										<?php
											}
										?>				
									</td>								
									<td>
										<a href="del-time-slot.php?ts_id=<?php echo $atrow['ts_id']; ?>" title="Delete">
										
											<button class="btn btn-youtube btn-icon">
												<i class="ti ti-square-rounded-x"></i>
											</button>
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
		<script>					
			$(document).ready(function() {    
				$('#slots').DataTable();
			});	
		</script>				
						
	</div>
</div>        

<?php
include('footer.php');
?>