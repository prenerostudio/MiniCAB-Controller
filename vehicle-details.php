<?php
include('header.php');
$dv_id = $_GET['dv_id'];
$vhsql = mysqli_query($connect, "SELECT driver_vehicle.*, vehicles.* FROM driver_vehicle INNER JOIN vehicles ON driver_vehicle.v_id = vehicles.v_id WHERE driver_vehicle.dv_id = '$dv_id'");
$vhrow = mysqli_fetch_array($vhsql);											
?>
<div class="page-body page_padding">
    <div class="row row-deck row-cards justify-content-center">
        <div class="col-12 col-md-10 col-lg-8">
            <div class="card">
                <div class="card-header">
                    <h3 class="card-title">Vehicle Details</h3>
                </div>
                <div class="card-body border-bottom py-3">
                    <form id="updateVehicleForm" method="post" enctype="multipart/form-data">
                        <div class="modal-body">
                            <div class="row">
                                <div class="mb-3 col-lg-4">
                                    <input type="hidden" name="dv_id" value="<?php echo $dv_id; ?>">
                                    <input type="hidden" name="d_id" value="<?php echo $vhrow['d_id']; ?>">
                                    <label class="form-label">Vehicle Type</label>
                                    <select class="form-control" name="v_id">
                                        <option value="<?php echo $vhrow['v_id'] ?>"><?php echo $vhrow['v_name'] ?></option>
                                        <?php
                                        $vsql = mysqli_query($connect, "SELECT * FROM `vehicles`");
                                        while ($vrow = mysqli_fetch_array($vsql)) {
                                            echo '<option value="'.$vrow['v_id'].'">'.$vrow['v_name'].'</option>';
                                        }
                                        ?>
                                    </select>
                                </div>
                                <div class="mb-3 col-lg-4">
                                    <label class="form-label">Make</label>
                                    <input type="text" class="form-control" name="make" value="<?php echo $vhrow['v_make'] ?>">
                                </div>
                                <div class="mb-3 col-lg-4">
                                    <label class="form-label">Model</label>
                                    <input type="text" class="form-control" name="model" value="<?php echo $vhrow['v_model'] ?>">
                                </div>
                                <div class="mb-3 col-lg-4">
                                    <label class="form-label">Color</label>
                                    <input type="text" class="form-control" name="color" value="<?php echo $vhrow['v_color'] ?>">
                                </div>
                                <div class="mb-3 col-lg-4">
                                    <label class="form-label">Registration Number</label>
                                    <input type="text" class="form-control" name="reg_num" value="<?php echo $vhrow['v_reg_num'] ?>">
                                </div>
                                <div class="mb-3 col-lg-4">
                                    <label class="form-label">PHV Licence</label>
                                    <input type="text" class="form-control" name="phv" value="<?php echo $vhrow['v_phv'] ?>">
                                </div>
                                <div class="mb-3 col-lg-4">
                                    <label class="form-label">PHV Expiry Date</label>
                                    <input type="date" class="form-control" name="phv_exp" value="<?php echo $vhrow['v_phv_expiry'] ?>">
                                </div>
                                <div class="mb-3 col-lg-4">
                                    <label class="form-label">Taxi Insurance</label>
                                    <input type="text" class="form-control" name="taxi_ins" value="<?php echo $vhrow['v_ti'] ?>">
                                </div>
                                <div class="mb-3 col-lg-4">
                                    <label class="form-label">Taxi Insurance Expiry Date</label>
                                    <input type="date" class="form-control" name="taxi_exp" value="<?php echo $vhrow['v_ti_expiry'] ?>">
                                </div>
                                <div class="mb-3 col-lg-4">
                                    <label class="form-label">MOT Number</label>
                                    <input type="text" class="form-control" name="mot" value="<?php echo $vhrow['v_mot'] ?>">
                                </div>
                                <div class="mb-3 col-lg-4">
                                    <label class="form-label">MOT Expiry Date</label>
                                    <input type="date" class="form-control" name="mot_exp" value="<?php echo $vhrow['v_mot_expiry'] ?>">
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <a href="view-driver.php?d_id=<?php echo $vhrow['d_id']; ?>#tabs-vehicle" class="btn btn-danger">
                                <i class="ti ti-circle-x"></i> Cancel
                            </a>
                            <button type="submit" class="btn btn-success ms-auto">
                                <i class="ti ti-message-plus"></i> Save Vehicle
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
$(document).ready(function() {
    $('#updateVehicleForm').on('submit', function(e) {
        e.preventDefault();

        var formData = new FormData(this);

        $.ajax({
            url: 'includes/drivers/update-dv.php',
            type: 'POST',
            data: formData,
            contentType: false,
            processData: false,
            beforeSend: function() {
                Swal.fire({
                    title: 'Updating...',
                    text: 'Please wait while we save your changes.',
                    allowOutsideClick: false,
                    didOpen: () => Swal.showLoading()
                });
            },
            success: function(response) {
                Swal.close();
                if (response.status === 'success') {
                    Swal.fire({
                        icon: 'success',
                        title: 'Updated!',
                        text: response.message,
                        timer: 2000,
                        showConfirmButton: false
                    });

                    
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: 'Error',
                        text: response.message
                    });
                }
            },
            error: function() {
                Swal.close();
                Swal.fire({
                    icon: 'error',
                    title: 'Error',
                    text: 'Something went wrong. Please try again.'
                });
            }
        });
    });
});
</script>


<?php
include('footer.php');
?>