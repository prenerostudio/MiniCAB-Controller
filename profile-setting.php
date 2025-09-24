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
                                <span class="avatar avatar-xl" style="background-image: url(img/users/<?php echo $urow['user_pic'];?>); background-size:100% 100% ; width: 150px; height: 150px;">				
                                </span>																			
                            </div>			
                            <div class="col-auto">																	
                                <form action="includes/authentication/update-user-img.php" method="post" enctype="multipart/form-data">				
                                    <input type="hidden" value="<?php echo $urow['user_id']; ?>" name="user_id">				
                                    <input type="file" name="fileToUpload" id="fileToUpload" class="btn btn-outline">
                                    <button type="submit" class="btn btn-info">Upload Image </button>
                                </form>
                            </div>
                            <div class="col-auto">
                                <a href="includes/authentication/del-user-img.php?user_id=<?php echo $urow['user_id'] ?>" class="btn btn-ghost-danger">
                                    Delete avatar
                                </a>
                            </div>	                    	
                        </div>			
                        <h3 class="card-title mt-4">Business Profile</h3>			
                        <form method="post" action="includes/authentication/update-user.php">			
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
                                    <button class="btn btn-primary" type="submit">
                                        Update Profile
                                    </button>
                                </div>
                            </div>			
                        </form>			
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
                <a href="profile.php" class="btn btn-secondary">Cancel</a>
                <button class="btn btn-primary" type="submit">Update Password</button>
            </div>
        </form>
    </div>
</div>

<!-- SweetAlert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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

    fetch("includes/authentication/update-password.php", {
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