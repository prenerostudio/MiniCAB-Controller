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
                <a href="javascript:void(0);" class="btn btn-primary approve_booker_btn d-none d-sm-inline-block" data-id="<?php echo $c_id; ?>">
    
                    <i class="ti ti-checks"></i> 
                    Approve Booker

                </a>
		
		<?php
                }elseif($brow['acount_status']==1) {		
                ?>
                <button class="btn btn-disable d-none d-sm-inline-block" disabled>
                    <i class="ti ti-checks"></i>
                    Verified Booker
                </button>		
		<?php
                }		
                ?>
            </div>
            
            <script>
$(document).ready(function() {
    $('.approve_booker_btn').on('click', function() {
        var c_id = $(this).data('id');

        Swal.fire({
            title: 'Are you sure?',
            text: "This will approve the booker!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, approve!'
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    url: 'includes/booker/update-booker-status.php',
                    type: 'POST',
                    data: { c_id: c_id },
                    dataType: 'json',
                    beforeSend: function() {
                        Swal.fire({
                            title: 'Processing...',
                            text: 'Please wait...',
                            allowOutsideClick: false,
                            didOpen: () => Swal.showLoading()
                        });
                    },
                    success: function(res) {
                        if(res.status === 'success') {
                            Swal.fire({
                                icon: 'success',
                                title: 'Approved!',
                                text: res.message,
                                timer: 1500,
                                showConfirmButton: false
                            });

                            // Optionally change button state or remove it
                            $('a[data-id="'+c_id+'"]').replaceWith('<span class="btn btn-disable d-none d-sm-inline-block">Verified Booker</span>');
                        } else {
                            Swal.fire({
                                icon: 'error',
                                title: 'Error!',
                                text: res.message
                            });
                        }
                    },
                    error: function() {
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
</script>

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