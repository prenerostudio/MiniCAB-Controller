<?php
require '../../configuration.php';
include('../../session.php');

header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $user_id = $_POST['user_id'];
    $fname = $_POST['fname'];
    $lname = $_POST['lname'];
    $uphone = $_POST['uphone'];
    $desig = $_POST['desig'];
    $nid = $_POST['nid'];
    $address = $_POST['address'];
    $city = $_POST['city'];
    $state = $_POST['state'];
    $country = $_POST['country'];
    $pc = $_POST['pc'];

    $sql = "UPDATE `users` SET 
                `first_name`='$fname',
                `last_name`='$lname',
                `user_phone`='$uphone',
                `designation`='$desig',
                `address`='$address',
                `city`='$city',
                `state`='$state',
                `country_id`='$country',
                `pc`='$pc',
                `nid`='$nid' 
            WHERE `user_id`='$user_id'";

    $result = mysqli_query($connect, $sql);

    if ($result) {
        $activity_type = 'Admin Profile Updated';
        $user_type = 'user';
        $details = 'Admin Profile Has Been updated by Controller.';

        $actsql = "INSERT INTO `activity_log`(
                        `activity_type`, 
                        `user_type`, 
                        `user_id`, 
                        `details`
                    ) VALUES (
                        '$activity_type',
                        '$user_type',
                        '$myId',
                        '$details')";
        mysqli_query($connect, $actsql);

        echo json_encode(["status" => "success", "message" => "Profile updated successfully."]);
    } else {
        echo json_encode(["status" => "error", "message" => "Failed to update profile."]);
    }
}
?>
