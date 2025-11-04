<div class="col-12">                    
    <div class="card-body">    
        <h2 class="mb-4">Profile Details</h2>        
        <div class="row align-items-center">        
            <div class="col-auto">			                
                <span id="userAvatar" class="avatar avatar-xl" style="background-image: url(img/users/<?php echo $urow['user_pic'];?>); background-size:100% 100%; width: 150px; height: 150px;">    
                </span>				
            </div>				            
            <div class="col-auto">			                        
                <form id="uploadForm" enctype="multipart/form-data">				                        
                    <input type="hidden" value="<?php echo $urow['user_id']; ?>" name="user_id">				        
                    <input type="file" name="fileToUpload" id="fileToUpload" class="form-control mb-3" required>                            
                    <button type="submit" class="btn btn-info">Upload Image</button>                        
                </form>		                               
                <script>
                    $(document).ready(function() {
                        $('#uploadForm').on('submit', function(e) {
                            e.preventDefault();
                            let formData = new FormData(this);        
                            Swal.fire({
                                title: 'Uploading...',
                                text: 'Please wait while the image is being uploaded.',
                                allowOutsideClick: false,
                                didOpen: () => Swal.showLoading()
                            });
                            $.ajax({
                                url: 'includes/users/update-user-thumbnail.php',
                                type: 'POST',
                                data: formData,
                                contentType: false,
                                processData: false,
                                dataType: 'json', // 👈 Tell jQuery we expect JSON
                                success: function(res) {
                                    if (res.status === 'success') {
                                        Swal.fire({
                                            icon: 'success',
                                            title: 'Image Updated!',
                                            text: 'Your profile image has been updated successfully.',
                                            timer: 2000,
                                            showConfirmButton: false
                                        });
                                        // Update avatar instantly
                                        $('#userAvatar').css('background-image', 
                                            'url(img/users/' + res.newImage + '?v=' + new Date().getTime() + ')'
                                        );
                                    } else {
                                        Swal.fire({
                                            icon: 'error',
                                            title: 'Upload Failed',
                                            text: res.message || 'Something went wrong while uploading.'
                                        });
                                    }
                                },
                                error: function(xhr) {
                                    Swal.fire({
                                        icon: 'error',
                                        title: 'Server Error',
                                        text: 'Unable to connect or invalid server response.'
                                    });
                                    console.log(xhr.responseText);
                                }
                            });
                        });
                    });
                </script>
            </div>
            <div class="col-auto">			                            
                <button class="btn btn-ghost-danger delete-avatar-btn" data-uid="<?php echo $urow['user_id']; ?>">    
                    Delete Avatar
                </button>
                <script>
                    $(document).ready(function() {
                        $('.delete-avatar-btn').click(function() {
                            const user_id = $(this).data('uid');
                            Swal.fire({
                                title: 'Are you sure?',
                                text: 'This will permanently remove the user avatar.',
                                icon: 'warning',
                                showCancelButton: true,
                                confirmButtonColor: '#3085d6',
                                cancelButtonColor: '#d33',
                                confirmButtonText: 'Yes, delete it!'
                            }).then((result) => {
                                if (result.isConfirmed) {
                                    $.ajax({
                                        url: 'includes/users/del-user-img.php',
                                        type: 'POST',
                                        data: { user_id: user_id },
                                        dataType: 'json',
                                        success: function(res) {
                                            if (res.status === 'success') {
                                                Swal.fire({
                                                    icon: 'success',
                                                    title: 'Avatar Deleted!',
                                                    text: 'User avatar has been removed successfully.',
                                                    timer: 2000,
                                                    showConfirmButton: false
                                                });
                                                // Remove avatar image
                                                $('#userAvatar').css('background-image', 'url(img/users/default-avatar.png)');
                                            } else {
                                                Swal.fire({
                                                    icon: 'error',
                                                    title: 'Error!',
                                                    text: res.message || 'Something went wrong.'
                                                });
                                            }
                                        },
                                        error: function(xhr) {
                                            Swal.fire({
                                                icon: 'error',
                                                title: 'Server Error!',
                                                text: 'Could not connect to the server.'
                                            });
                                            console.log(xhr.responseText);
                                        }
                                    });
                                }
                            });
                        });
                    });
                </script>
            </div>                       
        </div>        
        <h3 class="card-title mt-4">Business Profile</h3>        
        <form id="updateUserForm" method="post" enctype="multipart/form-data">        
            <div class="row g-3">            
                <div class="col-md">                
                    <div class="form-label">First Name</div>
                    <input type="hidden" class="form-control" value="<?php echo $urow['user_id'] ?>" name="user_id">                    
                    <input type="text" class="form-control" value="<?php echo $urow['first_name'] ?>" name="fname">		
                </div>                
                <div class="col-md">
                    <div class="form-label">Last Name</div>                    
                    <input type="text" class="form-control" value="<?php echo $urow['last_name'] ?>" name="lname">                    
                </div>                
                <div class="col-md">
                    <div class="form-label">Email</div>				                    
                    <input type="text" class="form-control" value="<?php echo $urow['user_email'] ?>" readonly>		
                </div>                
            </div>
            <div class="row g-3" style="padding-top: 20px;">            
                <div class="col-md">						
                    <div class="form-label">Phone Number</div>                    
                    <input type="text" class="form-control" value="<?php echo $urow['user_phone'] ?>" name="uphone">		
                </div>                
                <div class="col-md">				
                    <div class="form-label">Designation</div>
                    <select class="form-control" name="desig">
                        <option><?php echo $urow['designation']; ?></option>
                        <option>Admin</option>
                        <option>Controller</option>  
						
                        <option>Accountant</option> 
						
                        <option>Customer Service</option> 
						
                        <option>Driver Support</option> 
						
                        <option>User</option> 
                    </select>                                        
                </div>                
                <div class="col-md">
                    <div class="form-label">National ID</div>                    
                    <input type="text" class="form-control" value="<?php echo $urow['nid'] ?>" name="nid">                    
                </div>                
            </div>			
            <div class="row g-3" style="padding-top: 20px;">            
                <div class="col-md">                
                    <div class="form-label">Address</div>
                    <input type="text" class="form-control" value="<?php echo $urow['address'] ?>" name="address">                    
                </div>                
                <div class="col-md">
                    <div class="form-label">City</div>                    
                    <input type="text" class="form-control" value="<?php echo $urow['city'] ?>" name="city">                    
                </div>                
                <div class="col-md">
                    <div class="form-label">State / Province</div>                    
                    <input type="text" class="form-control" value="<?php echo $urow['state'] ?>" name="state">                    
                </div>                
            </div>
            <div class="row g-3" style="padding-top: 20px; padding-bottom: 20px;">            
                <div class="col-md-4">                
                    <div class="form-label">Country</div>
                    <select class="form-select" id="country" name="country">                    
                        <option value="<?php echo $urow['country_id'];?>">											
                            <?php echo $urow['country_name'];?>
                        </option>
                        <?php
                        $lsql=mysqli_query($connect,"SELECT * FROM `countries`");
                        while($lrow = mysqli_fetch_array($lsql)){										                       
                        ?>										
                        <option value="<?php echo $lrow['country_id'] ?>">											
                            <?php echo $lrow['country_name'] ?>                                        
                        </option>										
                        <?php										                                                    
                        }                                        
                        ?>                                   
                    </select>                              
                </div>                
                <div class="col-md-4">
                    <div class="form-label">Post Code</div>                    
                    <input type="text" class="form-control" value="<?php echo $urow['pc'];?>" name="pc">                    
                </div>                
            </div>
            <div class="card-footer bg-transparent mt-auto">            
                <div class="btn-list justify-content-end">                
                    <a href="#" class="btn">
                        Cancel                        
                    </a>                    
                    <button class="btn btn-primary" type="submit">				                    
                        Update User                       
                    </button>                    
                </div> 		
            </div>			            
        </form>     
        <script>
$(document).ready(function() {
    $('#updateUserForm').on('submit', function(e) {
        e.preventDefault();

        const formData = new FormData(this);

        $.ajax({
            url: 'includes/users/update-user-details.php',
            type: 'POST',
            data: formData,
            processData: false,
            contentType: false,
            dataType: 'json',

            beforeSend: function() {
                Swal.fire({
                    title: 'Updating...',
                    text: 'Please wait while we update user details.',
                    allowOutsideClick: false,
                    didOpen: () => Swal.showLoading()
                });
            },

            success: function(response) {
                Swal.close();

                if (response.status === 'success') {
                    Swal.fire({
                        icon: 'success',
                        title: 'Updated!',
                        text: response.message,
                        timer: 2000,
                        showConfirmButton: false
                    });

                    // Optional: Update UI instantly (e.g., update name or designation shown elsewhere)
                    // $('#userNameDisplay').text(formData.get('fname') + ' ' + formData.get('lname'));
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: 'Error',
                        text: response.message
                    });
                }
            },

            error: function(xhr) {
                Swal.close();
                Swal.fire({
                    icon: 'error',
                    title: 'Server Error',
                    text: 'Unable to process your request.'
                });
                console.log(xhr.responseText);
            }
        });
    });
});
</script>

        
    </div>	        
</div>     