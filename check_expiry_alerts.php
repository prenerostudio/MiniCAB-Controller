<?php
include 'config.php';

function checkExpiringDocuments($connect) {
    // Table configs: table => [driver_id_col, expiry_date_col, expiry_time_col, document_label]
    $tables = [
        'driving_license'      => ['d_id', 'dl_expiry', 'dl_expiry_time', 'Driving License'],
        'pco_license'          => ['d_id', 'pl_exp', 'pl_exp_time', 'PCO License'],
        'rental_agreement'     => ['d_id', 'ra_exp', 'ra_exp_time', 'Rental Agreement'],
        'vehicle_insurance'    => ['d_id', 'vi_exp', 'vi_exp_time', 'Vehicle Insurance'],
        'vehicle_mot'          => ['d_id', 'mot_expiry', 'mot_exp_time', 'Vehicle MOT'],
        'vehicle_pco'          => ['d_id', 'vpco_exp', 'vpco_exp_time', 'Vehicle PCO License'],
        'vehicle_road_tax'     => ['d_id', 'rt_exp', 'rt_exp_time', 'Vehicle Road Tax'],
    ];

    $alerts = [];

    foreach ($tables as $table => [$driverIdCol, $dateCol, $timeCol, $label]) {
        $query = "
            SELECT `$driverIdCol` AS driver_id, `$dateCol` AS expiry_date, `$timeCol` AS expiry_time,
                CONCAT(`$dateCol`, ' ', `$timeCol`) AS expiry_datetime
            FROM `$table`
            WHERE 
                `$dateCol` IS NOT NULL AND `$timeCol` IS NOT NULL
                AND `$dateCol` != '0000-00-00' AND `$timeCol` != '00:00:00'
                AND TIMESTAMPDIFF(MINUTE, NOW(), CONCAT(`$dateCol`, ' ', `$timeCol`)) BETWEEN 0 AND 180
        ";

        $result = mysqli_query($connect, $query);

        if ($result) {
            while ($row = mysqli_fetch_assoc($result)) {
                $alerts[] = [
                    'driver_id'     => $row['driver_id'],
                    'document_type' => $label,
                    'expiry_date'   => $row['expiry_date'],
                    'expiry_time'   => $row['expiry_time'],
                    'table'         => $table,
                ];
            }
        } else {
            error_log("Query error for `$table`: " . mysqli_error($connect));
        }
    }

    return $alerts;
}

$alerts = checkExpiringDocuments($connect);

header('Content-Type: application/json');
echo json_encode($alerts);
