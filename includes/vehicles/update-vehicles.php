<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

include("../../configuration.php");
include("../../session.php");

header("Content-Type: application/json");

if ($_SERVER["REQUEST_METHOD"] == "POST") { 

    $v_id   = $_POST["v_id"];
    $vname  = $_POST["vname"];
    $vseat  = $_POST["vseat"];
    $vchair = $_POST["vchair"];
    $vbaby  = $_POST["vbaby"];
    $vbags  = $_POST["vbags"];
    $vh_updated_at = date('Y-m-d H:i:s');

    $sql = "UPDATE vehicles SET
                v_name='$vname',
                v_seat='$vseat',
                v_airbags='$vbags',
                v_wchair='$vchair',
                v_babyseat='$vbaby',
                vh_updated_at='$vh_updated_at'
            WHERE v_id='$v_id'";

    if (!mysqli_query($connect, $sql)) {
        echo json_encode([
            "status" => "error",
            "message" => "SQL ERROR: " . mysqli_error($connect)
        ]);
        exit;
    }

    // Activity log
    $activity_type = 'Vehicle Updated';
    $details = "Vehicle " . mysqli_real_escape_string($connect, $vname) . " updated";

$log = "INSERT INTO activity_log(activity_type,user_type,user_id,details)
        VALUES('Vehicle Updated','user','$myId','$details')";

    if (!mysqli_query($connect, $log)) {
        echo json_encode([
            "status" => "error",
            "message" => "LOG ERROR: " . mysqli_error($connect)
        ]);
        exit;
    }

    echo json_encode([
        "status" => "success",
        "message" => "Vehicle updated successfully!"
    ]);
    exit;
}
?>
