<?php
include '../configuration.php';

// Validate POST data
$d_id       = $_POST['d_id'] ?? '';
$start_date = $_POST['start_date'] ?? '';
$end_date   = $_POST['end_date'] ?? '';
if (empty($d_id) || empty($start_date) || empty($end_date)) {
    die('Invalid request');
}
// Fetch Driver Invoice Report
$query = "SELECT  invoice.invoice_id, invoice.total_pay, invoice.driver_commission, invoice.invoice_status, invoice.invoice_date, drivers.d_name, clients.c_name, bookings.pickup, bookings.destination FROM invoice INNER JOIN jobs ON invoice.job_id = jobs.job_id INNER JOIN drivers ON invoice.d_id = drivers.d_id INNER JOIN clients ON invoice.c_id = clients.c_id INNER JOIN bookings ON jobs.book_id = bookings.book_id WHERE invoice.d_id = '$d_id' AND invoice.invoice_date BETWEEN '$start_date' AND '$end_date' ORDER BY invoice.invoice_date DESC";
$result = mysqli_query($connect, $query);
?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Driver Report</title>
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
                <h4>Driver Report</h4>                       
                <div class="no-print">            
                    <a href="javascript:window.print()" class="btn btn-outline-info me-2">                
                        Print / PDF            
                    </a>            
                    <a href="../driver-statement.php" class="btn btn-primary">                
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
                            <th>Driver</th>                    
                            <th>Journey</th>                    
                            <th>Customer</th>                    
                            <th>Total Pay</th>                    
                            <th>Driver Commission</th>                    
                            <th>Status</th>                    
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
                            <td><?= $row['invoice_id']; ?></td>                       
                            <td><?= ucfirst($row['d_name']); ?></td>                        
                            <td><?= $row['pickup']; ?> → <?= $row['destination']; ?></td>                        
                            <td><?= ucfirst($row['c_name']); ?></td>                        
                            <td><?= number_format($row['total_pay'], 2); ?></td>                        
                            <td><?= number_format($row['driver_commission'], 2); ?></td>                        
                            <td><?= ucfirst($row['invoice_status']); ?></td>                        
                            <td><?= date('d M Y', strtotime($row['invoice_date'])); ?></td>                    
                        </tr>                
                        <?php endwhile; ?>            
                        <?php endif; ?>
                    </tbody>        
                </table>    
            </div>           
        </div>
    </body>
</html>