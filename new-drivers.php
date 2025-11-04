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
                Drivers Section
            </h2>
        </div>
        <div class="col-auto ms-auto d-print-none">
            <div class="btn-list">
                <a href="#" class="btn btn-primary d-none d-sm-inline-block" data-bs-toggle="modal" data-bs-target="#modal-driver">
                    <i class="ti ti-user-plus"></i>
                    Add New Driver				
                </a>
            </div> 		
        </div>
    </div>	
</div>
<div class="page-body page_padding"> 
    <div class="row row-deck row-cards">
        <div class="col-12">            				
            <div class="card">
                <div class="card-header">
                    <ul class="nav nav-tabs card-header-tabs nav-fill" data-bs-toggle="tabs">
                        <li class="nav-item">
                            <a href="#tabs-new" class="nav-link active" data-bs-toggle="tab">
                                <i class="ti ti-brand-speedtest" style="font-size: 28px;"></i>
                                New Drivers	
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="#tabs-await" class="nav-link" data-bs-toggle="tab">			
                                <i class="ti ti-map-search" style="font-size: 28px;"></i>				
                                Awaiting Upload Documentation									
                            </a>
                        </li> 
                    </ul>
                </div>		                		
                <div class="card-body">		
                    <div class="tab-content">		
                        <div class="tab-pane active show" id="tabs-new">								
                            <div class="card">										
                                <div class="card-header">													
                                    <h3 class="card-title">				
                                        New Drivers Request List
                                    </h3>
                                </div>
                                <div class="card-body border-bottom py-3">
                                    <div id="table-ndriver">                                                                                
                                        <table class="table table-responsive" id="table-new">    
                                            <thead>        
                                                <tr>            
                                                    <th>ID</th>            
                                                    <th>Image</th>                                						            
                                                    <th>Name</th>                                						            
                                                    <th>Email</th>                                						            
                                                    <th>Phone</th>                                						            
                                                    <th>Vehicle</th>                                						            
                                                    <th>Post Code</th>                                						            
                                                    <th>Shift Timing</th>                                						            
                                                    <th>Actions</th>        
                                                </tr>						    
                                            </thead>    
                                            <tbody class="table-tbody">        
                                                <?php         
                                                $y = 0;        
                                                $newsql = mysqli_query($connect, "SELECT drivers.*, driver_vehicle.*, vehicles.* FROM drivers LEFT JOIN driver_vehicle ON driver_vehicle.d_id = drivers.d_id LEFT JOIN vehicles ON driver_vehicle.v_id = vehicles.v_id WHERE drivers.acount_status = 0 ORDER BY drivers.d_id DESC");                
                                                while ($newrow = mysqli_fetch_array($newsql)) :            
                                                    $y++;        
                                                ?>        
                                                <tr>            
                                                    <td><?= $newrow['d_id']; ?></td>            
                                                   <td>    
                                                       <?php    
                                                       $driver_img = !empty($newrow['d_pic']) ? $newrow['d_pic'] : '../user-1.jpg';    
                                                       ?>    
                                                       <img src="img/drivers/<?= htmlspecialchars($driver_img); ?>" alt="Driver Image" style="width:50px;height:50px;border-radius:5px;object-fit:cover;">
                                                   </td>           
                                                    <td><?= $newrow['d_name']; ?></td>            
                                                    <td><?= $newrow['d_email']; ?></td>            
                                                    <td><?= $newrow['d_phone']; ?></td>            
                                                    <td><?= $newrow['v_name']; ?></td>            
                                                    <td><?= $newrow['d_post_code']; ?></td>            
                                                    <td><?= $newrow['d_shift']; ?></td>            
                                                    <td>                
                                                        <a href="view-driver.php?d_id=<?= $newrow['d_id']; ?>" title="View">                    
                                                            <button class="btn btn-twitter btn-icon">                        
                                                                <i class="ti ti-eye"></i>                    
                                                            </button>                
                                                        </a>                
                                                        <a href="includes/drivers/del-driver.php?d_id=<?= $newrow['d_id']; ?>" class="btn btn-danger btn-icon delete_btn" title="Delete" onclick="return confirm('Are you sure you want to delete this driver?');">                    
                                                            <i class="ti ti-square-rounded-x"></i>                
                                                        </a>            
                                                    </td>        
                                                </tr>        
                                                <?php endwhile; ?>                                                       
                                                <?php if ($y === 0) : ?>        
                                                <tr>            
                                                    <td colspan="9" class="text-center">No Driver Found!</td>        
                                                </tr>        
                                                <?php endif; ?>    
                                            </tbody> 
                                        </table>
                                    </div>
                                </div>						
                            </div>
                        </div>			
                        <div class="tab-pane" id="tabs-await">
                            <div class="card">
                                <div class="card-header">
                                    <h3 class="card-title">
                                        Driver Waiting Upload Documents List
                                    </h3>
                                </div>
                                <div class="card-body border-bottom py-3">
                                    <div>
                                        <table class="table table-responsive" id="table-await">    
                                            <thead>        
                                                <tr>            
                                                    <th>ID</th>            
                                                    <th>Image</th>                                						            
                                                    <th>Name</th>                                						            
                                                    <th>Email</th>                                						            
                                                    <th>Phone</th>                                						            
                                                    <th>Vehicle</th>                                						            
                                                    <th>Post Code</th>                                						            
                                                    <th>Shift Timing</th>                                						            
                                                    <th>Actions</th>        
                                                </tr>						    
                                            </thead>    
                                            <tbody class="table-tbody">        
                                                <?php                                                               
                                                $awsql = mysqli_query($connect, "SELECT d.* FROM drivers AS d LEFT JOIN	driving_license AS dl ON dl.d_id = d.d_id LEFT JOIN dvla_check AS dc ON dc.d_id = d.d_id LEFT JOIN address_proofs AS ap ON ap.d_id = d.d_id LEFT JOIN pco_license AS pl ON pl.d_id = d.d_id LEFT JOIN national_insurance AS ni ON ni.d_id = d.d_id LEFT JOIN driver_extras AS de ON de.d_id = d.d_id LEFT JOIN vehicle_log_book AS vlb ON vlb.d_id = d.d_id LEFT JOIN vehicle_mot AS vm ON vm.d_id = d.d_id LEFT JOIN vehicle_insurance AS vi ON vi.d_id = d.d_id LEFT JOIN vehicle_pco AS vpc ON vpc.d_id = d.d_id LEFT JOIN vehicle_pictures AS vp ON vp.d_id = d.d_id LEFT JOIN vehicle_road_tax AS vrt ON vrt.d_id = d.d_id LEFT JOIN rental_agreement AS ra ON ra.d_id = d.d_id LEFT JOIN vehicle_ins_schedule AS vis ON vis.d_id = d.d_id LEFT JOIN vehicle_extras AS ve ON ve.d_id = d.d_id WHERE dl.d_id IS NULL AND dc.d_id IS NULL AND ap.d_id IS NULL AND pl.d_id IS NULL AND ni.d_id IS NULL AND de.d_id IS NULL AND vlb.d_id IS NULL AND vm.d_id IS NULL AND vi.d_id IS NULL AND vpc.d_id IS NULL AND vp.d_id IS NULL AND vrt.d_id IS NULL AND ra.d_id IS NULL AND vis.d_id IS NULL AND ve.d_id IS NULL ORDER BY d.d_id DESC;");
                                                while ($awrow = mysqli_fetch_array($awsql)) :                                                                    
                                                ?>        
                                                <tr>            
                                                    <td><?= $awrow['d_id']; ?></td>            
                                                   <td>    
                                                       <?php    
                                                       $driver_img = !empty($awrow['d_pic']) ? $awrow['d_pic'] : '../user-1.jpg';    
                                                       ?>    
                                                       <img src="img/drivers/<?= htmlspecialchars($driver_img); ?>" alt="Driver Image" style="width:50px;height:50px;border-radius:5px;object-fit:cover;">
                                                   </td>           
                                                    <td><?= $awrow['d_name']; ?></td>            
                                                    <td><?= $awrow['d_email']; ?></td>            
                                                    <td><?= $awrow['d_phone']; ?></td>            
                                                    <td><?= $awrow['v_name']; ?></td>            
                                                    <td><?= $awrow['d_post_code']; ?></td>            
                                                    <td><?= $awrow['d_shift']; ?></td>            
                                                    <td>                
                                                        <a href="view-driver.php?d_id=<?= $awrow['d_id']; ?>" title="View">                    
                                                            <button class="btn btn-twitter btn-icon">                        
                                                                <i class="ti ti-eye"></i>                    
                                                            </button>                
                                                        </a>                
                                                        <a href="includes/drivers/del-driver.php?d_id=<?= $awrow['d_id']; ?>" class="btn btn-danger btn-icon delete_btn" title="Delete" onclick="return confirm('Are you sure you want to delete this driver?');">                    
                                                            <i class="ti ti-square-rounded-x"></i>                
                                                        </a>            
                                                    </td>        
                                                </tr>        
                                                <?php endwhile; ?>                                                       
                                                <?php if ($y === 0) : ?>        
                                                <tr>            
                                                    <td colspan="9" class="text-center">No Driver Found!</td>        
                                                </tr>        
                                                <?php endif; ?>    
                                            </tbody> 
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>																		  			
        </div>
    </div>
</div>

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

               
                $(document).ready(function() {  
                    $('#table-new').DataTable({                               
                        dom: 'Bfrtip',        
                        buttons: ['copy', 'csv', 'excel', 'pdf', 'print'],        
                        language: {
                            emptyTable: "No Driver Found!" // ✅ Handles empty table cleanly        
                        }    
                    });
                });	

                $(document).ready(function() {
                    $('#table-await').DataTable({                            
                        dom: 'Bfrtip',        
                        buttons: ['copy', 'csv', 'excel', 'pdf', 'print'],
                        language: {
                            emptyTable: "No Driver Found!" // ✅ Handles empty table cleanly        
                        }
                    });
                });
            </script>        
        </div>    
    </div>    
</div>
<?php
include('footer.php');
?>