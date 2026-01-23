<div class="modal modal-blur fade" id="modal-driver" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">
                    Add New Driver
                </h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>            
            <form id="addDriverForm" enctype="multipart/form-data" method="POST">    
                <div class="modal-body">        
                    <div class="row">            
                        <div class="mb-3 col-lg-6">                
                            <label class="form-label">Driver Name</label>                
                            <input type="text" class="form-control" name="dname" placeholder="Driver Name" required>            
                        </div>            
                        <div class="mb-3 col-lg-6">                
                            <label class="form-label">Email</label>                
                            <input type="email" class="form-control" name="demail" placeholder="hello@example.com" required>            
                        </div>            
                        <div class="mb-3 col-lg-6">                
                            <label class="form-label">Phone</label>                
                            <input type="text" class="form-control" name="dphone" placeholder="+44 xx xxxx xxxx" required>            
                        </div>            
                        <div class="mb-3 col-lg-6">                
                            <label class="form-label">Password</label>                
                            <div class="input-group input-group-flat">                    
                                <input type="password" class="form-control" name="dpass" placeholder="xxxxxxxx" required>                    
                                <span class="input-group-text">                        
                                    <a href="#" class="link-secondary toggle-password"><i class="ti ti-eye"></i></a>                    
                                </span>                
                            </div>            
                        </div>            
                        <div class="mb-3 col-lg-6">
                            <label class="form-label">PCO Number</label>                
                            <div class="input-group input-group-flat">                    
                                <input type="text" class="form-control" name="dpco" placeholder="xxxxxxxx" required>                                    
                            </div>            
                        </div>            
                        <div class="mb-3 col-lg-6">                
                            <label class="form-label">Shift</label>                
                            <select class="form-select" name="dshift" required>                    
                                <option value="">Select Shift</option>                    
                                <option>Day Shift</option>                    
                                <option>Afternoon Shift</option>                    
                                <option>Night Shift</option>                
                            </select>            
                        </div>                              
                    </div>    
                </div>    
                <div class="modal-footer">        
                    <a href="#" class="btn btn-danger" data-bs-dismiss="modal">            
                        <i class="ti ti-circle-x"></i> Cancel        
                    </a>        
                    <button type="submit" class="btn btn-success ms-auto">            
                        <i class="ti ti-user-plus"></i> Save Driver        
                    </button>    
                </div>
            </form>            	                 
        </div>    
    </div>    
</div>
<script>
    $('#addDriverForm').on('submit', function (e) {        
        e.preventDefault();            
        let formData = new FormData(this);           
        $.ajax({        
            url: 'includes/drivers/driver-process.php',                    
            type: 'POST',                    
            data: formData,                    
            contentType: false,                    
            processData: false,                    
            dataType: 'json',                    
            beforeSend: function () {                    
                Swal.fire({        
                    title: 'Registering Driver...',            
                    text: 'Please wait while we process the request.',            
                    allowOutsideClick: false,            
                    didOpen: () => {            
                        Swal.showLoading();                
                    }            
                });            
            },    
            success: function (res) {                
                Swal.close();                  
                if (res.status) {        
                    Swal.fire({            
                        icon: 'success',                
                        title: 'Driver Registered!',                
                        text: res.message,                
                        confirmButtonColor: '#28a745'                
                    }).then(() => {            
                        $('#addDriverForm')[0].reset();                
                        // You can reload or refresh DataTable dynamically                
                        location.reload();                
                    });            
                } else {        
                    Swal.fire({            
                        icon: 'error',                
                        title: 'Registration Failed',                
                        text: res.message,                
                        confirmButtonColor: '#d33'                
                    });            
                }        
            },     
            error: function (xhr, status, error) {            
                Swal.close();        
                Swal.fire({        
                    icon: 'error',            
                    title: 'Server Error',            
                    text: 'Something went wrong on the server. Please try again later.',            
                    confirmButtonColor: '#d33'            
                });        
                console.error('AJAX Error:', status, error);        
            }       
        });        
    });
    function validateForm() {       
        var dnameInput = document.getElementsByName("dname")[0].value;	                
        var demailInput = document.getElementsByName("demail")[0].value;	                
        var dphoneInput = document.getElementsByName("dphone")[0].value;	                
        var dauthInput = document.getElementsByName("dauth")[0].value;	                
        if (dnameInput === "" || demailInput === "" || dphoneInput === "" || dauthInput === "" ) {	                
            alert("Please fill in all required fields.");	                        
            return false;	                        
        }	                
        return true;	                
    }
   
   
</script>  