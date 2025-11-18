<div class="card">
    <div class="row g-0">
        <div class="col-12 col-md-12 d-flex flex-column">
            <div class="card-body">
                <h2 class="mb-4">Mileage rate</h2>
                <hr>
                <h3>Mile range: £ per mile rate incl. 12% MiniCAB commission (and VAT)</h3>
                <p align="justify">
                    Enter your mileage rates for each Petrol, Diesel & Hybrid vehicle type<br><br>
                    Note that Per Mile Price mileage rates apply to the total distance from your office to the pickup point to the drop-off point unless you have set a Free Pickup Postcode Area. When you edit the mileage ranges and rates, the Price Per Mile Calculator will show you how your pricing relates to typical distances, factoring in any uplifts for larger vehicle sizes, so you can evaluate how competitive you are.
                </p>
                <form id="milePricingForm" enctype="multipart/form-data">
    <table class="table table-responsive" id="myTable">
        <thead>	
            <tr>
                <th>From (miles)</th>
                <th>To (miles)</th>
                <th>Salon / Mile</th>
                <th>Estate / Mile</th>
                <th>MPV / Mile</th>
                <th>Executive Salon / Mile</th>
                <th>Large MPV / Mile</th>
                <th>Executive Large MPV / Mile</th>
                <th>MiniBus / Mile</th>
                <th>Delivery / Mile</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><input type="text" class="form-control" name="from" required></td>
                <td><input type="text" class="form-control" name="to" required></td>
                <td><input type="text" class="form-control" name="salon" required></td>
                <td><input type="text" class="form-control" name="estate" required></td>
                <td><input type="text" class="form-control" name="mpv" required></td>
                <td><input type="text" class="form-control" name="esalon" required></td>
                <td><input type="text" class="form-control" name="lmpv" required></td>
                <td><input type="text" class="form-control" name="empv" required></td>
                <td><input type="text" class="form-control" name="minibus" required></td>
                <td><input type="text" class="form-control" name="delivery" required></td>
            </tr>
        </tbody>
        <tfoot>
            <tr>
                <td colspan="10" align="right">
                    <button type="submit" class="btn btn-danger">Save Records</button>
                </td>
            </tr>
        </tfoot>
    </table>
</form>
            <table class="table table-responsive">
    <thead>
        <tr align="center">
            <th>From (miles)</th>
            <th>To (miles)</th>
            <th>Salon / Mile</th>
            <th>Estate / Mile</th>
            <th>MPV / Mile</th>
            <th>Executive Salon / Mile</th>
            <th>Large MPV / Mile</th>
            <th>Executive Large MPV / Mile</th>
            <th>MiniBus / Mile</th>
            <th>Parcel Courier / Mile</th>
            <th>Actions</th>
        </tr>
    </thead>
    <tbody>
        <?php
        include('../../configuration.php');

        // Step 1: Get unique mileage ranges
        $range_sql = mysqli_query($connect, "
            SELECT DISTINCT from_miles, to_miles 
            FROM vehicle_pricing_miles 
            ORDER BY from_miles ASC
        ");

        while ($range = mysqli_fetch_assoc($range_sql)) {
            $from = $range['from_miles'];
            $to = $range['to_miles'];

            // Step 2: Default price structure
            $prices = [
                'Salon' => 0.00,
                'Estate' => 0.00,
                'MPV' => 0.00,
                'Executive Salon' => 0.00,
                'Large MPV' => 0.00,
                'Executive Large MPV' => 0.00,
                'MiniBus' => 0.00,
                'Parcel / Courier / Delivery' => 0.00
            ];

            // Step 3: Fetch actual prices for the range
            $sql = "
                SELECT v.v_name, vp.price_per_mile 
                FROM vehicle_pricing_miles vp 
                INNER JOIN vehicles v ON vp.v_id = v.v_id 
                WHERE vp.from_miles = '$from' AND vp.to_miles = '$to'
            ";
            $result = mysqli_query($connect, $sql);

            while ($row = mysqli_fetch_assoc($result)) {
                $name = trim($row['v_name']);
                // Normalize names to match keys
                if ($name === '(10-14 Seater) Minibus') $name = 'MiniBus';
                if ($name === 'Large MPV ') $name = 'Large MPV';
                if (array_key_exists($name, $prices)) {
                    $prices[$name] = (float)$row['price_per_mile'];
                }
            }
        ?>
            <tr align="center">
                <td><?php echo $from; ?> Miles</td>
                <td><?php echo $to; ?> Miles</td>
                <td>£ <?php echo number_format($prices['Salon'], 2); ?></td>
                <td>£ <?php echo number_format($prices['Estate'], 2); ?></td>
                <td>£ <?php echo number_format($prices['MPV'], 2); ?></td>
                <td>£ <?php echo number_format($prices['Executive Salon'], 2); ?></td>
                <td>£ <?php echo number_format($prices['Large MPV'], 2); ?></td>
                <td>£ <?php echo number_format($prices['Executive Large MPV'], 2); ?></td>
                <td>£ <?php echo number_format($prices['MiniBus'], 2); ?></td>
                <td>£ <?php echo number_format($prices['Parcel / Courier / Delivery'], 2); ?></td>
                <td>
                    <a class="btn btn-info button_padding" href="edit-price.php?from=<?php echo $from; ?>&to=<?php echo $to; ?>">
                        <i class="ti ti-pencil"></i>
                    </a>
                    <a class="btn btn-danger button_padding" href="del-price.php?from=<?php echo $from; ?>&to=<?php echo $to; ?>">
                        <i class="ti ti-square-rounded-x"></i>
                    </a>
                </td>
            </tr>
        <?php } ?>
    </tbody>
</table>



            </div>
        </div>
    </div>
</div>

<script>
$(document).ready(function() {
    $('#milePricingForm').on('submit', function(e) {
        e.preventDefault();

        $.ajax({
            url: 'includes/pricing/mp_process.php',
            type: 'POST',
            data: $(this).serialize(),
            beforeSend: function() {
                Swal.fire({
                    title: 'Saving...',
                    text: 'Please wait while we save pricing data',
                    icon: 'info',
                    showConfirmButton: false,
                    allowOutsideClick: false
                });
            },
            success: function(response) {
                Swal.close();

                try {
                    var res = JSON.parse(response);
                    if (res.status === 'success') {
                        Swal.fire({
                            icon: 'success',
                            title: 'Saved!',
                            text: res.message,
                            timer: 2000,
                            showConfirmButton: false
                        }).then(() => {
                            // Reload or redirect
                            location.reload();
                        });
                    } else {
                        Swal.fire({
                            icon: 'error',
                            title: 'Error',
                            text: res.message
                        });
                    }
                } catch (e) {
                    Swal.fire({
                        icon: 'error',
                        title: 'Error',
                        text: 'Unexpected server response.'
                    });
                    console.log(response);
                }
            },
            error: function() {
                Swal.close();
                Swal.fire({
                    icon: 'error',
                    title: 'Error',
                    text: 'AJAX request failed!'
                });
            }
        });
    });
});
</script>
