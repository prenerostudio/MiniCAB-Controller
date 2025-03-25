<div class="card-body">
    <div class="row g-2 align-items-center mb-4">
        <div class="col">
            <h2 class="page-title">
                Drivers Details Section
            </h2>
        </div>
        <div class="col-auto ms-auto d-print-none">
            <div class="btn-list">
                <a href="add-vehicle.php?d_id=<?php echo $d_id; ?>" class="btn btn-primary d-none d-sm-inline-block">
                    <i class="ti ti-car"></i>
                    Add Vehicle
                </a>
            </div>
        </div>
    </div>
    <div class="row mb-3">
        <div class="card">
            <div class="card-body border-bottom py-3">
                <div id="table-adriver" class="table-responsive">
                    <table class="table" id="table-vehicle">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Vehicle Type</th>
                                <th>Make & Model, Color</th>
                                <th>Registration #</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody class="table-tbody">
                            <?php
                            $x = 0;
                            $vhsql = mysqli_query($connect, "SELECT driver_vehicle.*, vehicles.* FROM driver_vehicle INNER JOIN vehicles ON driver_vehicle.v_id = vehicles.v_id WHERE driver_vehicle.d_id = $d_id");
                            while ($vhrow = mysqli_fetch_array($vhsql)):
                                $x++;
                            ?>							
                            <tr>
                                <td>
                                    <?php echo $x; ?>
                                </td>
                                <td>
                                    <?php echo $vhrow['v_name']; ?>
                                </td>
                                <td>                                   
									<?php echo $vhrow['v_make']; ?> -                                       
									<?php echo $vhrow['v_model']; ?> -                                           
									<?php echo $vhrow['v_color']; ?>
                                </td>
                                <td>
                                    <?php echo $vhrow['v_reg_num']; ?>
                                </td>
                                <td>
                                    <a href="vehicle-details.php?dv_id=<?php echo $vhrow['dv_id']; ?>">
                                        <button class="btn btn-info">
                                            <i class="ti ti-eye"></i>
                                            View
                                        </button>
                                    </a>
                                </td>
                            </tr>				
							<?php endwhile; ?>                                    
							<?php if ($x === 0) : ?>
                            <tr>
                                <td colspan="8">
                                    <p align="center">
                                        No Vehicle Found!
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
        $('#table-vehicle').DataTable();
});
</script>