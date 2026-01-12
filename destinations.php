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
                Destinations Section					
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
                        Destinations List			
                    </h3>										
                </div>						
                <div class="card-body border-bottom py-3">						
                    <div id="table-adriver" class="table-responsive">							
                        <table class="table" id="destinations">									
                            <thead>										
                                <tr>												
                                    <th>ID</th>																	
                                    <th>Destination Name</th>																	
                                    <th>Address</th>							
                                    <th>Actions</th>				
                                </tr>				
                            </thead>										
                            <tbody class="table-tbody">															
                                <?php								                                       
                                $x = 0;								
                                $dsql = mysqli_query($connect, "SELECT * FROM `destinations`");				
                                while ($drow = mysqli_fetch_array($dsql)) :												
                                    $x++;												
                                ?>												
                                <tr>												
                                    <td>																			
                                        <?php echo $x; ?>										
                                    </td>													
                                    <td>																			
                                        <?php echo $drow['des_name'];?>										
                                    </td>													
                                    <td>																			
                                        <?php echo $drow['des_address'];?>										
                                    </td>				
                                    <td>											
                                        <button class="btn btn-danger deleteDestination" data-id="<?php echo $drow['des_id']; ?>" title="Delete">    
                                            <i class="ti ti-square-rounded-x"></i>
                                        </button>															
                                    </td>													
                                </tr>												
				<?php endwhile; ?>																
                                <?php if ($x === 0) : ?>								
                                <tr>                                   																			
                                    <td colspan="8">																					
                                        <p align="center">No Destination Found!</p>															
                                    </td>													
                                </tr>												
				<?php endif; ?>								
                            </tbody>										
                        </table>               																
                    </div>           													
                </div>       													
            </div>   										
        </div>					
        <script>     
            $(document).ready(function() {                          
                $('#destinations').DataTable({                        
                    responsive: true,                                            
                    dom: 'Bfrtip',                                            
                    buttons: ['copy', 'csv', 'excel', 'pdf', 'print'],                                            
                    language: {                                    
                        emptyTable: "No User Found!" // ✅ Handles empty table cleanly                                                    
                    }                                            
                });                    
            });     
            $(document).on('click', '.deleteDestination', function () {

    let des_id = $(this).data('id');
    let btn = $(this);

    Swal.fire({
        title: 'Are you sure?',
        text: "This destination will be permanently deleted!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonText: 'Yes, Delete',
        cancelButtonText: 'Cancel',
        confirmButtonColor: '#d33',
        allowOutsideClick: false,
        preConfirm: () => {
            btn.prop('disabled', true);

            return $.ajax({
                url: 'includes/zones/del-destination.php',
                type: 'POST',
                data: { des_id: des_id },
                dataType: 'json'
            }).then(response => {
                if (response.status !== 'success') {
                    throw new Error(response.message);
                }
                return response;
            }).catch(error => {
                Swal.showValidationMessage(error.message);
                btn.prop('disabled', false);
            });
        }
    }).then((result) => {
        if (result.isConfirmed) {
            Swal.fire({
                icon: 'success',
                title: 'Deleted!',
                text: 'Destination has been deleted.',
                timer: 1500,
                showConfirmButton: false
            }).then(() => {
                location.reload();
            });
        }
    });
});
        </script>		
        <div class="col-4">       			
            <div class="card">            				
                <div class="card-header">                						
                    <h3 class="card-title">		                        
                        Destinations List			
                    </h3>            							
                </div>            						
                <div class="card-body border-bottom py-3"> 																
                    <form id="destinationForm" method="post" enctype="multipart/form-data">
    <div class="modal-body">																
        <div class="row">              																
            <div class="mb-3">              									
                <label class="form-label">Destination Name</label>				
                <input type="text" class="form-control" name="des_name" placeholder="Destination Name" required>											
            </div>															
            <div class="mb-3">												
                <label class="form-label">Address</label>				
                <input type="text" class="form-control" name="des_address" placeholder="Address" required>													
            </div>          													
        </div>						
    </div>          						
    <div class="modal-footer">			
        <button type="reset" class="btn btn-danger">
            <i class="ti ti-circle-x"></i> Cancel
        </button>			
        <button type="submit" class="btn ms-auto btn-success" id="saveBtn">
            <i class="ti ti-map-pin-plus"></i> Save Destination
        </button>       						
    </div>			
</form>
				
                </div>					
            </div>				
        </div>			
    </div>		
</div>
            
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBkPNpPhCg1hVZ14GUWeGpxpSaIL-qPdbU&libraries=places&callback=initAutocomplete"
    async defer></script>
<script>		   	
    function validateForm() { 
        var ap_nameInput = document.getElementsByName("ap_name")[0].value;        					
        var ap_addressInput = document.getElementsByName("ap_address")[0].value;        							
        if (ap_nameInput === "" || ap_addressInput === "") {					
            alert("Please fill in all required fields.");				
            return false;				
        }			
        return true;    			
    }	 
    var autocompletePickup;   
    function initAutocomplete() {    
        var pickupInput = document.getElementById('pickup');        
        var autocompleteOptions = {        
            types: ['geocode'],            
            componentRestrictions: {country: 'GB'}
        };        
        autocompletePickup = new google.maps.places.Autocomplete(pickupInput, autocompleteOptions);
        autocompletePickup.addListener('place_changed', function() {           
        });
    }       
    google.maps.event.addDomListener(window, 'load', initAutocomplete);
    
    $('#destinationForm').on('submit', function (e) {
    e.preventDefault();

    let formData = new FormData(this);

    Swal.fire({
        title: 'Saving...',
        text: 'Please wait',
        allowOutsideClick: false,
        didOpen: () => {
            Swal.showLoading();
        }
    });

    $.ajax({
        url: 'includes/zones/add-destination.php',
        type: 'POST',
        data: formData,
        contentType: false,
        processData: false,
        dataType: 'json',
        success: function (response) {
            if (response.status === 'success') {
                Swal.fire({
                    icon: 'success',
                    title: 'Success',
                    text: response.message,
                    timer: 1500,
                    showConfirmButton: false
                }).then(() => {
                    window.location.href = 'destinations.php';
                });
            } else {
                Swal.fire({
                    icon: 'error',
                    title: 'Error',
                    text: response.message
                });
            }
        },
        error: function () {
            Swal.fire({
                icon: 'error',
                title: 'Error',
                text: 'Something went wrong!'
            });
        }
    });
});
    
</script>

<?php
include('footer.php');
?>