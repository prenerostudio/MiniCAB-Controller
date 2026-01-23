<?php
include('header.php');
$com_id = $_GET['com_id'];
$csql=mysqli_query($connect,"SELECT * FROM `companies` WHERE `com_id`='$com_id'");
$crow = mysqli_fetch_array($csql);		
?>
<div class="page-header d-print-none page_padding">
    <div class="row g-2 align-items-center">
        <div class="col">
            <div class="page-pretitle">
                Overview
            </div>
            <h2 class="page-title">
                View Customer Details
            </h2>
        </div>
        <div class="col-auto ms-auto d-print-none">
            <div class="btn-list">
                <?php if($crow['acount_status']==0){ ?>		              
                <button class="btn btn-primary d-none d-sm-inline-block approve-company" data-id="<?php echo $com_id; ?>">    
                    <i class="ti ti-checks"></i> Approve Company
                </button>							
		<?php }else { ?>		
                <button class="btn btn-disable d-none d-sm-inline-block" disabled> 		                
                    <i class="ti ti-checks"></i>                    
                    Verified Company                
                </button>  							
		<?php }	?>
            </div>  
            <script>
                $(document).on('click', '.approve-company', function () {
                    let com_id = $(this).data('id');
                    Swal.fire({
                        title: 'Approve Company?',
                        text: "This company will be verified.",
                        icon: 'warning',
                        showCancelButton: true,
                        confirmButtonText: 'Yes, Approve',
                        cancelButtonText: 'Cancel'
                    }).then((result) => {
                        if (result.isConfirmed) {
                            $.ajax({
                                url: 'includes/companies/approve-company.php',
                                type: 'POST',
                                data: { com_id: com_id },
                                success: function (response) {
                                    if (response.trim() === 'success') {
                                        Swal.fire(
                                            'Approved!',
                                            'Company has been verified.',
                                            'success'
                                        ).then(() => {
                                            location.reload(); // or redirect if you want
                                        });
                                    } else {
                                        Swal.fire(
                                            'Error!',
                                            'Something went wrong.',
                                            'error'
                                        );
                                    }
                                }
                            });
                        }
                    });
                });
            </script>
        </div>			
    </div>	
</div>
<div class="page-body page_padding">          		
    <div class="row row-deck row-cards">						
        <div class="col-md-12">        			
            <div class="card">            				
                <div class="card-header">                						
                    <ul class="nav nav-tabs card-header-tabs" data-bs-toggle="tabs">
                        <li class="nav-item">
                            <a href="#tabs-profile" class="nav-link active" data-bs-toggle="tab">			
                                <i class="ti ti-user-scan"></i>                          						
                                Company Profile											
                            </a>                      									
                        </li>                      									
                        <li class="nav-item">									
                            <a href="#tabs-statement" class="nav-link" data-bs-toggle="tab">
                                <i class="ti ti-calendar-user"></i>
                                Company Bookings Statement
                            </a>    
                        </li>				                        			
                    </ul>                  						
                </div>						
                <div class="card-body">                						
                    <div class="tab-content">                    							
                        <div class="tab-pane active show" id="tabs-profile">    									
                            <div class="col-12">            											
                                <div class="card">													
                                    <div class="card-body border-bottom py-3">	
                                        <h2 class="mb-4">
                                            Company Profile
                                        </h2>														
                                        <h3 class="card-title">Profile Details</h3>					
                                        <div class="row align-items-center">											
                                            <div class="col-auto">                                                
                                                <span class="avatar avatar-xl" style="background-image: url(img/companies/<?php echo $crow['com_pic'];?>); background-size:100% 100% ; width: 150px; height: 150px;">						
                                                </span>													
                                            </div>																
                                            <div class="col-auto">                                               
                                                <form id="companyImageForm" enctype="multipart/form-data">    
                                                    <input type="hidden" name="com_id" value="<?php echo $crow['com_id']; ?>">    
                                                    <input type="file" name="fileToUpload" class="form-control mb-2" required>    
                                                    <button type="submit" class="btn btn-info">        
                                                        Upload Image    
                                                    </button>
                                                </form>
                                                <script>
                                                    $('#companyImageForm').on('submit', function (e) {
                                                        e.preventDefault();
                                                        let formData = new FormData(this);
                                                        Swal.fire({
                                                            title: 'Upload Image?',
                                                            text: 'Company profile image will be updated.',
                                                            icon: 'question',
                                                            showCancelButton: true,
                                                            confirmButtonText: 'Yes, Upload',
                                                            cancelButtonText: 'Cancel'
                                                        }).then((result) => {
                                                            if (result.isConfirmed) {
                                                                Swal.fire({
                                                                    title: 'Uploading...',
                                                                    allowOutsideClick: false,
                                                                    didOpen: () => {
                                                                        Swal.showLoading();
                                                                    }
                                                                });
                                                                $.ajax({
                                                                    url: 'includes/companies/update-logo.php',
                                                                    type: 'POST',
                                                                    data: formData,
                                                                    contentType: false,
                                                                    processData: false,
                                                                    success: function (response) {
                                                                        if (response.trim() === 'success') {
                                                                            Swal.fire(
                                                                                'Uploaded!',
                                                                                'Company image updated successfully.',
                                                                                'success'
                                                                            ).then(() => {
                                                                                location.reload(); // or redirect
                                                                            });
                                                                        } else {
                                                                            Swal.fire(
                                                                                'Error!',
                                                                                response,
                                                                                'error'
                                                                            );
                                                                        }
                                                                    }
                                                                });
                                                            }
                                                        });
                                                    });
                                                </script>
                                            </div>
                                            <div class="col-auto">
                                                <button class="btn btn-ghost-danger delete-company-img" data-id="<?php echo $com_id; ?>">    
                                                    Delete avatar
                                                </button>
                                                <script>
                                                    $(document).on('click', '.delete-company-img', function () {
    let com_id = $(this).data('id');
    Swal.fire({
        title: 'Delete Company Image?',
        text: 'This action cannot be undone.',
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
                url: 'includes/companies/del-logo.php',
                type: 'POST',
                data: { com_id: com_id },
                success: function (response) {
                    if (response.trim() === 'success') {
                        Swal.fire(
                            'Deleted!',
                            'Company image has been removed.',
                            'success'
                        ).then(() => {
                            location.reload(); // or redirect
                        });
                    } else {
                        Swal.fire(
                            'Error!',
                            response,
                            'error'
                        );
                    }
                }
            });
        }
    });
});
                                                </script>
                                            </div>
                                        </div>
                                        <h3 class="card-title mt-4">Personal Information:</h3>					                                     
                                        <form id="updateCompanyForm" enctype="multipart/form-data">    
                                            <div class="row g-3">					        
                                                <div class="mb-3 col-md-3">								            
                                                    <label class="form-label">Company Name</label>            
                                                    <input type="hidden" value="<?php echo $crow['com_id']; ?>" name="com_id">            
                                                    <input type="text" class="form-control" value="<?php echo $crow['com_name']; ?>" name="cname" required>
                                                </div>                                                      
                                                <div class="mb-3 col-md-3">	            
                                                    <label class="form-label">Relative Person</label>            
                                                    <input type="text" class="form-control" value="<?php echo $crow['com_person']; ?>" name="rpname" required>        
                                                </div>        
                                                <div class="mb-3 col-md-3">	            
                                                    <label class="form-label">Email Address</label>            
                                                    <input type="email" class="form-control" value="<?php echo $crow['com_email']; ?>" name="cemail" required>						        
                                                </div>						                                                        
                                                <div class="mb-3 col-md-3">            
                                                    <label class="form-label">Phone</label>            
                                                    <input type="text" class="form-control" value="<?php echo $crow['com_phone']; ?>" name="cphone" readonly>						        
                                                </div>	                                                        
                                                <div class="mb-3 col-md-3">            
                                                    <label class="form-label">Pin Code</label>            
                                                    <input type="text" class="form-control" value="<?php echo $crow['com_pin']; ?>" name="cpin" required>						        
                                                </div>     						                                                        
                                                <div class="mb-3 col-md-3">							            
                                                    <label class="form-label">Postal Code</label>            
                                                    <input type="text" class="form-control" value="<?php echo $crow['postal_code']; ?>" name="pc" required>        
                                                </div>                                                        
                                                <div class="mb-3 col-md-6">						            
                                                    <label class="form-label">Address</label>						            
                                                    <textarea class="form-control" rows="3" name="caddress" required><?php echo $crow['com_address']; ?></textarea>						        
                                                </div>						    
                                            </div>					                                               
                                            <div class="card-footer bg-transparent mt-auto">        
                                                <div class="btn-list justify-content-end">            
                                                    <a href="companies-list.php" class="btn">Cancel</a>            
                                                    <button type="submit" class="btn btn-primary">Update</button>        
                                                </div>    
                                            </div>
                                        </form>                                                                           
                                    </div>				
                                </div>	                                
                                <script>
                                    $("#updateCompanyForm").on("submit", function(e) {
                                        e.preventDefault();
                                        let formData = new FormData(this);
                                        Swal.fire({
                                            title: 'Update Company?',
                                            text: "Do you want to save changes?",
                                            icon: 'question',
                                            showCancelButton: true,
                                            confirmButtonText: 'Yes, Update',
                                            cancelButtonText: 'Cancel'
                                        }).then((result) => {
                                            if (result.isConfirmed) {
                                                $.ajax({
                                                    url: "includes/companies/update-company.php",
                                                    type: "POST",
                                                    data: formData,
                                                    contentType: false,
                                                    processData: false,
                                                    dataType: "json",
                                                    success: function(response) {
                                                        if (response.status === "success") {
                                                            Swal.fire({
                                                                icon: 'success',
                                                                title: 'Updated!',
                                                                text: response.message,
                                                                timer: 1500,
                                                                showConfirmButton: false
                                                            }).then(() => {
                                                                window.location.href = "companies-list.php";
                                                            });
                                                        } else {
                                                            Swal.fire({
                                                                icon: 'error',
                                                                title: 'Error',
                                                                text: response.message
                                                            });
                                                        }
                                                    },
                                                    error: function() {
                                                        Swal.fire("Error", "Server error occurred", "error");
                                                    }
                                                });
                                            }
                                        });
                                    });

                                </script>
                            </div>			
                        </div>			
                        <div class="tab-pane" id="tabs-statement">									
                            <div class="card-body">										
                                <h2 class="mb-4">				
                                    Customer Booking Statements				
                                </h2>												
                                <div class="row mb-3">												
                                    <div class="card"> 				
                                        <div class="card-body border-bottom py-3">					
                                            <div id="table-adriver" class="table-responsive">					
                                                <table class="table" id="cstate">						
                                                    <thead>
                                                        <tr>							
                                                            <th>ID</th>							
                                                            <th>Job Completion Date</th>							
                                                            <th>Job Details</th>							
                                                            <th>Total Pay</th>							
                                                            <th>Status</th>							
                                                            <th>Actions</th>							
                                                        </tr>							
                                                    </thead>						
                                                    <tbody class="table-tbody">
                                                        <?php 
                                                        $x = 0;  
                                                        $isql = mysqli_query($connect, "SELECT invoice.*, jobs.book_id, bookings.b_type_id, bookings.pickup, bookings.destination, bookings.pick_date, bookings.pick_time, booking_type.b_type_name, drivers.d_name, drivers.d_phone, companies.com_phone, companies.com_name FROM invoice JOIN jobs ON invoice.job_id = jobs.job_id JOIN drivers ON invoice.d_id = drivers.d_id JOIN bookings ON jobs.book_id = bookings.book_id JOIN booking_type ON bookings.b_type_id = booking_type.b_type_id JOIN companies ON invoice.c_id = companies.com_id WHERE invoice.c_id = '$com_id'");
                                                        while ($irow = mysqli_fetch_array($isql)) :				
                                                            $x++;
                                                        ?>                                                        
                                                        <tr>                                                        
                                                            <td><?php echo $x; ?></td>	
                                                            <td><?php echo $irow['invoice_date'];?></td>							
                                                            <td>							                                                                							
                                                                Booking ID: <?php echo $irow['book_id'];?><br>																								
								<?php echo $irow['pickup'];?> - 																                                                                    
                                                                <?php echo $irow['destination'];?>                                                              
                                                            </td>
                                                            <td><?php echo $irow['total_pay'];?></td>							
                                                            <td><?php echo $irow['invoice_status'];?></td>
                                                            <td>
                                                                <a href="invoice.php?invoice_id=<?php echo $irow['invoice_id']; ?>" class="btn btn-info">								                                                                                                                                                                                                               
                                                                    <i class="ti ti-eye"></i>
                                                                    View Invoice
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
                            <script>
                                $(document).ready(function() {             
                                    $('#cstate').DataTable({                                      
                                        dom: 'Bfrtip',                    
                                        buttons: ['copy', 'csv', 'excel', 'pdf', 'print'],                    
                                        language: {            
                                            emptyTable: "No Booking Found!" // ✅ Handles empty table cleanly                        
                                        }                
                                    });        
                                });                        
                            </script>									                        
                        </div>    									
                    </div>                 												
                </div>             		
            </div>	
        </div>	
    </div>
</div>   
<?php
include('footer.php');
?>