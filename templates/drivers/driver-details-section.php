<div class="col-12">
    <div class="card">
        <div class="card-body border-bottom py-3">
            <h2 class="mb-4">
                Driver Profile
            </h2>
            <h3 class="card-title">
                Profile Details
            </h3>
            <div class="row align-items-center">
                <div class="col-auto">
                    <span class="avatar avatar-xl" style="background-image: url(img/drivers/<?php echo $drow['d_pic'];?>); background-size:100% 100%; width: 150px; height: 150px;"></span>
                </div>                
                <div class="col-auto">    
                    <form id="uploadDriverImageForm" class="d-flex align-items-center gap-2" enctype="multipart/form-data">        
                        <input type="hidden" name="d_id" value="<?= $d_id; ?>">        
                        <input type="file" name="fileToUpload" id="fileToUpload" class="form-control" accept="image/*" required style="max-width: 250px;">       
                        <button type="submit" class="btn btn-info">            
                            <i class="ti ti-upload me-1"></i> Upload        
                        </button>    
                    </form>
                </div>              
                <script>                
                    $('#uploadDriverImageForm').on('submit', function(e) {
                        e.preventDefault();
                        var formData = new FormData(this);
                        $.ajax({
                            url: 'includes/drivers/update-driver-img.php',
                            type: 'POST',
                            data: formData,
                            contentType: false,
                            processData: false,
                            beforeSend: function() {
                                Swal.fire({
                                    title: 'Uploading...',
                                    text: 'Please wait while the image is being uploaded.',
                                    allowOutsideClick: false,
                                    didOpen: () => Swal.showLoading()
                                });
                            },
                            success: function(response) {
                                Swal.close();

                                if (response.status) {
                                    Swal.fire({
                                        icon: 'success',
                                        title: 'Upload Successful!',
                                        text: response.message,
                                        confirmButtonColor: '#28a745'
                                    }).then(() => {
                                        location.reload();
                                    });
                                } else {
                                    Swal.fire({
                                        icon: 'error',
                                        title: 'Upload Failed!',
                                        text: response.message,
                                        confirmButtonColor: '#d33'
                                    });
                                }
                            },
                            error: function() {
                                Swal.close();
                                Swal.fire({
                                    icon: 'error',
                                    title: 'Server Error!',
                                    text: 'Something went wrong on the server. Please try again.',
                                    confirmButtonColor: '#d33'
                                });
                            }
                        });
                    });                                                           
                </script>
                <div class="col-auto">    
                    <button type="button" class="btn btn-ghost-danger" id="deleteAvatarBtn" data-id="<?= $d_id; ?>">        
                        <i class="ti ti-trash"></i> Delete Avatar    
                    </button>
                </div>
            </div>
            <script>            
                $('#deleteAvatarBtn').on('click', function() {
                    const driverId = $(this).data('id');

                    Swal.fire({
                        title: 'Are you sure?',
                        text: "This will permanently delete the driver's profile image.",
                        icon: 'warning',
                        showCancelButton: true,
                        confirmButtonColor: '#d33',
                        cancelButtonColor: '#6c757d',
                        confirmButtonText: 'Yes, delete it!'
                    }).then((result) => {
                        if (result.isConfirmed) {
                            $.ajax({
                                url: 'includes/drivers/del-driver-img.php',
                                type: 'POST',
                                data: { d_id: driverId },
                                beforeSend: function() {
                                    Swal.fire({
                                        title: 'Deleting...',
                                        text: 'Please wait a moment.',
                                        allowOutsideClick: false,
                                        didOpen: () => Swal.showLoading()
                                    });
                                },
                                success: function(res) {
                                    Swal.close();
                                    if (res.status) {
                                        Swal.fire({
                                            icon: 'success',
                                            title: 'Deleted!',
                                            text: res.message,
                                            confirmButtonColor: '#28a745'
                                        }).then(() => location.reload());
                                    } else {
                                        Swal.fire({
                                            icon: 'error',
                                            title: 'Failed!',
                                            text: res.message,
                                            confirmButtonColor: '#d33'
                                        });
                                    }
                                },
                                error: function() {
                                    Swal.close();
                                    Swal.fire({
                                        icon: 'error',
                                        title: 'Server Error!',
                                        text: 'Something went wrong on the server.',
                                        confirmButtonColor: '#d33'
                                    });
                                }
                            });
                        }
                    });
                });           
            </script>
            <h3 class="card-title mt-4">
                Personal Information
            </h3>
            <form id="updateDriverForm" enctype="multipart/form-data">
                <div class="row g-3">
                    <div class="mb-3 col-md-4">
                        <div class="form-label">Driver Name</div>
                        <input type="hidden" class="form-control" value="<?php echo $d_id; ?>" name="d_id">
                        <input type="text" class="form-control" value="<?php echo $drow['d_name']; ?>" name="dname">
                    </div>
                    <div class="mb-3 col-md-4">
                        <div class="form-label">Email Address</div>
                        <input type="text" class="form-control" value="<?php echo $drow['d_email']; ?>" name="demail">
                    </div>
                    <div class="mb-3 col-md-4">
                        <div class="form-label">Phone</div>
                        <input type="text" class="form-control" value="<?php echo $drow['d_phone']; ?>" name="dphone" readonly>
                    </div>					
                    <div class="mb-3 col-md-4">
                        <div class="form-label">Whatsapp</div>
                        <input type="text" class="form-control" value="<?php echo $drow['d_whatsapp']; ?>" name="dwa">
                    </div>
                    <div class="mb-3 col-md-4">
                        <div class="form-label">Gender</div>
                        <select class="form-select" name="dgender">
                            <option><?php echo $drow['d_gender']; ?></option> 
                            <option>Male</option>
                            <option>Female</option>
                            <option>Transgender</option>
                        </select>
                    </div>
                    
                    <div class="mb-3 col-md-4">
                        <div class="form-label">License Authority</div>
                        <select class="form-select" name="dauth">
                            <option>
                                <?php echo $drow['licence_authority'];?>
                            </option>
                            <option>London</option>
                            <option>Birmingham</option>
                            <option>Ireland</option>			
                        </select>
                    </div>
					
                    <div class="mb-3 col-md-4">
                        <div class="form-label">Address</div>
                        <input type="text" class="form-control" id="add" value="<?php echo $drow['d_address'] ?>" name="daddress" >
                    </div>
                    <div class="mb-3 col-md-4">
                        <div class="form-label">Post Code </div>
                        <input type="text" class="form-control" value=" <?php echo $drow['d_post_code'];?>" name="pc" id="pc">                                                
                    </div>			
                    <div class="mb-3 col-md-4">                    
                        <div class="form-label">Vehicle</div>			
                        <select class="form-control" name="v_id">                        
                            <option value="<?php echo $drow['v_id'] ?>">                                           
                                <?php echo $drow['v_name'] ?>
                            </option>										
                            <?php                                                            
                            $vhcsql = mysqli_query($connect, "SELECT * FROM `vehicles`");                                                            
                            while ($vhcrow = mysqli_fetch_array($vhcsql)) {				                            
                            ?>                                    
                            <option value="<?php echo $vhcrow['v_id'] ?>">                                            
                                <?php echo $vhcrow['v_name'] ?>
                            </option>										
                            <?php										                                                            
                            }										
                            ?>                                    
                        </select>						 
                    </div>
                    <div class="mb-3 col-md-4">
                        <div class="form-label">Language</div>
                        <select class="form-select" name="dlang">
                            <option>
                                <?php echo $drow['d_language'];?>
                            </option>							
                            <?php							                            
                            $lsql=mysqli_query($connect,"SELECT * FROM `language`");
                            while($lrow = mysqli_fetch_array($lsql)){                            
                            ?>
                            <option>
                                <?php echo $lrow['language'] ?>
                            </option>							
                            <?php							                                                            
                            }							
                            ?>
                        </select>
                    </div>					
                    <div class="mb-3 col-md-4">
                        <div class="form-label">Shift Timing</div>
                        <select class="form-select" name="dshift">
                            <option>
                                <?php echo $drow['d_shift'];?>
                            </option>							
                            <option>Day Shift</option>							
                            <option>Afternoon Shift</option>			
                            <option>Night Shift</option>							
                        </select>
                    </div>					
                    <div class="mb-3 col-md-4">
                        <div class="form-label">TFL PCO Number: </div>
                        <input type="text" class="form-control" value="<?php echo $drow['d_pco']; ?>" name="dpco">
                    </div>                   
                </div>
                <div class="card-footer bg-transparent mt-auto">
        
                    <div class="btn-list justify-content-end">
            
                        <a href="drivers.php" class="btn btn-danger">Cancel</a>
            
                        <button type="submit" class="btn btn-success">
                
                            <i class="ti ti-360"></i> Update Driver
            
                        </button>
        
                    </div>
    
                </div>
            </form>            
            <script>                
                $(document).ready(function() {
                    $('#updateDriverForm').on('submit', function(e) {
                        e.preventDefault();
                        const formData = new FormData(this);
                        $.ajax({
                            url: 'includes/drivers/update-driver.php',
                            type: 'POST',
                            data: formData,
                            contentType: false,
                            processData: false,
                            dataType: 'json', // ✅ jQuery will parse JSON automatically
                            beforeSend: function() {
                                Swal.fire({
                                    title: 'Updating...',
                                    text: 'Please wait while we update the driver profile.',
                                    allowOutsideClick: false,
                                    didOpen: () => Swal.showLoading()
                                });
                            },
                            success: function(response) {
                                Swal.close();
                                if (response.status === 'success') {
                                    Swal.fire({
                                        icon: 'success',
                                        title: 'Profile Updated!',
                                        text: response.message,
                                        confirmButtonColor: '#28a745'
                                    }).then(() => {
                                        window.location.href = 'view-driver.php?d_id=' + response.d_id;
                                    });
                                } else {
                                    Swal.fire({
                                        icon: 'error',
                                        title: 'Update Failed!',
                                        text: response.message || 'Something went wrong.'
                                    });
                                }
                            },
                            error: function(xhr) {
                                Swal.close();
                                console.log(xhr.responseText);
                                Swal.fire({
                                    icon: 'error',
                                    title: 'Server Error',
                                    text: 'Unexpected response received.'
                                });
                            }
                        });
                    });
                });
            </script>
        </div>
    </div>
</div>
 

<script>  
  document.addEventListener("DOMContentLoaded", async () => {
    await google.maps.importLibrary("places");
    const { Autocomplete } = await google.maps.importLibrary("places");
    const options = { componentRestrictions: { country: "GB" } };
    const addInput = document.getElementById("add");
    const pcInput  = document.getElementById("pc");
    if (addInput) {
      const autoAdd = new Autocomplete(addInput, options);
      autoAdd.addListener("place_changed", () => {
        const place = autoAdd.getPlace();
        console.log(place);
        if (place.address_components) {
          let postalCode = "";
          place.address_components.forEach(c => {
            if (c.types.includes("postal_code")) {
              postalCode = c.long_name;
            }
          });
          if (postalCode && pcInput) {
            pcInput.value = postalCode;
          }
        }
      });
    }
    if (pcInput) {
      // If you want postcode autocomplete too (optional)
      const autoPC = new Autocomplete(pcInput, { types: ["(regions)"], componentRestrictions: { country: "GB" } });
    }
  });
</script>
