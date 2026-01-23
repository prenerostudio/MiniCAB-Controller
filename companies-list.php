<?php include('header.php');?>  
<div class="page-header d-print-none page_padding">		   		
    <div class="row g-2 align-items-center">        	
        <div class="col">            									
            <div class="page-pretitle">                				
                Overview                						
            </div>                				
            <h2 class="page-title">                				
                Companies Section                						
            </h2>              				
        </div>			
        <div class="col-auto ms-auto d-print-none">            			
            <div class="btn-list">                				
                <a href="#" class="btn btn-primary d-none d-sm-inline-block" data-bs-toggle="modal" data-bs-target="#modal-customer">		
                    <i class="ti ti-user-plus"></i>                    							
                    Add New Company                  							
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
                        All Companies List			
                    </h3>		
                </div>                  						
                <div class="card-body border-bottom py-3">						
                    <div id="table-companies" class="table-responsive">		
                        <table class="table table-responsive" id="companies">			
                            <thead>			
                                <tr>				
                                    <th>ID</th>				
                                    <th>Image</th>				
                                    <th>Company Name</th>				
                                    <th>Person Name</th>				
                                    <th>Email</th>				
                                    <th>Phone</th>				
                                    <th>PIN</th>				
                                    <th>Status</th>				
                                    <th>Actions</th>				
                                </tr>				
                            </thead>			
                            <tbody class="table-tbody">								
                                <?php								
                                $csql=mysqli_query($connect,"SELECT companies.* FROM companies WHERE companies.acount_status = 1 ORDER BY companies.com_id DESC");								
                                while($crow = mysqli_fetch_array($csql)){								
                                ?>				
                                <tr>				
                                    <td><?php echo $crow['com_id']; ?></td>				
                                    <td>
                                        <?php if (!$crow['com_pic']) { ?>
                                        <img src="img/user-1.jpg" alt="Customer Img" style="width: 50px; height: 50px; border-radius: 5px;">						
					<?php } else{ ?>															
                                        <img src="img/companies/<?php echo $crow['com_pic'];?>" alt="Company Img" style="width: 50px; height: 50px; background-size: 100% 100%; border-radius: 5px;">					
					<?php } ?>
                                    </td>
                                    <td><?php echo $crow['com_name'];?></td>				
                                    <td><?php echo $crow['com_person'];?></td>			
                                    <td><?php echo $crow['com_email'];?></td>				
                                    <td><?php echo $crow['com_phone'];?></td>				
                                    <td><?php echo $crow['com_pin'];?></td>				
                                    <td><?php if($crow['acount_status']==0){ ?>
                                        <div class="col-auto status">			
                                            <span class="status-dot status-dot-animated bg-red d-block"></span>					
                                            <span>Unverified</span>														
                                        </div>					
					<?php } else{ ?>					
                                        <div class="col-auto status">					
                                            <span class="status-dot status-dot-animated bg-green d-block"></span>					
                                            <span>Verified</span>																
                                        </div>								
					<?php } ?>														
                                    </td>					
                                    <td> 													
                                        <a href="view-company.php?com_id=<?php echo $crow['com_id']; ?>" class="btn btn-info btn-icon" title="View/Edit">					
                                            <i class="ti ti-eye"></i>															
                                        </a>											
                                        <button class="btn btn-danger btn-icon delete-company" data-id="<?php echo $crow['com_id']; ?>" title="Delete">    
                                            <i class="ti ti-square-rounded-x"></i>
                                        </button>					
                                        <button class="btn btn-warning btn-icon block-company" data-id="<?php echo $crow['com_id']; ?>" title="Block Company">                                                
                                            <i class="ti ti-ban"></i>
                                        </button>					
                                    </td>												
                                </tr>				
				<?php }	?>
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
        $('#companies').DataTable({                                      
            dom: 'Bfrtip',                    
            buttons: ['copy', 'csv', 'excel', 'pdf', 'print'],                    
            language: {            
                emptyTable: "No Company Found!" // ✅ Handles empty table cleanly                        
            }                
        });        
    });   

$(document).on('click', '.delete-company', function () {
    let com_id = $(this).data('id');
    Swal.fire({
        title: 'Delete Company?',
        text: 'This will permanently delete the company profile.',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonText: 'Yes, Delete',
        cancelButtonText: 'Cancel'
    }).then((result) => {
        if (result.isConfirmed) {
            Swal.fire({
                title: 'Deleting...',
                allowOutsideClick: false,
                didOpen: () => Swal.showLoading()
            });
            $.ajax({
                url: 'includes/companies/del-company.php',
                type: 'POST',
                data: { com_id: com_id },
                success: function (response) {
                    if (response.trim() === 'success') {
                        Swal.fire(
                            'Deleted!',
                            'Company profile has been deleted.',
                            'success'
                        ).then(() => {
                            window.location.href = 'companies-list.php';
                        });
                    } else {
                        Swal.fire(
                            'Error!',
                            'Unable to delete company.',
                            'error'
                        );
                    }
                }
            });
        }
    });
});


$(document).on('click', '.block-company', function () {
    let com_id = $(this).data('id');
    Swal.fire({
        title: 'Block Company?',
        text: 'The company will be blocked and access will be restricted.',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonText: 'Yes, Block',
        cancelButtonText: 'Cancel'
    }).then((result) => {
        if (result.isConfirmed) {
            Swal.fire({
                title: 'Blocking...',
                allowOutsideClick: false,
                didOpen: () => Swal.showLoading()
            });
            $.ajax({
                url: 'includes/companies/block-company.php',
                type: 'POST',
                data: { com_id: com_id },
                success: function (response) {
                    if (response.trim() === 'success') {
                        Swal.fire(
                            'Blocked!',
                            'Company has been blocked successfully.',
                            'success'
                        ).then(() => {
                            window.location.href = 'blocked-companies.php';
                        });
                    } else {
                        Swal.fire(
                            'Error!',
                            'Unable to block company.',
                            'error'
                        );
                    }
                }
            });
        }
    });
});
</script>



<!-------------------------------
----------Add Company-----------
-------------------------------->
<div class="modal modal-blur fade" id="modal-customer" tabindex="-1" role="dialog" aria-hidden="true">	
    <div class="modal-dialog modal-lg" role="document">    	
        <div class="modal-content">        			
            <div class="modal-header">            				
                <h5 class="modal-title">Add New Company</h5>            						
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>		
            </div> 				
            <form id="addCompanyForm" enctype="multipart/form-data">    
                <div class="modal-body">        
                    <div class="row">            
                        <div class="mb-3 col-md-4">                
                            <label class="form-label">Company Name</label>                
                            <input type="text" class="form-control" name="cname" required>            
                        </div>            
                        <div class="mb-3 col-md-4">                
                            <label class="form-label">Relative Person</label>                
                            <input type="text" class="form-control" name="rpname" required>            
                        </div>            
                        <div class="mb-3 col-md-4">                
                            <label class="form-label">Email</label>                
                            <input type="email" class="form-control" name="cemail" required>            
                        </div>                                   
                        <div class="mb-3 col-md-4">                
                            <label class="form-label">Phone</label>                
                            <input type="text" class="form-control" name="cphone" required>=            
                        </div>                                    
                        <div class="mb-3 col-md-4">                
                            <label class="form-label">Password</label>                
                            <input type="password" class="form-control" name="cpass" required>            
                        </div>                                    
                        <div class="mb-3 col-md-4">                
                            <label class="form-label">PIN</label>                
                            <input type="text" class="form-control" name="cpin" required>            
                        </div>                       
                        <div class="mb-3 col-md-6">                
                            <label class="form-label">Postal Code</label>                
                            <select class="form-control" name="pc" required>                    
                                <option value="">Select PostCode</option>                    
                                    <?php                    
                                    $pcsql = mysqli_query($connect,"SELECT * FROM post_codes");                    
                                    while($pcrow = mysqli_fetch_array($pcsql)){                    
                                    ?>                        
                                <option value="<?= $pcrow['pc_name']; ?>">                            
                                    <?= $pcrow['pc_name']; ?>                        
                                </option>                    
                                <?php } ?>                
                            </select>            
                        </div>                                   
                        <div class="mb-3 col-md-6">                
                            <label class="form-label">Picture</label>                
                            <input type="file" class="form-control" name="cpic">            
                        </div>                                   
                        <div class="mb-3 col-12">                
                            <label class="form-label">Address</label>                
                            <textarea class="form-control" rows="3" name="caddress"></textarea>            
                        </div>                               
                    </div>
                    <div class="modal-footer">            
                        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">                
                            Cancel            
                        </button>            
                        <button type="submit" class="btn btn-success">                
                            Save Company            
                        </button>        
                    </div>    
                </div>
            </form>                   
        </div>    		
    </div>
</div>	
<script>
$('#addCompanyForm').on('submit', function(e){
    e.preventDefault();
    let formData = new FormData(this);
    Swal.fire({
        title: 'Add Company?',
        text: 'Do you want to save this company?',
        icon: 'question',
        showCancelButton: true,
        confirmButtonText: 'Yes, Save'
    }).then((result) => {
        if (result.isConfirmed) {
            Swal.fire({
                title: 'Saving...',
                allowOutsideClick: false,
                didOpen: () => Swal.showLoading()
            });
            $.ajax({
                url: 'includes/companies/add-company.php',
                type: 'POST',
                data: formData,
                contentType: false,
                processData: false,
                dataType: 'json',
                success: function(response) {
                    if (response.status === 'success') {
                        Swal.fire({
                            icon: 'success',
                            title: 'Success',
                            text: response.message
                        }).then(() => {
                            window.location.href = 'companies-list.php';
                        });
                    } else {
                        Swal.fire('Error', response.message, 'error');
                    }
                },
                error: function() {
                    Swal.fire('Error', 'Something went wrong!', 'error');
                }
            });
        }
    });
});
</script>
<?php include('footer.php');?>