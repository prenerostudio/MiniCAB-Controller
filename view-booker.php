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
                <a href="includes/booker/update-booker-status.php?c_id=<?php echo $c_id ?>" class="btn btn-primary d-none d-sm-inline-block">
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
                           <?php
                           include 'templates/booker/booker-profile-section.php';
                           ?>
                        </div>
                        <div class="tab-pane" id="tabs-statement">
                           <?php                                                      
                           include 'templates/booker/booker-booking-statement.php';
                           ?>
                        </div> 															
                        <div class="tab-pane" id="tabs-wallet">									
                           <?php                                                      
                           include 'templates/booker/booker-wallet.php';
                           ?>		
                        </div>			
                        <div class="tab-pane" id="tabs-activity">			
                            <?php                                                      
                           include 'templates/booker/booker-activity-logs.php';
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