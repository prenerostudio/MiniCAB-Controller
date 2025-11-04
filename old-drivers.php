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
                        InActive Old Drivers List
                    </h3>											
                </div>										
                <div class="card-body border-bottom py-3">										
                    <div>													
                        <table class="table table-responsive" id="table-old">																
                            <thead>																		
                                <tr>																					
                                    <th>ID</th>				
                                    <th>Image</th>				
                                    <th>Name</th>				
                                    <th>Email</th>																						
                                    <th>Phone</th>																						
                                    <th>Gender</th>																						
                                    <th>License Authority</th>				
                                    <th>Actions</th>				
                                </tr>																			
                            </thead>																
                            <tbody class="table-tbody">
                                <?php
                                $z = 0;                            								
                                $idsql = mysqli_query($connect, "SELECT drivers.* FROM drivers WHERE drivers.acount_status = 4 ORDER BY drivers.d_id DESC");								
                                while ($idrow = mysqli_fetch_array($idsql)) :								
                                    $z++;                            								
                                ?>                                								
                                <tr>                                													
                                    <td>										
                                        <?php echo $z; ?>
                                    </td>                                    				
                                    <td>                                       																				
                                        <?php if (!$idrow['d_pic']) : ?>                                           
                                        <img src="img/user-1.jpg" alt="Driver Img" style="width: 50px; height: 50px; border-radius: 5px;">                                        					
					<?php else : ?>                                          
                                        <img src="img/drivers/<?php echo $idrow['d_pic']; ?>" alt="Driver Img" style="width: 50px; height: 50px; border-radius: 5px;">                                        					
					<?php endif; ?>                                   
                                    </td>                                   				
                                    <td>									
                                        <?php echo $idrow['d_name']; ?>
                                    </td>                                   				
                                    <td>										
                                        <?php echo $idrow['d_email']; ?>
                                    </td>                                    				
                                    <td>										
                                        <?php echo $idrow['d_phone']; ?>
                                    </td>                                    
                                    <td>										
                                        <?php echo $idrow['d_gender']; ?>
                                    </td>                                    
                                    <td>										
                                        <?php echo $idrow['licence_authority']; ?>
                                    </td>                                    				
                                    <td>                                    				
                                        <a href="javascript:void(0);" class="btn btn-success btn-icon activateDriverBtn" data-did="<?php echo $idrow['d_id']; ?>" title="Activate Driver">   
                                            <i class="ti ti-user-check"></i>
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
    document.querySelectorAll('.activateDriverBtn').forEach(function(button) {
        button.addEventListener('click', function() {
            const driverId = this.dataset.did;

            Swal.fire({
                title: 'Activate Driver?',
                text: 'Are you sure you want to activate this driver?',
                icon: 'question',
                showCancelButton: true,
                confirmButtonColor: '#28a745',
                cancelButtonColor: '#6c757d',
                confirmButtonText: 'Yes, Activate',
                cancelButtonText: 'Cancel'
            }).then((result) => {
                if (result.isConfirmed) {

                    Swal.fire({
                        title: 'Processing...',
                        text: 'Please wait while activating driver...',
                        allowOutsideClick: false,
                        didOpen: () => Swal.showLoading()
                    });

                    fetch('includes/drivers/activate-driver.php', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/x-www-form-urlencoded'
                        },
                        body: 'd_id=' + encodeURIComponent(driverId)
                    })
                    .then(response => response.json())
                    .then(data => {
                        Swal.close();
                        if (data.status === 'success') {
                            Swal.fire({
                                icon: 'success',
                                title: 'Driver Activated!',
                                text: data.message,
                                timer: 2000,
                                showConfirmButton: false
                            });

                            // Optional: visually update the row or refresh after short delay
                            setTimeout(() => location.reload(), 1500);

                        } else {
                            Swal.fire({
                                icon: 'error',
                                title: 'Error!',
                                text: data.message
                            });
                        }
                    })
                    .catch(err => {
                        Swal.close();
                        Swal.fire({
                            icon: 'error',
                            title: 'Server Error',
                            text: 'Something went wrong. Please try again later.'
                        });
                        console.error(err);
                    });
                }
            });
        });
    });
});
  			
   $(document).ready(function() {      
        $('#table-old').DataTable({        
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