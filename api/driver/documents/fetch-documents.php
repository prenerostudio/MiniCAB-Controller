<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Content-Type, Authorization, X-Requested-With');
header('Cache-Control: no-cache');

include("../../../configuration.php");

/**
 * -------------------------------------------------
 * Read POST + JSON Body Safely
 * -------------------------------------------------
 */
$input = json_decode(file_get_contents("php://input"), true);

$d_id = 0;
if (isset($_POST['d_id'])) {
    $d_id = intval($_POST['d_id']);
} elseif (isset($input['d_id'])) {
    $d_id = intval($input['d_id']);
}

$response = ['status' => false, 'message' => 'Invalid Request'];

if ($d_id <= 0) {
    echo json_encode([
        'status' => false,
        'message' => 'Driver ID is missing or invalid'
    ]);
    exit;
}

/**
 * -------------------------------------------------
 * Tables List
 * -------------------------------------------------
 */
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

/**
 * -------------------------------------------------
 * Get Database Name
 * -------------------------------------------------
 */
$dbRes = $connect->query("SELECT DATABASE() AS db");
$dbName = $dbRes->fetch_assoc()['db'];

/**
 * -------------------------------------------------
 * Fetch Columns Dynamically
 * -------------------------------------------------
 */
$table_columns = [];

$colStmt = $connect->prepare("
    SELECT COLUMN_NAME 
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = ? AND TABLE_NAME = ?
");

foreach ($tables as $tbl) {
    $colStmt->bind_param("ss", $dbName, $tbl);
    $colStmt->execute();
    $res = $colStmt->get_result();

    $table_columns[$tbl] = [];
    while ($row = $res->fetch_assoc()) {
        $table_columns[$tbl][] = $row['COLUMN_NAME'];
    }
}
$colStmt->close();

/**
 * -------------------------------------------------
 * Build SELECT with UNIQUE ALIASES
 * -------------------------------------------------
 */
$selects = [];

foreach ($tables as $tbl) {
    foreach ($table_columns[$tbl] as $col) {
        $selects[] = "$tbl.$col AS {$tbl}__{$col}";
    }
}

$select_sql = implode(",\n", $selects);

/**
 * -------------------------------------------------
 * Build LEFT JOINS
 * -------------------------------------------------
 */
$joins = [];
foreach (array_slice($tables, 1) as $tbl) {
    $joins[] = "LEFT JOIN $tbl ON drivers.d_id = $tbl.d_id";
}
$join_sql = implode("\n", $joins);

/**
 * -------------------------------------------------
 * Final SQL
 * -------------------------------------------------
 */
$sql = "
    SELECT
        $select_sql
    FROM drivers
    $join_sql
    WHERE drivers.d_id = ?
";

$stmt = $connect->prepare($sql);
$stmt->bind_param("i", $d_id);

/**
 * -------------------------------------------------
 * Execute
 * -------------------------------------------------
 */
if (!$stmt->execute()) {
    echo json_encode([
        'status' => false,
        'message' => 'Query execution failed'
    ]);
    exit;
}

$result = $stmt->get_result();
$row = $result->fetch_assoc();

if (!$row) {
    echo json_encode([
        'status' => false,
        'message' => 'No documents found for this driver'
    ]);
    exit;
}

/**
 * -------------------------------------------------
 * Group Data Back to Tables
 * -------------------------------------------------
 */
$grouped = [];

foreach ($tables as $tbl) {
    $grouped[$tbl] = [];
    foreach ($table_columns[$tbl] as $col) {
        $key = "{$tbl}__{$col}";
        $grouped[$tbl][$col] = $row[$key] ?? null;
    }
}

/**
 * -------------------------------------------------
 * Rename drivers → driver_info
 * -------------------------------------------------
 */
$grouped['driver_info'] = $grouped['drivers'];
unset($grouped['drivers']);

/**
 * -------------------------------------------------
 * Final Response
 * -------------------------------------------------
 */
echo json_encode([
    'status' => true,
    'message' => 'Driver documents fetched successfully',
    'data' => $grouped
], JSON_PRETTY_PRINT);

$stmt->close();
$connect->close();
