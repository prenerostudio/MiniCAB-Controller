<?php
include('header.php');

$v_id = $_GET['v_id'];
$vsql=mysqli_query($connect,"SELECT * FROM `vehicles` WHERE `v_id`='$v_id'");
$vrow = mysqli_fetch_array($vsql);
?>
<div class="page-header d-print-none">
    <div class="container-xl">
        <div class="row g-2 align-items-center">	
            <div class="col">	
                <h2 class="page-title">		
                    Vehicle Details	
                </h2>		
            </div>	
        </div>	
    </div>    
</div>
<div class="container-xl">                       
    <div class="row g-0">	    
        <div class="card col-8 col-md-8 d-flex flex-column">            				
            <div class="card-body">
                <div class="row align-items-center mt-4">   
                    <!-- Vehicle Image -->    
                    <div class="col-auto">        
                        <span class="avatar avatar-xl" id="vehicleImage" style="background-image: url(img/vehicles/<?php echo $vrow['v_img'];?>); background-size:cover; width:220px; height:160px;">        
                        </span>    
                    </div>   
                    <!-- Upload Image via AJAX -->    
                    <div class="col-auto">        
                        <form id="uploadForm" enctype="multipart/form-data">            
                            <input type="hidden" name="v_id" value="<?php echo $vrow['v_id']; ?>">            
                            <input type="file" name="fileToUpload" id="fileToUpload" class="btn">            
                            <button type="submit" class="btn btn-info mt-2">Upload Image</button>        
                        </form>    
                    </div>    
                    <!-- Delete Button via AJAX -->    
                    <div class="col-auto">        
                        <button class="btn btn-ghost-danger" id="deleteImageBtn" data-id="<?php echo $vrow['v_id']; ?>">            
                            Delete Vehicle Image        
                        </button>    
                    </div>
                </div>
            						                
                <h3 class="card-title mt-4">
                    Business Profile
                </h3>		                
                <form id="updateVehicleForm" method="post" enctype="multipart/form-data">                    
                    <div class="row g-3">									                    
                        <div class="mb-3 col-md-4">			                        
                            <div class="form-label">Vehicle Name</div>				                            
                            <input type="hidden" class="form-control" value="<?php echo $vrow['v_id']; ?>" name="v_id">  				                            
                            <input type="text" class="form-control" value="<?php echo $vrow['v_name']; ?>" name="vname"> 
                        </div>                        
                        <div class="mb-3 col-md-4">			                        
                            <div class="form-label">No. of Seats</div>                            
                            <input type="text" class="form-control" value="<?php echo $vrow['v_seat']; ?>" name="vseat">                            
                        </div>                        
                        <div class="mb-3 col-md-4">			                        
                            <div class="form-label">Wheel Chair</div>   				                            
                            <select class="form-control" name="vchair">				                            
                                <option value="<?php echo $vrow['w_chair'] ?>">								
                                    <?php if ($vrow['v_wchair'] == 1) { ?>                                        
                                    Yes
                                    <?php } else {	?>
                                    No                                        
                                    <?php }	?>				                                    
                                </option>				                                
                                <option value="1">Yes</option>				                                
                                <option value="0">No</option>												                                
                            </select>				                            
                        </div>										                        
                        <div class="mb-3 col-md-4">                    									                        
                            <div class="form-label">Baby Sitter</div>   				                            
                            <select class="form-control" name="vbaby">				                            
                                <option value="<?php echo $vrow['v_babyseat'] ?>">
                                    <?php if ($vrow['v_babyseat'] == 1) { ?>
                                    Yes                                        
                                    <?php } else { ?>                                        
                                    No                                        
                                    <?php } ?>				                                    
                                </option>				                                
                                <option value="1">Yes</option>				                                
                                <option value="0">No</option>												                                
                            </select>				                            
                        </div>                        
                        <div class="mb-3 col-md-4">                    									                        
                            <div class="form-label">Air Bags</div>                              
                            <select class="form-control" name="vbags">
                                <option value="<?php echo $vrow['v_airbags']; ?>">					
                                    <?php if ($vrow['v_airbags'] == 1) { ?>                                        
                                    Yes                                        
                                    <?php } else { ?>                                        
                                    No                                        
                                    <?php }	?>					                                                                        
                                </option>				                                
                                <option value="1">Yes</option>				                                
                                <option value="0">No</option>												                                
                            </select>				                            
                        </div>    								                        
                    </div>														                    
                    <div class="card-footer bg-transparent mt-auto">								                    
                        <div class="btn-list justify-content-end">									                        
                            <a href="vehicles-list.php" class="btn">											                            
                                <i class="ti ti-circle-x"></i>
                                Cancel										                                
                            </a>										                            
                            <button type="submit" class="btn btn-primary ms-auto">
                                <i class="ti ti-car-garage"></i>                            
                                Update										                                
                            </button>                                                        
                        </div>
                    </div>
                </form>																				        
            </div>
        </div>            	
    </div>         
</div>
<script>
/* --------------------------
   IMAGE UPLOAD (AJAX)
---------------------------- */
$("#uploadForm").on("submit", function(e){
    e.preventDefault();

    let formData = new FormData(this);

    Swal.fire({
        title: "Uploading...",
        html: '<div class="spinner-border" role="status"></div>',
        showConfirmButton: false,
        allowOutsideClick: false
    });

    $.ajax({
        url: "includes/vehicles/update-vehicle-img.php",
        type: "POST",
        data: formData,
        contentType: false,
        processData: false,

       success: function(response) {
    console.log(response); // TEMP debugging

    if (response.status === "success") {
        Swal.fire("Success!", response.message, "success");
        $("#vehicleImage").css("background-image", "url(img/vehicles/" + response.newImage + ")");
    } else {
        Swal.fire("Error", response.message, "error");
    }
}
,

        error: function(){
            Swal.fire("Error", "Server error!", "error");
        }
    });
});


/* --------------------------
   DELETE IMAGE (AJAX)
---------------------------- */
$("#deleteImageBtn").on("click", function () {

    let v_id = $(this).data("id");

    Swal.fire({
        title: "Are you sure?",
        text: "Vehicle image will be deleted permanently!",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#d33",
        cancelButtonColor: "#3085d6",
        confirmButtonText: "Yes, delete it!"
    }).then((result) => {

        if (result.isConfirmed) {

            $.ajax({
                url: "includes/vehicles/del-vehicle-img.php",
                type: "POST",
                data: { v_id: v_id }, // FIXED
                dataType: "json",

                success: function(response) {

                    if (response.status === "success") {
                        Swal.fire("Deleted!", response.message, "success");
                    } else {
                        Swal.fire("Error!", response.message, "error");
                    }
                },

                error: function(xhr, status, error) {
                    console.log("Server Response:", xhr.responseText);
                    Swal.fire("Error!", "Invalid server response!", "error");
                }
            });

        }

    });

});


$("#updateVehicleForm").on("submit", function(e) {
    e.preventDefault();

    let formData = new FormData(this);

    $.ajax({
        url: "includes/vehicles/update-vehicles.php",
        type: "POST",
        data: formData,
        contentType: false,
        processData: false,
        dataType: "json",

        success: function(res) {
            if (res.status === "success") {
                Swal.fire({
                    icon: "success",
                    title: "Updated!",
                    text: res.message,
                    timer: 1500,
                    showConfirmButton: false
                });

                setTimeout(() => {
                    location.reload();
                }, 1500);

            } else {
                Swal.fire("Error!", res.message, "error");
            }
        },

        error: function(xhr) {
            console.log("RAW RESPONSE:", xhr.responseText);

            Swal.fire("Error!", "Invalid server response!", "error");
        }
    });
});



</script>



<?php
include('footer.php');
?>