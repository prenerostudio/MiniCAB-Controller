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
                Bookers Section                						
            </h2>              				
        </div>			
        <div class="col-auto ms-auto d-print-none">            			
            <div class="btn-list">                				
                <a href="#" class="btn btn-primary d-none d-sm-inline-block" data-bs-toggle="modal" data-bs-target="#modal-booker">		
                    <i class="ti ti-user-plus"></i>                    							
                    Add New Booker                  							
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
                    <h3 class="card-title">		
                        All Bookers List			
                    </h3>		
                </div>                  						
                <div class="card-body border-bottom py-3">						
                    <div>		
                        <table class="table table-responsive" id="table-bookers">                    									
                            <thead>			
                                <tr>													
                                    <th>ID</th>                        													
                                    <th> Image </th>				
                                    <th> PostCode </th>					
                                    <th> Name </th>						
                                    <th> Email </th>							
                                    <th> Phone </th>                  							
                                    <th>Gender</th>													
                                    <th>Status</th>											
                                    <th> Actions </th>							
                                </tr>                   												
                            </thead>                  										
                            <tbody class="table-tbody">								
                                <?php                                      
                                $x=0;																				
                                $csql=mysqli_query($connect,"SELECT clients.* FROM clients WHERE clients.account_type = 2 AND clients.acount_status <> 2 ORDER BY clients.c_id DESC");				
                                while($crow = mysqli_fetch_array($csql)){				
                                    $x++;													
                                ?>				
                                <tr>				
                                    <td>										
                                        <?php echo $x; ?>
                                    </td>				
                                    <td>										
                                        <?php                                               
                                        if (!$crow['c_pic']) {						                                                    
                                        ?>						
                                        <img src="img/user-1.jpg" alt="Booker Img" style="width: 50px; height: 50px; border-radius: 5px;">						
					<?php                                                                                
                                        } else{					
                                        ?>					
                                        <img src="img/bookers/<?php echo $crow['c_pic'];?>" alt="Booker Img" style="width: 50px; height: 50px; background-size: 100% 100%; border-radius: 5px;">					
					<?php
                                        }					
                                        ?>					
                                    </td>				
                                    <td>										
                                        <?php echo $crow['postal_code']; ?>
                                    </td>				
                                    <td>										
                                        <?php echo $crow['c_name']; ?>
                                    </td>					
                                    <td>										
                                        <?php echo $crow['c_email']; ?>
                                    </td>  														
                                    <td>						
                                        <?php echo $crow['c_phone']; ?>
                                    </td>
                                    <td>										
                                        <?php echo $crow['c_gender']; ?>
                                    </td>
                                    <td>										
                                        <?php
                                        if($crow['acount_status']==0){						                                                    
                                        ?>						
                                        <div class="col-auto status">					
                                            <span class="status-dot status-dot-animated bg-red d-block"></span>					
                                            <span>Unverified</span>														
                                        </div>					
					<?php									
                                        } elseif($crow['acount_status']==1){					
                                        ?>					
                                        <div class="col-auto status">					
                                            <span class="status-dot status-dot-animated bg-green d-block"></span>					
                                            <span>Verified</span>					
                                        </div>								
					<?php									
                                        }					
                                        ?>														
                                    </td>					
                                    <td> 													
                                        <a href="view-booker.php?c_id=<?php echo $crow['c_id']; ?>" class="btn btn-info btn-icon" title="View/Edit">                                                
                                            <i class="ti ti-eye"></i>						                                           														
                                        </a>					
                                       <button class="btn btn-danger delete_btn btn-icon" data-c_id="<?php echo $crow['c_id']; ?>" title="Delete">        
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
    </div>
</div>        

<script>
$(document).ready(function() {
    $('.delete_btn').on('click', function() {
        var c_id = $(this).data('c_id');

        Swal.fire({
            title: 'Are you sure?',
            text: "This will deactivate the customer's profile!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, deactivate it!'
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    url: 'includes/booker/delete-booker.php', // your PHP file
                    type: 'POST',
                    data: { c_id: c_id },
                    dataType: 'json',
                    beforeSend: function() {
                        Swal.fire({
                            title: 'Processing...',
                            text: 'Please wait...',
                            allowOutsideClick: false,
                            didOpen: () => {
                                Swal.showLoading();
                            }
                        });
                    },
                    success: function(res) {
                        if (res.status === 'success') {
                            Swal.fire({
                                icon: 'success',
                                title: 'Deactivated!',
                                text: res.message,
                                timer: 1500,
                                showConfirmButton: false
                            });

                            // Optionally remove the row from the table
                            $('button[data-c_id="'+c_id+'"]').closest('tr').fadeOut();
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
                            text: 'Something went wrong. Please try again.'
                        });
                    }
                });
            }
        });
    });
});



    $(document).ready(function() {      
        $('#table-bookers').DataTable({                                      
            dom: 'Bfrtip',                    
            buttons: ['copy', 'csv', 'excel', 'pdf', 'print'],                    
            language: {            
                emptyTable: "No Customer Found!" // ✅ Handles empty table cleanly                        
            }                
        });        
    });
</script>

<!-------------------------------
----------Add Customer-------------
-------------------------------->
<div class="modal modal-blur fade" id="modal-booker" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">    	
        <div class="modal-content">        			
            <div class="modal-header">            				
                <h5 class="modal-title">Add New Booker</h5>            						
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>		
            </div> 				
            <div class="modal-body">		
                <form id="addBookerForm" method="post" enctype="multipart/form-data">		
                    <div class="row">						
                        <div class="mb-3 col-md-4">              								
                            <label class="form-label">Full Name</label>			
                            <input type="text" class="form-control" name="cname" placeholder="Customer Name" required> 							
                        </div> 						               			
                        <div class="mb-3 col-md-4">                  			
                            <label class="form-label">Email</label>			
                            <input type="email" class="form-control" name="cemail" placeholder="hello@example.com" required>			
                        </div>						
                        <div class="mb-3 col-md-4">                  									
                            <label class="form-label">Phone</label>              								
                            <input type="text" class="form-control" name="cphone" placeholder="+44 xx xxxx xxxx" required>			
                        </div>				
                        <div class="mb-3 col-md-4">              								
                            <label class="form-label">Password</label>			
                            <input type="password" class="form-control" name="cpass" placeholder="xxxxxxxx" required> 							
                        </div> 				
                        <div class="mb-3 col-md-4">			
                            <label class="form-label">Gender</label>			
                            <select class="form-select" name="cgender" required>			
                                <option value="" selected>Select Gender</option>				
                                <option>Male</option>				
                                <option>Female</option>												
                                <option>Transgender</option>											
                            </select>						
                        </div>					
                        <div class="mb-3 col-md-4">			
                            <label class="form-label">Language</label>										
                            <select class="form-select" name="clang">										
                                <option value="" selected>Select Language</option>					
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
                            <label class="form-label">Postal Code</label>				
                            <select class="form-control" name="pc">			
                                <option>Search PostCode</option>												
				<?php
                                $pcsql=mysqli_query($connect,"SELECT * FROM `post_codes`");				
                                while($pcrow = mysqli_fetch_array($pcsql)){												
                                ?>				
                                <option>					
                                    <?php echo $pcrow['pc_name'] ?>								
                                </option>				
				<?php
                                }																						
                                ?>				
                            </select>																	
                        </div> 					
                        <div class="mb-3 col-md-4">			
                            <label class="form-label">Picture</label>										
                            <input type="file" class="form-control" name="cpic">			
                        </div>			
                        <div class="mb-3 col-md-4">			
                            <label class="form-label">National ID</label>										
                            <input type="text" class="form-control" name="cni">									
                        </div>			
                    </div>		
                    <div class="modal-body">		
                        <div class="row">															
                            <div class="mb-3 col-md-4">    			
                                <label class="form-label">Commission Type</label>    				
                                <select class="form-control" name="com_type" id="commission_type">				
                                    <option value="" selected>Select Commission Type</option>				
                                    <option value="1">Percentage</option>        				
                                    <option value="2">Fixed</option>    				
                                </select>				
                            </div>			
                            <div class="mb-3 col-md-4" id="percentage_field" style="display:none;">			
                                <label class="form-label">Percentage</label>    				
                                <input type="text" class="form-control" name="percent" placeholder="%">				
                            </div>			
                            <div class="mb-3 col-md-4" id="fixed_field" style="display:none;">    			
                                <label class="form-label">Fixed</label>    				
                                <input type="text" class="form-control" name="fixed" placeholder="£">				
                            </div>			
                            <script>    			
                                document.getElementById('commission_type').addEventListener('change', function() {        
                                    var selectedValue = this.value;        	
                                    var percentageField = document.getElementById('percentage_field');        	
                                    var fixedField = document.getElementById('fixed_field');        	
                                    if (selectedValue === '1') {            	
                                        percentageField.style.display = 'block';            	
                                        fixedField.style.display = 'none';        	
                                    } else if (selectedValue === '2') {            	
                                        percentageField.style.display = 'none';            	
                                        fixedField.style.display = 'block';        	
                                    } else {            	
                                        percentageField.style.display = 'none';            	
                                        fixedField.style.display = 'none';        	
                                    }    	
                                });
                            </script>										
                            <div class="col-lg-12">			
                                <div class="mb-3">				
                                    <label class="form-label">Address</label>				
                                    <textarea class="form-control" rows="3" name="caddress"></textarea>				
                                </div>     											
                                <div class="mb-3">                 											
                                    <label class="form-label">Others</label>				
                                    <textarea class="form-control" rows="3" name="cothers"></textarea>					
                                </div> 										
                            </div>   												
                        </div>          										
                    </div>		
                    <div class="modal-footer">           						
                        <a href="#" class="btn btn-danger" data-bs-dismiss="modal">			
                            <i class="ti ti-circle-x"></i>			
                            Cancel								
                        </a>								
                        <button type="submit" class="btn ms-auto btn-success">			
                            <i class="ti ti-user-plus"></i> 									
                            Add Booker 														
                        </button>					     										
                    </div>		
                </form>		
                <script>
$(document).ready(function() {
    $('#addBookerForm').on('submit', function(e) {
        e.preventDefault();

        // Basic client-side validation
        var cname = $('input[name="cname"]').val();
        var cemail = $('input[name="cemail"]').val();
        var cphone = $('input[name="cphone"]').val();
        var cgender = $('select[name="cgender"]').val();
        var pc = $('select[name="pc"]').val();

        if (!cname || !cemail || !cphone || !cgender || !pc) {
            Swal.fire({
                icon: 'warning',
                title: 'Validation Error',
                text: 'Please fill in all required fields.'
            });
            return;
        }

        var formData = new FormData(this);

        $.ajax({
            url: 'includes/booker/booker-process.php',
            type: 'POST',
            data: formData,
            contentType: false,
            processData: false,
            dataType: 'json', // expect JSON response
            beforeSend: function() {
                Swal.fire({
                    title: 'Adding Booker...',
                    text: 'Please wait...',
                    allowOutsideClick: false,
                    didOpen: () => {
                        Swal.showLoading();
                    }
                });
            },
            success: function(res) {
                if (res.status === 'success') {
                    Swal.fire({
                        icon: 'success',
                        title: 'Booker Added!',
                        text: res.message,
                        timer: 1500,
                        showConfirmButton: false
                    });

                    // Reset the form
                    $('#addBookerForm')[0].reset();

                    // Optionally refresh the booker list dynamically here
                    // e.g., fetchBookers();
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
                    text: 'Something went wrong. Please try again.'
                });
            }
        });
    });
});
</script>
		
            </div>	
        </div>	
    </div>
</div>
<?php
include('footer.php');
?>