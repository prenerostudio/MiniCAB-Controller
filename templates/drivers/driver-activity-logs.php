<div class="card-body">
    <h2 class="mb-4">
        Driver Activity Logs
    </h2>
    <div class="row mb-3">
        <div class="card">
            <div class="card-body border-bottom py-3">
                <div class="table-responsive">
                    <table class="table" id="table-logs">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Activity Type</th>
                                <th>Details</th>
                                <th>Time</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $x = 0;
                            $acsql = mysqli_query($connect, "SELECT activity_log.* FROM activity_log WHERE  activity_log.user_type = 'driver' AND activity_log.user_id = $d_id");
                            while ($acrow = mysqli_fetch_array($acsql)):
                                $x++;
                            ?>
                            <tr>
                                <td>
                                    <?php echo $x; ?>
                                </td>
                                <td>
                                    <?php echo $acrow['activity_type'];?>
                                </td>
                                <td>
                                    <?php echo $acrow['details'];?>
                                </td>
                                <td>
                                    <?php echo $acrow['timestamp']; ?>
                                </td>
                            </tr>
				<?php endwhile; ?>
                                <?php if ($x === 0) : ?>
                            <tr>
                                <td colspan="4">
                                    <p align="center">
                                        No Log Found!
                                    </p>
                                </td>
                            </tr>
				<?php endif; ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
$(document).ready(function() {
  $('#table-logs').DataTable({
    responsive: true,
    fixedHeader: true,
    dom: 'Bfrtip',
    buttons: ['copy', 'csv', 'excel', 'pdf', 'print'],
    columnDefs: [
      { targets: '_all', defaultContent: '' }
    ]
  });
});
</script>