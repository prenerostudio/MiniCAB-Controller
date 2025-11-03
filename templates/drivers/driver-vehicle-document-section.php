<div class="card-body">
    <h2 class="mb-4">
        Driver Vehicle Document Section (All Documents with 
        <span style="color:red;">*</span> are required.)
    </h2>	
    <div class="row mb-3">	
        <div class="col-md-6" style="border: 1px solid #6c7a91; padding: 30px;">		
            <h3 class="card-title">
                Vehicle Log Book 
                <span style="color:red; font-size: 24px; font-weight: bold;">*</span> 
            </h3>
            <div class="row align-items-center">
    <div class="col-auto">
        <span id="logBookPreview" class="avatar avatar-xl"
            style="background-image: url(img/drivers/vehicle/log-book/<?php echo $drow['lb_img'];?>);
                   background-size: contain;
                   width: 220px;
                   height: 160px;">
        </span>
    </div>
    <div class="col-auto">
        <form id="logBookForm" enctype="multipart/form-data">
            <input type="hidden" name="d_id" value="<?php echo $d_id; ?>">

            <div class="form-group mb-3">
                <label class="form-label">Log Book Number</label>
                <input type="text" name="lb_num" placeholder="Log Book Number"
                    class="form-control" value="<?php echo $drow['lb_number'];?>">
            </div>

            <div class="form-group mb-3">
                <label class="form-label">Log Book Image</label>
                <input type="file" id="log-book" name="log_book" accept="image/*"
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
    $('#logBookForm').on('submit', function(e) {
        e.preventDefault();

        var formData = new FormData(this);
        formData.append('submit', true);

        $.ajax({
            url: 'includes/drivers/documents/upload-log-book.php',
            type: 'POST',
            data: formData,
            processData: false,
            contentType: false,
            dataType: 'json',
            beforeSend: function() {
                Swal.fire({
                    title: 'Uploading...',
                    text: 'Please wait while your log book image is being uploaded.',
                    allowOutsideClick: false,
                    didOpen: () => Swal.showLoading()
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

                    // Update the displayed image
                    $('#logBookPreview').css('background-image', 'url("img/drivers/vehicle/log-book/' + response.fileName + '")');
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
        <div class="col-md-6" style="border: 1px solid #6c7a91; padding: 30px;">			
            <h3 class="card-title">			
                Vehicle MOT Certificate	<span style="color:red; font-size: 24px; font-weight: bold;">*</span> 					
            </h3>				
            <div class="row align-items-center">				
    <div class="col-auto">						
        <span id="motPreview" class="avatar avatar-xl" 
            style="background-image: url(img/drivers/vehicle/mot-certificate/<?php echo $drow['mot_img'];?>); 
                   background-size:contain; 
                   width: 220px; 
                   height: 160px;">
        </span>		
    </div>

    <div class="col-auto">
        <form id="motForm" enctype="multipart/form-data">
            <input type="hidden" name="d_id" value="<?php echo $d_id; ?>">                       

            <div class="form-group mb-3">
                <label class="form-label">MOT Certificate Number</label>
                <input type="text" name="mot_num" placeholder="MOT Certificate Number" 
                    class="form-control" value="<?php echo $drow['mot_num'];?>">
            </div>    

            <div class="form-group mb-3">
                <label class="form-label">MOT Certificate Expiry</label>
                <input type="date" name="mot_exp" class="form-control" value="<?php echo $drow['mot_expiry'];?>">
            </div>

            <div class="form-group mb-3">
                <label class="form-label">MOT Certificate Expiry Time</label>
                <input type="time" name="mot_exp_time" class="form-control" value="<?php echo $drow['mot_exp_time'];?>">
            </div>

            <div class="form-group mb-3">
                <label class="form-label">MOT Certificate Image</label>
                <input type="file" id="mot" name="mot" accept="image/*" class="form-control" required>
            </div>                        

            <button type="submit" class="btn btn-info" style="margin-top: 25px;">
                Upload Image
            </button>
        </form>		
    </div>		
</div>
            
            
            <script>
$(document).ready(function() {
    $('#motForm').on('submit', function(e) {
        e.preventDefault();

        var formData = new FormData(this);
        formData.append('submit', true);

        $.ajax({
            url: 'includes/drivers/documents/upload-mot.php',
            type: 'POST',
            data: formData,
            processData: false,
            contentType: false,
            dataType: 'json',
            beforeSend: function() {
                Swal.fire({
                    title: 'Uploading...',
                    text: 'Please wait while the MOT certificate is being uploaded.',
                    allowOutsideClick: false,
                    didOpen: () => Swal.showLoading()
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

                    // Update the preview image dynamically
                    $('#motPreview').css('background-image', 'url("img/drivers/vehicle/mot-certificate/' + response.fileName + '")');
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
    <div class="row mb-3">
        <div class="col-md-6" style="border: 1px solid #6c7a91; padding: 30px;">	
            <h3 class="card-title">	
                Vehicle PCO <span style="color:red; font-size: 24px; font-weight: bold;">*</span> 		
            </h3>
            <div class="row align-items-center">
    <div class="col-auto">
        <span id="vpco-preview" class="avatar avatar-xl"
            style="background-image: url(img/drivers/vehicle/pco/<?php echo $drow['vpco_img'];?>);
                   background-size: contain; width: 220px; height: 160px;">
        </span>
    </div>

    <div class="col-auto">
        <form id="vpcoForm" enctype="multipart/form-data">
            <input type="hidden" name="d_id" value="<?php echo $d_id; ?>">

            <div class="form-group mb-3">
                <label class="form-label">Vehicle PCO Number</label>
                <input type="text" name="vpco_num" placeholder="Vehicle PCO Number" class="form-control"
                    value="<?php echo $drow['vpco_num'];?>">
            </div>

            <div class="form-group mb-3">
                <label class="form-label">Vehicle PCO Expiry</label>
                <input type="date" name="vpco_exp" class="form-control" value="<?php echo $drow['vpco_exp'];?>">
            </div>

            <div class="form-group mb-3">
                <label class="form-label">Vehicle PCO Expiry Time</label>
                <input type="time" name="vpco_exp_time" class="form-control" value="<?php echo $drow['vpco_exp_time'];?>">
            </div>

            <div class="form-group mb-3">
                <label class="form-label">Vehicle PCO Image</label>
                <input type="file" id="vpco" name="vpco" accept="image/*" class="form-control" required>
            </div>

            <button type="submit" class="btn btn-info" style="margin-top: 25px;">Upload Image</button>
        </form>
    </div>
</div>

            
            
            <script>
$(document).ready(function() {
    $('#vpcoForm').on('submit', function(e) {
        e.preventDefault();

        let formData = new FormData(this);

        $.ajax({
            url: 'includes/drivers/documents/upload-vpco.php',
            type: 'POST',
            data: formData,
            contentType: false,
            processData: false,
            dataType: 'json',
            beforeSend: function() {
                Swal.fire({
                    title: 'Uploading...',
                    text: 'Please wait while we upload your document.',
                    allowOutsideClick: false,
                    didOpen: () => Swal.showLoading()
                });
            },
            success: function(response) {
                Swal.close();
                if (response.status) {
                    Swal.fire({
                        icon: 'success',
                        title: 'Success!',
                        text: response.message,
                        timer: 2000,
                        showConfirmButton: false
                    });

                    // Update preview image instantly
                    $('#vpco-preview').css('background-image', 'url(img/drivers/vehicle/pco/' + response.image + ')');

                    // Reset file input
                    $('#vpcoForm')[0].reset();
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: 'Error',
                        text: response.message
                    });
                }
            },
            error: function() {
                Swal.close();
                Swal.fire({
                    icon: 'error',
                    title: 'Upload Failed',
                    text: 'An unexpected error occurred. Please try again.'
                });
            }
        });
    });
});
</script>

        </div>	
        <div class="col-md-6" style="border: 1px solid #6c7a91; padding: 30px;">	
            <h3 class="card-title">				
                Vehicle Insurance <span style="color:red; font-size: 24px; font-weight: bold;">*</span> 						
            </h3>				
           <div class="row align-items-center">				
    <div class="col-auto">						
        <span id="vi-preview" class="avatar avatar-xl"
            style="background-image: url(img/drivers/vehicle/insurance/<?php echo $drow['vi_img'];?>);
                   background-size: contain; width: 220px; height: 160px;">
        </span>		
    </div>		
    <div class="col-auto">						
        <form id="viForm" enctype="multipart/form-data">		
            <input type="hidden" name="d_id" value="<?php echo $d_id; ?>">	 
            
            <div class="form-group mb-3">                        
                <label class="form-label">Vehicle Insurance Number</label>                            
                <input type="text" name="vi_num" placeholder="Vehicle Insurance Number" class="form-control"
                       value="<?php echo $drow['vi_num'];?>">                        
            </div>                            
            
            <div class="form-group mb-3">                        
                <label class="form-label">Vehicle Insurance Expiry</label>                            
                <input type="date" name="vi_exp" class="form-control" value="<?php echo $drow['vi_exp'];?>">                        
            </div>   
			
            <div class="form-group mb-3">                        
                <label class="form-label">Vehicle Insurance Expiry Time</label>                            
                <input type="time" name="vi_exp_time" class="form-control" value="<?php echo $drow['vi_exp_time'];?>">                        
            </div> 
            
            <div class="form-group mb-3">                         
                <label class="form-label">Vehicle Insurance Image</label>								
                <input type="file" id="ins" name="ins" accept="image/*" class="form-control" required>                         
            </div>			
			
            <button type="submit" class="btn btn-info" style="margin-top: 25px;">Upload Image</button>			
        </form>		
    </div>		
</div>

         <script>
$(document).ready(function() {
    $('#viForm').on('submit', function(e) {
        e.preventDefault();
        
        let formData = new FormData(this);

        $.ajax({
            url: 'includes/drivers/documents/upload-vinsurance.php',
            type: 'POST',
            data: formData,
            contentType: false,
            processData: false,
            dataType: 'json',
            beforeSend: function() {
                Swal.fire({
                    title: 'Uploading...',
                    text: 'Please wait while we upload your vehicle insurance document.',
                    allowOutsideClick: false,
                    didOpen: () => Swal.showLoading()
                });
            },
            success: function(response) {
                Swal.close();

                if (response.status) {
                    Swal.fire({
                        icon: 'success',
                        title: 'Success!',
                        text: response.message,
                        timer: 2000,
                        showConfirmButton: false
                    });

                    // Instantly update the preview image
                    $('#vi-preview').css('background-image', 'url(img/drivers/vehicle/insurance/' + response.image + ')');

                    
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: 'Error',
                        text: response.message
                    });
                }
            },
            error: function() {
                Swal.close();
                Swal.fire({
                    icon: 'error',
                    title: 'Upload Failed',
                    text: 'An unexpected error occurred. Please try again.'
                });
            }
        });
    });
});
</script>   
            
            
        </div>	
    </div>
    <div class="row mb-3">
        <div class="col-md-12" style="border: 1px solid #6c7a91; padding: 30px;">	
            <h3 class="card-title">	
                Vehicle Picture (Front)		
            </h3>	
            <div class="row align-items-center">	
    <div class="col-auto text-center">
        <h5>Vehicle Front Image</h5>
        <span class="avatar avatar-xl" id="frontPreview" 
              style="background-image: url('img/drivers/vehicle/picture/<?php echo $drow['vp_front'];?>'); 
                     background-size:contain; width: 220px; height: 160px; display:inline-block;">
        </span>		
    </div>
    
    <div class="col-auto text-center">
        <h5>Vehicle Back Image</h5>
        <span class="avatar avatar-xl" id="backPreview" 
              style="background-image: url('img/drivers/vehicle/picture/<?php echo $drow['vp_back'];?>'); 
                     background-size:contain; width: 220px; height: 160px; display:inline-block;">
        </span>
    </div>		

    <div class="col-auto">		
        <form id="uploadVehicleForm" enctype="multipart/form-data">		
            <input type="hidden" name="d_id" value="<?php echo $d_id; ?>">                         

            <div class="form-group mb-3">                                                 
                <label class="form-label">Vehicle Image Front</label>				                        
                <input type="file" id="pic1" name="pic1" accept="image/*" class="form-control" required>                            
            </div>                        

            <div class="form-group mb-3">
                <label class="form-label">Vehicle Image Back</label>
                <input type="file" id="pic2" name="pic2" accept="image/*" class="form-control" required>
            </div>                        

            <button type="submit" class="btn btn-info" style="margin-top: 25px;">Upload Image</button>			                    
        </form>		
    </div>		
</div>
            
        <script>
$(document).ready(function() {

    $('#uploadVehicleForm').on('submit', function(e) {
        e.preventDefault();

        var formData = new FormData(this);

        $.ajax({
            url: 'includes/drivers/documents/upload-vehicle-pictures.php',
            type: 'POST',
            data: formData,
            contentType: false,
            processData: false,
            beforeSend: function() {
                Swal.fire({
                    title: 'Uploading...',
                    text: 'Please wait while we upload your images.',
                    allowOutsideClick: false,
                    didOpen: () => {
                        Swal.showLoading();
                    }
                });
            },
           success: function(response) {
    console.log("Server response:", response);

    let res = (typeof response === "string") ? JSON.parse(response) : response;

    if (res.status === 'success') {
        Swal.fire({
            icon: 'success',
            title: 'Success!',
            text: res.message,
            timer: 1500,
            showConfirmButton: false
        });

        // Update preview images
        $('#frontPreview').css('background-image', 'url(img/drivers/vehicle/picture/' + res.vp_front + '?t=' + new Date().getTime() + ')');
        $('#backPreview').css('background-image', 'url(img/drivers/vehicle/picture/' + res.vp_back + '?t=' + new Date().getTime() + ')');
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
                    text: 'AJAX request failed: ' + error
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
                Vehicle Road TAX		                
            </h3>		            
            <div class="row align-items-center">					            
    <div class="col-auto text-center">
        <h5>Road TAX Image</h5>
        <span id="roadTaxPreview" 
              class="avatar avatar-xl"
              style="background-image: url('img/drivers/vehicle/road-tax/<?php echo $drow['rt_img'];?>'); 
                     background-size: contain; width: 220px; height: 160px; display: inline-block;">
        </span>
    </div>

    <div class="col-auto">
        <form id="uploadRoadTaxForm" enctype="multipart/form-data">			                            
            <input type="hidden" name="d_id" value="<?php echo $d_id; ?>">

            <div class="form-group mb-3">                                                
                <label class="form-label">Road TAX Number</label>                                                        
                <input type="text" name="rt_num" placeholder="Road TAX Number" 
                       class="form-control" value="<?php echo $drow['rt_num'];?>">                                                
            </div>

            <div class="form-group mb-3">                                                
                <label class="form-label">Road TAX Expiry</label>
                <input type="date" name="rt_exp" class="form-control" value="<?php echo $drow['rt_exp'];?>">
            </div>

            <div class="form-group mb-3">                                                
                <label class="form-label">Road TAX Expiry Time</label>
                <input type="time" name="rt_exp_time" class="form-control" value="<?php echo $drow['rt_exp_time'];?>">
            </div>

            <div class="form-group mb-3">                                                 
                <label class="form-label">Road TAX Image</label>	                            
                <input type="file" id="rt" name="rt" accept="image/*"  class="form-control" required>                            
            </div>

            <button type="submit" class="btn btn-info" style="margin-top: 25px;">Upload Image</button>			                        
        </form>								                    
    </div>						                
</div> 	


<script>
$(document).ready(function() {

    $('#uploadRoadTaxForm').on('submit', function(e) {
        e.preventDefault();

        var formData = new FormData(this);

        $.ajax({
            url: 'includes/drivers/documents/upload-road-tax.php',
            type: 'POST',
            data: formData,
            contentType: false,
            processData: false,
            beforeSend: function() {
                Swal.fire({
                    title: 'Uploading...',
                    text: 'Please wait while we upload your Road TAX document.',
                    allowOutsideClick: false,
                    didOpen: () => { Swal.showLoading(); }
                });
            },
            success: function(response) {
                console.log("Server response:", response);
                let res = (typeof response === "string") ? JSON.parse(response) : response;

                if (res.status === 'success') {
                    Swal.fire({
                        icon: 'success',
                        title: 'Success!',
                        text: res.message,
                        timer: 1500,
                        showConfirmButton: false
                    });

                    // Update Road Tax image preview dynamically
                    $('#roadTaxPreview').css('background-image', 'url(img/drivers/vehicle/road-tax/' + res.rt_img + '?t=' + new Date().getTime() + ')');
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
                    text: 'AJAX request failed: ' + error
                });
            }
        });
    });
});
</script>
			            
        </div>			        
        <div class="col-md-6" style="border: 1px solid #6c7a91; padding: 30px;">			        
            <h3 class="card-title">					            
                Vehicle Rental Agreement						                
            </h3>					            
            <div class="row align-items-center">					            
    <div class="col-auto">
        <span id="ra-preview" class="avatar avatar-xl" 
            style="background-image: url(img/drivers/vehicle/rental-agreement/<?php echo $drow['ra_img'];?>); 
                   background-size: contain; 
                   width: 220px; height: 160px;">
        </span>
    </div>

    <div class="col-auto">
        <form id="uploadRentalAgreementForm" enctype="multipart/form-data">
            <input type="hidden" name="d_id" value="<?php echo $d_id; ?>">

            <div class="form-group mb-3">
                <label class="form-label">Vehicle Rental Agreement Number</label>
                <input type="text" name="ra_num" value="<?php echo $drow['ra_num'];?>" class="form-control">
            </div>

            <div class="form-group mb-3">
                <label class="form-label">Vehicle Rental Agreement Expiry</label>
                <input type="date" name="ra_exp" class="form-control" value="<?php echo $drow['ra_exp'];?>">
            </div>

            <div class="form-group mb-3">
                <label class="form-label">Vehicle Rental Agreement Expiry Time</label>
                <input type="time" name="ra_exp_time" class="form-control" value="<?php echo $drow['ra_exp_time'];?>">
            </div>

            <div class="form-group mb-3">
                <label class="form-label">Vehicle Rental Agreement Image</label>
                <input type="file" name="ra" accept="image/*" class="form-control" required>
            </div>

            <button type="submit" class="btn btn-info mt-2">Upload Image</button>
        </form>
    </div>
</div>

<script>
$(document).ready(function () {
    $("#uploadRentalAgreementForm").on("submit", function (e) {
        e.preventDefault();

        var formData = new FormData(this);

        $.ajax({
            url: "includes/drivers/documents/upload-rental-agreement.php",
            type: "POST",
            data: formData,
            contentType: false,
            processData: false,
            beforeSend: function() {
                Swal.fire({
                    title: 'Uploading...',
                    text: 'Please wait while we upload your file.',
                    allowOutsideClick: false,
                    didOpen: () => Swal.showLoading()
                });
            },
            success: function (response) {
                Swal.close();

                if (response.status === "success") {
                    Swal.fire({
                        icon: 'success',
                        title: 'Upload Successful!',
                        text: response.message,
                        timer: 2000,
                        showConfirmButton: false
                    });

                    // Update the image preview instantly
                    $("#ra-preview").css("background-image", "url(img/drivers/vehicle/rental-agreement/" + response.ra_img + "?" + new Date().getTime() + ")");
                   
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: 'Upload Failed!',
                        text: response.message
                    });
                }
            },
            error: function () {
                Swal.close();
                Swal.fire({
                    icon: 'error',
                    title: 'Server Error!',
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
                Insurance Schedule						
            </h3>				
            <div class="row align-items-center">
    <div class="col-auto">
        <span id="is-preview" class="avatar avatar-xl"
            style="background-image: url(img/drivers/vehicle/insurance-schedule/<?php echo $drow['is_img'];?>);
                   background-size:contain; width:220px; height:160px;">
        </span>
    </div>

    <div class="col-auto">
        <form id="uploadInsScheduleForm" enctype="multipart/form-data">
            <input type="hidden" name="d_id" value="<?php echo $d_id; ?>">

            <div class="form-group mb-3">
                <label class="form-label">Insurance Schedule Number</label>
                <input type="text" class="form-control" name="is_num" value="<?php echo $drow['is_num'];?>" placeholder="Insurance Schedule Number">
            </div>

            <div class="form-group mb-3">
                <label class="form-label">Insurance Schedule Image</label>
                <input type="file" name="sche" accept="image/*" class="form-control" required>
            </div>

            <button type="submit" class="btn btn-info mt-2">Upload Image</button>
        </form>
    </div>
</div>

        
<script>
$(document).ready(function () {
    $("#uploadInsScheduleForm").on("submit", function (e) {
        e.preventDefault();

        var formData = new FormData(this);

        $.ajax({
            url: "includes/drivers/documents/upload-schedule.php",
            type: "POST",
            data: formData,
            contentType: false,
            processData: false,
            beforeSend: function () {
                Swal.fire({
                    title: 'Uploading...',
                    text: 'Please wait while we upload your file.',
                    allowOutsideClick: false,
                    didOpen: () => Swal.showLoading()
                });
            },
            success: function (response) {
                Swal.close();

                if (response.status === "success") {
                    Swal.fire({
                        icon: 'success',
                        title: 'Upload Successful!',
                        text: response.message,
                        timer: 2000,
                        showConfirmButton: false
                    });

                    // Update image preview dynamically
                    $("#is-preview").css("background-image",
                        "url(img/drivers/vehicle/insurance-schedule/" + response.is_img + "?" + new Date().getTime() + ")"
                    );

                    
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: 'Upload Failed!',
                        text: response.message
                    });
                }
            },
            error: function () {
                Swal.close();
                Swal.fire({
                    icon: 'error',
                    title: 'Server Error!',
                    text: 'Something went wrong. Please try again.'
                });
            }
        });
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
        <span id="extra-img" 
              class="avatar avatar-xl" 
              style="background-image: url(img/drivers/vehicle/extra/<?php echo $drow['ve_img'];?>); 
                     background-size:contain; width: 220px; height: 160px;">
        </span>								
    </div>						
    <div class="col-auto">						
        <form id="formExtraUpload" enctype="multipart/form-data">							
            <input type="hidden" name="d_id" value="<?php echo $d_id; ?>">									
            <input type="file" id="vextra" name="vextra" accept="image/*" class="form-control" required>			
            <button type="submit" class="btn btn-info" style="margin-top: 25px;">Upload Image</button>			
        </form>		
    </div>		
</div>

<script>
document.getElementById("formExtraUpload").addEventListener("submit", function(e) {
    e.preventDefault();
    
    let formData = new FormData(this);

    fetch("includes/drivers/documents/vehicle-extra.php", {
        method: "POST",
        body: formData
    })
    .then(res => res.json())
    .then(data => {
        if (data.status === "success") {
            Swal.fire({
                icon: "success",
                title: "Uploaded!",
                text: data.message,
                timer: 1500,
                showConfirmButton: false
            });

            // Update image instantly
            document.getElementById("extra-img").style.backgroundImage = `url(${data.image}?v=${Date.now()})`;
        } else {
            Swal.fire({
                icon: "error",
                title: "Upload Failed!",
                text: data.message
            });
        }
    })
    .catch(err => {
        Swal.fire({
            icon: "error",
            title: "Unexpected Error",
            text: err.message
        });
    });
});
</script>

	
        </div>	
    </div>
</div>