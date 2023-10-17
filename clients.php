<?php
include('header.php');
?>

<div class="container-xl">
          
	<div class="card">
			
		<div class="card-header">
			
			<h2 class="page-title">
              
				Clients List
             
			</h2>
				<div class="col-auto ms-auto d-print-none">
                <div class="btn-list">
                 
                  <a href="#" class="btn d-none d-sm-inline-block" data-bs-toggle="modal" data-bs-target="#modal-client">
                    
                    <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M12 5l0 14" /><path d="M5 12l14 0" /></svg>
                   Add New Client
                  </a>
                 
                </div>
              </div>
				
		</div>
            
		<div class="card-body">
            
			<div id="table-default" class="table-responsive">
            
				<table class="table card-table table-vcenter text-nowrap datatable">                   					
								<thead>                   						
									<tr>                          							
										<th class="w-1">ID</th>                         							
										<th class="w-1">Date</th>                          							
										<th style="background:rgba(227,136,137,0.61);">Time</th>                         							
										<th style="background:rgba(227,136,137,0.61);">Passenger</th>                         							
										<th style="width: 15%;">Pickup</th>                         							
										<th style="width: 15%;">Destination</th>                         							
										<th style="background:rgba(227,136,137,0.61);">Fare</th>                        							
										<th>Vehicle</th>                       							
										<th>Note</th>                       							
										<th>Status</th>                       							
										<th style="background:rgba(227,136,137,0.61);">Driver</th>                       							
										<th>Action</th>                       						
									</tr>                     					
								</thead>                    					
								<tbody> 						
									<?php																											
									$jsql=mysqli_query($connect,"SELECT * FROM `jobs` WHERE `status`='Waiting'");
									while($jrow = mysqli_fetch_array($jsql)){																	
										$book_id = $jrow['book_id'];														
										$bsql = mysqli_query($connect,"SELECT * FROM `bookings` WHERE `book_id`='$book_id'");
										$brow = mysqli_fetch_array($bsql);														
										$c_id = $jrow['c_id'];														
										$csql = mysqli_query($connect,"SELECT * FROM `clients` WHERE `c_id`='$c_id'");							
										$crow = mysqli_fetch_array($csql);
										$d_id = $jrow['d_id'];														
										$dsql = mysqli_query($connect,"SELECT * FROM `drivers` WHERE `d_id`='$d_id'");
										$drow = mysqli_fetch_array($dsql);															
									?>													
									<tr>                         						
										<td>							
											<?php echo $jrow['job_id']; ?>						
										</td>                          							
										<td>								
											<span class="text-secondary">									
												<?php echo $brow['book_date']; ?>								
											</span>						
										</td>                        							
										<td style="background:rgba(227,136,137,0.61);">								
											<?php echo $brow['book_time']; ?>							
										</td>                        							
										<td style="background:rgba(227,136,137,0.61);">                           								
											<?php echo $crow['c_name']; ?>                     							
										</td>                         							
										<td>                          								
											<?php echo $brow['pickup']; ?>                     							
										</td>                         							
										<td>                           								
											<?php echo $brow['destination']; ?>                      							
										</td>                          							
										<td style="background:rgba(227,136,137,0.61);">                            								
											<?php echo $brow['fare']; ?>                        							
										</td>                          							
										<td>Car</td>   							
										<td><?php echo $jrow['note']; ?>  </td>							
										<td><?php echo $jrow['status']; ?>  </td>							
										<td style="background:rgba(227,136,137,0.61);"><?php echo $drow['d_name']; ?> </td>
										<td class="text-end">                            								
											<span class="dropdown">                              									
												<button class="btn align-text-top">Dispatch</button>								
											</span>                         							
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

<?php
include('footer.php');
?>