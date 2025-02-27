<?php
include('header.php');
$com_id = $_GET['com_id'];
$csql=mysqli_query($connect,"SELECT * FROM `companies` WHERE `com_id`='$com_id'");
$crow = mysqli_fetch_array($csql);		
?>
<div class="page-header d-print-none page_padding">
    <div class="row g-2 align-items-center">
        <div class="col">
            <div class="page-pretitle">
                Overview
            </div>
            <h2 class="page-title">
                View Customer Details
            </h2>
        </div>
        <div class="col-auto ms-auto d-print-none">
            <div class="btn-list">			
				<?php                        
				if($crow['acount_status']==0){             
				?>		              
				<a href="update-company-status.php?com_id=<?php echo $com_id ?>" class="btn btn-primary d-none d-sm-inline-block">	                
					<i class="ti ti-checks"></i>                    							
                    Approve Company
                </a>					
				<?php                        
				}else {							                            
				?>							                
				<button class="btn btn-disable d-none d-sm-inline-block" disabled> 		
                    <i class="ti ti-checks"></i>
                    Verified Company
                </button>  					
				<?php					                       
				}							                       
				?>							              					                							
            </div>              				
        </div>			
    </div>	
</div>
<div class="page-body page_padding">          		
    <div class="row row-deck row-cards">						
        <div class="col-md-12">        			
            <div class="card">            				
                <div class="card-header">                						
                    <ul class="nav nav-tabs card-header-tabs" data-bs-toggle="tabs">
                        <li class="nav-item">
                            <a href="#tabs-profile" class="nav-link active" data-bs-toggle="tab">			
                                <i class="ti ti-user-scan"></i>                          						
                                Company Profile											
                            </a>                      									
                        </li>                      									
                        <li class="nav-item">									
                            <a href="#tabs-statement" class="nav-link" data-bs-toggle="tab">
                                <i class="ti ti-calendar-user"></i>
                                Company Bookings Statement
                            </a>    
                        </li>				                        			
                    </ul>                  						
                </div>						
                <div class="card-body">                						
                    <div class="tab-content">                    							
                        <div class="tab-pane active show" id="tabs-profile">    									
                            <div class="col-12">            											
                                <div class="card">													
                                    <div class="card-body border-bottom py-3">	
                                        <h2 class="mb-4">
                                            Company Profile
                                        </h2>														
                                        <h3 class="card-title">Profile Details</h3>					
                                        <div class="row align-items-center">											
                                            <div class="col-auto">                                                
                                                <span class="avatar avatar-xl" style="background-image: url(img/companies/<?php echo $crow['com_pic'];?>); background-size:100% 100% ; width: 150px; height: 150px;">						
                                                </span>													
                                            </div>																
                                            <div class="col-auto">
                                                <form action="update-company-img.php" method="post" enctype="multipart/form-data">						
                                                    <input type="hidden" value="<?php echo $crow['com_id']; ?>" name="com_id">						
                                                    <input type="file" name="fileToUpload" id="fileToUpload" class="btn">
                                                    <button type="submit" class="btn btn-info">Upload Image </button>
                                                </form>						
                                            </div>
                                            <div class="col-auto">
                                                <a href="del-company-img.php?com_id=<?php echo $com_id ?>" class="btn btn-ghost-danger">
                                                    Delete avatar
                                                </a>
                                            </div>
                                        </div>
                                        <h3 class="card-title mt-4">Personel Information:</h3>					
                                        <form method="post" action="update-customer.php" enctype="multipart/form-data">
                                            <div class="row g-3">					
                                                <div class="mb-3 col-md-3">								
                                                    <div class="form-label">Company Name</div>
                                                    <input type="hidden" class="form-control" value="<?php echo $crow['com_id']; ?>" name="com_id">
                                                    <input type="text" class="form-control" value="<?php echo $crow['com_name']; ?>" name="cname">              
												</div>
                                                <div class="mb-3 col-md-3">	
                                                    <div class="form-label">Relative Person</div>
                                                    <input type="text" class="form-control" value="<?php echo $crow['com_person']; ?>" name="rpname">
                                                </div>
                                                <div class="mb-3 col-md-3">	
                                                    <div class="form-label">Email Address</div>
                                                    <input type="text" class="form-control" value="<?php echo $crow['com_email']; ?>" name="cemail">						
                                                </div>						
                                                <div class="mb-3 col-md-3">
                                                    <div class="form-label">Phone</div>
                                                    <input type="text" class="form-control" value="<?php echo $crow['com_phone']; ?>" name="cphone" readonly>						
                                                </div>	
                                                <div class="mb-3 col-md-3">
                                                    <div class="form-label">Pin Code</div>
                                                    <input type="text" class="form-control" value="<?php echo $crow['com_pin']; ?>" name="cpin">						
                                                </div>     						
                                                <div class="mb-3 col-md-3">							
                                                    <div class="form-label">Postal Code</div>
                                                    <input type="text" class="form-control" value="<?php echo $crow['postal_code'] ?>" name="pc">
                                                </div>
                                                <div class="mb-3 col-md-3">						
                                                    <div class="form-label">Address</div>						
                                                    <textarea class="form-control" rows="3" name="caddress"><?php echo $crow['c_address'] ?></textarea>						
                                                </div>						
                                            </div>					
                                            <div class="card-footer bg-transparent mt-auto">					
                                                <div class="btn-list justify-content-end">						
                                                    <a href="customers.php" class="btn">						
                                                        Cancel							
                                                    </a>						
                                                    <button type="submit" class="btn btn-primary">						
                                                        Update
                                                    </button>						
                                                </div>
											</div>					
                                        </form>					
                                    </div>				
                                </div>					
                            </div>			
                        </div>			
                        <div class="tab-pane" id="tabs-statement">									
                            <div class="card-body">										
                                <h2 class="mb-4">				
                                    Customer Booking Statements				
                                </h2>												
                                <div class="row mb-3">												
                                    <div class="card"> 				
                                        <div class="card-body border-bottom py-3">					
                                            <div id="table-adriver" class="table-responsive">					
                                                <table class="table" id="cstate">						
                                                    <thead>
                                                        <tr>							
                                                            <th>ID</th>							
                                                            <th>Job Completion Date</th>							
                                                            <th>Job Details</th>							
                                                            <th>Total Pay</th>							
                                                            <th>Status</th>							
                                                            <th>Actions</th>							
                                                        </tr>							
                                                    </thead>						
                                                    <tbody class="table-tbody">
                                                        <?php 
                                                        $x = 0;  
                                                        $isql = mysqli_query($connect, "SELECT invoice.*, jobs.book_id, bookings.b_type_id, bookings.pickup, bookings.destination, bookings.pick_date, bookings.pick_time, booking_type.b_type_name, drivers.d_name, drivers.d_phone, companies.com_phone, companies.com_name FROM invoice JOIN jobs ON invoice.job_id = jobs.job_id JOIN drivers ON invoice.d_id = drivers.d_id JOIN bookings ON jobs.book_id = bookings.book_id JOIN booking_type ON bookings.b_type_id = booking_type.b_type_id JOIN companies ON invoice.c_id = companies.com_id WHERE invoice.c_id = '$com_id'");
                                                        while ($irow = mysqli_fetch_array($isql)) :				
                                                            $x++;
                                                        ?>
                                                        <tr>
                                                            <td class="sort-id">
																<?php echo $x; ?>
                                                            </td>	
                                                            <td class="sort-date">
																<?php echo $irow['invoice_date'];?>
                                                            </td>							
                                                            <td>
																Booking ID: <?php echo $irow['book_id'];?><br>
																<?php echo $irow['pickup'];?> -
																<?php echo $irow['destination'];?>
															</td>							
                                                            <td class="sort-pay">
																<?php echo $irow['total_pay'];?>
                                                            </td>
                                                            <td class="sort-status">				
																<?php echo $irow['invoice_status'];?>
                                                            </td>
                                                            <td>
                                                                <a href="invoice.php?invoice_id=<?php echo $irow['invoice_id']; ?>">
                                                                    <button class="btn btn-info">								
                                                                        <i class="ti ti-eye"></i>									
                                                                        View Invoice									
                                                                    </button>								
                                                                </a>								
                                                            </td>
                                                        </tr>														
														<?php endwhile; ?>
														<?php if ($x === 0) : ?>
                                                        <tr>							
                                                            <td colspan="8">							
                                                                <p align="center">No Invoice Found!</p>
                                                            </td>							
                                                        </tr>														
														<?php  endif; ?>
                                                    </tbody>										
                                                </table>																		
                                            </div>										
                                        </div>						
                                    </div>									
                                </div>				
                            </div>  										
                            <script>			   
								$(document).ready(function() {          
									$('#cstate').DataTable();	    
								});                        
                            </script>									                        
                        </div>    									
                    </div>                 												
                </div>             		
            </div>	
        </div>	
    </div>
</div>   
<?php
include('footer.php');
?>