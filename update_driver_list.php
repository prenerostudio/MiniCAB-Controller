<?php
include('config.php');

echo '<table class="table" id="table-active">';
echo '<thead>
        <tr>
            <th>ID</th>
            <th>Driver</th>
            <th>Online Time</th>
            <th>Status</th>
        </tr>
      </thead>';
echo '<tbody>';

$x = 0;

$query = "
    SELECT d.d_id, d.d_name, d.status, s.driver_online_at
    FROM drivers d
    JOIN driver_sessions s ON d.d_id = s.d_id
    WHERE d.status = 'online' AND s.driver_offline_at IS NULL
    GROUP BY d.d_id
";
$drvsql = mysqli_query($connect, $query);

while ($drvrow = mysqli_fetch_assoc($drvsql)) {
    $x++;
    $timestamp = strtotime($drvrow['driver_online_at']) * 1000;

    echo '<tr>';
    echo '<td>' . $x . '</td>';
    echo '<td><span class="text-secondary">' . htmlspecialchars($drvrow['d_name']) . '</span></td>';
    echo '<td><span class="timer" data-start="' . $timestamp . '"></span></td>';
    echo '<td><span class="badge bg-success me-1"></span>' . htmlspecialchars($drvrow['status']) . '</td>';
    echo '</tr>';
}

echo '</tbody></table>';
?>
