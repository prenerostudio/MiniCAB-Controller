<?php
include('header.php');
$inv_id = $_GET['invoice_id'];
$sql=mysqli_query($connect,"SELECT invoice.*, jobs.book_id, drivers.*, bookings.*, booking_type.*, clients.* FROM invoice, jobs, drivers, bookings, clients, booking_type WHERE invoice.job_id = jobs.job_id AND invoice.d_id = drivers.d_id AND jobs.book_id = bookings.book_id AND bookings.b_type_id = booking_type.b_type_id AND jobs.c_id = clients.c_id AND invoice.invoice_id = '$inv_id'");
$irow = mysqli_fetch_array($sql);	
?>

        <div class="page-header d-print-none">
          <div class="container-xl">
            <div class="row g-2 align-items-center">
              <div class="col">
                <h2 class="page-title">
                  Invoice
                </h2>
              </div>
              <!-- Page title actions -->
              <div class="col-auto ms-auto d-print-none">
                <button type="button" class="btn btn-primary" onclick="javascript:window.print();">
                <i class="ti ti-printer"></i>
                  Print Invoice
                </button>
              </div>
            </div>
          </div>
        </div>
        <!-- Page body -->
        <div class="page-body">
          <div class="container-xl">
            <div class="card card-lg">
              <div class="card-body">
                <div class="row">
                  <div class="col-6">
                    <p class="h3">Driver Details:</p>
                    <address>
                     <?php echo $irow['d_name']; ?><br>
                      <?php echo $irow['d_phone']; ?><br>
                      <?php echo $irow['d_email']; ?><br>
                     <?php echo $irow['d_address']; ?>
                    </address>
                  </div>
                  <div class="col-6 text-end">
                    <p class="h3">Customer Details:</p>
                    <address>
                      <?php echo $irow['c_name']; ?><br>
                      <?php echo $irow['c_phone']; ?><br>
                      <?php echo $irow['d_email']; ?><br>
                      <?php echo $irow['d_address']; ?>
                    </address>
                  </div>
                  <div class="col-12 my-5">
                    <h1>Invoice INV/<?php echo $irow['book_id']; ?></h1>
                  </div>
                </div>
                <table class="table table-transparent table-responsive">
                  <thead>
                    <tr>
                      <th class="text-center" style="width: 1%"></th>
                      <th>Booking Detail</th>
                      <th class="text-center" >Journey Fare</th>
                      <th class="text-center" >Car Parking</th>
						<th class="text-center" >Waiting</th>
						<th class="text-center" >Tolls</th>
						<th class="text-center" >Extra</th>
                      <th class="text-center" >Amount</th>
                    </tr>
                  </thead>
                  <tr>
                    <td class="text-center">1</td>
                    <td>
                      <p class="strong mb-1"><?php echo $irow['pick_date']; ?> - <?php echo $irow['pick_time']; ?></p>
                      <div class="text-secondary">Pickup: <?php echo $irow['pickup']; ?> <br> Dropoff: <?php echo $irow['destination']; ?></div>
                    </td>
                    <td class="text-center">
                     £ <?php echo $irow['journey_fare']; ?>
                    </td>
                    <td class="text-center">£ <?php echo $irow['car_parking']; ?></td>
                    <td class="text-center">£ <?php echo $irow['waiting']; ?></td>
					  <td class="text-center">
                      £ <?php echo $irow['tolls']; ?>
                    </td>
                    <td class="text-center">£ <?php echo $irow['extra']; ?></td>
                    <td class="text-center">£ <?php echo $irow['total_pay']; ?></td>
                  </tr>
                  
                  
                  <tr>
                    <td colspan="7" class="strong text-end">Subtotal</td>
                    <td class="text-end">£ <?php echo $irow['total_pay']; ?></td>
                  </tr>
                  <tr>
                    <td colspan="7" class="strong text-end">Driver Commission</td>
                    <td class="text-end">20%</td>
                  </tr>
					 <?php
        // Assuming $irow['total_pay'] contains the total amount
        $commissionPercentage = 20; // Change this to the desired commission percentage
        $driverCommission = ($commissionPercentage / 100) * $irow['total_pay'];
        $driverAmount = $irow['total_pay'] - $driverCommission;
    ?>
   
                  <tr>
                    <td colspan="7" class="strong text-end">Driver Amount</td>
                    <td class="text-end">£ <?php echo number_format($driverCommission, 2); ?></td>
                  </tr>
                  <tr>
                    <td colspan="7" class="font-weight-bold text-uppercase text-end">Company Charges</td>
                    <td class="font-weight-bold text-end">£ <?php echo $driverAmount ?></td>
                  </tr>
                </table>
                <p class="text-secondary text-center mt-5">Thank you very much for doing business with us. We look forward to working with
                  you again!</p>
              </div>
            </div>
          </div>
        </div>


<?php
include('footer.php');
?>