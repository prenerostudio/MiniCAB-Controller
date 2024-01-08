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


<?php
include('footer.php');
?>