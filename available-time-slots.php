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
                Time Slots For Drivers					
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
                        All Time Slots For Drivers								
                    </h3>                  																
                </div>                  										
                <div class="card-body border-bottom py-3">										
                    <div class="table-responsive">							
                        <table class="table table-responsive" id="slots">									
                            <thead>										
                                <tr>																		
                                    <th>ID</th>													
                                    <th>Date</th>													
                                    <th>Start Time</th>													
                                    <th>End Date</th>				
                                    <th>Price / Hour</th>				
                                    <th>Total Payment</th>				
                                    <th>Status</th>				
                                    <th>Action</th> 
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                
                                $n=0;
                                
                                $atsql=mysqli_query($connect,"SELECT time_slots.*, drivers.* FROM time_slots LEFT JOIN drivers ON time_slots.d_id = drivers.d_id WHERE time_slots.ts_status = 0 ORDER BY time_slots.ts_id DESC");
                               
                                while($atrow = mysqli_fetch_array($atsql)){                                   
									
                                   
                                    $n++                                            
                                ?>
                                <tr>
                                    <td>
                                        <?php echo $n; ?>
                                    </td>
                                    <td>
                                        <?php echo $atrow['ts_date'];?>	
                                    </td>
                                    <td>
                                        <?php echo $atrow['start_time'];?>
                                    </td>
                                    <td>
                                        <span>
                                            <?php echo $atrow['end_time'];?>
                                        </span>
                                    </td>				
                                    <td>
                                        <span>
                                            <strong>£</strong> <?php echo $atrow['price_hour'];?>
                                        </span>
                                    </td>
                                    <td>
                                        <strong>£</strong>                                             
										
                                            <?php
                                            
                                            $stime = strtotime($atrow['start_time']);
                                            $etime = strtotime($atrow['end_time']);
                                            $pph =  $atrow['price_hour']; 
                                            $total_time = ($etime - $stime) / 3600;           
                                            $total_pay = $pph * $total_time;   
                                            echo number_format($total_pay, 2);                                       
										
                                            ?>					                                    
                                    </td>				
                                    <td>                                        
										
                                        <?php                                        
											
                                        if($atrow['ts_status']==0){                                            
										
                                        ?> 
                                        <div class="col-auto status">     
                                            <span class="status-dot status-dot-animated bg-orange d-block"></span>
                                            <span>Pending</span>
                                        </div>					
										
                                        <?php
                                        
                                        
                                        } elseif($atrow['ts_status']==1){
                                        ?>
                                        <div class="col-auto status">
                                            <span class="status-dot status-dot-animated bg-green d-block"></span>
                                            <span>Accepted</span>
                                        </div>					
										
                                        <?php
                                        } elseif($atrow['ts_status']==2){
                                        ?>
                                        <div class="col-auto status">
                                            <span class="status-dot status-dot-animated bg-red d-block"></span>
                                            <span>Cancelled</span>
                                        </div>					
										
                                        <?php
                                        } elseif($atrow['ts_status']==3){
                                        ?>
                                        <div class="col-auto status">
                                            <span class="status-dot status-dot-animated bg-yellow d-block"></span>
                                            <span>Withdrawn</span>
                                        </div>					
										
                                        <?php
                                        } elseif($atrow['ts_status']==5){
                                        ?>
                                        <div class="col-auto status">
                                            <span class="status-dot status-dot-animated bg-yellow d-block"></span>
                                            <span>Waiting</span>
                                        </div>					
										
                                        <?php
                                        }  elseif($atrow['ts_status']==4) {                                           
										
                                        ?> 
                                        <div class="col-auto status">
                                            <span class="status-dot status-dot-animated bg-blue d-block"></span>
                                            <span>Completed</span>
                                        </div>					
										
                                        <?php
                                        }					
                                        ?>					
                                    </td>
                                    <td>                                       
                                        <div class="d-flex align-items-center gap-2">    
                                            <!-- Dispatch Form -->                                                
                                            <form method="post" class="dispatch-form d-flex align-items-center gap-2 mb-0">            
                                                <input type="hidden" value="<?php echo $atrow['ts_id']; ?>" name="ts_id">            
                                                <select class="form-control form-select" name="d_id" required style="width: 180px;">                    
                                                    <option value="">Select Driver</option>                    
                                                        <?php                    
                                                        $drsql = mysqli_query($connect, "SELECT drivers.* FROM drivers WHERE drivers.acount_status = 1");                    
                                                        while ($drrow = mysqli_fetch_array($drsql)) { 
                                                        ?>                        
                                                    <option value="<?php echo $drrow['d_id']; ?>">                                
                                                        <?php echo $drrow['d_id']; ?> - <?php echo $drrow['d_name']; ?> - <?php echo $drrow['d_phone']; ?>                        
                                                    </option>                    
                                                        <?php } ?>            
                                                </select>            
                                                <button class="btn btn-bitbucket" type="submit" title="Dispatch">                    
                                                    <i class="ti ti-plane-tilt"></i>            
                                                </button>    
                                            </form>                                                                                        
                                            <script>
                                                $(document).on('submit', '.dispatch-form', function (e) {
                                                    e.preventDefault();
                                                    const form = $(this);
                                                    const formData = form.serialize();
                                                    Swal.fire({
                                                        title: 'Dispatch Time Slot?',
                                                        text: "This will send the slot to the selected driver.",
                                                        icon: 'question',
                                                        showCancelButton: true,
                                                        confirmButtonText: 'Yes, dispatch',
                                                        cancelButtonText: 'Cancel',
                                                        confirmButtonColor: '#3085d6',
                                                        cancelButtonColor: '#6c757d'
                                                    }).then((result) => {
                                                        if (result.isConfirmed) {
                                                            $.ajax({
                                                                url: 'includes/time-slot/dispatch-time-slot.php',
                                                                type: 'POST',
                                                                data: formData,
                                                                dataType: 'json',
                                                                success: function (res) {
                                                                    if (res.status === 'success') {
                                                                        Swal.fire({
                                                                            title: 'Dispatched!',
                                                                            text: res.message,
                                                                            icon: 'success',
                                                                            timer: 1500,
                                                                            showConfirmButton: false
                                                                        });
                                                                        setTimeout(() => location.reload(), 1500);
                                                                    } else {
                                                                        Swal.fire('Error', res.message, 'error');
                                                                    }
                                                                },
                                                                error: function () {
                                                                    Swal.fire('Error', 'Unexpected server response.', 'error');
                                                                }
                                                            });
                                                        }
                                                    });
                                                });
                                            </script>
                                               
                                            <!-- View/Edit Button -->    
                                            <a href="edit-time-slot.php?ts_id=<?php echo $atrow['ts_id']; ?>" class="btn btn-info" title="View / Edit">        
                                                <i class="ti ti-eye"></i> View / Edit    
                                            </a>

                                            
    
                                            <!-- Delete Button -->
    
                                            <button class="btn btn-danger btn-delete-time" data-id="<?php echo $atrow['ts_id']; ?>" title="Delete">
        
                                                <i class="ti ti-square-rounded-x"></i> Delete
    
                                            </button>

                                        </div>

                                        <script>
                                            $(document).on('click', '.btn-delete-time', function () {
                                                const ts_id = $(this).data('id');

                                                Swal.fire({
                                                    title: 'Are you sure?',
                                                    text: "This will permanently delete the time slot.",
                                                    icon: 'warning',
                                                    showCancelButton: true,
                                                    confirmButtonColor: '#d33',
                                                    cancelButtonColor: '#6c757d',
                                                    confirmButtonText: 'Yes, delete it!'
                                                }).then((result) => {
                                                    if (result.isConfirmed) {
                                                        $.ajax({
                                                            url: 'includes/del-time-slot.php',
                                                            type: 'POST',
                                                            data: { ts_id: ts_id },
                                                            dataType: 'json',
                                                            success: function (res) {
                                                                if (res.status === 'success') {
                                                                    Swal.fire({
                                                                        title: 'Deleted!',
                                                                        text: res.message,
                                                                        icon: 'success',
                                                                        timer: 1500,
                                                                        showConfirmButton: false
                                                                    });
                                                                    setTimeout(() => location.reload(), 1500);
                                                                } else {
                                                                    Swal.fire('Error', res.message, 'error');
                                                                }
                                                            },
                                                            error: function () {
                                                                Swal.fire('Error', 'Unexpected server response.', 'error');
                                                            }
                                                        });
                                                    }
                                                });
                                            });

                                        </script>
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
            
            <script>                                
                $(document).ready(function() {          
                    $('#slots').DataTable({                                      
                        dom: 'Bfrtip',                    
                        buttons: ['copy', 'csv', 'excel', 'pdf', 'print'],                    
                        language: {            
                            emptyTable: "No Time Slot Found!" // ✅ Handles empty table cleanly                        
                        }                
                    });        
                });			  	        
            </script>        
        </div>
        					
        <div class="col-4">
            <div class="card">	
                <div class="card-header">		
                    <h3 class="card-title">
                        Add Time Slot
                    </h3>
                </div>
                <div class="card-body border-bottom py-3">                                           
                    <div class="modal-body">                    
                        <form id="addTimeSlotForm">    
                            <div class="row">        
                                <div class="col-lg-12">            
                                    <div class="mb-3">                
                                        <label class="form-label">Select Date:</label>                
                                        <input type="date" name="mdate" class="form-control" required>            
                                    </div>        
                                </div>        
                                <div class="col-lg-12">            
                                    <div class="mb-3">                
                                        <label class="form-label">Start Time:</label>                
                                        <input type="time" name="stime" class="form-control" required>            
                                    </div>        
                                </div>        
                                <div class="col-lg-12">            
                                    <div class="mb-3">                
                                        <label class="form-label">End Time:</label>                
                                        <input type="time" name="etime" class="form-control" required>            
                                    </div>        
                                </div>        
                                <div class="col-lg-12">            
                                    <div class="mb-3">                
                                        <label class="form-label">Price Per Hour:</label>                
                                        <input type="number" name="pph" class="form-control" required>            
                                    </div>				        
                                </div>				    
                            </div>    
                            <div class="modal-footer">        
                                <button type="submit" class="btn btn-success">            
                                    <i class="ti ti-clock-plus"></i>            
                                    Save Time Slot        
                                </button>    
                            </div>
                        </form>                                        
                    </div>            
                </div>        
            </div>    
        </div>
    </div>         
    <script>
        $('#addTimeSlotForm').on('submit', function(e) {
            e.preventDefault(); // Stop normal form submit
            $.ajax({
                url: 'includes/time-slot/time-slot-process.php',
                type: 'POST',
                data: $(this).serialize(),
                dataType: 'json',
                success: function(res) {
                    if (res.status === 'success') {
                        Swal.fire({
                            title: 'Success!',
                            text: res.message,
                            icon: 'success',
                            timer: 1500,
                            showConfirmButton: false
                        });
                        // Optional: reset the form
                        $('#addTimeSlotForm')[0].reset();
                        // Optional: reload page or update table dynamically
                        setTimeout(() => location.reload(), 1500);
                    } else {
                        Swal.fire({
                            title: 'Error!',
                            text: res.message,
                            icon: 'error'
                        });
                    }
                },
                error: function() {
                    Swal.fire({
                        title: 'Error!',
                        text: 'Unexpected server response.',
                        icon: 'error'
                    });
                }
            });
        });

    function validateForm() {
        var dateInput = document.getElementsByName("date")[0].value;        
        var stimeInput = document.getElementsByName("stime")[0].value;        
        var etimeInput = document.getElementsByName("etime")[0].value;        
        if (dateInput === "" || stimeInput === "" || etimeInput === "") {                    
            alert("Please fill in all required fields.");            
            return false;
       }                
        return true;    
    }

    </script>
<?php
include('footer.php');
?>