<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Methods, Authorization, X-Requested-With');
header('Cache-Control: max-age=3600');

include("../../configuration.php");

$response = ['status' => false, 'message' => 'Invalid Request'];

$d_id = isset($_POST['d_id']) ? intval($_POST['d_id']) : 0;

if ($d_id > 0) {

    // ✅ List of all related tables (including main driver)
    $tables = [
        'drivers',
        'driving_license',
        'address_proofs',
        'pco_license',
        'national_insurance',
        'dvla_check',
        'driver_extras',
        'vehicle_log_book',
        'vehicle_mot',
        'vehicle_pco',
        'vehicle_insurance',
        'vehicle_pictures',
        'vehicle_road_tax',
        'rental_agreement',
        'vehicle_ins_schedule',
        'vehicle_extras'
    ];

    // ✅ Build query dynamically
    $joins = [];
    foreach (array_slice($tables, 1) as $tbl) {
        $joins[] = "LEFT JOIN $tbl ON drivers.d_id = $tbl.d_id";
    }
    $join_sql = implode("\n", $joins);

    $sql = "
        SELECT *
        FROM drivers
        $join_sql
        WHERE drivers.d_id = ?
    ";

    $stmt = $connect->prepare($sql);
    $stmt->bind_param("i", $d_id);

    if ($stmt->execute()) {
        $result = $stmt->get_result();
        $row = $result->fetch_assoc();

        if ($row) {
            // ✅ Fetch columns for each table dynamically from INFORMATION_SCHEMA
            $db_name_result = $connect->query("SELECT DATABASE() AS db_name");
            $db_name = $db_name_result->fetch_assoc()['db_name'];

            $table_columns = [];
            foreach ($tables as $tbl) {
                $cols = [];
                $col_query = $connect->prepare("
                    SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS
                    WHERE TABLE_SCHEMA = ? AND TABLE_NAME = ?
                ");
                $col_query->bind_param("ss", $db_name, $tbl);
                $col_query->execute();
                $col_result = $col_query->get_result();
                while ($col = $col_result->fetch_assoc()) {
                    $cols[] = $col['COLUMN_NAME'];
                }
                $table_columns[$tbl] = $cols;
                $col_query->close();
            }

            // ✅ Group the fetched data by matching columns to their table
            $grouped = [];
            foreach ($tables as $tbl) {
                $grouped[$tbl] = [];
                foreach ($table_columns[$tbl] as $col) {
                    if (array_key_exists($col, $row)) {
                        $grouped[$tbl][$col] = $row[$col];
                    }
                }
            }

            // ✅ Rename `drivers` key to `driver_info` for cleaner structure
            $grouped['driver_info'] = $grouped['drivers'];
            unset($grouped['drivers']);

            $response = [
                'status' => true,
                'message' => 'Document Fetched Successfully',
                'data' => $grouped
            ];
        } else {
            $response = [
                'status' => false,
                'message' => 'No documents found for this driver'
            ];
        }
    } else {
        $response = [
            'status' => false,
            'message' => 'Error executing query'
        ];
    }

    $stmt->close();
} else {
    $response = [
        'status' => false,
        'message' => 'Driver ID is missing or invalid'
    ];
}

echo json_encode($response, JSON_PRETTY_PRINT);
?>
