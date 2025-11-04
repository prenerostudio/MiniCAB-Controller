<div class="col-12">            											
    <div class="card">													    
        <div class="card-body border-bottom py-3">													        
            <h2 class="mb-4">					                                            
                <?php if($crow['account_type']== 2) { ?>                                             
                Booker
                <?php }elseif($crow['account_type']== 1){ ?> Customer <?php } ?>
                Profile                
            </h2>
            <h3 class="card-title">
                Profile Details            
            </h3>					                                                    
            <div class="row align-items-center">
                <div class="col-auto">
    <span class="avatar avatar-xl" id="customer-image"
        style="background-image: url(img/customers/<?php echo $crow['c_pic'];?>);
               background-size:100% 100%;
               width: 150px; height: 150px;">
    </span>
</div>

<div class="col-auto">
    <form id="updateCustomerImageForm" enctype="multipart/form-data">
        <input type="hidden" name="c_id" value="<?php echo $crow['c_id']; ?>">
        <input type="file" name="fileToUpload" id="fileToUpload" class="btn" required>
        <button type="submit" class="btn btn-info">Upload Image</button>
    </form>
</div>
<script>
$(document).ready(function() {
    $('#updateCustomerImageForm').on('submit', function(e) {
        e.preventDefault();

        var formData = new FormData(this);

        $.ajax({
            url: 'includes/customer/update-customer-img.php',
            type: 'POST',
            data: formData,
            contentType: false,
            processData: false,
            dataType: 'json', // 👈 THIS forces jQuery to auto-parse JSON
            beforeSend: function() {
                Swal.fire({
                    title: 'Uploading...',
                    text: 'Please wait while the image is being uploaded.',
                    allowOutsideClick: false,
                    didOpen: () => {
                        Swal.showLoading();
                    }
                });
            },
            success: function(res) {
                // ✅ No need to parse again, it's already a JS object
                if (res.status === 'success') {
                    Swal.fire({
                        icon: 'success',
                        title: 'Success!',
                        text: res.message,
                        timer: 1500,
                        showConfirmButton: false
                    });

                    // Update image dynamically
                    $('#customer-image').css('background-image', 'url(img/customers/' + res.newImage + ')');
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: 'Error!',
                        text: res.message
                    });
                }
            },
            error: function(xhr, status, error) {
                Swal.fire({
                    icon: 'error',
                    title: 'Upload Failed',
                    text: 'Something went wrong: ' + error
                });
            }
        });
    });
});
</script>


                
                
                <div class="col-auto">					                
                    <a href="javascript:void(0);" 
   class="btn btn-ghost-danger" 
   id="delete-avatar-btn" 
   data-id="<?php echo $c_id; ?>">
   Delete avatar
</a>

                   <script>
$(document).ready(function() {
    $('#delete-avatar-btn').on('click', function() {
        var c_id = $(this).data('id');

        Swal.fire({
            title: 'Are you sure?',
            text: "This will permanently remove the customer's avatar.",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, delete it!'
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    url: 'includes/customer/del-customer-img.php',
                    type: 'POST', // safer than GET
                    data: { c_id: c_id },
                    dataType: 'json',
                    beforeSend: function() {
                        Swal.fire({
                            title: 'Deleting...',
                            text: 'Please wait...',
                            allowOutsideClick: false,
                            didOpen: () => {
                                Swal.showLoading();
                            }
                        });
                    },
                    success: function(res) {
                        if (res.status === 'success') {
                            Swal.fire({
                                icon: 'success',
                                title: 'Deleted!',
                                text: res.message,
                                timer: 1500,
                                showConfirmButton: false
                            });

                            // Remove or reset the image preview
                            $('#customer-image').css('background-image', 'url(img/customers/default.png)');
                        } else {
                            Swal.fire({
                                icon: 'error',
                                title: 'Error!',
                                text: res.message
                            });
                        }
                    },
                    error: function() {
                        Swal.fire({
                            icon: 'error',
                            title: 'Error!',
                            text: 'Something went wrong. Try again.'
                        });
                    }
                });
            }
        });
    });
});
</script>
 
                    
                </div>					                
            </div>					            
            <h3 class="card-title mt-4">
                Personal Information:
            </h3>					                                        
            <form id="updateCustomerForm" method="post" enctype="multipart/form-data">					            
                <div class="row g-3">									                
                    <div class="mb-3 col-md-3">																				                    
                        <div class="form-label">Customer Name</div>						                        
                        <input type="hidden" class="form-control" value="<?php echo $crow['c_id']; ?>" name="c_id">						                        
                        <input type="text" class="form-control" value="<?php echo $crow['c_name']; ?>" name="cname">
                    </div>						                   
                    <div class="mb-3 col-md-3">						                    
                        <div class="form-label">Email Address</div>						                        
                        <input type="text" class="form-control" value="<?php echo $crow['c_email']; ?>" name="cemail">						   
                    </div>						                   
                    <div class="mb-3 col-md-3">						                    
                        <div class="form-label">Phone</div>						                        
                        <input type="text" class="form-control" value="<?php echo $crow['c_phone']; ?>" name="cphone" readonly>						                        
                    </div>																		                    
                    <div class="mb-3 col-md-3">																		                    
                        <div class="form-label">Gender</div>									                        
                        <select class="form-select" name="cgender" required>						                        
                            <option><?php echo $crow['c_gender']; ?></option>							                            
                            <option>Male</option>																		
                            <option>Female</option>																                            
                            <option>Transgender</option>							
                        </select>						                        
                    </div>
                    <div class="mb-3 col-md-3">                    
                        <div class="form-label">Language </div>						                        
                        <select class="form-select" name="clang">						                        
                            <option><?php echo $crow['c_language']; ?></option>										
				<?php														
                                $lsql=mysqli_query($connect,"SELECT * FROM `language`");				                                                                
                                while($lrow = mysqli_fetch_array($lsql)){							                                
                                ?>																					                               
                            <option>															
                                <?php echo $lrow['language'];?>                                
                            </option>										
                            <?php														                          
                            }
                            ?>							                                
                        </select>
                    </div>
                    <div class="mb-3 col-md-3">						                    
                        <div class="form-label">Postal Code</div>						                        
                        <input type="text" class="form-control" value="<?php echo $crow['postal_code'] ?>" name="postal_code">						                        
                    </div>											                    
                    <div class="mb-3 col-md-3">																		                    
                        <div class="form-label">National ID</div>						                        
                        <input type="text" class="form-control" value="<?php echo $crow['c_ni'];?>" name="cni">
                    </div>
                    <div class="mb-3 col-md-3">
                        <div class="form-label">Address</div>
                        <textarea class="form-control" rows="3" name="caddress"><?php echo $crow['c_address'] ?></textarea>
                    </div>						                    
                </div>					                
                <div class="card-footer bg-transparent mt-auto">					                
                    <div class="btn-list justify-content-end">						                    
                        <a href="customers.php" class="btn">						                        
                            Cancel							                            
                        </a>						
                        <button type="submit" class="btn btn-primary">						                        
                            Update																				                            
                        </button>																		
                    </div>																	                    
                </div>															                
            </form>
            
            <script>
$(document).ready(function() {
    $('#updateCustomerForm').on('submit', function(e) {
        e.preventDefault();

        var formData = new FormData(this);

        $.ajax({
            url: 'includes/customer/update-customer.php',
            type: 'POST',
            data: formData,
            contentType: false,
            processData: false,
            dataType: 'json', // ensure JSON response
            beforeSend: function() {
                Swal.fire({
                    title: 'Updating...',
                    text: 'Please wait while customer details are being updated.',
                    allowOutsideClick: false,
                    didOpen: () => {
                        Swal.showLoading();
                    }
                });
            },
            success: function(res) {
                if (res.status === 'success') {
                    Swal.fire({
                        icon: 'success',
                        title: 'Updated!',
                        text: res.message,
                        timer: 1500,
                        showConfirmButton: false
                    });

                    // Optionally refresh displayed info without reloading:
                    // $('#customer-name-display').text($('input[name="cname"]').val());
                    // $('#customer-email-display').text($('input[name="cemail"]').val());
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: 'Error!',
                        text: res.message
                    });
                }
            },
            error: function(xhr, status, error) {
                Swal.fire({
                    icon: 'error',
                    title: 'Error!',
                    text: 'Something went wrong. Please try again.'
                });
            }
        });
    });
});
</script>

        </div>				        
    </div>
</div>    