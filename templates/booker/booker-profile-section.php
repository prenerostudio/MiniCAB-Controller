<div class="card">
    <div class="card-body border-bottom py-3">    
        <h2 class="mb-4">        
            Booker Profile            
        </h2>        
        <div class="row align-items-center">                    
            <div class="col-auto">    
                <span class="avatar avatar-xl" id="bookerImage" style="background-image: url(img/bookers/<?php echo $brow['c_pic'];?>); background-size:contain; width: 220px; height: 160px;"></span>
            </div>
            <div class="col-auto">    
                <form id="bookerImageForm" enctype="multipart/form-data">        
                    <input type="hidden" name="c_id" value="<?php echo $brow['c_id']; ?>">        
                    <input type="file" name="fileToUpload" id="fileToUpload" class="btn" required>        
                    <button type="submit" class="btn btn-info">Upload Image</button>    
                </form>
            </div>
            <script>
                $(document).ready(function () {
                    $('#bookerImageForm').on('submit', function (e) {
                        e.preventDefault();
                        var formData = new FormData(this);
                        $.ajax({
                            url: 'includes/booker/update-booker-img.php',
                            type: 'POST',
                            data: formData,
                            contentType: false,
                            processData: false,
                            beforeSend: function () {
                                Swal.fire({
                                    title: 'Uploading...',
                                    text: 'Please wait while we upload your image.',
                                    icon: 'info',
                                    showConfirmButton: false,
                                    allowOutsideClick: false,
                                    didOpen: () => {
                                        Swal.showLoading();
                                    }
                                });
                            },
                            success: function (response) {
                                // Show success message
                                Swal.fire({
                                    title: 'Success!',
                                    text: 'Profile image updated successfully.',
                                    icon: 'success',
                                    timer: 2000,
                                    showConfirmButton: false
                                });
                                // Extract new image filename from response
                                try {
                                    var res = JSON.parse(response);
                                    if (res.status === 'success') {
                                        $('#bookerImage').css('background-image', 'url(img/bookers/' + res.newImage + '?v=' + new Date().getTime() + ')');
                                    } else {
                                        Swal.fire('Error', res.message, 'error');
                                    }
                                } catch (err) {
                                    console.log(response);
                                }
                            },
                            error: function () {
                                Swal.fire('Error', 'Something went wrong during upload.', 'error');
                            }
                        });
                    });
                });
            </script>                       
            <div class="col-auto">    
                <button type="button" class="btn btn-ghost-danger" id="deleteBookerImg" data-id="<?php echo $brow['c_id']; ?>">        
                    Delete Avatar    
                </button>
            </div>
            <script>
                $(document).ready(function () {
                    $('#deleteBookerImg').on('click', function () {
                        var c_id = $(this).data('id');

                        Swal.fire({
                            title: 'Are you sure?',
                            text: "This will permanently remove the profile image.",
                            icon: 'warning',
                            showCancelButton: true,
                            confirmButtonColor: '#d33',
                            cancelButtonColor: '#3085d6',
                            confirmButtonText: 'Yes, delete it!'
                        }).then((result) => {
                            if (result.isConfirmed) {
                                $.ajax({
                                    url: 'includes/booker/del-booker-img.php',
                                    type: 'POST',
                                    data: { c_id: c_id },
                                    success: function (response) {
                                        try {
                                            var res = JSON.parse(response);
                                            if (res.status === 'success') {
                                                Swal.fire({
                                                    title: 'Deleted!',
                                                    text: res.message,
                                                    icon: 'success',
                                                    timer: 1500,
                                                    showConfirmButton: false
                                                });

                                                // Replace image with default avatar
                                                $('#bookerImage').css('background-image', 'url(img/bookers/default.png)');
                                            } else {
                                                Swal.fire('Error', res.message, 'error');
                                            }
                                        } catch (err) {
                                            console.log(response);
                                            Swal.fire('Error', 'Unexpected response from server.', 'error');
                                        }
                                    },
                                    error: function () {
                                        Swal.fire('Error', 'Something went wrong while deleting.', 'error');
                                    }
                                });
                            }
                        });
                    });
                });
            </script>           
        </div>        
        <h3 class="card-title mt-4">        
            Personal Details            
        </h3>        
        <form id="updateBookerForm" enctype="multipart/form-data">
            <div class="row g-3">            
                <div class="mb-3 col-md-3">                
                    <div class="form-label">Booker Name</div>                    
                    <input type="hidden" class="form-control" value="<?php echo $brow['c_id']; ?>" name="c_id">                    
                    <input type="text" class="form-control" value="<?php echo $brow['c_name']; ?>" name="cname">                    
                </div>                
                <div class="mb-3 col-md-3">                
                    <div class="form-label">Email Address</div>                    
                    <input type="text" class="form-control" value="<?php echo $brow['c_email']; ?>" name="cemail">                    
                </div>                
                <div class="mb-3 col-md-3">                
                    <div class="form-label">Phone</div>                    
                    <input type="text" class="form-control" value="<?php echo $brow['c_phone']; ?>" name="cphone" readonly>                    
                </div>                
                <div class="mb-3 col-md-3">                
                    <div class="form-label">Gender</div>                    
                    <select class="form-select" name="cgender">                    
                        <option><?php echo $brow['c_gender']; ?></option>                        
                        <option>Male</option>                        
                        <option>Female</option>                        
                        <option>Transgender</option>                        
                    </select>                    
                </div>                
                <div class="mb-3 col-md-3">                
                    <div class="form-label">Language </div>                    
                    <select class="form-select" name="clang">                    
                        <option>                                                        
                            <?php echo $brow['c_language']; ?>
                        </option>
                        <?php
                        $lsql=mysqli_query($connect,"SELECT * FROM `language`");										                                                    
                        while($lrow = mysqli_fetch_array($lsql)){			                        
                        ?>				
                        <option>
                            <?php echo $lrow['language']; ?>
                        </option>
                        <?php
                        }
                        ?>			
                    </select>                    
                </div>                
                <div class="mb-3 col-md-3">                
                    <div class="form-label">Postal Code</div>                    
                    <input type="text" class="form-control" value="<?php echo $brow['postal_code'] ?>" name="pc">                    
                </div>                
                <div class="mb-3 col-md-3">                
                    <div class="form-label">National ID</div>                    
                    <input type="text" class="form-control" value="<?php echo $brow['c_ni'] ?>" name="cni">                    
                </div>                
                <div class="mb-3 col-md-3">                
                    <div class="form-label">Company Name</div>                    
                    <input type="text" class="form-control" value="<?php echo $brow['company_name'] ?>" name="com_name">                    
                </div>                
                <div class="mb-3 col-md-3">    
                    <div class="form-label">Commission Type</div>                        
                    <select class="form-control" name="com_type" id="commissionType">													        
                        <?php if ($brow['commission_type'] === '1') { ?>                                   
                        <option value="1" selected>Percentage</option>													            
                        <option value="2">Fixed</option>                                                                                                         
                            <?php } else { ?>           
                        <option value="1">Percentage</option>			            
                        <option value="2" selected>Fixed</option>													        
                            <?php } ?>			    
                    </select>		
                </div>
                <div class="mb-3 col-md-3">		    
                    <div class="form-label">Commission</div>		    
                    <input type="text" class="form-control" value="<?php echo $brow['percentage'];?>" name="percent" id="commissionPercent">         
                    <input type="text" class="form-control" value="<?php echo $brow['fixed'];?>" name="fixed" id="commissionFixed">                    
                </div>		
                <script>    
                    function toggleCommissionFields() {
                        var commissionType = $('#commissionType').val();
                        if (commissionType === "1") {  // ✅ Compare with string
                            $('#commissionPercent').show();
                            $('#commissionFixed').hide();        
                        } else {
                            $('#commissionPercent').hide();
                            $('#commissionFixed').show();        
                        }    
                    }
                    $(document).ready(function () {
                        toggleCommissionFields(); // Run on page load
                        $('#commissionType').on('change', function () {
                        toggleCommissionFields();
                        });
                    });
                </script>                
                <div class="mb-3 col-md-6">                
                    <div class="form-label">Address</div>                    
                    <input type="text" class="form-control" value="<?php echo $brow['c_address'] ?>" name="caddress">                    
                </div>                
            </div>            
            <div class="card-footer bg-transparent mt-auto">            
                <div class="btn-list justify-content-end">                
                    <a href="bookers.php" class="btn">                    
                        Cancel	                        
                    </a>                    
                    <button type="submit" class="btn btn-primary">		
                        Update Booker			
                    </button>                    
                </div>                
            </div>            
        </form>    
        <script>
            $(document).ready(function () {
                $('#updateBookerForm').on('submit', function (e) {
                    e.preventDefault();
                    var formData = new FormData(this);
                    $.ajax({
                        url: 'includes/booker/update-booker.php',
                        type: 'POST',
                        data: formData,
                        contentType: false,
                        processData: false,
                        beforeSend: function () {
                            Swal.fire({
                                title: 'Updating...',
                                text: 'Please wait while we update the booker information.',
                                icon: 'info',
                                showConfirmButton: false,
                                allowOutsideClick: false,
                                didOpen: () => {
                                    Swal.showLoading();
                                }
                            });
                        },
                        success: function (response) {
                            let res;
                            try {
                                if (typeof response === "string") {
                                    res = JSON.parse(response.trim());
                                } else {
                                    res = response;
                                }
                                if (res.status === "success") {
                                    Swal.fire({
                                        title: 'Success!',
                                        text: res.message,
                                        icon: 'success',
                                        timer: 2000,
                                        showConfirmButton: false
                                    }).then(() => {
                                        location.reload();
                                    });
                                } else {
                                    Swal.fire('Error', res.message, 'error');
                                }
                            } catch (err) {
                                console.log("Raw Response:", response);
                                Swal.fire('Error', 'Unexpected server response.', 'error');
                            }
                        },
                        error: function () {
                            Swal.fire('Error', 'Something went wrong while updating.', 'error');
                        }
                    });
                });
            });
        </script>
    </div>    
</div>