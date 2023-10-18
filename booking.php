<?php
include('header.php');
?>

<div class="container-xl">
          
	<div class="card">
			
		<div class="card-header">
			
			<h2 class="page-title">
              
				Bookings List
             
			</h2>
			<div class="col-auto ms-auto d-print-none">
                <div class="btn-list">
                 
                  <a href="#" class="btn d-none d-sm-inline-block" data-bs-toggle="modal" data-bs-target="#modal-booking">
                    
                    <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M12 5l0 14" /><path d="M5 12l14 0" /></svg>
                   Add New Booking
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
										                      							
										<th>Vehicle</th>                       							
										<th>Note</th>                       							
										<th>Status</th>                       							
										                  							
										<th>Action</th>                       						
									</tr>                     					
								</thead>                    					
								<tbody> 						
									<?php																											
									$booksql=mysqli_query($connect,"SELECT * FROM `bookings` WHERE `status`='Pending'");
									while($bookrow = mysqli_fetch_array($booksql)){																	
										
										$cus_id = $bookrow['c_id'];
										
										//echo $cus_id;
										//die;
										
										$cussql = mysqli_query($connect,"SELECT * FROM `clients` WHERE `c_id`='$cus_id'");
										$cusrow = mysqli_fetch_array($cussql);
										
									?>													
									<tr>                         						
										<td>							
											<?php echo $bookrow['book_id']; ?>						
										</td>                          							
										<td>								
											<span class="text-secondary">									
												<?php echo $bookrow['book_date']; ?>								
											</span>						
										</td>                        							
										<td style="background:rgba(227,136,137,0.61);">								
											<?php echo $bookrow['book_time']; ?>							
										</td>                        							
										<td style="background:rgba(227,136,137,0.61);">                           								
											<?php echo $cusrow['c_name']; ?>                     							
										</td>                         							
										<td>                          								
											<?php echo $bookrow['pickup']; ?>                     							
										</td>                         							
										<td>                           								
											<?php echo $bookrow['destination']; ?>                      							
										</td>                          							
										                         							
										<td>Car</td>   							
										<td><?php echo $bookrow['note']; ?>  </td>							
										<td><?php echo $bookrow['status']; ?>  </td>							
										
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