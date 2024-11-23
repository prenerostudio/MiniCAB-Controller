<?php
include('header.php');
$c_id = $_GET['c_id'];
$bsql=mysqli_query($connect,"SELECT * FROM `clients` WHERE `c_id`='$c_id'");
$brow = mysqli_fetch_array($bsql);		
?>
<div class="page-header d-print-none page_padding">
    <div class="row g-2 align-items-center">
        <div class="col">
            <div class="page-pretitle">
                Overview
            </div>
            <h2 class="page-title">
                View Booker Details
            </h2>
        </div>
        <div class="col-auto ms-auto d-print-none">
            <div class="btn-list">
				<?php
				if($brow['acount_status']==0){
				?>
                <a href="update-booker-status.php?c_id=<?php echo $c_id ?>" class="btn btn-primary d-none d-sm-inline-block">
                    <i class="ti ti-checks"></i>
                    Approve Booker
                </a>
				<?php
				}else {
				?>
                <button class="btn btn-disable d-none d-sm-inline-block" disabled>
                    <i class="ti ti-checks"></i>
                    Verified Booker
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
                                Booker Profile
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="#tabs-statement" class="nav-link" data-bs-toggle="tab">
                                <i class="ti ti-calendar-user"></i>
                                Booker Bookings Statement
                            </a>
						</li>
                        <li class="nav-item">
                            <a href="#tabs-wallet" class="nav-link" data-bs-toggle="tab">
                                <i class="ti ti-calendar-user"></i>
                                Booker Wallet
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="#tabs-activity" class="nav-link" data-bs-toggle="tab">
                                <i class="ti ti-activity"></i>
                                Booker Activity Logs
                            </a>
						</li>
                    </ul>
                </div>
                <div class="card-body">
                    <div class="tab-content">
                        <div class="tab-pane active show" id="tabs-profile">
                            <div class="card">
                                <div class="card-body border-bottom py-3">
                                    <h2 class="mb-4">
                                        Booker Profile
                                    </h2>
                                    <div class="row align-items-center">
                                        <div class="col-auto">
                                            <span class="avatar avatar-xl" style="background-image: url(img/bookers/<?php echo $brow['c_pic'];?>); background-size:contain; width: 220px; height: 160px;"></span>
                                        </div>
                                        <div class="col-auto">
                                            <form action="update-booker-img.php" method="post" enctype="multipart/form-data">
                                                <input type="hidden" value="<?php echo $brow['c_id']; ?>" name="c_id">
                                                <input type="file" name="fileToUpload" id="fileToUpload" class="btn">
                                                <button type="submit" class="btn btn-info">Upload Image </button>
                                            </form>
                                        </div>
                                        <div class="col-auto">
                                            <a href="del-booker-img.php?c_id=<?php echo $c_id ?>" class="btn btn-ghost-danger">
                                                Delete avatar
                                            </a>
                                        </div>
                                    </div>
                                    <h3 class="card-title mt-4">
                                        Personel Details
                                    </h3>
                                    <form method="post" action="update-booker.php" enctype="multipart/form-data">
                                        <div class="row g-3">
                                            <div class="mb-3 col-md-3">
                                                <div class="form-label">Booker Name</div>
                                                <input type="hidden" class="form-control" value="<?php echo $brow['c_id']; ?>" name="c_id">
                                                <input type="text" class="form-control" value="<?php echo $brow['c_name']; ?>" name="cname">
                                            </div>
                                            <div class="mb-3 col-md-3">
                                                <div class="form-label">Email Address</div>
                                                <input type="text" class="form-control" value="<?php echo $brow['c_email']; ?>" name="cemail">
                                            </div>
                                            <div class="mb-3 col-md-3">
                                                <div class="form-label">Phone</div>
                                                <input type="text" class="form-control" value="<?php echo $brow['c_phone']; ?>" name="cphone" readonly>
                                            </div>
                                            <div class="mb-3 col-md-3">
                                                <div class="form-label">Gender</div>
                                                <select class="form-select" name="cgender">
                                                    <option><?php echo $brow['c_gender']; ?></option>
                                                    <option>Male</option>
                                                    <option>Female</option>
                                                    <option>Transgender</option>
                                                </select>
                                            </div>
                                            <div class="mb-3 col-md-3">
                                                <div class="form-label">Language </div>
                                                <select class="form-select" name="clang">
                                                    <option>
                                                        <?php echo $brow['c_language']; ?>
                                                    </option>													
													<?php                                                    
													$lsql=mysqli_query($connect,"SELECT * FROM `language`");
													while($lrow = mysqli_fetch_array($lsql)){
													?>
													<option>														
														<?php echo $lrow['language']; ?>
													</option>													
													<?php                                                    
													}        
													?>
												</select>
                                            </div>
                                            <div class="mb-3 col-md-3">
                                                <div class="form-label">Postal Code</div>
                                                <input type="text" class="form-control" value="<?php echo $brow['postal_code'] ?>" name="pc">
                                            </div>
                                            <div class="mb-3 col-md-3">
                                                <div class="form-label">National ID</div>
                                                <input type="text" class="form-control" value="<?php echo $brow['c_ni'] ?>" name="cni">
                                            </div>
                                            <div class="mb-3 col-md-3">
                                                <div class="form-label">Company Name</div>
                                                <input type="text" class="form-control" value="<?php echo $brow['company_name'] ?>" name="com_name">
                                            </div> 
                                            <div class="mb-3 col-md-3">
                                                <div class="form-label">Commission Type</div>
                                                <select class="form-control" name="com_type" id="commissionType">
													<?php if ($brow['commission_type'] === 'percentage') { ?>
													<option value="percentage" selected>Percentage</option>
													<option value="fixed">Fixed</option>
													<?php } else { ?>         
													<option value="percentage">Percentage</option>
													<option value="fixed" selected>Fixed</option>
													<?php } ?>
												</select>
											</div>
											<div class="mb-3 col-md-3">
												<div class="form-label">Commission</div>
												<input type="text" class="form-control" value="% <?php echo $brow['percentage'];?>" name="percent" id="commissionPercent">
                                                <input type="text" class="form-control" value="£ <?php echo $brow['fixed'];?>" name="fixed" id="commissionFixed">
                                            </div>
											<script>
												function toggleCommissionFields() {
													var commissionType = $('#commissionType').val();
													if (commissionType === 'percentage') {
														$('#commissionPercent').show();
														$('#commissionFixed').hide();
													} else {
														$('#commissionPercent').hide();
														$('#commissionFixed').show();
													}	    
												}    
												toggleCommissionFields();    
												$('#commissionType').on('change', function () {                
													toggleCommissionFields();    	    
												});            
											</script>
                                            <div class="mb-3 col-md-6">
                                                <div class="form-label">Address</div>
                                                <input type="text" class="form-control" value="<?php echo $brow['c_address'] ?>" name="caddress">
                                            </div>
                                        </div>
                                        <div class="card-footer bg-transparent mt-auto">
                                            <div class="btn-list justify-content-end">
                                                <a href="bookers.php" class="btn">
                                                    Cancel	
                                                </a>
                                                <button type="submit" class="btn btn-primary">
													Update Booker
												</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="tabs-statement">
                            <div class="card-body">
                                <h2 class="mb-4">
                                    Booker Booking Statements
                                </h2>
                                <div class="row mb-3">
                                    <div class="card">
                                        <div class="card-body border-bottom py-3">
                                            <div id="table-adriver" class="table-responsive">
                                                <table class="table" id="bstate">
                                                    <thead>
                                                        <tr>
                                                            <th>ID</th>
															<th>Job Completion Date</th>
                                                            <th>Job Details</th>
                                                            <th>Total Comission</th>
                                                            <th>Status</th>
                                                            <th>Actions</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody class="table-tbody">
                                                        <?php
                                                        $isql = mysqli_query($connect, "SELECT ba.*, c.*, bk.*, bt.* FROM booker_account AS ba JOIN clients AS c ON ba.c_id = c.c_id JOIN bookings AS bk ON ba.book_id = bk.book_id JOIN booking_type AS bt ON bk.b_type_id = bt.b_type_id WHERE ba.c_id = '$c_id'");
                                                        while ($irow = mysqli_fetch_array($isql)) :
                                                            $x++;
                                                        ?>							
                                                        <tr>							
                                                            <td>
																<?php echo $irow['acc_id'];?>
															</td>
                                                            <td>
																<?php echo $irow['commission_date'];?>
                                                            </td>
                                                            <td>     
																Booking ID: <?php echo $irow['book_id'];?> <br>
																<?php echo $irow['pickup']; ?> -     
																<?php echo $irow['destination']; ?>
                                                            </td>							
                                                            <td>	
                                                                <?php echo $irow['comission_amount']; ?>
                                                            </td>
                                                            <td>	
                                                                <?php          
                                                                if($irow['comission_status']=='Unpaid'){
																?>
                                                                <div class="col-auto status">
                                                                    <span class="status-dot status-dot-animated bg-red d-block"></span>
                                                                    <span>Unpaid</span>
                                                                </div>
																<?php         
																} else{
																?>
																<div class="col-auto status">
                                                                    <span class="status-dot status-dot-animated bg-green d-block"></span>
                                                                    <span>Paid</span>
																</div>	
																<?php   
																}
                                                                ?>
                                                            </td>
                                                            <td>
                                                                <a href="booker-invoice.php?acc_id=<?php echo $irow['acc_id']; ?>">
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
                                                                <p align="center">								
                                                                    No Invoice Found!								
                                                                </p>								
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
									$('#bstate').DataTable();	    
								});                           
							</script>			
                        </div> 															
                        <div class="tab-pane" id="tabs-wallet">									
                            <div class="card-body">										
                                <h2 class="mb-4">Booker Wallet</h2>												
                                <div class="row mb-3">												
                                    <div class="card"> 				
                                        <div class="card-body border-bottom py-3">					
                                            <div id="table-adriver" class="table-responsive">						
                                                <table class="table" id="bwallet">						
                                                    <thead>
                                                        <tr>							
                                                            <th>ID</th>
                                                            <th>Job Completion Date</th>
                                                            <th>Job Details</th>
                                                            <th>Total Comission</th>
                                                            <th>Status</th>
                                                            <th>Actions</th>
                                                        </tr>							
                                                    </thead>						
                                                    <tbody class="table-tbody">
                                                        <?php
                                                        $x = 0;   
                                                        $isql = mysqli_query($connect, "SELECT ba.*, c.*, bk.*, bt.* FROM booker_account AS ba JOIN clients AS c ON ba.c_id = c.c_id JOIN bookings AS bk ON ba.book_id = bk.book_id JOIN booking_type AS bt ON bk.b_type_id = bt.b_type_id WHERE ba.c_id = '$c_id'");
                                                        while ($irow = mysqli_fetch_array($isql)) :
                                                            $x++;														
                                                        ?>							
                                                        <tr>							
                                                            <td>
																<?php echo $x; ?>
															</td>
                                                            <td>
																<?php echo $irow['commission_date']; ?>
                                                            </td>
                                                            <td>
                                                                Booking ID: <?php echo $irow['book_id']; ?> <br>
																<?php echo $irow['pickup']; ?> - 
																<?php echo $irow['destination']; ?>
															</td>							
                                                            <td>
																<?php echo $irow['comission_amount']; ?>
                                                            </td>
                                                            <td>          
																<?php		
																if($irow['comission_status']=='Unpaid'){
																?>          
																<div class="col-auto status">
                                                                    <span class="status-dot status-dot-animated bg-red d-block"></span>
                                                                    <span>Unpaid</span>
                                                                </div>			
																<?php        
																} else{                
																?>				
                                                                <div class="col-auto status">	
                                                                    <span class="status-dot status-dot-animated bg-green d-block"></span>
                                                                    <span>Paid</span>								
                                                                </div>			
																<?php
																}                                   
																?>
                                                            </td>
                                                            <td>
                                                                <a href="booker-invoice.php?acc_id=<?php echo $irow['acc_id']; ?>">								
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
									$('#bwallet').DataTable();	    
								});                            
							</script>			
                        </div>			
                        <div class="tab-pane" id="tabs-activity">			
                            <div class="card-body">				
                                <h2 class="mb-4">						
                                    Activity Logs					
                                </h2>														
                                <div class="row mb-3">															
                                    <div class="card">				
                                        <div class="card-body border-bottom py-3">
                                            <div id="table-adriver" class="table-responsive">
                                                <table class="table" id="blogs">						
                                                    <thead>						
                                                        <tr>															
                                                            <th>ID</th>							
                                                            <th>Activity Type</th>							
                                                            <th>Details</th>
                                                            <th>Time</th>                    
                                                        </tr>
                                                    </thead>
                                                    <tbody class="table-tbody">
                                                        <?php
                                                        $x = 0;	
                                                        $acsql = mysqli_query($connect, "SELECT activity_log.* FROM activity_log WHERE activity_log.user_type = 'client' AND activity_log.user_id = $c_id");
                                                        while ($acrow = mysqli_fetch_array($acsql)):
                                                            $x++;							
                                                        ?>							
                                                        <tr>							
                                                            <td>						
																<?php echo $x; ?>
                                                            </td>							
                                                            <td>		
																<?php echo $acrow['activity_type'];?>
															</td>
                                                            <td>	
																<?php echo $acrow['details'];?>
                                                            </td>
                                                            <td>
																<?php echo $acrow['timestamp']; ?>
                                                            </td>
                                                        </tr>
														<?php endwhile; ?>
														<?php if ($x === 0) : ?>		
                                                        <tr>							
                                                            <td colspan="8">							
                                                                <p align="center">
                                                                    No Log Found!
                                                                </p>
                                                            </td>
                                                        </tr>
														<?php endif; ?>
													</tbody>		
                                                </table>						
                                            </div>
                                        </div> 
                                    </div>
                                </div>
                            </div>			                                                       
							<script>					    
								$(document).ready(function() {           
									$('#blogs').DataTable();	   
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