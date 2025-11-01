<div class="card-body">
    <h2 class="mb-4">
        Driver Booking Statements
    </h2>
    <div class="row mb-3">
        <div class="card">
            <div class="card-body border-bottom py-3">
                <div class="table-responsive">
                    <table class="table" id="table-statement" style="width: 100%;">
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
                        <tbody>
                            <?php
                            $x = 0;
                            $isql = mysqli_query($connect, "SELECT invoice.*, jobs.book_id, drivers.*, bookings.*, booking_type.*, clients.* FROM invoice JOIN jobs ON invoice.job_id = jobs.job_id JOIN drivers ON invoice.d_id = drivers.d_id JOIN bookings ON jobs.book_id = bookings.book_id JOIN clients ON jobs.c_id = clients.c_id JOIN booking_type ON bookings.b_type_id = booking_type.b_type_id WHERE invoice.d_id = $d_id");
                            while ($irow = mysqli_fetch_array($isql)):
                                $x++;
                            ?>
                            <tr>
                                <td class="sort-id">
                                    <?php echo $x; ?>
                                </td>
                                <td>
                                    <?php echo $irow['invoice_date']; ?>
                                </td>
                                <td>
                                    <strong>Booking ID:</strong> <?php echo $irow['book_id']; ?> <br>
                                    <strong>Pickup Date:</strong> <?php echo $irow['pick_date']; ?> <br>
                                    <strong>Pickup Time:</strong> <?php echo $irow['pick_time']; ?> <br>
                                    <strong>Pickup Address:</strong> <?php echo $irow['pickup']; ?> <br>
                                    <strong>Drop-off Address:</strong><?php echo $irow['destination']; ?>
                                </td>
                                <td>
                                    <?php echo $irow['total_pay']; ?>
                                </td>
                                <td>
                                    <?php echo $irow['invoice_status']; ?>
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
                                
                            
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
$(document).ready(function() {
  $('#table-statement').DataTable({
    responsive: true,
    fixedHeader: true,
    dom: 'Bfrtip',
    buttons: ['copy', 'csv', 'excel', 'pdf', 'print'],
    language: {
                            
                emptyTable: "No Booking Found!" // ✅ Handles empty table cleanly        
                
            }
  });
});
</script>