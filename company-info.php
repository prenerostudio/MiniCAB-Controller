<?php
include('header.php');

$usql=mysqli_query($connect,"SELECT * FROM `company` WHERE `user_id`='$myId'");				
$urow = mysqli_fetch_array($usql);
?> 
<div class="container-xl">           	
    <div class="card">	
        <div class="row g-0">                    			
            <div class="col-12 col-md-12 d-flex flex-column">        				
                <div class="card-body">            						
                    <h2 class="mb-4">Company Profile</h2>                						
                    <h3 class="card-title">Company Logo</h3>                						
                    <div class="row align-items-center">                		
                        <div class="col-auto">			
                            <span class="avatar avatar-xl" style="background-image: url('img/companies/<?php echo $urow['com_logo']; ?>')"></span>						
                        </div>                    								
                        <div class="col-auto">					                            
                            <form id="logoUploadForm" enctype="multipart/form-data">    
                                <input type="hidden" name="company_id" value="<?php echo $urow['company_id']; ?>">                                  
                                <input type="file" name="fileToUpload" id="fileToUpload" class="form-control mb-2" required>        
                                <button type="submit" class="btn btn-info">        
                                    Upload Image    
                                </button>
                            </form>			
                        </div>         			
                        <div class="col-auto">   
                            <button class="btn btn-ghost-danger" onclick="deleteLogo(<?php echo $urow['company_id']; ?>)">        
                                Delete Logo    
                            </button>
                        </div>                   							
                    </div>																
                    <form id="updateCompanyForm" enctype="multipart/form-data">		
                        <div class="row g-3">									
                            <div class="col-md-4">										
                                <h3 class="card-title mt-4">				
                                    Company Profile				
                                </h3> 											
                                <div class="mb-3">                    										
                                    <div class="form-label"> Company Name</div>				
                                    <input type="hidden" class="form-control" value="<?php echo $urow['company_id']; ?>" name="company_id">				
                                    <input type="text" class="form-control" value="<?php echo $urow['com_name']; ?>" name="cname">				
                                </div>				
                                <div class="mb-3">								
                                    <div class="form-label">Company Phone</div>				
                                    <input type="text" class="form-control" value="<?php echo $urow['com_phone']; ?>" name="cphone">		
                                </div>								
                                <div class="mb-3">												
                                    <div class="form-label">Company Contact Email</div>				
                                    <input type="text" class="form-control" value="<?php echo $urow['com_c_email']; ?>" name="cemail">				
                                </div>											
                                <div class="mb-3">												
                                    <div class="form-label">Company Admin Email</div>				
                                    <input type="text" class="form-control" value="<?php echo $urow['com_a_email']; ?>" name="aemail">				
                                </div>											
                                <div class="mb-3">												
                                    <div class="form-label">Company Admin Phone</div>				
                                    <input type="text" class="form-control" value="<?php echo $urow['com_a_phone']; ?>" name="aphone">				
                                </div>											
                                <div class="mb-3">											
                                    <div class="form-label">Company Web</div>				
                                    <input type="text" class="form-control" value="<?php echo $urow['com_web']; ?>" name="cweb">				
                                </div>									
                            </div>									
                            <div class="col-md-4">			
                                <h3 class="card-title mt-4">				
                                    Fiscal Data				
                                </h3> 																			
                                <div class="mb-3">				
                                    <div class="form-label">Company Licence</div>				
                                    <input type="text" class="form-control" value="<?php echo $urow['com_licence']; ?>" name="clicence">				
                                </div>				
                                <div class="mb-3">				
                                    <div class="form-label">VAT </div>				
                                    <input type="text" class="form-control" value="<?php echo $urow['com_vat']; ?>" name="cvat">				
                                </div>				
                                <div class="mb-3">				
                                    <div class="form-label">Company Register Number</div>				
                                    <input type="text" class="form-control" value="<?php echo $urow['com_r_num'] ?>" name="cnum">				
                                </div>											
                                <div class="mb-3">												
                                    <div class="form-label">Client Tax By Default in %</div>				
                                    <input type="text" class="form-control" value="<?php echo $urow['com_tax'] ?>" name="ctax">				
                                </div>				
                            </div>			
                            <div class="col-md-4">										
                                <h3 class="card-title mt-4">				
                                    Company Profile				
                                </h3>				
                                <div class="mb-3">												
                                    <div class="form-label">Company Address</div>				
                                    <input type="text" class="form-control" value="<?php echo $urow['com_address']; ?>" name="caddress">				
                                </div>											
                                <div class="mb-3">												
                                    <div class="form-label">Zip Code</div>				
                                    <input type="text" class="form-control" value="<?php echo $urow['com_zip'] ?>" name="czip">				
                                </div>											
                                <div class="mb-3">												
                                    <div class="form-label">City</div>				
                                    <input type="text" class="form-control" value="<?php echo $urow['com_city'] ?>" name="city">				
                                </div>											
                                <div class="mb-3">												
                                    <div class="form-label">Country</div>				
                                    <input type="text" class="form-control" value="<?php echo $urow['com_country'] ?>" name="country">				
                                </div>											
                                <div class="mb-3">												
                                    <div class="form-label">Language</div>												
                                    <input type="text" class="form-control" value="<?php echo $urow['com_language'] ?>" name="clang">											
                                </div>											
                                <div class="mb-3">				
                                    <div class="form-label">Currency</div>				
                                    <input type="text" class="form-control" value="<?php echo $urow['com_currency'] ?>" name="currency">				
                                </div>									
                                <div class="mb-3">				
                                    <div class="form-label">TimeZone</div>				
                                    <input type="text" class="form-control" value="<?php echo $urow['com_time_zone'] ?>" name="time_zone">				
                                </div>				
                            </div>			
                        </div>			
                        <div class="card-footer bg-transparent mt-auto">								
                            <div class="btn-list justify-content-end">									
                                <a href="dashboard.php" class="btn">											
                                    Cancel										
                                </a>						 											
                                <button type="submit" class="btn btn-primary">				
                                    Update				
                                </button>					
                            </div>							
                        </div>								
                    </form>													
                </div>									               					
            </div>              	
        </div>            	
    </div>         
</div>
<script>
$(function () {   
    $('#logoUploadForm').on('submit', function (e) {
        e.preventDefault();
        if ($('#fileToUpload').val() === '') {
            Swal.fire('Error', 'Please select a file first', 'error');
            return;
        }
        Swal.fire({
            title: 'Upload Company Logo?',
            text: 'Do you want to upload this image?',
            icon: 'question',
            showCancelButton: true,
            confirmButtonText: 'Yes, Upload'
        }).then((result) => {
            if (result.isConfirmed) {
                let formData = new FormData(this);
                $.ajax({
                    url: 'includes/auth/update-company-logo.php',
                    type: 'POST',
                    data: formData,
                    contentType: false,
                    processData: false,
                    dataType: 'json',
                    beforeSend: function () {
                        Swal.fire({
                            title: 'Uploading...',
                            text: 'Please wait',
                            allowOutsideClick: false,
                            didOpen: () => Swal.showLoading()
                        });
                    },
                    success: function (res) {
                        if (res.status === 'success') {
                            Swal.fire({
                                icon: 'success',
                                title: 'Uploaded!',
                                text: res.message,
                                timer: 2000,
                                showConfirmButton: false
                            }).then(() => location.reload());
                        } else {
                            Swal.fire('Error', res.message, 'error');
                        }
                    },
                    error: function () {
                        Swal.fire('Error', 'Server error occurred', 'error');
                    }
                });
            }
        });
    });        
    $('#updateCompanyForm').on('submit', function (e) {
        e.preventDefault();
        Swal.fire({
            title: 'Update Company?',
            text: 'Do you want to save these changes?',
            icon: 'question',
            showCancelButton: true,
            confirmButtonText: 'Yes, Update'
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    url: 'includes/auth/update-company.php',
                    type: 'POST',
                    data: new FormData(this),
                    processData: false,
                    contentType: false,
                    dataType: 'json',
                    success: function (res) {
                        if (res.status === 'success') {
                            Swal.fire({
                                icon: 'success',
                                title: 'Updated!',
                                text: res.message,
                                timer: 2000,
                                showConfirmButton: false
                            }).then(() => location.reload());
                        } else {
                            Swal.fire('Error', res.message, 'error');
                        }
                    },
                    error: function () {
                        Swal.fire('Error', 'Server error occurred', 'error');
                    }
                });
            }
        });
    });
});
function deleteLogo(companyId) {
    Swal.fire({
        title: 'Delete Company Logo?',
        text: 'This action cannot be undone!',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#d33',
        confirmButtonText: 'Yes, Delete'
    }).then((result) => {
        if (result.isConfirmed) {
            $.ajax({
                url: 'includes/auth/delete-company-logo.php',
                type: 'POST',
                data: { company_id: companyId },
                dataType: 'json',
                beforeSend: function () {
                    Swal.fire({
                        title: 'Deleting...',
                        allowOutsideClick: false,
                        didOpen: () => Swal.showLoading()
                    });
                },
                success: function (res) {
                    if (res.status === 'success') {
                        Swal.fire({
                            icon: 'success',
                            title: 'Deleted!',
                            text: res.message,
                            timer: 2000,
                            showConfirmButton: false
                        }).then(() => location.reload());
                    } else {
                        Swal.fire('Error', res.message, 'error');
                    }
                },
                error: function () {
                    Swal.fire('Error', 'Server error occurred', 'error');
                }
            });
        }
    });
}
</script>
<?php include('footer.php'); ?>