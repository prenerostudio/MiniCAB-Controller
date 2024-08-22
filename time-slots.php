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
		<div class="col-7">            					
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
									<th>Driver</th> 
									<th>Status</th>									
								</tr>                     													
							</thead>                    												
							<tbody> 													
								<?php								
								$n=0;								
								$atsql=mysqli_query($connect,"SELECT availability_times.*, drivers.* FROM availability_times LEFT JOIN drivers ON availability_times.d_id = drivers.d_id ORDER BY availability_times.at_id DESC");
								while($atrow = mysqli_fetch_array($atsql)){				
									$n++		
								?>																					
								<tr>                         														
									<td>																
										<?php echo $n; ?>																
									</td>
									<td>
										<?php echo $atrow['at_date']; ?>								
									</td>									
									<td>
										<?php echo $atrow['start_time']; ?>
									</td> 									
									<td>																				
										<span>												
											<?php echo $atrow['end_time']; ?>												
										</span>										
									</td>
									<td>									
										<?php echo $atrow['d_name']; ?>									
									</td>
									<td>	
										<?php 
											if($atrow['at_status']==0){
										?>
										
										<div class="col-auto status">
											<span class="status-dot status-dot-animated bg-orange d-block"></span>
											<span>Pending</span>									
										</div>
										<?php
									
											}else{
										?>
										
										<div class="col-auto status">
											<span class="status-dot status-dot-animated bg-green d-block"></span>
											<span>Accepted</span>									
										</div>
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
		<script>					
			$(document).ready(function() {    
				$('#slots').DataTable();
			});	
		</script>				
		<div class="col-5">            					
			<div class="card">                							
				<div class="card-header">                    									
					<h3 class="card-title">
						Add Time Slot
					</h3>                  										
				</div>                  				
				<div class="card-body border-bottom py-3">					
					<form method="post" action="time-slot-process.php" onsubmit="return validateForm();">				
						<div class="modal-body">																		
							<div class="row">					
								<div class="col-lg-12">						
									<div class="mb-3">								
										<label class="form-label">Select Date:</label>
										<input type="date" name="mdate" class="form-control" required>							
									</div>						
								</div>						
								<div class="col-lg-12">							
									<div class="mb-3">								
										<label class="form-label">Start Time:</label>								
										<input type="time" name="stime" class="form-control" required>							
									</div>						
								</div>												
								<div class="col-lg-12">                													
									<div class="mb-3">								
										<label class="form-label">End Time:</label>								
										<input type="time" name="etime" class="form-control" required>
									</div>						
								</div>					
							</div>							          				          				
						</div>				       							
						<div class="modal-footer">					
											
							<button type="submit" class="btn btn-success">												
								<i class="ti ti-clock-plus"></i>						
								Save Time Slot											
							</button>       							
						</div> 											
					</form>									
				</div>                                                    				
			</div>              					
		</div>				
	</div>
</div>        
<script>
	function validateForm() {       
        var dateInput = document.getElementsByName("date")[0].value;
        var stimeInput = document.getElementsByName("stime")[0].value;
        var etimeInput = document.getElementsByName("etime")[0].value;
        if (dateInput === "" || stimeInput === "" || etimeInput === "") {            
            alert("Please fill in all required fields.");
            return false;
        }        
        return true;
    }
</script>
<?php
include('footer.php');
?>