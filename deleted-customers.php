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
                Customers Section
            </h2>
        </div>
        <div class="col-auto ms-auto d-print-none">
            <div class="btn-list">
                <a href="#" class="btn btn-primary d-none d-sm-inline-block" data-bs-toggle="modal" data-bs-target="#modal-customer">
                    <i class="ti ti-user-plus"></i> 
                    Add New Customer				
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
                    <h3 class="card-title">		
                        All Customers List			
                    </h3>		
                </div>                  						
                <div class="card-body border-bottom py-3">						
                    <div>                  							
                        <table class="table table-responsive" id="del-customers">                    									
                            <thead>			
                                <tr>				
                                    <th>ID</th>				
                                    <th>Image</th>				
                                    <th>PostCode</th>				
                                    <th>Name</th>				
                                    <th>Email</th>				
                                    <th>Phone</th>				
                                    <th>Gender</th>				
                                    <th>Status</th>				
                                    <th>Actions</th>				
                                </tr>				
                            </thead>			
                            <tbody class="table-tbody">								
                                <?php				
                                $csql=mysqli_query($connect,"SELECT clients.* FROM clients WHERE clients.acount_status = 2 ORDER BY clients.c_id DESC");				
                                while($crow = mysqli_fetch_array($csql)){				
                                ?>				
                                <tr>				
                                    <td>										
                                        <?php echo $crow['c_id']; ?>
                                    </td>
                                    <td>										
                                        <?php                                                
                                        if (!$crow['c_pic']) {     						                                                    
                                        ?>						
                                        <img src="img/user-1.jpg" alt="Customer Img" style="width: 50px; height: 50px; border-radius: 5px;">										
					<?php
                                        } else{
                                        ?>                                        
                                        <img src="img/customers/<?php echo $crow['c_pic'];?>" alt="Customer Img" style="width: 50px; height: 50px; background-size: 100% 100%; border-radius: 5px;">					
					<?php
                                        }
                                        ?>
                                    </td>
                                    <td>										
                                        <?php echo $crow['postal_code']; ?>
                                    </td>
                                    <td>																				
                                        <?php echo $crow['c_name']; ?>
                                    </td>
                                    <td>										
                                        <?php echo $crow['c_email']; ?>
                                    </td>  										
                                    <td>										
                                        <?php echo $crow['c_phone']; ?>
                                    </td>				
                                    <td>																				
                                        <?php echo $crow['c_gender']; ?>
                                    </td>
                                    <td>										
                                        <?php											
                                        if($crow['acount_status']==0){										
                                        ?>
                                        <div class="col-auto status">
                                            <span class="status-dot status-dot-animated bg-red d-block"></span>
                                            <span>Unverified</span>
                                        </div>										
                                        <?php											                                            
                                        } elseif($crow['acount_status']==1){                       										
                                        ?>					
                                        <div class="col-auto status">					
                                            <span class="status-dot status-dot-animated bg-green d-block"></span>					
                                            <span>Verified</span>																
                                        </div>										
                                        <?php																						                                            
                                        }										
                                        ?>					
                                    </td>				
                                    <td>				
                                        <a href="view-customer.php?c_id=<?php echo $crow['c_id']; ?>" class="btn btn-info btn-icon" title="View/Edit">                                                                                           
                                            <i class="ti ti-eye"></i>                                                                                           
                                        </a>                                       
                                        <a href="javascript:void(0);" class="btn btn-success btn-icon activateCustomer" data-id="<?php echo $crow['c_id']; ?>" title="Activate Customer">
   
                                            <i class="ti ti-user-check"></i>

                                        </a>

                                     

                                        <script>
                                            $(document).on('click', '.activateCustomer', function(e) {
                                                e.preventDefault();
                                                var customerId = $(this).data('id');
                                                Swal.fire({
                                                    title: 'Activate Customer?',
                                                    text: "Do you want to activate this customer?",
                                                    icon: 'question',
                                                    showCancelButton: true,
                                                    confirmButtonColor: '#28a745',
                                                    cancelButtonColor: '#d33',
                                                    confirmButtonText: 'Yes, Activate'
                                                }).then((result) => {
                                                    if (result.isConfirmed) {
                                                        $.ajax({
                                                            url: 'includes/customer/activate-customer.php',
                                                            type: 'POST',
                                                            data: { c_id: customerId },
                                                            success: function(response) {
                                                                if (response.trim() === 'success') {
                                                                    Swal.fire({
                                                                        icon: 'success',
                                                                        title: 'Activated!',
                                                                        text: 'Customer has been activated successfully.',
                                                                        timer: 2000,
                                                                        showConfirmButton: false
                                                                    });
                                                                    // Option 1: Reload page after activation
                                                                    
                                                                        location.reload();
                                                                   
                                                                } else {
                                                                    Swal.fire({
                                                                        icon: 'error',
                                                                        title: 'Failed!',
                                                                        text: 'Unable to activate customer. Please try again.'
                                                                    });
                                                                }
                                                            },
                                                            error: function() {
                                                                Swal.fire({
                                                                    icon: 'error',
                                                                    title: 'Error!',
                                                                    text: 'Something went wrong while activating the customer.'
                                                                });
                                                            }
                                                        });
                                                    }
                                                });
                                            });

                                        </script>

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
    </div>
</div>        
<script>	
$(document).ready(function() {      
        $('#del-customers').DataTable({                                      
            dom: 'Bfrtip',                    
            buttons: ['copy', 'csv', 'excel', 'pdf', 'print'],                    
            language: {            
                emptyTable: "No Customer Found!" // ✅ Handles empty table cleanly                        
            }                
        });        
    });
</script>
<?php
include('footer.php');
?>