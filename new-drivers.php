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
                                    <div id="table-ndriver" class="table-responsive">
                                        <table class="table" id="table-new">
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Image</th>
                                                    <th>Post Code</th>
                                                    <th>Name</th>
                                                    <th>Email</th>
                                                    <th>Phone</th>
                                                    <th>Gender</th>
                                                    <th>Licence Authority</th>
                                                    <th>Actions</th>
                                                </tr>
											</thead>
                                            <tbody class="table-tbody">
                                                <?php 
                                                $y = 0;
                                                $ndsql = mysqli_query($connect, "SELECT drivers.* FROM drivers WHERE drivers.acount_status = 0 ORDER BY drivers.d_id DESC");
                                                while ($ndrow = mysqli_fetch_array($ndsql)) :
                                                    $y++;
                                                ?> 
                                                <tr>
                                                    <td>
                                                        <?php echo $ndrow['d_id']; ?>
                                                    </td>
                                                    <td>                                                        
														<?php if (!$ndrow['d_pic']) : ?>
                                                        <img src="img/user-1.jpg" alt="Driver Img" style="width: 50px; height: 50px; border-radius: 5px;">
														<?php else : ?>
                                                        <img src="img/drivers/<?php echo $ndrow['d_pic']; ?>" alt="Driver Img" style="width: 50px; height: 50px; border-radius: 5px;">                                                            
														<?php endif; ?>
													</td>
                                                    <td>
                                                        <?php echo $ndrow['d_post_code'];?>
                                                    </td>
                                                    <td>
                                                        <?php echo $ndrow['d_name']; ?>
                                                    </td>
                                                    <td>
                                                        <?php echo $ndrow['d_email']; ?>
                                                    </td>                                    
                                                    <td>										
                                                        <?php echo $ndrow['d_phone']; ?>									
                                                    </td>
                                                    <td>
                                                        <?php echo $ndrow['d_gender']; ?>
                                                    </td>
                                                    <td>
                                                        <?php echo $ndrow['licence_authority']; ?>
                                                    </td>
                                                    <td>
                                                        <a href="view-driver.php?d_id=<?php echo $ndrow['d_id']; ?>" title="View">
                                                            <button class="btn btn-twitter btn-icon">
																<i class="ti ti-eye"></i>
															</button>
                                                        </a>
                                                        <a href="del-driver.php?d_id=<?php echo $ndrow['d_id'];?>" title="Delete">
                                                            <button class="btn btn-youtube btn-icon">
                                                                <i class="ti ti-square-rounded-x"></i>
															</button>
                                                        </a>
                                                    </td>
                                                </tr>                                                    
												<?php endwhile; ?>   
												<?php if ($y === 0) : ?>
                                                <tr>
                                                    <td colspan="9">
                                                        <p align="center">
                                                            No Driver Found!
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
                        <div class="tab-pane" id="tabs-await">
                            <div class="card">
                                <div class="card-header">
                                    <h3 class="card-title">
                                        Driver Waiting Upload Documents List
                                    </h3>
                                </div>
                                <div class="card-body border-bottom py-3">
                                    <div id="table-ndriver" class="table-responsive">
                                        <table class="table" id="table-new">
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Image</th>
                                                    <th>Post Code</th>
                                                    <th>Name</th>
                                                    <th>Email</th>
                                                    <th>Phone</th>
                                                    <th>Gender</th>
                                                    <th>Licence Authority</th>
													<th>Actions</th>
                                                </tr>
                                            </thead>
                                            <tbody class="table-tbody">
                                                <?php
                                                $y = 0;
                                                $ndsql = mysqli_query($connect, "SELECT d.* FROM drivers d WHERE NOT EXISTS (SELECT 1 FROM driving_license dl WHERE dl.d_id = d.d_id) AND NOT EXISTS (SELECT 1 FROM dvla_check dc WHERE dc.d_id = d.d_id) AND NOT EXISTS (SELECT 1 FROM address_proofs ap WHERE ap.d_id = d.d_id) AND NOT EXISTS (SELECT 1 FROM pco_license pl WHERE pl.d_id = d.d_id) AND NOT EXISTS (SELECT 1 FROM national_insurance ni WHERE ni.d_id = d.d_id) AND NOT EXISTS (SELECT 1 FROM driver_extras de WHERE de.d_id = d.d_id) AND NOT EXISTS (SELECT 1 FROM vehicle_log_book vlb WHERE vlb.d_id = d.d_id) AND NOT EXISTS (SELECT 1 FROM vehicle_mot vm WHERE vm.d_id = d.d_id) AND NOT EXISTS (SELECT 1 FROM vehicle_insurance vi WHERE vi.d_id = d.d_id) AND NOT EXISTS (SELECT 1 FROM vehicle_pco vpc WHERE vpc.d_id = d.d_id) AND NOT EXISTS (SELECT 1 FROM vehicle_pictures vp WHERE vp.d_id = d.d_id) AND NOT EXISTS (SELECT 1 FROM vehicle_road_tax vrt WHERE vrt.d_id = d.d_id) AND NOT EXISTS (SELECT 1 FROM rental_agreement ra WHERE ra.d_id = d.d_id) AND NOT EXISTS (SELECT 1 FROM vehicle_ins_schedule vis WHERE vis.d_id = d.d_id) AND NOT EXISTS (SELECT 1 FROM vehicle_extras ve WHERE ve.d_id = d.d_id)");
                                                while ($ndrow = mysqli_fetch_array($ndsql)) :
                                                    $y++;
                                                ?>
                                                <tr>
                                                    <td>
                                                        <?php echo $ndrow['d_id']; ?>
                                                    </td>
                                                    <td>
                                                        <?php if (!$ndrow['d_pic']) : ?>
                                                        <img src="img/user-1.jpg" alt="Driver Img" style="width: 50px; height: 50px; border-radius: 5px;">
														<?php else : ?>
                                                        <img src="img/drivers/<?php echo $ndrow['d_pic']; ?>" alt="Driver Img" style="width: 50px; height: 50px; border-radius: 5px;">
														<?php endif; ?>
                                                    </td>
                                                    <td>
                                                        <?php echo $ndrow['d_post_code'];?>
                                                    </td>
                                                    <td>
                                                        <?php echo $ndrow['d_name']; ?>
                                                    </td>
                                                    <td>
                                                        <?php echo $ndrow['d_email']; ?>
                                                    </td>
                                                    <td>
                                                        <?php echo $ndrow['d_phone']; ?>
                                                    </td>
                                                    <td>
                                                        <?php echo $ndrow['d_gender']; ?>
                                                    </td>
                                                    <td>
                                                        <?php echo $ndrow['licence_authority']; ?>
                                                    </td>
                                                    <td>
                                                        <a href="view-driver.php?d_id=<?php echo $ndrow['d_id']; ?>" title="View">
                                                            <button class="btn btn-twitter btn-icon">
																<i class="ti ti-eye"></i>
                                                            </button>
                                                        </a>
                                                        <a href="del-driver.php?d_id=<?php echo $ndrow['d_id'];?>" title="Delete">
                                                            <button class="btn btn-youtube btn-icon">
                                                                <i class="ti ti-square-rounded-x"></i>
                                                            </button>
                                                        </a>
                                                    </td>
                                                </tr>
												<?php endwhile; ?>   
												<?php if ($y === 0) : ?>
												<tr>
                                                    <td colspan="9">
                                                        <p align="center">
                                                            No Driver Found!
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
                </div>
            </div>																		  			
        </div>
    </div>
</div>
<script>    
	$(document).ready(function() {
        $('#table-new').DataTable();	
    });	
</script>
<div class="modal modal-blur fade" id="modal-driver" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">
                    Add New Driver
                </h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form method="post" enctype="multipart/form-data" action="driver-process.php" onsubmit="return validateForm();">
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
                            <input type="password" class="form-control" name="dpass" placeholder="xxxxxxxx" required>
                        </div> 
                        <div class="mb-3 col-lg-6">
                            <label class="form-label">Licence Authority</label>
                            <select class="form-select" name="dauth" required>
                                <option value="" selected>Select Authority</option>
                                <option>England</option>
                                <option>Scotland</option>
								<option>Wales</option>
                            </select>
                        </div>
                        <div class="mb-3 col-lg-6">
							<label class="form-label">Gender</label>
                            <select class="form-select" name="dgender">
								<option value="" selected>Select Gender</option>
                                <option>Male</option>
                                <option>Female</option>
                                <option>Transgender</option>
                            </select>
                        </div>
                        <div class="mb-3 col-lg-6">
                            <label class="form-label">Language</label>
                            <select class="form-select" name="dlang">
                                <option value="" selected>Select Language</option>
								<?php
                                $lsql=mysqli_query($connect,"SELECT * FROM `language`");
                                while($lrow = mysqli_fetch_array($lsql)){
								?>
                                <option><?php echo $lrow['language'] ?></option>
								<?php
                                }
                                ?>
                            </select>
                        </div>
                        <div class="mb-3 col-lg-6">
                            <label class="form-label">Picture</label>
                            <input type="file" class="form-control" name="dpic">
                        </div>
                        <div class="mb-3 col-lg-6">
							<label class="form-label">Post Code</label>
                            <input type="text" class="form-control" name="post_code" placeholder="xxxxx">
                        </div>
                        <div class="mb-3 col-lg-6">	
                            <label class="form-label">Address</label>
                            <textarea class="form-control" rows="3" name="address"></textarea>
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
                        Save Driver
                    </button>
                </div>
            </form>
			<script>
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
        </div>
    </div>    
</div>
<?php
include('footer.php');
?>