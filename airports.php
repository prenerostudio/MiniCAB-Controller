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
				Airports Section                				
			</h2>              			
		</div>		
		<div class="col-auto ms-auto d-print-none">            		
			<div class="btn-list">                			
				<a href="#" class="btn btn-primary d-none d-sm-inline-block" data-bs-toggle="modal" data-bs-target="#modal-ap">
					<i class="ti ti-map-pin-plus"></i>                    					
					Add Airports                					
				</a>              				
			</div>              			
		</div>		
	</div>	
</div>

<div class="page-body page_padding">          		
	<div class="row row-deck row-cards">					  							
		<div class="col-12">		
			<div class="card">			
				<div class="card-header">				
					<h3 class="card-title">Airports List</h3>					
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
										<button class="table-sort" data-sort="sort-date">Airport Name</button>										
									</th>                                									
									<th>									
										<button class="table-sort" data-sort="sort-time">Address</button>										
									</th>                                									
									<th>									
										<button class="table-sort" data-sort="sort-passenger">City </button>										
									</th>                                									
									<th>									
										<button class="table-sort" data-sort="sort-pickup">Code</button>										
									</th>       									
									<th>									
										<button class="table-sort">Actions</button>										
									</th>                            									
								</tr>                       								
							</thead>                       													
							<tbody class="table-tbody">                        													
								<?php                            														
								$x = 0;                            														
								$asql = mysqli_query($connect, "SELECT * FROM `airports`");   														
								while ($arow = mysqli_fetch_array($asql)) :								
								$x++;                            														
								?>								
								<tr>                            															
									<td class="sort-id">																	
										<?php echo $x; ?>																	
									</td>                                   																
									<td class="sort-date">									
										<?php echo $arow['ap_name']; ?>											
									</td>                                   																
									<td class="sort-time">																	
										<?php echo $arow['ap_address']; ?>																	
									</td>                                  																
									<td class="sort-passenger">																		
										<?php echo $arow['ap_city']; ?>																		
									</td>                                 																	
									<td class="sort-pickup">																	
										<?php echo $arow['ap_code']; ?>																	
									</td>									
									<td>																		
										<a href="view-airport.php?ap_id=<?php echo $arow['ap_id']; ?>">										
											<button class="btn btn-info">											
												<i class="ti ti-eye"></i>												
												View												
											</button>                                        											
										</a>                                       										
										<a href="del-airport.php?ap_id=<?php echo $arow['ap_id']; ?>">										
											<button class="btn btn-danger">											
												<i class="ti ti-square-rounded-x"></i>												
												Delete												
											</button>																									
										</a>                                   										
									</td>									
								</tr>                          														
								<?php endwhile; ?>                         															
								<?php if ($x === 0) : ?>								
								<tr>                                   															
									<td colspan="8">																	
										<p align="center">No Zone Found!</p>																		
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
<script>	
	document.addEventListener("DOMContentLoaded", function() {    			
		const list = new List('table-default', {      							
			sortClass: 'table-sort',			
			listClass: 'table-tbody',			
			valueNames: [ 'sort-id', 'sort-date', 'sort-time', 'sort-fare',	'sort-driver']					
		}); 			
	})	
</script>

<!-------------------------------
----------Add Airport-------------
-------------------------------->

<div class="modal modal-blur fade" id="modal-ap" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">    	
		<div class="modal-content">        		
			<div class="modal-header">            			
				<h5 class="modal-title">Add Airport</h5>            				
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>          			
			</div> 
			<form method="post" enctype="multipart/form-data" action="airport-process.php">			
				<div class="modal-body">								
					<div class="row">              					
						<div class="col-lg-6">				
							<div class="mb-3">              					
								<label class="form-label">Airport Name</label>              					
								<input type="text" class="form-control" name="ap_name" placeholder="Airport Name" required>            				
							</div> 						
						</div>              					
						<div class="col-lg-6">                
							<div class="mb-3">                  							
								<label class="form-label">Address</label>              					
								<input type="text" class="form-control" name="ap_address" placeholder="Address" required>
							</div>             				
						</div>            				
					</div>
								
					<div class="row">              					
						<div class="col-lg-6">				
							<div class="mb-3">              					
								<label class="form-label">City</label>              					
								<input type="text" class="form-control" name="ap_city" placeholder="City" required>
							</div> 						
						</div>              					
						<div class="col-lg-6">                
							<div class="mb-3">                  
								<label class="form-label">Code</label>              					
								<input type="text" class="form-control" name="ap_code" placeholder=" Air-0004" required>
							</div>             					
						</div>            				
					</div>						
									          				          
				</div>          			
				        			
				<div class="modal-footer">           
					<a href="#" class="btn btn-danger" data-bs-dismiss="modal"> 
						<i class="ti ti-circle-x" style="margin-right: 10px; font-size: 20px;"></i>
						Cancel           				
					</a>           				
					<button type="submit" class="btn ms-auto btn-success" data-bs-dismiss="modal">												
						<i class="ti ti-plane-tilt" style="margin-right: 10px; font-size: 20px;"></i>						
						Save Airport  						
					</button>       			
				</div> 								
			</form>		
		</div>      	
	</div>    
</div>   

<?php
include('footer.php');
?>