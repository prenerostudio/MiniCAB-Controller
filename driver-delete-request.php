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
                Driver Deletion Requests					
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
                        Driver Deletion Requests List			
                    </h3>										
                </div>						
                <div class="card-body border-bottom py-3">						
                    <div>							
                        <table class="table table-responsive" id="del-driver">									
                            <thead>										
                                <tr>												
                                    <th>ID</th>																	
                                    <th>Driver</th>																	
                                    <th>Request Msg</th>				
                                    <th>Request Status</th>				
                                    <th>Actions</th>				
                                </tr>				
                            </thead>										
                            <tbody class="table-tbody">					
                                <?php
                                $x = 0;								
                                $ddsql = mysqli_query($connect, "SELECT delete_drivers.*, drivers.* FROM delete_drivers JOIN drivers ON delete_drivers.d_id = drivers.d_id");
                                while ($ddrow = mysqli_fetch_array($ddsql)) :								
                                    $x++;
                                ?>
                                <tr>
                                    <td>
                                        <?php echo $x; ?>
                                    </td>
                                    <td>
                                        <?php echo $ddrow['d_name'];?><br>
                                        <?php echo $ddrow['d_email'];?><br>										                                                       
                                        <?php echo $ddrow['d_phone'];?>									
                                    </td>									
                                    <td>
                                        <?php echo $ddrow['request_msg'];?>
                                    </td>				
                                    <td>										
                                        <?php                                               
                                        if($ddrow['req_status'] == 0){						                                                   
                                        ?>																		
                                        <div class="col-auto status">					
                                            <span class="status-dot status-dot-animated bg-orange d-block"></span>					
                                            <span>Pending</span>														
                                        </div>					
					<?php
                                        } elseif($ddrow['req_status'] == 1){					
                                        ?>					
                                        <div class="col-auto status">					
                                            <span class="status-dot status-dot-animated bg-green d-block"></span>					
                                            <span>Approved</span>																
                                        </div>								
					<?php
                                        }else{					
                                        ?>					
                                        <div class="col-auto status">					
                                            <span class="status-dot status-dot-animated bg-red d-block"></span>					
                                            <span>Cancelled</span>																
                                        </div>					
					<?php                                        				
                                        }					
                                        ?>																								
                                    </td>				
                                    <td>    
                                        <?php     
                                        $isDisabled = ($ddrow['req_status'] == 1 || $ddrow['req_status'] == 2) ? 'disabled' : '';    
                                        ?>   
                                        <button class="btn btn-danger cancel-delete-btn" data-did="<?php echo $ddrow['del_d_id']; ?>" title="Cancelled" <?php echo $isDisabled; ?>>        
                                            <i class="ti ti-square-rounded-x"></i>    
                                        </button>   
                                        <button class="btn btn-success approve-delete-btn" data-did="<?php echo $ddrow['del_d_id']; ?>" title="Approve" <?php echo $isDisabled; ?>>        
                                            <i class="ti ti-check"></i>    
                                        </button>
                                    </td>													
                                </tr>					
                                <?php endwhile; ?>                                							
                            </tbody>										
                        </table>               																
                    </div>           													
                </div>       													
            </div>   										
        </div>		        			        
        <script>
           
$(document).ready(function() {
    $('.cancel-delete-btn').click(function() {
        const del_d_id = $(this).data('did');

        Swal.fire({
            title: 'Are you sure?',
            text: "You want to cancel this driver delete request?",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, cancel it!'
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    url: 'includes/drivers/cancel-driver-delete.php',
                    type: 'POST',
                    data: { del_d_id: del_d_id },
                    success: function(response) {
                        Swal.fire({
                            icon: 'success',
                            title: 'Cancelled!',
                            text: 'Driver deletion request has been cancelled.',
                            timer: 2000,
                            showConfirmButton: false
                        });

                        // Optionally remove row or reload data
                        setTimeout(() => {
                            location.reload();
                        }, 2000);
                    },
                    error: function() {
                        Swal.fire({
                            icon: 'error',
                            title: 'Error!',
                            text: 'Something went wrong. Please try again.'
                        });
                    }
                });
            }
        });
    });
});

$(document).ready(function() {
    $('.approve-delete-btn').click(function() {
        const del_d_id = $(this).data('did');

        Swal.fire({
            title: 'Approve Request?',
            text: "Are you sure you want to approve this driver deletion request?",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, approve it!'
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    url: 'includes/drivers/approve-driver-delete.php',
                    type: 'POST',
                    data: { del_d_id: del_d_id },
                    success: function(response) {
                        if (response.trim() === 'success') {
                            Swal.fire({
                                icon: 'success',
                                title: 'Approved!',
                                text: 'Driver account deletion request has been approved.',
                                timer: 2000,
                                showConfirmButton: false
                            });

                            // Optionally refresh or remove the row dynamically
                            setTimeout(() => {
                                location.reload();
                            }, 2000);
                        } else {
                            Swal.fire({
                                icon: 'error',
                                title: 'Error!',
                                text: 'Something went wrong. Please try again.'
                            });
                        }
                    },
                    error: function() {
                        Swal.fire({
                            icon: 'error',
                            title: 'Error!',
                            text: 'Unable to connect to the server.'
                        });
                    }
                });
            }
        });
    });
});


            $(document).ready(function() {          
                $('#del-driver').DataTable({        
                    responsive: true,                    
                    dom: 'Bfrtip',                    
                    buttons: ['copy', 'csv', 'excel', 'pdf', 'print'],                    
                    language: {            
                        emptyTable: "No Driver Found!" // ✅ Handles empty table cleanly                        
                    }                
                });        
            });
        </script>	        	
    </div>		
</div>            
<?php
include('footer.php');
?>