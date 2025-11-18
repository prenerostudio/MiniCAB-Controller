<?php
include('header.php');
?>  
<div class="page-header d-print-none page_padding">		   		
    <div class="row g-2 align-items-center">        		
        <div class="col">            											
            <div class="page-pretitle">                							
                Overview                						
            </div>                							
            <h2 class="page-title">                							
                Vehicle Section                									
            </h2>              						
        </div>							
    </div>	
</div>
<div class="page-body page_padding">
    <div class="row row-deck row-cards">
        <div class="col-8">
            <div class="card">
                <div class="card-header">
                    <h3 class="card-title">		
                        All Vehicle List			
                    </h3>						
                </div>
                <div class="card-body border-bottom py-3">
                    <div id="table-booker" class="table-responsive">
                        <table class="table" id="vehicles">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Image</th>
                                    <th>Vehicle Name</th>
                                    <th>Seat</th>
                                    <th>Air Bags</th>
                                    <th>Wheel Chair</th>
                                    <th>Baby Sitter</th>
                                    <th>Actions</th>				
                                </tr>
                            </thead>
                            <tbody class="table-tbody">
                                <?php
                                $x=0;
                                $vsql=mysqli_query($connect,"SELECT * FROM `vehicles`");
                                while($vrow = mysqli_fetch_array($vsql)){
                                    $x++;
                                    ?>
                                <tr>
                                    <td>
                                        <?php echo $x; ?>
                                    </td>				
                                    <td>                                        
										
                                        <?php if (!$vrow['v_img']) { ?>
                                        <img src="img/car-icon.png" alt="Vehicle Img" style="width: 50px; height: 50px; border-radius: 5px;">					
					<?php } else{ ?>
                                        <img src="img/vehicles/<?php echo $vrow['v_img'];?>" alt="Vehicle Img" style="width: 50px; height: 50px; border-radius: 5px;">					
					<?php } ?>
                                    </td>
                                    <td>
                                        <?php echo $vrow['v_name']; ?>
                                    </td>
                                    <td>										
                                        <?php echo $vrow['v_seat']; ?>
                                    </td> 				
                                    <td>
                                        <?php if ($vrow['v_airbags'] == 1) { ?>						                                        
                                        <p style="color: yellowgreen;">Yes</p>					
					<?php } else { ?>    					
                                        <p style="color: red;">No</p>					
					<?php } ?>														
                                    </td>													
                                    <td>									
                                        <?php if ($vrow['v_wchair'] == 1) { ?>    						
                                        <p style="color: yellowgreen;">Yes</p>										
                                        <?php } else { ?>    					
                                        <p style="color: red;">No</p>					
					<?php } ?>															
                                    </td>
                                    <td>					
					<?php if ($vrow['v_babyseat'] == 1) { ?>						
                                        <p style="color: yellowgreen;">Yes</p>					
					<?php } else { ?>    					
                                        <p style="color: red;">No</p>					
					<?php }	?>															
                                    </td>
                                    <td>
                                        <a href="view-vehicle.php?v_id=<?php echo $vrow['v_id']; ?>" class="btn btn-info" title="View / Edit">
                                            <i class="ti ti-eye"></i>
                                        </a>                                        
                                        <button class="btn btn-danger deleteVehicleBtn" data-id="<?php echo $vrow['v_id']; ?>" title="Delete Vehicle">    
                                            <i class="ti ti-square-rounded-x"></i>
                                        </button>
                                    </td>
                                </tr>							
                                <?php
                                }
                                ?>                                   
                            </tbody>  			
                        </table>                									
                    </div>                  						
                </div>                                                    						
            </div>              				
        </div>			
        <div class="col-4">            									
            <div class="card">                											
                <div class="card-header">
                    <h3 class="card-title">								
                        Add New Vehicle								
                    </h3>						
                </div>                  										
                <div class="card-body border-bottom py-3">								
                    <form id="vehicleForm" enctype="multipart/form-data">
                        <div class="modal-body">        
                            <div class="row">           
                                <div class="mb-3">                
                                    <label class="form-label">Vehicle Name</label>                
                                    <input type="text" class="form-control" name="vname" id="vname" placeholder="Vehicle Name" required>            
                                </div>            
                                <div class="mb-3">                
                                    <label class="form-label">No. of Seats</label>                
                                    <input type="number" class="form-control" name="seats" id="seats" required>            
                                </div>                                          
                                <div class="mb-3">                
                                    <label class="form-check form-switch">                    
                                        <input class="form-check-input" type="checkbox" name="bags" value="1">                    
                                        <span class="form-check-label">Air Bags</span>               
                                    </label>            
                                </div>                                           
                                <div class="mb-3">                
                                    <label class="form-check form-switch">                    
                                        <input class="form-check-input" type="checkbox" name="wchair" value="1">                    
                                        <span class="form-check-label">Wheel Chair</span>               
                                    </label>            
                                </div>                                           
                                <div class="mb-3">                
                                    <label class="form-check form-switch">                    
                                        <input class="form-check-input" type="checkbox" name="babyc" value="1">                    
                                        <span class="form-check-label">Baby Carriers</span>               
                                    </label>            
                                </div>                                            
                                <!-- Image Preview -->            
                                <div class="mb-3">                
                                    <label class="form-label">Vehicle Image</label>                
                                    <input type="file" class="form-control" name="v_img" id="v_img" accept="image/*">                                                   
                                    <div class="mt-2">                    
                                        <img id="previewImg" src="" style="width:120px; display:none; border-radius:8px;">                
                                    </div>            
                                </div>                                       
                            </div>    
                        </div>                           
                        <div class="modal-footer">        
                            <button type="reset" class="btn btn-danger">
                                <i class="ti ti-circle-x"></i>
                                Cancel
                            </button>        
                            <button type="submit" class="btn ms-auto btn-success">
                                <i class="ti ti-car-garage"></i>
                                Save Vehicle
                            </button>    
                        </div>                       
                    </form>                                   
                </div>
            </div>
        </div>
    </div>
</div>
<script>

document.getElementById("v_img").addEventListener("change", function(){
    let file = this.files[0];
    if(file){
        let reader = new FileReader();
        reader.onload = function(event){
            document.getElementById("previewImg").style.display = "block";
            document.getElementById("previewImg").src = event.target.result;
        }
        reader.readAsDataURL(file);
    }
});


$("#vehicleForm").on("submit", function (e) {
    e.preventDefault();

    // ------------------------
    // **Validation**
    // ------------------------
    let vname = $("#vname").val().trim();
    let seats = $("#seats").val().trim();

    if (vname === "") {
        Swal.fire("Error", "Vehicle name is required", "error");
        return;
    }
    if (seats === "" || seats <= 0) {
        Swal.fire("Error", "Enter valid seat number", "error");
        return;
    }

    // Prepare form data
    let formData = new FormData(this);

    // ------------------------
    // **Loading Spinner**
    // ------------------------
    Swal.fire({
        title: "Saving Vehicle...",
        html: `
            <div class="spinner-border" role="status"></div>
            <p class='mt-2'>Please wait...</p>
        `,
        showConfirmButton: false,
        allowOutsideClick: false
    });

    // ------------------------
    // **AJAX Request**
    // ------------------------
    $.ajax({
        url: "includes/vehicles/vehicle-process.php",
        type: "POST",
        data: formData,
        contentType: false,
        processData: false,

        success: function (response) {
            if (response.trim() === "success") {
                Swal.fire({
                    title: "Vehicle Added!",
                    text: "Vehicle has been saved successfully.",
                    icon: "success"
                }).then(() => {
                    window.location.href = "vehicles-list.php";
                });

            } else {
                Swal.fire("Error", response, "error");
            }
        },

        error: function () {
            Swal.fire("Error", "Server not responding!", "error");
        }
    });
});

$(".deleteVehicleBtn").on("click", function() {
    let v_id = $(this).data("id");

    Swal.fire({
        title: "Are you sure?",
        text: "This vehicle will be deleted permanently!",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#d33",
        cancelButtonColor: "#3085d6",
        confirmButtonText: "Yes, delete it!"
    }).then((result) => {
        if(result.isConfirmed){

            $.ajax({
                url: "includes/vehicles/del-vehicle.php",
                type: "POST",
                data: { v_id: v_id },
                dataType: "json",
                success: function(response){
                    if(response.status === "success"){
                        Swal.fire("Deleted!", response.message, "success");

                        // Remove the deleted row from table (optional)
                        // $(this).closest("tr").remove();
                        setTimeout(() => location.reload(), 1000); // reload page
                    } else {
                        Swal.fire("Error!", response.message, "error");
                    }
                },
                error: function(xhr){
                    console.log("Server Response:", xhr.responseText);
                    Swal.fire("Error!", "Invalid server response!", "error");
                }
            });
        }
    });
});

</script>

<?php
include('footer.php');
?>