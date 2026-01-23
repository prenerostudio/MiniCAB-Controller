<?php
include '../configuration.php';

// Validate POST data
$c_id       = $_POST['c_id'] ?? '';
$start_date = $_POST['start_date'] ?? '';
$end_date   = $_POST['end_date'] ?? '';
if (empty($c_id) || empty($start_date) || empty($end_date)) {
    die('Invalid request');
}
// Fetch Driver Invoice Report
$query = "SELECT invoice.*, jobs.book_id, jobs.job_note, jobs.job_status, clients.c_name, clients.c_email, clients.c_phone, drivers.d_name, drivers.d_email, drivers.d_phone, bookings.b_type_id, bookings.pickup, bookings.stops, bookings.destination, bookings.passenger, bookings.pick_time, bookings.pick_date, bookings.journey_type, bookings.v_id, booking_type.* FROM invoice INNER JOIN jobs ON invoice.job_id = jobs.job_id INNER JOIN clients ON invoice.c_id = clients.c_id INNER JOIN drivers ON invoice.d_id = drivers.d_id INNER JOIN bookings ON jobs.book_id = bookings.book_id INNER JOIN booking_type ON bookings.b_type_id = booking_type.b_type_id WHERE invoice.invoice_date BETWEEN '$start_date' AND '$end_date' AND invoice.c_id = '$c_id'";
$result = mysqli_query($connect, $query);
?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Customer Report</title>
        <link rel="shortcut icon" href="../img/favicon.png">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            @media print {    
                .no-print, .btn, a { display: none !important; }    
                @page { size: A4 portrait; margin: 15mm; }  
                body { font-size: 12px; background: #fff; color: #000; }    
                table th, table td {        
                    border: 1px solid #000 !important;        
                    padding: 6px;        
                    font-size: 11px;    
                }
            }
        </style>
    </head>
    <body>
        <div class="container mt-4">    
            <h2 class="mb-3">Minicab Taxi Service</h2>                
            <div class="d-flex justify-content-between align-items-center mb-3">        
                <h4>Customer Report</h4>                       
                <div class="no-print">            
                    <a href="javascript:window.print()" class="btn btn-outline-info me-2">                
                        Print / PDF            
                    </a>            
                    <a href="../customer-statement.php" class="btn btn-primary">                
                        Back            
                    </a>        
                </div>    
            </div>                
            <p>        
                <strong>From:</strong> <?= date('d M Y', strtotime($start_date)) ?>        
                &nbsp; | &nbsp;        
                <strong>To:</strong> <?= date('d M Y', strtotime($end_date)) ?>    
            </p>               
            <div class="table-responsive">        
                <table class="table table-bordered mt-3">            
                    <thead class="table-light">                        
                        <tr>            					                        
                            <th>Invoice ID</th>					                            
                            <th>Customer</th>					                            
                            <th>Job Details</th>              					                            
                            <th>Driver</th>     					                            
                            <th>Total Pay</th>               					                            
                            <th>Driver Commission</th>               					                            
                            <th>Invoice Status</th>                					                            
                            <th>Invoice Date</th>            					                            
                        </tr>            
                    </thead>            
                    <tbody>                                   
                        <?php if (mysqli_num_rows($result) == 0): ?>                
                        <tr>                    
                            <td colspan="8" class="text-center">                        
                                No records found for selected dates.                    
                            </td>                
                        </tr>            
                        <?php else: ?>                
                        <?php while ($row = mysqli_fetch_assoc($result)): ?>                    
                        <tr>					                                            
                            <td><?php echo $row['invoice_id'];?></td> 					                            
                            <td>                   
                                <strong style="text-transform: capitalize;">										                                                                                        
                                    <?php echo $row['c_name'];?>
                                </strong>						                                
                            </td>					                            
                            <td><?php echo $row['pickup'];?> | <?php echo $row['destination'];?></td>					                            
                            <td>                            
                                <strong style="text-transform:capitalize;">												                                                    
                                    <?php echo $row['d_name'];?>
                                </strong>						                                
                            </td>                     					                            
                            <td><?php echo $row['total_pay'];?></td>                										                            
                            <td><?php echo $row['driver_commission'];?></td>                					                            
                            <td><?php echo $row['invoice_status'];?></td>               					                            
                            <td><?php echo $row['invoice_date'];?></td>                            
                        </tr>                
                        <?php endwhile; ?>            
                        <?php endif; ?>
                    </tbody>        
                </table>    
            </div>           
        </div>
    </body>
</html> 