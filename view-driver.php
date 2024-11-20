<?php
include('header.php');
$d_id = $_GET['d_id'];
$dsql=mysqli_query($connect,"SELECT drivers.*, address_proofs.*, driving_license.*, pco_license.*, national_insurance.*, dvla_check.*, driver_extras.*, vehicle_extras.*, vehicle_ins_schedule.*, rental_agreement.*, vehicle_road_tax.*, vehicle_pictures.*, vehicle_insurance.*, vehicle_pco.*, vehicle_mot.*, vehicle_log_book.* FROM drivers JOIN address_proofs ON address_proofs.d_id = drivers.d_id JOIN driving_license ON driving_license.d_id = drivers.d_id JOIN pco_license ON pco_license.d_id = drivers.d_id JOIN national_insurance ON national_insurance.d_id = drivers.d_id JOIN dvla_check ON dvla_check.d_id = drivers.d_id JOIN driver_extras ON driver_extras.d_id = drivers.d_id JOIN vehicle_log_book ON vehicle_log_book.d_id = drivers.d_id JOIN vehicle_mot ON vehicle_mot.d_id = drivers.d_id JOIN vehicle_pco ON vehicle_pco.d_id = drivers.d_id JOIN vehicle_insurance ON vehicle_insurance.d_id = drivers.d_id JOIN vehicle_pictures ON vehicle_pictures.d_id = drivers.d_id JOIN vehicle_road_tax ON vehicle_road_tax.d_id = drivers.d_id JOIN rental_agreement ON rental_agreement.d_id = drivers.d_id JOIN vehicle_ins_schedule ON vehicle_ins_schedule.d_id = drivers.d_id JOIN vehicle_extras ON vehicle_extras.d_id = drivers.d_id WHERE drivers.d_id = '$d_id'");
$drow = mysqli_fetch_array($dsql);		
?>
<div class="page-header d-print-none page_padding">
    <div class="row g-2 align-items-center">
        <div class="col">
            <div class="page-pretitle">
                Overview
            </div>
            <h2 class="page-title">
                View Driver Details
            </h2>
        </div>
        <div class="col-auto ms-auto d-print-none">
            <div class="btn-list">
                <?php
                if($drow['acount_status'] == 0){
                ?>
                <a href="update-driver-status.php?d_id=<?php echo $d_id ?>" class="btn btn-primary d-none d-sm-inline-block">
                    <i class="ti ti-checks"></i>
                    Approve Driver
                </a>
		<?php
                }else {
                ?>
                <button class="btn btn-disable d-none d-sm-inline-block" disabled>
                    <i class="ti ti-checks"></i>
                    Verified Driver
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
                                Driver Profile
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="#tabs-document" class="nav-link" data-bs-toggle="tab">
                                <i class="ti ti-calendar-user"></i>
                                Driver Documents
                            </a>
                        </li>			
                        <li class="nav-item">
                            <a href="#tabs-vdocument" class="nav-link" data-bs-toggle="tab">
                                <i class="ti ti-car-garage"></i>
                                Vehicle Documents 				
                            </a>                      			
                        </li>			
                        <li class="nav-item">			
                            <a href="#tabs-vehicle" class="nav-link" data-bs-toggle="tab">										
                                <i class="ti ti-car-garage"></i>
                                Driver Vehicles
                            </a>
                        </li>			
                        <li class="nav-item">			
                            <a href="#tabs-statement" class="nav-link" data-bs-toggle="tab">										
                                <i class="ti ti-calendar-user"></i>                          				
                                Driver Account Statement				
                            </a>                      			
                        </li>			
                        <li class="nav-item">			
                            <a href="#tabs-bank" class="nav-link" data-bs-toggle="tab">										
                                <i class="ti ti-calendar-user"></i>                          				
                                Bank Details				
                            </a>                      			
                        </li>			
                        <li class="nav-item">			
                            <a href="#tabs-tracker" class="nav-link" data-bs-toggle="tab">										
                                <i class="ti ti-activity"></i>                          				
                                Activity Tracker				
                            </a>                      			
                        </li>			
                        <li class="nav-item">			
                            <a href="#tabs-activity" class="nav-link" data-bs-toggle="tab">										
                                <i class="ti ti-activity"></i>                          				
                                Activity Logs				
                            </a>                      			
                        </li>			
                    </ul>                  		
                </div>		
                <div class="card-body">
                    <div class="tab-content">
                        <div class="tab-pane active show" id="tabs-profile">
                            <?php
                            include('driver-details-section.php');
                            ?>
                        </div>
                        <div class="tab-pane" id="tabs-document">
                            <?php
                            include('driver-document-section.php');
                            ?>
                        </div>
                        <div class="tab-pane" id="tabs-vdocument">
                            <?php
                            include('driver-vehicle-document-section.php');
                            ?>
                        </div>
                        <div class="tab-pane" id="tabs-vehicle">
                            <?php
                            include('driver-vehicle-section.php');
                            ?>
                        </div>
                        <div class="tab-pane" id="tabs-statement">
                            <?php
                            include('driver-booking-statement-section.php');
                            ?>
                        </div>
                        <div class="tab-pane" id="tabs-bank">
                            <?php
                            include('driver-bank-section.php');
                            ?>
                        </div>
                        <div class="tab-pane" id="tabs-tracker">
                            <?php
                            include('activity-tracker.php');
                            ?>
                        </div>			
                        <div class="tab-pane" id="tabs-activity">
                            <?php
                            include('driver-activity-logs.php');
                            ?>
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