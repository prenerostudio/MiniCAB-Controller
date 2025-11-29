<?php include 'session.php'; ?>
<header class="navbar-expand-md">
    <div class="collapse navbar-collapse" id="navbar-menu">
        <div class="navbar">
            <div class="col">
                <ul class="navbar-nav">
                    <!-- Dashboard -->
                    <li class="nav-item">
                        <a class="nav-link" href="dashboard.php">
                            <span class="nav-link-icon d-md-none d-lg-inline-block">
                                <i class="ti ti-home"></i>
                            </span>
                            <span class="nav-link-title">Dashboard</span>
                        </a>
                    </li>

                    <!-- BOOKINGS -->
                    <?php if ($add_booking || $open_booking || $all_booking || $upcoming_booking || $inprocess_booking || $completed_booking || $cancelled_booking): ?>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#navbar-booking" data-bs-toggle="dropdown" aria-expanded="false">
                            <span class="nav-link-icon d-md-none d-lg-inline-block">
                                <i class="ti ti-book"></i>
                            </span>
                            <span class="nav-link-title">
                                Bookings
                            </span>
                        </a>
                        <div class="dropdown-menu">
                            <?php if ($add_booking): ?>
                            <a class="dropdown-item" href="add-booking.php">
                                <i class="ti ti-bookmark-plus"></i> 
                                Add New Booking
                            </a>
                            <?php endif; ?>
                            <?php if ($open_booking): ?>
                            <a class="dropdown-item" href="open-bookings.php">
                                <i class="ti ti-folder-open"></i> 
                                Open Bookings 
                                <?php include 'includes/bookings/count-open-booking.php'; ?>
                                <span class="badge bg-green-lt ms-auto">
                                    <?php echo $open_booking_count; ?>
                                </span>
                            </a>
                            <?php endif; ?>
                            <?php if ($all_booking): ?>
                            <a class="dropdown-item" href="all-bookings.php">
                                <i class="ti ti-bookmarks"></i> 
                                All Bookings 
                                <?php include 'includes/bookings/count-all-bookings.php'; ?>
                                <span class="badge bg-green-lt ms-auto">
                                    <?php echo $booking_count; ?>
                                </span>
                            </a>
                            <?php endif; ?>
                            <?php if ($upcoming_booking): ?>
                            <a class="dropdown-item" href="upcoming-bookings.php">
                                <i class="ti ti-alarm-plus"></i> 
                                Upcoming Bookings 
                                <?php include 'includes/bookings/count-upcoming-booking.php'; ?>
                                <span class="badge bg-green-lt ms-auto">
                                    <?php echo $upcoming_booking_count; ?>
                                </span>
                            </a>
                            <?php endif; ?>
                            <?php if ($inprocess_booking): ?>
                            <a class="dropdown-item" href="inprocess-bookings.php">
                                <i class="ti ti-address-book"></i> 
                                Booking In-Process 
                                <?php include 'includes/bookings/count-inprocess.php'; ?>
                                <span class="badge bg-green-lt ms-auto">
                                    <?php echo $inprocess_count; ?>
                                </span>
                            </a>
                            <?php endif; ?>
                            <?php if ($completed_booking): ?>
                            <a class="dropdown-item" href="completed-booking.php">
                                <i class="ti ti-bookmarks-filled"></i> 
                                Completed Bookings 
                                <?php include 'includes/bookings/count-completed.php'; ?>
                                <span class="badge bg-green-lt ms-auto">
                                    <?php echo $completed_count; ?>
                                </span>
                            </a>
                            <?php endif; ?>
                            <?php if ($cancelled_booking): ?>
                            <a class="dropdown-item" href="cancelled-booking.php">
                                <i class="ti ti-bookmarks-off"></i> 
                                Cancelled Bookings 
                                <?php include 'includes/bookings/count-cancelled.php'; ?>
                                <span class="badge bg-red-lt ms-auto">
                                    <?php echo $cancel_count; ?>
                                </span>
                            </a>
                            <?php endif; ?>
                        </div>
                    </li>
                    <?php endif; ?>

                    <!-- BIDS -->
                    <?php if ($new_bid || $bid_booking || $accepted_bids): ?>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">
                            <span class="nav-link-icon d-md-none d-lg-inline-block">
                                <i class="ti ti-gavel"></i>
                            </span>
                            <span class="nav-link-title">Bids</span>
                        </a>
                        <div class="dropdown-menu">
                            <?php if ($new_bid): ?>
                            <a class="dropdown-item" href="add-bid.php">
                                <i class="ti ti-file-plus"></i> 
                                Add New Bid
                            </a>
                                <?php endif; ?>
                            <?php if ($bid_booking): ?>
                            <a class="dropdown-item" href="bid-bookings.php">
                                <i class="ti ti-file-check"></i> 
                                Bookings on Bid
                            </a>
                                <?php endif; ?>
                            <?php if ($accepted_bids): ?>
                            <a class="dropdown-item" href="accepted-bids.php">
                                <i class="ti ti-users"></i> 
                                Accepted Bids
                            </a>
                                <?php endif; ?>
                        </div>
                    </li>
                    <?php endif; ?>

                    <!-- TIMESLOTS -->
                    <?php if ($available_timeslot || $waiting_timeslot || $accepted_timeslot || $cancelled_timeslot || $withdrawn_timeslot || $completed_timeslot): ?>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">
                            <span class="nav-link-icon d-md-none d-lg-inline-block">
                                <i class="ti ti-clock-24"></i>
                            </span>
                            <span class="nav-link-title">Time Slots</span>
                        </a>
                        <div class="dropdown-menu">
                            <?php if ($available_timeslot): ?>
                            <a class="dropdown-item" href="available-time-slots.php">
                                <i class="ti ti-alarm"></i> 
                                Available
                            </a>
                                <?php endif; ?>
                            <?php if ($waiting_timeslot): ?>
                            <a class="dropdown-item" href="waiting-time-slots.php">
                                <i class="ti ti-alarm"></i> 
                                Waiting
                            </a>
                                <?php endif; ?>
                            <?php if ($accepted_timeslot): ?>
                            <a class="dropdown-item" href="accepted-time-slots.php">
                                <i class="ti ti-clock-check"></i> 
                                Accepted
                            </a>
                                <?php endif; ?>
                            <?php if ($cancelled_timeslot): ?>
                            <a class="dropdown-item" href="cancelled-time-slots.php">
                                <i class="ti ti-alarm-off"></i> 
                                Cancelled
                            </a>
                                
                                <?php endif; ?>
                            <?php if ($withdrawn_timeslot): ?>
                            <a class="dropdown-item" href="withdrawn-time-slots.php">
                                <i class="ti ti-clock-exclamation"></i> 
                                Withdrawn
                            </a>
                                <?php endif; ?>
                            <?php if ($completed_timeslot): ?>
                            <a class="dropdown-item" href="completed-time-slot.php">
                                <i class="ti ti-clock-24"></i> 
                                Completed
                            </a>
                                <?php endif; ?>
                        </div>
                    </li>
                    <?php endif; ?>

                    <!-- COMPANIES -->
                    <?php if ($active_companies || $blocked_companies || $deleted_companies): ?>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">
                            <span class="nav-link-icon d-md-none d-lg-inline-block">
                                <i class="ti ti-building-store"></i>
                            </span>
                            <span class="nav-link-title">Companies</span>
                        </a>
                        <div class="dropdown-menu">
                            <?php if ($active_companies): ?>
                            <a class="dropdown-item" href="companies.php">
                                <i class="ti ti-building-store"></i> 
                                Active Companies 
                                    <?php include 'includes/companies/count-active-companies.php'; ?>
                                <span class="badge bg-green-lt ms-auto">
                                    <?php echo $active_company_count; ?>
                                </span>
                            </a>
                                <?php endif; ?>
                            <?php if ($blocked_companies): ?>
                            <a class="dropdown-item" href="blocked-companies.php">
                                <i class="ti ti-users-group"></i> 
                                Blocked Companies 
                                    <?php include 'includes/companies/count-block-company.php'; ?>
                                <span class="badge bg-red-lt ms-auto">
                                    <?php echo $block_company_count; ?>
                                </span>
                            </a>
                                <?php endif; ?>
                            <?php if ($deleted_companies): ?>
                            <a class="dropdown-item" href="#">
                                <i class="ti ti-users-group"></i> 
                                Delete Requests 
                                <span class="badge bg-green-lt ms-auto">0</span>
                            </a>
                                <?php endif; ?>
                        </div>
                    </li>
                    <?php endif; ?>

                    <!-- CUSTOMERS -->
                    <?php if ($customer_accounts || $booker_accounts || $deleted_accounts): ?>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">
                            <span class="nav-link-icon d-md-none d-lg-inline-block">
                                <i class="ti ti-user-shield"></i>
                            </span>
                            <span class="nav-link-title">
                                Customers
                            </span>
                        </a>
                        <div class="dropdown-menu">
                            <?php if ($customer_accounts): ?>
                            <a class="dropdown-item" href="customers.php">
                                <i class="ti ti-users-group"></i> 
                                Customers 
                                    <?php include 'includes/customer/count-customers.php'; ?>
                                <span class="badge bg-green-lt ms-auto">
                                    <?php echo $customer_count; ?>
                                </span>
                            </a>
                                <?php endif; ?>
                            <?php if ($booker_accounts): ?>
                            <a class="dropdown-item" href="bookers.php">
                                <i class="ti ti-users-group"></i> 
                                Bookers 
                                    <?php include 'includes/booker/count-bookers.php'; ?>
                                <span class="badge bg-green-lt ms-auto">
                                    <?php echo $booker_count; ?>
                                </span>
                            </a>
                                <?php endif; ?>
                            <?php if ($deleted_accounts): ?>
                            <a class="dropdown-item" href="deleted-customers.php">
                                <i class="ti ti-users-group"></i> 
                                Delete Requests 
                                <span class="badge bg-green-lt ms-auto">0</span>
                            </a>
                                <?php endif; ?>
                        </div>
                    </li>
                    <?php endif; ?>

                    <!-- DRIVERS -->
                    <?php if ($web_driver || $new_driver || $active_driver || $inactive_driver || $old_driver || $deleted_drivers): ?>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">
                            <span class="nav-link-icon d-md-none d-lg-inline-block">
                                <i class="ti ti-user-pin"></i>
                            </span>
                            <span class="nav-link-title">
                                Drivers
                            </span>
                        </a>
                        <div class="dropdown-menu">
                            <?php if ($web_driver): ?>
                            <a class="dropdown-item" href="new-driver-web.php">
                                <i class="ti ti-user-shield"></i> 
                                New Drivers (Web)
                            </a>
                                <?php endif; ?>
                            <?php if ($new_driver): ?>
                            <a class="dropdown-item" href="new-drivers.php">
                                <i class="ti ti-user-shield"></i> 
                                New Drivers 
                                    <?php include 'includes/drivers/count-new-drivers.php'; ?>
                                <span class="badge bg-green-lt ms-auto">
                                    <?php echo $new_driver_count; ?>
                                </span>
                            </a>
                                <?php endif; ?>
                            <?php if ($active_driver): ?>
                            <a class="dropdown-item" href="active-drivers.php">
                                <i class="ti ti-steering-wheel"></i> 
                                Active Drivers 
                                    <?php include 'includes/drivers/count-active-drivers.php'; ?>
                                <span class="badge bg-green-lt ms-auto">
                                    <?php echo $active_driver_count; ?>
                                </span>
                            </a>
                                <?php endif; ?>
                            <?php if ($inactive_driver): ?>
                            <a class="dropdown-item" href="inactive-drivers.php">
                                <i class="ti ti-car-off"></i> 
                                Inactive Drivers 
                                    <?php include 'includes/drivers/count-inactive-drivers.php'; ?>
                                <span class="badge bg-green-lt ms-auto">
                                    <?php echo $inactive_driver_count; ?>
                                </span>
                            </a>
                                <?php endif; ?>
                            <?php if ($old_driver): ?>
                            <a class="dropdown-item" href="old-drivers.php">
                                <i class="ti ti-user-shield"></i> 
                                Old Drivers
                            </a>
                                <?php endif; ?>
                            <?php if ($deleted_drivers): ?>
                            <a class="dropdown-item" href="driver-delete-request.php">
                                <i class="ti ti-user-shield"></i> 
                                Delete Requests
                            </a>
                                <?php endif; ?>
                        </div>
                    </li>
                    <?php endif; ?>
                    <!-- DESTINATIONS -->
                    <?php if ($zones_list || $airports_list || $destinations_list || $railways_list): ?>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">
                            <span class="nav-link-icon d-md-none d-lg-inline-block">
                                <i class="ti ti-map-down"></i>
                            </span>
                            <span class="nav-link-title">
                                Destinations
                            </span>
                        </a>
                        <div class="dropdown-menu">
                            <?php if ($zones_list): ?>
                            <a class="dropdown-item" href="zones.php">
                                <i class="ti ti-map-pins"></i> 
                                Zones 
                                    <?php include 'includes/zones/count-zones.php'; ?>
                                <span class="badge bg-green-lt ms-auto">
                                    <?php echo $zone_count; ?>
                                </span>
                            </a>
                                <?php endif; ?>
                            <?php if ($airports_list): ?>
                            <a class="dropdown-item" href="airports.php">
                                <i class="ti ti-plane-tilt"></i> 
                                Airports 
                                    <?php include 'includes/zones/count-airports.php'; ?>
                                <span class="badge bg-green-lt ms-auto">
                                    <?php echo $ap_count; ?>
                                </span>
                            </a>
                                <?php endif; ?>
                            <?php if ($destinations_list): ?>
                            <a class="dropdown-item" href="destinations.php">
                                <i class="ti ti-map-2"></i> 
                                Destinations 
                                    <?php include 'includes/zones/count-dest.php'; ?>
                                <span class="badge bg-green-lt ms-auto">
                                    <?php echo $des_count; ?>
                                </span>
                            </a>
                                <?php endif; ?>
                            <?php if ($railways_list): ?>
                            <a class="dropdown-item" href="railway_stations.php">
                                <i class="ti ti-train"></i> 
                                Railway Stations 
                                    <?php include 'includes/zones/count-rs.php'; ?>
                                <span class="badge bg-green-lt ms-auto">
                                    <?php echo $rs_count; ?>
                                </span>
                            </a>
                                <?php endif; ?>
                        </div>
                    </li>
                    <?php endif; ?>                                                                                
                    <!-- Vehicle List -->
                    <?php if ($vehicles_list): ?>
                    <li class="nav-item">
                        <a class="nav-link" href="vehicles-list.php">
                            <span class="nav-link-icon d-md-none d-lg-inline-block">
                                <i class="ti ti-activity"></i>
                            </span>
                            <span class="nav-link-title">
                                Vehicle List
                            </span>
                        </a>
                    </li>
                    <?php endif; ?>                    
                    <!-- Vehicle List -->
                    <?php if ($pricing_models): ?>
                    <li class="nav-item">
                        <a class="nav-link" href="pricing.php">
                            <span class="nav-link-icon d-md-none d-lg-inline-block">
                                <i class="ti ti-activity"></i>
                            </span>
                            <span class="nav-link-title">
                                Pricing
                            </span>
                        </a>
                    </li>
                    <?php endif; ?>                                                             
                    <!-- REPORTS -->
                    <?php if ($driver_reports || $customer_reports || $booker_reports): ?>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">
                            <span class="nav-link-icon d-md-none d-lg-inline-block">
                                <i class="ti ti-credit-card-pay"></i>
                            </span>
                            <span class="nav-link-title">
                                Accounts
                            </span>
                        </a>
                        <div class="dropdown-menu">
                            <?php if ($driver_reports): ?>
                            <a class="dropdown-item" href="driver-reports.php">
                                <i class="ti ti-report"></i> 
                                Driver Account Statement
                            </a>
                            <?php endif; ?>
                            <?php if ($customer_reports): ?>
                            <a class="dropdown-item" href="customer-report.php">
                                <i class="ti ti-report"></i> 
                                Customer Account Statement
                            </a>
                            <?php endif; ?>
                            <?php if ($booker_reports): ?>
                            <a class="dropdown-item" href="booker-report.php">
                                <i class="ti ti-report"></i> 
                                Booker Account Statement
                            </a>
                            <?php endif; ?>
                        </div>
                    </li>
                    <?php endif; ?>
                    <!-- COMPANY PROFILE -->
                    <?php if ($company_profile): ?>
                    <li class="nav-item">
                        <a class="nav-link" href="company.php">
                            <span class="nav-link-icon d-md-none d-lg-inline-block">
                                <i class="ti ti-building-bank"></i>
                            </span>
                            <span class="nav-link-title">
                                Company Profile
                            </span>
                        </a>
                    </li>
                    <?php endif; ?>
                    <!-- ACTIVITY LOGS -->
                    <?php if ($activity_logs): ?>
                    <li class="nav-item">
                        <a class="nav-link" href="activity_log.php">
                            <span class="nav-link-icon d-md-none d-lg-inline-block">
                                <i class="ti ti-activity"></i>
                            </span>
                            <span class="nav-link-title">
                                Activity Logs
                            </span>
                        </a>
                    </li>
                    <?php endif; ?>
                </ul>
            </div>
        </div>
    </div>
</header>