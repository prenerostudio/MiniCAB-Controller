<?php
include('config.php'); 
$pc_name = $_POST['pc_name'];
$x = 0;

$query = "SELECT drivers.*, driver_vehicle.*, vehicles.* 
          FROM drivers 
          INNER JOIN driver_vehicle ON driver_vehicle.d_id = drivers.d_id 
          INNER JOIN vehicles ON driver_vehicle.v_id = vehicles.v_id 
          WHERE drivers.acount_status = 1";

if (!empty($pc_name)) {
    $query .= " AND drivers.d_post_code = '" . mysqli_real_escape_string($connect, $pc_name) . "'";
}

$query .= " ORDER BY drivers.d_id DESC";

$result = mysqli_query($connect, $query);

while ($row = mysqli_fetch_array($result)) {
    $x++;
    echo '<tr>
        <td>' . $x . '</td>
        <td>';
    echo (!$row['d_pic']) 
        ? '<img src="img/user-1.jpg" style="width: 50px; height: 50px; border-radius: 5px;">' 
        : '<img src="img/drivers/' . $row['d_pic'] . '" style="width: 50px; height: 50px; border-radius: 5px;">';
    echo '</td>
        <td><strong style="text-transform: capitalize;">' . $row['d_name'] . '</strong></td>
        <td>' . $row['d_email'] . '</td>
        <td>' . $row['d_phone'] . '</td>
        <td>' . $row['v_name'] . '</td>
        <td>' . $row['d_post_code'] . '</td>
        <td>' . $row['d_shift'] . '</td>
        <td>
            <a href="view-driver.php?d_id=' . $row['d_id'] . '" class="btn btn-icon btn-info"><i class="ti ti-eye"></i></a>
            <a href="del-driver.php?d_id=' . $row['d_id'] . '" class="btn btn-danger btn-icon delete_btn" onclick="return confirm(\'Are you sure?\');"><i class="ti ti-square-rounded-x"></i></a>
            <a href="make-inactive.php?d_id=' . $row['d_id'] . '" class="btn btn-icon btn-instagram"><i class="ti ti-user-x"></i></a>
        </td>
    </tr>';
}

if ($x == 0) {
    echo '<tr><td colspan="9" align="center">No Driver Found!</td></tr>';
}
?>
