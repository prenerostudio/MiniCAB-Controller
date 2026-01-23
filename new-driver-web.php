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
                    <h3 class="card-title">		
                        New Drivers Request List From Web Link			
                    </h3>											
                </div>																		
                <div class="card-body border-bottom py-3">											
                    <div id="table-ndriver" class="table-responsive">		
                        <table class="table" id="table-new">			
                            <thead>																						
                                <tr>				
                                    <th>ID</th>				
                                    <th>Image</th>				
                                    <th>Name</th>                                    
                                    <th>Email</th>				
                                    <th>Phone</th>				
                                    <th>Postcode</th>				
                                    <th>Shift Timing</th>															
                                    <th>Actions</th>				
                                </tr>				
                            </thead>																				
                            <tbody class="table-tbody">                            								
                                <?php                                        
                                $y = 0;								
                                $ndsql = mysqli_query($connect, "SELECT drivers.* FROM drivers WHERE drivers.signup_type = 3 AND drivers.acount_status = 0 ORDER BY drivers.d_id DESC");				
                                while ($ndrow = mysqli_fetch_array($ndsql)) :	
                                    $y++;                            								
                                ?>                                								
                                <tr>                                									
                                    <td>										
                                        <?php echo $y; ?>									
                                    </td>                                    									
                                    <td>                                        										
                                        <?php if (!$ndrow['d_pic']) : ?>
                                        <img src="img/user-1.jpg" alt="Driver Img" style="width: 50px; height: 50px; border-radius: 5px;">										
                                        <?php else : ?>										
                                        <img src="img/drivers/<?php echo $ndrow['d_pic']; ?>" alt="Driver Img" style="width: 50px; height: 50px; border-radius: 5px;">
                                        <?php endif; ?>									
                                    </td>                                    
                                    <td>										
                                        <?php echo $ndrow['d_name']; ?>
                                    </td>                                    
                                    <td>										
                                        <?php echo $ndrow['d_email']; ?>
                                    </td>                                    
                                    <td>										
                                        <?php echo $ndrow['d_phone']; ?>
                                    </td>                                    
                                    <td>										
                                        <?php echo $ndrow['d_post_code']; ?>
                                    </td>                                    
                                    <td>										
                                        <?php echo $ndrow['d_shift']; ?>
                                    </td>                                    
                                    <td>                                    
                                       <a href="javascript:void(0);" class="btn btn-success acceptDriverBtn" data-did="<?php echo $ndrow['d_id']; ?>" title="Accept Driver">
                                           <i class="ti ti-checks"></i> 
                                           Accept Driver 
                                       </a>                                      
                                    </td>
                                </tr>								
                                <?php endwhile; ?>
                            </tbody>  			
                        </table>  			
                    </div>		
                </div>		
            </div>  			
        </div>		
    </div>
</div>   
<script>
    document.addEventListener('DOMContentLoaded', function() {
        // Attach event listener to all Accept buttons
        document.querySelectorAll('.acceptDriverBtn').forEach(function(button) {
            button.addEventListener('click', function() {
                const driverId = this.dataset.did;
                Swal.fire({
                    title: 'Are you sure?',
                    text: "You want to approve this driver?",
                    icon: 'question',
                    showCancelButton: true,
                    confirmButtonColor: '#28a745',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, Approve!',
                    cancelButtonText: 'Cancel'
                }).then((result) => {
                    if (result.isConfirmed) {
                        // Send AJAX request
                        fetch('includes/drivers/accept-driver.php', {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/x-www-form-urlencoded'
                            },
                            body: 'd_id=' + encodeURIComponent(driverId)
                        })
                        .then(response => response.json())
                        .then(data => {
                            if (data.status === 'success') {
                                Swal.fire({
                                    icon: 'success',
                                    title: 'Driver Approved!',
                                    text: data.message,
                                    timer: 2000,
                                    showConfirmButton: false
                                });
                                // Optional: remove the driver row dynamically
                                const row = button.closest('tr');
                                if (row) row.remove();
                            } else {
                                Swal.fire({
                                    icon: 'error',
                                    title: 'Error!',
                                    text: data.message
                                });
                            }
                        })
                        .catch(error => {
                            Swal.fire({
                                icon: 'error',
                                title: 'Server Error',
                                text: 'Something went wrong. Please try again later.'
                            });
                            console.error('Error:', error);
                        });
                    }
                });
            });
        });
    });
    $(document).ready(function() {      
        $('#table-new').DataTable({        
            responsive: true,                    
            dom: 'Bfrtip',                    
            buttons: ['copy', 'csv', 'excel', 'pdf', 'print'],                    
            language: {            
                emptyTable: "No Driver Found!" // ✅ Handles empty table cleanly                        
            }                
        });        
    });
</script>
<?php
include('footer.php');
?>