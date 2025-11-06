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
                Accepted Time Slots			
            </h2>			
        </div>			
    </div>	
</div>
<div class="page-body page_padding">          
    <div class="row row-deck row-cards">			      	
        <div class="col-12">            						
            <div class="card">                								
                <div class="card-header">                    											
                    <h3 class="card-title">		
                        All Accepted Time Slots From Drivers			
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
                                    <th>Total Pay</th>				
                                    <th>Driver</th>				
                                    <th>Status</th>					
                                    <th>Action</th>				
                                </tr>				
                            </thead>				
                            <tbody>
                                <?php
                                $n=0;
                                $atsql=mysqli_query($connect,"SELECT time_slots.*, drivers.* FROM time_slots LEFT JOIN drivers ON time_slots.d_id = drivers.d_id WHERE time_slots.ts_status = 5 ORDER BY time_slots.ts_id DESC");
                                while($atrow = mysqli_fetch_array($atsql)){
                                    $n++										
                                ?>
                                <tr>
                                    <td>				
					<?php echo $n; ?>
                                    </td>				
                                    <td>				
					<?php echo $atrow['ts_date']; ?>								
                                    </td>													
                                    <td>						
                                        <?php echo $atrow['start_time']; ?>
                                    </td>
                                    <td>																								
                                        <span>
                                            <?php echo $atrow['end_time']; ?>
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
                                        <?php echo $atrow['d_name']; ?>	
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
                                        } elseif($atrow['ts_status']==4){    					
                                        ?>        					
                                        <div class="col-auto status">            					
                                            <span class="status-dot status-dot-animated bg-yellow d-block"></span>           					
                                            <span>Withdrawn</span>        					
                                        </div>    					
					<?php        
                                        } elseif($atrow['ts_status']==5) {    					
                                        ?>					
                                        <div class="col-auto status">            					
                                            <span class="status-dot status-dot-animated bg-blue d-block"></span>
                                            <span>Awaiting</span>					
                                        </div>    					
					<?php        
                                        }    					
                                        ?>									
                                    </td>					
                                    <td>					
                                        <button class="btn btn-instagram btn-icon btn-withdraw-slot" data-id="<?php echo $atrow['ts_id']; ?>" title="Withdraw">    
                                            <i class="ti ti-door-exit"></i>
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
        <script>	           
            $(document).on('click', '.btn-withdraw-slot', function() {
                var ts_id = $(this).data('id');
                Swal.fire({
                    title: 'Withdraw Time Slot?',
                    text: "Are you sure you want to withdraw this time slot?",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, withdraw it!'
                }).then((result) => {
                    if (result.isConfirmed) {
                        $.ajax({
                            url: 'includes/time-slot/withdraw-time-slot.php',
                            type: 'POST',
                            data: { ts_id: ts_id },
                            success: function(response) {
                                try {
                                    var res = JSON.parse(response);
                                    if (res.status === 'success') {
                                        Swal.fire({
                                            title: 'Withdrawn!',
                                            text: res.message,
                                            icon: 'success',
                                            timer: 1500,
                                            showConfirmButton: false
                                        });
                                        setTimeout(() => {
                                            location.reload();
                                        }, 1500);
                                    } else {
                                        Swal.fire('Error!', res.message, 'error');
                                    }
                                } catch (e) {
                                    Swal.fire('Error!', 'Unexpected server response.', 'error');
                                }
                            },
                            error: function() {
                                Swal.fire('Error!', 'Could not connect to the server.', 'error');
                            }
                        });
                    }
                });
            });
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
</div>        
<?php
include('footer.php');
?>