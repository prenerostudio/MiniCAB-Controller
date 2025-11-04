<?php
include('header.php');
$usql=mysqli_query($connect,"SELECT users.*, countries.* FROM users INNER JOIN countries ON users.country_id = countries.country_id WHERE users.user_id = '$myId'");											
$urow = mysqli_fetch_array($usql);	
?>
<div class="page-header d-print-none">
    <div class="container-xl">    
        <div class="row g-2 align-items-center">        	
            <div class="col">            	
                <h2 class="page-title">                		
                    Account Settings                		
                </h2>              		
            </div>	
        </div>        	
    </div>    
</div>      
<div class="page-body">
    <div class="container-xl">    		
        <div class="card">        					
            <div class="row g-0">												
                <div class="col-12 col-md-12 d-flex flex-column">		
                    <div class="card-body">                  																	
                        <h2 class="mb-4">Profile Details</h2>			
                        <div class="row align-items-center">							                            
                            <div class="col-auto">			    
                                <span id="userImageWrapper" class="avatar avatar-xl" style="background-image: url('img/users/<?php echo $urow['user_pic'];?>'); background-size:100% 100%; width:150px; height:150px;"></span>																			
                            </div>			
                            <div class="col-auto">																	    
                                <form id="userImageForm" enctype="multipart/form-data">				        
                                    <input type="hidden" value="<?php echo $urow['user_id']; ?>" name="user_id">				        
                                    <input type="file" name="fileToUpload" id="fileToUpload" class="form-control mb-3" required>        
                                    <button type="submit" class="btn btn-info">Upload Image</button>    
                                </form>  
                                <script>
                                    document.getElementById('userImageForm').addEventListener('submit', function(e) {
                                        e.preventDefault();
                                        const form = e.target;
                                        const formData = new FormData(form);
                                        fetch('includes/auth/update-user-img.php', {
                                            method: 'POST',
                                            body: formData
                                        })
                                        .then(response => response.json())
                                        .then(data => {
                                            if (data.status === 'success') {
                                                Swal.fire({
                                                    icon: 'success',
                                                    title: 'Success!',
                                                    text: data.message,
                                                    timer: 2000,
                                                    showConfirmButton: false
                                                });
                                                // Update the image dynamically
                                                const newImgUrl = 'img/users/' + data.filename + '?v=' + new Date().getTime();
                                                document.getElementById('userImageWrapper').style.backgroundImage = `url('${newImgUrl}')`;
                                                // Reset file input
                                                document.getElementById('fileToUpload').value = '';
                                            } else {
                                                Swal.fire({
                                                    icon: 'error',
                                                    title: 'Error',
                                                    text: data.message
                                                });
                                            }
                                        })
                                        .catch(error => {
                                            Swal.fire({
                                                icon: 'error',
                                                title: 'Oops!',
                                                text: 'Something went wrong!'
                                            });
                                            console.error(error);
                                        });
                                    });
                                </script>        
                            </div> 
                            <div class="col-auto">                               
                                <a href="javascript:void(0);" id="deleteUserImgBtn" data-userid="<?php echo $urow['user_id']; ?>" class="btn btn-ghost-danger">  
                                    Delete Avatar
                                </a>
                                <script>
                                    document.getElementById('deleteUserImgBtn').addEventListener('click', function() {
                                        const userId = this.dataset.userid;
                                        Swal.fire({
                                            title: 'Are you sure?',
                                            text: "You want to delete your profile image?",
                                            icon: 'warning',
                                            showCancelButton: true,
                                            confirmButtonText: 'Yes, delete it!',
                                            cancelButtonText: 'Cancel',
                                            confirmButtonColor: '#d33'
                                        }).then((result) => {
                                            if (result.isConfirmed) {
                                                fetch('includes/auth/del-user-img.php?user_id=' + userId)
                                                .then(response => response.json())
                                                .then(data => {
                                                    if (data.status === 'success') {
                                                        Swal.fire({
                                                            icon: 'success',
                                                            title: 'Deleted!',
                                                            text: data.message,
                                                            timer: 2000,
                                                            showConfirmButton: false
                                                        });
                                                        // Replace avatar with default placeholder
                                                        document.getElementById('userImageWrapper').style.backgroundImage = "url('img/users/default.png')";
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
                                                        title: 'Oops!',
                                                        text: 'Something went wrong!'
                                                    });
                                                    console.error(error);
                                                });
                                            }
                                        });
                                    });                               
                                </script>
                            </div>	                    	
                        </div>			
                        <h3 class="card-title mt-4">Business Profile</h3>			                       
                        <form id="updateUserForm" method="post">			
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
                                        <option>											
                                            <?php echo $urow['designation']; ?>
                                        </option>                        					
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
                                        <option value="<?php echo $urow['country_id'] ?>">
                                            <?php echo $urow['country_name'] ?>
                                        </option>										                                                                                        
                                        <?php
                                        $lsql=mysqli_query($connect,"SELECT * FROM `countries`");					
                                        while($lrow = mysqli_fetch_array($lsql)){										
                                        ?>					
                                        <option value="<?php echo $lrow['country_id']; ?>">
                                            <?php echo $lrow['country_name']; ?>
                                        </option>										                                            
                                        <?php
                                        }																					
                                        ?>																	
                                    </select>                      								
                                </div>                      				
                                <div class="col-md-4">                        				
                                    <div class="form-label">Post Code</div>                        				
                                    <input type="text" class="form-control" value="<?php echo $urow['pc'] ?>" name="pc">
                                </div>								                    				
                            </div>			
                            <div class="card-footer bg-transparent mt-auto">
                                <div class="btn-list justify-content-end">
                                    <a href="#" class="btn">
                                        Cancel
                                    </a>                                    
                                    <button class="btn btn-primary" type="submit" id="updateBtn">                
                                        Update Profile            
                                    </button>
                                </div>
                            </div>			
                        </form>	                        
                        <script>
                            document.getElementById('updateUserForm').addEventListener('submit', function(e) {
                                e.preventDefault();
                                const form = e.target;
                                const formData = new FormData(form);
                                const submitBtn = document.getElementById('updateBtn');
                                // Disable button & show loader
                                submitBtn.disabled = true;
                                submitBtn.innerHTML = '<span class="spinner-border spinner-border-sm me-2"></span>Updating...';
                                fetch('includes/auth/update-user.php', {
                                    method: 'POST',
                                    body: formData
                                })
                                .then(response => response.json())
                                .then(data => {
                                    submitBtn.disabled = false;
                                    submitBtn.innerHTML = 'Update Profile';
                                    if (data.status === 'success') {
                                        Swal.fire({
                                            icon: 'success',
                                            title: 'Profile Updated',
                                            text: data.message,
                                            timer: 2000,
                                            showConfirmButton: false
                                        });
                                    } else {
                                        Swal.fire({
                                            icon: 'error',
                                            title: 'Error!',
                                            text: data.message
                                        });
                                    }
                                })
                                .catch(error => {
                                    submitBtn.disabled = false;
                                    submitBtn.innerHTML = 'Update Profile';
                                    Swal.fire({
                                        icon: 'error',
                                        title: 'Oops!',
                                        text: 'Something went wrong!'
                                    });
                                    console.error(error);
                                });
                            });
                        </script>
                    </div>		
                </div>                  														
            </div>	
        </div>				  		      
        <div class="card mt-3">            
            <div class="card-body">                    
                <h2 class="mb-4">Change Password</h2>                      
                <form id="passwordForm">                            
                    <input type="hidden" name="user_id" value="<?php echo $urow['user_id']; ?>">                             
                    <div class="mb-3 password-toggle">                                    
                        <label class="form-label">New Password</label>                                      
                        <input type="password" class="form-control" name="password" id="password" required>                                      
                        <i class="fa-solid fa-eye toggle-icon" onclick="togglePassword('password', this)"></i>                              
                    </div>                             
                    <div class="mb-3 password-toggle">                                    
                        <label class="form-label">Confirm Password</label>                                      
                        <input type="password" class="form-control" name="confirm_password" id="confirm-password" required>                                      
                        <i class="fa-solid fa-eye toggle-icon" onclick="togglePassword('confirm-password', this)"></i>                              
                    </div>                             
                    <div class="d-flex justify-content-between">                                    
                        <a href="#" class="btn btn-secondary">Cancel</a>                                      
                        <button class="btn btn-primary" type="submit">Update Password</button>                              
                    </div>                      
                </form>              
            </div>            
        </div>             
        <script>
            function togglePassword(id, icon) {
                const input = document.getElementById(id);
                const isPassword = input.type === "password";
                input.type = isPassword ? "text" : "password";
                icon.classList.toggle("fa-eye");
                icon.classList.toggle("fa-eye-slash");
            }
            // Handle form submission with AJAX
            document.getElementById("passwordForm").addEventListener("submit", function(e) {
                e.preventDefault();
                const formData = new FormData(this);
                fetch("includes/auth/update-password.php", {
                    method: "POST",
                    body: formData
                })
                .then(res => res.json())
                .then(data => {
                    Swal.fire({
                        icon: data.status,
                        title: data.title,
                        text: data.message
                    }).then(() => {
                        if (data.status === "success") {
                            // Redirect after success
                            window.location.href = "profile-setting.php";
                        }
                    });
                })
                .catch(err => {
                    Swal.fire("Error", "Something went wrong. Try again.", "error");
                });
            });
        </script>   
    </div>
</div>       
<?php
include('footer.php')
?>