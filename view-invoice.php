<?php
include('header.php');

$iv_id = $_GET['id'];

$isql=mysqli_query($connect,"SELECT invoice.*, bookings.pickup, bookings.destination, bookings.passenger, bookings.luggage, bookings.book_date, bookings.book_time, bookings.journey_type, bookings.v_id, vehicles.v_name, clients.c_name, drivers.d_name, drivers.d_phone, clients.c_phone, clients.c_email, drivers.d_email, jobs.job_status FROM invoice, jobs, drivers, clients, bookings, vehicles WHERE invoice.job_id = jobs.job_id AND jobs.book_id = bookings.book_id AND invoice.d_id = drivers.d_id AND bookings.c_id = clients.c_id AND bookings.v_id = vehicles.v_id AND invoice.invoice_id = '$iv_id'");											
					

$irow = mysqli_fetch_array($isql);

?>

<div class="container-xl">
            <div class="card card-lg col-md-7 d-flex justify-content-center">
				<div class="card-header">						
		<h2 class="page-title">              					
			Payments Invoices           						
		</h2>
		<div class="col-auto ms-auto d-print-none">										
			<div class="btn-list">                                 			
				
				<a href="#" onclick="printInvoice()" class="btn d-none d-sm-inline-block btn-info">
					                					
					Print Invoice                  					
				</a> 
			</div>              			
		</div>
									
	</div>
              <div class="card-body">
				  
                <div class="row">
                  <div class="col-6">
                    <p class="h3">Company</p>
					  <?php
					  $csql=mysqli_query($connect,"SELECT * FROM `company` WHERE `user_id`='$myId'");											
					

$crow = mysqli_fetch_array($csql);
					  ?>
					  
                    <address>
                     <strong>Comapny Name:</strong>  <?php echo $crow['com_name'] ?><br>
                     <strong>Email:</strong> <?php echo $crow['com_a_email'] ?><br>
                     <strong>Phone:</strong> <?php echo $crow['com_a_phone'] ?><br>
                     <strong>Website:</strong> <?php echo $crow['com_web'] ?>
                    </address>
                  </div>
                  <div class="col-6 text-end">
                    <p class="h3">Driver Details</p>
                    <address>
                      <strong>Name:</strong><?php echo $irow['d_name'] ?><br>
						<strong>Email:</strong><?php echo $irow['d_email'] ?><br>
						<strong>Phone:</strong><?php echo $irow['d_phone'] ?><br>
                      
                    </address>
                  </div>
                  <div class="col-12 my-5">
                    <h1>Invoice INV/<?php echo $irow['invoice_id']; ?>/23</h1>
                  </div>
                </div>
                <table class="table table-transparent table-responsive">
                  <thead>
                    <tr>
                      <th class="text-center" style="width: 1%"></th>
                      <th>Ride Details</th>
                     
                      <th class="text-end" style="width: 1%">Chargess</th>
                      
                    </tr>
                  </thead>
                  <tr>
                    <td class="text-center">1</td>
                    <td>
                      <p class="strong mb-1"><?php echo $irow['pickup'] ?> / <?php echo $irow['destination'] ?></p>
                      <div class="text-secondary"><?php echo $irow['book_date'] ?> | <?php echo $irow['book_time'] ?></div>
                    </td>
                    <td class="text-center">
                     £ <?php echo $irow['fare'] ?>
                    </td>
                   
                    
                  </tr>
                  <tr>
                    <td class="text-center">2</td>
                    <td>
                      <p class="strong mb-1">Parking Charges</p>
                    </td>
                    <td class="text-center">
                      £ <?php echo $irow['parking_charges'] ?>
                    </td>
                   
                  </tr>
                  <tr>
                    <td class="text-center">3</td>
                    <td>
                      <p class="strong mb-1">Extra Drop Charges</p>
                    </td>
                    <td class="text-center">
                      £ <?php echo $irow['extra_drop_charges'] ?>
                    </td>
                    
                  </tr>
					<tr>
                    <td class="text-center">3</td>
                    <td>
                      <p class="strong mb-1">Driver Waiting Charges</p>
                    </td>
                    <td class="text-center">
                      £ <?php echo $irow['driver_waiting'] ?>
                    </td>
                    
                  </tr>
                  <tr>
                    <td colspan="2" class="strong text-end">Subtotal</td>
                    <td class="text-end"> £ <?php echo $irow['total_pay'] ?></td>
                  </tr>
                  <tr>
                    <td colspan="2" class="strong text-end">Payment Method</td>
                    <td class="text-end"><?php echo $irow['p_method'] ?></td>
                  </tr>
                  <tr>
                    <td colspan="2" class="strong text-end">Payment Status</td>
                    <td class="text-end"><?php echo $irow['status'] ?></td>
                  </tr>
                  
                </table>
                <p class="text-secondary text-center mt-5">Thank you very much for doing business with us. We look forward to working with
                  you again!</p>
              </div>
            </div>
          </div>


<?php
include('footer.php');
?>