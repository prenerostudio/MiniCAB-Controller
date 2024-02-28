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
				Drivers Section                				
			</h2>              			
		</div>		
		<div class="col-auto ms-auto d-print-none">            		
			<div class="btn-list">                			
				<a href="#" class="btn btn-primary d-none d-sm-inline-block" data-bs-toggle="modal" data-bs-target="#modal-driver">
					<i class="ti ti-user-plus"></i>                    					
					Add New Driver                  					
				</a>                  				
				<a href="#" class="btn btn-primary d-sm-none btn-icon" data-bs-toggle="modal" data-bs-target="#modal-driver" aria-label="Create new report">                    				
					<i class="ti ti-bookmark-plus"></i>                  					
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
					
									<h3 class="card-title">New Drivers Request List</h3>
				
								</div>                  				
				
								
								<div class="card-body border-bottom py-3">				
					
									<div id="table-ndriver" class="table-responsive">                  					
						
										<table class="table">                    						
							
											<thead>                      							
								
												<tr>									
									
													<th>									
										
														<button class="table-sort" data-sort="sort-id">ID</button>
									
													</th>                        									
									
													<th>									
										
														<button class="table-sort" data-sort="sort-date">Image</button>
									
													</th>                        									
									
													<th>									
										
														<button class="table-sort" data-sort="sort-time">Name</button>
									
													</th>                       									
									
													<th>									

														<button class="table-sort" data-sort="sort-passenger">Email</button>
									
													</th>                        									
									
													<th>									
										
														<button class="table-sort" data-sort="sort-pickup">Phone</button>
									
													</th>                        									
									
													<th>									
										
														<button class="table-sort" data-sort="sort-dropoff">Gender</button>
									
													</th>									
									
													<th>									
										
														<button class="table-sort" data-sort="sort-dropoff">Licence Authority</button>
									
													</th>							
									
													<th>									
										
														<button class="table-sort">Actions</button>
									
													</th>                      									
								
												</tr>                   								
							
											</thead>                  							
							
											<tbody class="table-tbody">
                            <?php
                            $y = 0;
                            $ndsql = mysqli_query($connect, "SELECT drivers.* FROM drivers WHERE drivers.acount_status = 0 ORDER BY drivers.d_id DESC");
                            while ($ndrow = mysqli_fetch_array($ndsql)) :
                                $y++;
                            ?>
                                <tr>
                                    <td class="sort-id"><?php echo $y; ?></td>
                                    <td class="sort-date">
                                        <?php if (!$ndrow['d_pic']) : ?>
                                            <img src="img/user-1.jpg" alt="Driver Img" style="width: 80px; height: 80px; border-radius: 5px;">
                                        <?php else : ?>
                                            <img src="img/drivers/<?php echo $ndrow['d_pic']; ?>" alt="Driver Img" style="width: 80px; height: 80px; border-radius: 5px;">
                                        <?php endif; ?>
                                    </td>
                                    <td class="sort-time">
										<?php echo $ndrow['d_name']; ?>
									</td>
                                    <td class="sort-passenger">
										<?php echo $ndrow['d_email']; ?>
									</td>
                                    <td class="sort-pickup">
										<?php echo $ndrow['d_phone']; ?>
									</td>
                                    <td class="sort-drpoff">
										<?php echo $ndrow['d_gender']; ?>
									</td>
                                    <td class="sort-drpoff">
										<?php echo $ndrow['licence_authority']; ?>
									</td>
                                    <td>
                                        <a href="view-driver.php?d_id=<?php echo $ndrow['d_id']; ?>">
                                            <button class="btn btn-info">
												<i class="ti ti-eye"></i>
												View
											</button>
                                        </a>
										<!--Delete Modal-->
<!-- Delete Modal -->
<div class="modal modal-blur fade" id="modal-driver-delete" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Delete Driver</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>Are you sure you want to delete this driver?</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success" data-bs-dismiss="modal">
                    Cancel
                </button>
                <button type="button" class="btn ms-auto btn-danger" id="deleteDriverBtn">
                    Yes
                </button>
            </div>
        </div>
    </div>
</div>
<!-- End Delete Modal -->

<!-- Button to trigger the modal -->
<button class="btn btn-danger delete_btn" data-d_id="<?php echo $ndrow['d_id']; ?>" data-bs-toggle="modal" data-bs-target="#modal-driver-delete">
    <i class="ti ti-square-rounded-x"></i>
    Delete
</button>

                                        
                                    </td>
                                </tr>
                            <?php endwhile; ?>
                            <?php if ($y === 0) : ?>
                                <tr>
                                    <td colspan="8">
										<p align="center">
											No Driver Found!
										</p>
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
		$(document).ready(function() {
    $('#modal-driver-delete').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget);
        var driverId = button.data('d_id');
        var modal = $(this);

        $('#deleteDriverBtn').click(function() {
            $.ajax({
                url: 'del-driver.php',
                type: 'GET', // or 'POST' based on your server-side handling
                data: { d_id: driverId },
                success: function(response) {
                    console.log('Deletion successful');
                    $('#modal-driver-delete').modal('hide');
                    location.reload(true); // Refresh the page after successful deletion
                },
                error: function(xhr, status, error) {
                    console.error('Error:', error);
                }
            });
        });
    });
});

</script>


<div class="modal modal-blur fade" id="modal-driver" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">    		
		<div class="modal-content">        				
			<div class="modal-header">            						
				<h5 class="modal-title">Add New Driver</h5>            								
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>          									
			</div> 			
			<form method="post" enctype="multipart/form-data" action="driver-process.php" onsubmit="return validateForm();">						
				<div class="modal-body">												
					<div class="row">              																						
						<div class="mb-3 col-lg-6">              											
							<label class="form-label">Driver Name</label>              												
							<input type="text" class="form-control" name="dname" placeholder="Driver Name" required>
						</div> 											             											             						
						<div class="mb-3 col-lg-6">                  													
							<label class="form-label">Email</label>              												
							<input type="email" class="form-control" name="demail" placeholder="hello@example.com" required>							
						</div>		
						<div class="mb-3 col-lg-6">                  						
							<label class="form-label">Phone</label>              												
							<input type="text" class="form-control" name="dphone" placeholder="+44 20 7123 4567" required>							
						</div> 												
						<div class="mb-3 col-lg-6">                  						
							<label class="form-label">Password</label>              												
							<input type="password" class="form-control" name="dpass" placeholder="xxxxxxxx" required>							
						</div> 																		
						<div class="mb-3 col-lg-6">              											
							<label class="form-label">Licence Authority</label>              					                  							
							<select class="form-select" name="dauth" required>                    															
								<option value="" selected>Select Authority</option>                    																
								<option>London</option>                    																
								<option>Bermingham</option> 																	
								<option>Ireland</option> 																						
							</select>             																		
						</div>					             															
						<div class="mb-3 col-lg-6">              											
							<label class="form-label">Gender</label>              					                  							
							<select class="form-select" name="dgender">                    															
								<option value="" selected>Select Gender</option>                    																
								<option>Male</option>                    																
								<option>Female</option> 																	
								<option>Transgender</option> 																						
							</select>             																		
						</div> 						              										               												
						<div class="mb-3 col-lg-6">                  													
							<label class="form-label">Language</label>              											
							<select class="form-select" name="dlang">                     															
								<option value="" selected>Select Language</option>
								<?php														
								$lsql=mysqli_query($connect,"SELECT * FROM `language`");								
								while($lrow = mysqli_fetch_array($lsql)){																	
								?>
								<option><?php echo $lrow['language'] ?></option>								
								<?php								
								}																	
								?>																				
							</select> 													
						</div>					 									                  							
						<div class="mb-3 col-lg-6">                  													
							<label class="form-label">Picture</label>              												
							<input type="file" class="form-control" name="dpic">      													
						</div>				
						<div class="mb-3 col-lg-6">              											
							<label class="form-label">Licence</label>              												
							<input type="text" class="form-control" name="licence" placeholder="xxxxxxxx">            				
						</div> 											               						
						<div class="mb-3 col-lg-6">                  													
							<label class="form-label">Licence Expiry</label>              												
							<input type="date" class="form-control" name="lexp">        													
						</div>								
						<div class="mb-3 col-lg-6">              											
							<label class="form-label">PCO Licence</label>              												
							<input type="text" class="form-control" name="pco" placeholder="xxxxxxxx">            											
						</div> 												               						
						<div class="mb-3 col-lg-6">                  													
							<label class="form-label">PCO Licence Expiry</label>              												
							<input type="date" class="form-control" name="pcoexp">        													
						</div>             																									
					</div>				          				          				
				</div>          							
				<div class="modal-body">				
					<div class="row">              					             					
						<div class="col-lg-12">               												
							<div>                 														
								<label class="form-label">Address</label>                  															
								<textarea class="form-control" rows="3" name="remarks"></textarea>               													
							</div>              											
						</div>  						
						<div class="col-lg-12">               												
							<div>                 														
								<label class="form-label">Remarks</label>                  															
								<textarea class="form-control" rows="3" name="address"></textarea>               													
							</div>              											
						</div>  						 									
					</div>          							
				</div>        							
				<div class="modal-footer">           				
					<a href="#" class="btn btn-danger" data-bs-dismiss="modal"> 					
						<i class="ti ti-circle-x"></i>												
						Cancel           									
					</a>           									
					<button type="submit" class="btn ms-auto btn-success">																	
						<i class="ti ti-user-plus"></i> 						
						Add Driver  											
					</button>       							
				</div> 											
			</form>							
			<script>    
				function validateForm() {        					       
					var dnameInput = document.getElementsByName("dname")[0].value;        
					var demailInput = document.getElementsByName("demail")[0].value;        
					var dphoneInput = document.getElementsByName("dphone")[0].value;		
					var dauthInput = document.getElementsByName("dauth")[0].value;		      
					if (dnameInput === "" || demailInput === "" || dphoneInput === "" || dauthInput === "" ) {            						           
						alert("Please fill in all required fields.");           
						return false;       
					}      					       
					return true;   
				}
			</script>					
		</div>      		
	</div>    
</div>
<?php
include('footer.php');
?>