<div class="card-body">							
    <h2 class="mb-4">
        Driver Document Section	(All Documents with <span style="color:red;">*</span> are required.)
    </h2>	
    <div class="row mb-3">	
        <div class="col-md-6" style="border: 1px solid #6c7a91; padding: 30px;">			
            <h3 class="card-title">            
                Driver License Photo Card (Front & Back) 
                <span style="color:red; font-size: 24px; font-weight: bold;">*</span> 
            </h3>				
            <div class="row align-items-center">				
                <div class="col-auto">		    
                    <h5>Image Front</h5>		    
                    <span id="dl_front_preview" class="avatar avatar-xl" style="background-image: url(img/drivers/driving-license/<?php echo $drow['dl_front'];?>); background-size: contain; width: 220px; height: 160px; display: inline-block; background-position: center; background-repeat: no-repeat;"></span>
                    <h5>Image Back</h5>		
    
                    <span id="dl_back_preview" class="avatar avatar-xl" style="background-image: url(img/drivers/driving-license/<?php echo $drow['dl_back'];?>); background-size: contain; width: 220px; height: 160px; display: inline-block; background-position: center; background-repeat: no-repeat;"></span>		

                </div>

                <div class="col-auto">
                    <form id="licenseForm" enctype="multipart/form-data">
    
                        <input type="hidden" name="d_id" value="<?php echo $d_id; ?>">                        

    
                        <div class="form-group pb-3">                                           
        
                            <label class="form-label">License Number</label>
        
                            <input type="text" name="licene_number" class="form-control" value="<?php echo $drow['dl_number'];?>" placeholder="Licence Number">
    
                        </div>                        
    
                        <div class="form-group pb-3">                                                          
        
                            <label class="form-label">License Expiry Date</label>
        
                            <input type="date" name="licence_exp" class="form-control" value="<?php echo $drow['dl_expiry'];?>">
    
                        </div>						
    
                        <div class="form-group pb-3">                                                          
        
                            <label class="form-label">License Expiry Time</label>
        
                            <input type="time" name="li_exp_time" class="form-control" value="<?php echo $drow['dl_expiry_time'];?>">
    
                        </div>
    
                        <div class="form-group pb-3">							
        
                            <label class="form-label">License Front Image</label>
        
                            <input type="file" name="dl_front" accept="image/*" class="form-control" required>                            
    
                        </div>                        
    
                        <div class="form-group">                                                          
        
                            <label class="form-label">License Back Image</label>
        
                            <input type="file" name="dl_back" accept="image/*" class="form-control" required>
    
                        </div>			                                                

                        
    
                        <button type="submit" class="btn btn-info mt-3">Upload Image</button>				

                    </form>
                  
                    <script>                       
                        $(document).ready(function() {
                            $("#licenseForm").on("submit", function(e) {
                                e.preventDefault();
                                var formData = new FormData(this);
                                $.ajax({
                                    url: "includes/drivers/documents/upload-license.php",
                                    type: "POST",
                                    data: formData,
                                    processData: false,
                                    contentType: false,
                                    dataType: "json",
                                    beforeSend: function() {
                                        Swal.fire({
                                            title: "Uploading...",
                                            text: "Please wait while we upload your license.",
                                            icon: "info",
                                            showConfirmButton: false,
                                            allowOutsideClick: false
                                        });
                                    },
                                    success: function(response) {
                                        Swal.close();
                                        if (response.status === "success") {
                                            Swal.fire({
                                                title: "Success!",
                                                text: response.message,
                                                icon: "success",
                                                timer: 2000,
                                                showConfirmButton: false
                                            });
                                            // ✅ Update background images dynamically
                                            if (response.front_image) {
                                                $("#dl_front_preview").css(
                                                    "background-image",
                                                    "url(" + response.front_image + "?v=" + new Date().getTime() + ")"
                                                );
                                            }
                                            if (response.back_image) {
                                                $("#dl_back_preview").css(
                                                    "background-image",
                                                    "url(" + response.back_image + "?v=" + new Date().getTime() + ")"
                                                );
                                            }

                                            // Clear file inputs
                                            $("#dl_front").val("");
                                            $("#dl_back").val("");
                                        } else {
                                            Swal.fire({
                                                title: "Error!",
                                                text: response.message || "Something went wrong.",
                                                icon: "error"
                                            });
                                        }
                                    },
                                    error: function(xhr, status, error) {
                                        Swal.fire({
                                            title: "Server Error",
                                            text: "Could not connect to the server: " + error,
                                            icon: "error"
                                        });
                                    }
                                });
                            });
                        });


                    </script>
						
                </div>
            </div>	
        </div>	                   
        <div class="col-md-6" style="border: 1px solid #6c7a91; padding: 30px;">			        
            <h3 class="card-title">				
                Proof of Address						
            </h3>				
            <div class="row align-items-center">				
    <div class="col-auto">	
        <h5>Proof of Address 1</h5>
        <span id="ap1_preview" 
              class="avatar avatar-xl" 
              style="background-image: url(img/drivers/address-proof/<?php echo $drow['ap_1'];?>);
                     background-size: contain; width: 220px; height: 160px;
                     display:inline-block; background-position:center; background-repeat:no-repeat;">
        </span>

        <h5>Proof of Address 2</h5>
        <span id="ap2_preview" 
              class="avatar avatar-xl" 
              style="background-image: url(img/drivers/address-proof/<?php echo $drow['ap_2'];?>);
                     background-size: contain; width: 220px; height: 160px;
                     display:inline-block; background-position:center; background-repeat:no-repeat;">
        </span>		
    </div>		

    <div class="col-auto">		
        <form id="addressProofForm" enctype="multipart/form-data">
            <input type="hidden" name="d_id" value="<?php echo $d_id; ?>">			                       
            
            <div class="form-group mb-3">  
                <label class="form-label">Proof of Address 1</label>                          
                <input type="file" id="pa1" name="pa1" accept="image/*" class="form-control" required>
            </div>                        
            
            <div class="form-group mb-3">                        
                <label class="form-label">Proof of Address 2</label>                          
                <input type="file" id="pa2" name="pa2" accept="image/*" class="form-control" required>
            </div>			

            <button type="submit" class="btn btn-info" style="margin-top: 25px;">Upload Image</button>
        </form>		
    </div>		
</div>
            <script>
                $(document).ready(function() {
    $("#addressProofForm").on("submit", function(e) {
        e.preventDefault();

        var formData = new FormData(this);

        $.ajax({
            url: "includes/drivers/documents/upload-address-proof.php",
            type: "POST",
            data: formData,
            contentType: false,
            processData: false,
            dataType: "json",
            beforeSend: function() {
                Swal.fire({
                    title: "Uploading...",
                    text: "Please wait while we upload your proof of address.",
                    icon: "info",
                    showConfirmButton: false,
                    allowOutsideClick: false
                });
            },
            success: function(response) {
                Swal.close();

                if (response.status === "success") {
                    Swal.fire({
                        title: "Success!",
                        text: response.message,
                        icon: "success",
                        timer: 2000,
                        showConfirmButton: false
                    });

                    // ✅ Update background images dynamically
                    if (response.ap_1) {
                        $("#ap1_preview").css(
                            "background-image",
                            "url(" + response.ap_1 + "?v=" + new Date().getTime() + ")"
                        );
                    }
                    if (response.ap_2) {
                        $("#ap2_preview").css(
                            "background-image",
                            "url(" + response.ap_2 + "?v=" + new Date().getTime() + ")"
                        );
                    }

                    // Clear file inputs
                    $("#pa1, #pa2").val("");
                } else {
                    Swal.fire({
                        title: "Error!",
                        text: response.message,
                        icon: "error"
                    });
                }
            },
            error: function(xhr, status, error) {
                Swal.fire({
                    title: "Server Error",
                    text: "Unexpected response: " + error,
                    icon: "error"
                });
            }
        });
    });
});

            </script>
        </div>		        	        	              			
    </div>			
    <div class="row mb-3">				    
         <div class="col-md-6" style="border: 1px solid #6c7a91; padding: 30px;">			
            <h3 class="card-title">				
                PCO License <span style="color:red; font-size: 24px; font-weight: bold;">*</span> 						
            </h3>				
           <div class="row align-items-center">				
    <div class="col-auto">						
        <span id="pco_preview" 
              class="avatar avatar-xl" 
              style="background-image: url(img/drivers/pco-license/<?php echo $drow['pl_img'];?>);
                     background-size: contain; 
                     width: 220px; height: 160px;
                     display:inline-block; 
                     background-position:center; 
                     background-repeat:no-repeat;">		
        </span>		
    </div>		

    <div class="col-auto">						
        <form id="pcoForm" enctype="multipart/form-data">
            <input type="hidden" name="d_id" value="<?php echo $d_id; ?>">				
            
            <div class="form-group pb-3">                                                          
                <label class="form-label">PCO License Number</label>
                <input type="text" name="pl_number" class="form-control" value="<?php echo $drow['pl_number'];?>" placeholder="PCO Licence Number">
            </div>                                              
            
            <div class="form-group pb-3">                                                  
                <label class="form-label">PCO License Expiry Date</label>
                <input type="date" name="pl_exp" class="form-control" value="<?php echo $drow['pl_exp'];?>">
            </div>  
            
            <div class="form-group pb-3">                                                  
                <label class="form-label">PCO License Expiry Time</label>
                <input type="time" name="pl_exp_time" class="form-control" value="<?php echo $drow['pl_exp_time'];?>">
            </div> 
            
            <div class="form-group mb-3">			                                                        
                <label class="form-label">PCO License Image</label>                            
                <input type="file" id="pco" name="pco" accept="image/*" class="form-control" required>
            </div>                        			
			
            <button type="submit" class="btn btn-info" style="margin-top: 25px;">Upload</button>			
        </form>							
    </div>						
</div>
             <script>
             $(document).ready(function() {
    $("#pcoForm").on("submit", function(e) {
        e.preventDefault();

        var formData = new FormData(this);

        $.ajax({
            url: "includes/drivers/documents/upload-pco.php",
            type: "POST",
            data: formData,
            processData: false,
            contentType: false,
            dataType: "json",
            beforeSend: function() {
                Swal.fire({
                    title: "Uploading...",
                    text: "Please wait while we upload your PCO license.",
                    icon: "info",
                    showConfirmButton: false,
                    allowOutsideClick: false
                });
            },
            success: function(response) {
                Swal.close();

                if (response.status === "success") {
                    Swal.fire({
                        title: "Success!",
                        text: response.message,
                        icon: "success",
                        timer: 2000,
                        showConfirmButton: false
                    });

                    // ✅ Update preview image without reload
                    if (response.pco_img) {
                        $("#pco_preview").css(
                            "background-image",
                            "url(" + response.pco_img + "?v=" + new Date().getTime() + ")"
                        );
                    }

                  
                } else {
                    Swal.fire({
                        title: "Error!",
                        text: response.message,
                        icon: "error"
                    });
                }
            },
            error: function(xhr, status, error) {
                Swal.fire({
                    title: "Server Error",
                    text: "Unexpected response: " + error,
                    icon: "error"
                });
            }
        });
    });
});

             
             </script>			
        </div>        
        <div class="col-md-6" style="border: 1px solid #6c7a91; padding: 30px;">		
            <h3 class="card-title">
                National Insurance Number				
            </h3>
           <div class="row align-items-center">	
    <div class="col-auto">
        <span id="niPreview" class="avatar avatar-xl"
            style="background-image: url(img/drivers/ni/<?php echo $drow['ni_img'];?>);
                   background-size:contain; width: 220px; height: 160px;">
        </span>
    </div>
    <div class="col-auto">
        <form id="uploadNiForm" enctype="multipart/form-data">
            <input type="hidden" name="d_id" value="<?php echo $d_id; ?>">
            <div class="form-group pb-3">
                <label class="form-label">National Insurance Number</label>
                <input type="text" name="ni_num" class="form-control"
                       placeholder="National Insurance Number"
                       value="<?php echo $drow['ni_number'];?>">
            </div>                        
            <div class="form-group mb-3">                        
                <label class="form-label">National Insurance Image</label>                          
                <input type="file" id="ni" name="ni" accept="image/*"
                       class="form-control" required>
            </div>			
            <button type="submit" class="btn btn-info" style="margin-top: 25px;">
                Upload Image
            </button>			
        </form>		
    </div>						
</div>
<script>
$(document).ready(function() {
    $('#uploadNiForm').on('submit', function(e) {
        e.preventDefault();
        
        let formData = new FormData(this);

        $.ajax({
            url: 'includes/drivers/documents/upload-ni.php',
            type: 'POST',
            data: formData,
            contentType: false,
            processData: false,
            beforeSend: function() {
                Swal.fire({
                    title: 'Uploading...',
                    text: 'Please wait while we process your upload.',
                    allowOutsideClick: false,
                    didOpen: () => Swal.showLoading()
                });
            },
            success: function(response) {
                Swal.close();
                if (response.status === 'success') {
                    Swal.fire({
                        icon: 'success',
                        title: 'Success!',
                        text: response.message,
                        timer: 2000,
                        showConfirmButton: false
                    });
                    
                    // Update preview image dynamically
                    $('#niPreview').css('background-image', 'url(' + response.image + '?v=' + new Date().getTime() + ')');
                    
                   
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: 'Upload Failed',
                        text: response.message
                    });
                }
            },
            error: function() {
                Swal.close();
                Swal.fire({
                    icon: 'error',
                    title: 'Error',
                    text: 'Something went wrong. Please try again.'
                });
            }
        });
    });
});
</script>			
        </div>	        	
    </div>    															
    <div class="row mb-3">
        <div class="col-md-6" style="border: 1px solid #6c7a91; padding: 30px;">	
            <h3 class="card-title">	
                DVLA Check Code			
            </h3>	
           <div class="row align-items-center">				
    <div class="col-auto">		
        <span id="dvla-preview" class="avatar avatar-xl"
            style="background-image: url(img/drivers/dvla/<?php echo $drow['dvla_img'];?>);
                   background-size:contain; width: 220px; height: 160px;">
        </span>
    </div>

    <div class="col-auto">
        <form id="dvlaForm" enctype="multipart/form-data">
            <input type="hidden" name="d_id" value="<?php echo $d_id; ?>">			

            <div class="form-group pb-3">  
                <label class="form-label">DVLA Check Number</label>
                <input type="text" name="dvla_num" class="form-control"
                    placeholder="DVLA Check Number" value="<?php echo $drow['dvla_number'];?>">
            </div>                        

            <div class="form-group mb-3">                        
                <label class="form-label">DVLA Check Image</label>
                <input type="file" id="dvla" name="dvla" accept="image/*" class="form-control" required>
            </div>			

            <button type="submit" class="btn btn-info" style="margin-top: 25px;">Upload Image</button>			
        </form>		
    </div>		
</div>
            <script>
document.getElementById('dvlaForm').addEventListener('submit', function(e) {
    e.preventDefault();

    const form = this;
    const formData = new FormData(form);

    Swal.fire({
        title: 'Uploading...',
        text: 'Please wait while the DVLA image is being uploaded.',
        allowOutsideClick: false,
        didOpen: () => Swal.showLoading()
    });

    fetch('includes/drivers/documents/upload-dvla.php', {
        method: 'POST',
        body: formData
    })
    .then(response => response.json())
    .then(data => {
        Swal.close();

        if (data.status === 'success') {
            Swal.fire({
                icon: 'success',
                title: 'Uploaded!',
                text: data.message,
                timer: 2000,
                showConfirmButton: false
            });

            // Update image preview
            document.getElementById('dvla-preview').style.backgroundImage =
                `url(img/drivers/dvla/${data.file})`;

        } else {
            Swal.fire({
                icon: 'error',
                title: 'Error',
                text: data.message || 'Upload failed, please try again.'
            });
        }
    })
    .catch(() => {
        Swal.close();
        Swal.fire('Error', 'An unexpected error occurred.', 'error');
    });
});
</script>

        </div>			
        <div class="col-md-6" style="border: 1px solid #6c7a91; padding: 30px;">
            <h3 class="card-title">
                Extra
            </h3>
            <div class="row align-items-center">
    <div class="col-auto">
        <span id="extraPreview" class="avatar avatar-xl" 
            style="background-image: url(img/drivers/extra/<?php echo $drow['de_img'];?>); 
                   background-size: contain; 
                   width: 220px; 
                   height: 160px;">
        </span>
    </div>						
    <div class="col-auto">						
        <form id="extraForm" enctype="multipart/form-data">
            <input type="hidden" name="d_id" value="<?php echo $d_id; ?>">
            <input type="file" id="extra" name="extra" accept="image/*" class="form-control" required>
            <button type="submit" class="btn btn-info" style="margin-top: 25px;">Upload Image</button>
        </form>
    </div>
</div>
            <script>
$(document).ready(function() {
    $('#extraForm').on('submit', function(e) {
        e.preventDefault(); // Prevent default form submission
        
        var formData = new FormData(this);
        formData.append('submit', true); // Mimic your PHP POST check

        $.ajax({
            url: 'includes/drivers/documents/upload-extra.php',
            type: 'POST',
            data: formData,
            processData: false,
            contentType: false,
            dataType: 'json',
            beforeSend: function() {
                Swal.fire({
                    title: 'Uploading...',
                    text: 'Please wait while your image is being uploaded.',
                    allowOutsideClick: false,
                    didOpen: () => {
                        Swal.showLoading();
                    }
                });
            },
            success: function(response) {
                Swal.close();

                if (response.status === 'success') {
                    Swal.fire({
                        icon: 'success',
                        title: 'Uploaded!',
                        text: response.message,
                        timer: 2000,
                        showConfirmButton: false
                    });

                    // Update image preview
                    $('#extraPreview').css('background-image', 'url("img/drivers/extra/' + response.fileName + '")');
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: 'Error',
                        text: response.message
                    });
                }
            },
            error: function(xhr, status, error) {
                Swal.close();
                Swal.fire({
                    icon: 'error',
                    title: 'Upload Failed',
                    text: 'An unexpected error occurred: ' + error
                });
            }
        });
    });
});
</script>

        </div>	
    </div>
</div>