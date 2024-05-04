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
					Dashboard                
				</h2>              
			</div>
			<div class="col-auto ms-auto d-print-none">            
				<!--<div class="btn-list">                
					<span class="d-none d-sm-inline">
						<a href="#" class="btn">						
							<i class="ti ti-user-search" style="margin-right: 10px;"></i>                     
							Driver Tracking                    
						</a>                  
					</span>                  
					<a href="#" class="btn btn-primary d-none d-sm-inline-block" data-bs-toggle="modal" data-bs-target="#modal-booking">                   
						<i class="ti ti-bookmark-plus" style="margin-right: 10px;"></i>                    
						Create New Booking                  
					</a>                  
					<a href="#" class="btn btn-primary d-sm-none btn-icon" data-bs-toggle="modal" data-bs-target="#modal-booking" aria-label="Create new report">                    
						<i class="ti ti-bookmark-plus"></i>                  
					</a>                
				</div>    -->          
			</div>
		</div>
	
</div>          
<div class="page-body page_padding">          
	
       

			<div class="col-12">            			
				<div class="card">                				
					<div class="card-header">                    					
						<h3 class="card-title">Activity Logs	</h3>                  					
					</div>                  
					<div class="card-body border-bottom py-3">
						<div id="table-default" class="table-responsive">                  
							<table class="table">                    
								<thead>                      
									<tr>                        
										<th>
											<button class="table-sort" data-sort="sort-id">ID</button>
										</th>                        
										                    
										<th>
											<button class="table-sort" data-sort="sort-time">Time</button>
										</th>                       
										<th>
											<button class="table-sort" data-sort="sort-passenger">Activity Title</button>
										</th>                        
										<th>
											<button class="table-sort" data-sort="sort-pickup">Activity Details</button>
										</th>                        
										<th>
											<button class="table-sort" data-sort="sort-dropoff">User</button>
										</th>                       
										                    
									</tr>                   
								</thead>                  
								<tbody class="table-tbody">					
									<?php										
									$y=0;								
									$actsql=mysqli_query($connect,"SELECT * FROM `activity_log`");									
									while($actrow = mysqli_fetch_array($actsql)){											
										$y++;
									?>														                     
									<tr>                        
										<td class="sort-id"><?php echo $y; ?></td>                        
										<td class="sort-date"><?php echo $actrow['timestamp'] ?></td> 										
										<td class="sort-vehicle"> <?php echo $actrow['activity_type'] ?> </td>
										<td class="sort-status"> <?php echo $actrow['details'] ?> </td>
										<td class="sort-driver"> <?php echo $actrow['user'] ?> </td>
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
<script>	
	document.addEventListener("DOMContentLoaded", function() {    	
		const list = new List('table-default', {      			
			sortClass: 'table-sort',      				
			listClass: 'table-tbody',      				
			valueNames: [ 'sort-id', 'sort-date', 'sort-time', 'sort-fare',						      					
						 'sort-driver'      	
						]			
		}); 		
	})	
</script>
<?php	
include('footer.php');	
?>