<div class="card-body">
    <h2 class="mb-4">
        Driver Bank Details
    </h2>
    <div class="row mb-3">
        <div class="card">
            <div class="card-body border-bottom py-3">
                <div id="table-adriver" class="table-responsive">
                    <table class="table" id="table-bank">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Bank Name</th>
                                <th>Account Number</th>
                                <th>Sort Code</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody class="table-tbody">
                            <?php
                            $x = 0;
                            $bsql = mysqli_query($connect, "SELECT drivers.*, driver_bank_details.* FROM drivers JOIN driver_bank_details ON drivers.d_id = driver_bank_details.d_id WHERE drivers.d_id = $d_id");
                            while ($brow = mysqli_fetch_array($bsql)):
                                $x++;
                            ?>
                            <tr>
                                <td>
                                    <?php echo $x;?>
                                </td>
                                <td>
                                    <?php echo $brow['bank_name'];?>
                                </td>
                                <td>
                                    <?php echo $brow['account_number'];?>
                                </td>
                                <td>
                                    <?php echo $brow['sort_code']; ?>
                                </td>
                                <td>
                                    <a href="edit-driver-bank.php?d_bank_id=<?php echo $brow['d_bank_id']; ?>">
                                        <button class="btn btn-info">
                                            <i class="ti ti-eye"></i>
                                            Edit
                                        </button>
                                    </a>
                                    <a href="includes/drivers/del-driver-bank.php?d_bank_id=<?php echo $brow['d_bank_id'];?>& d_id=<?php echo $brow['d_id'];?>">
                                        <button class="btn btn-danger">
                                            <i class="ti ti-basket"></i>
                                            Delete
                                        </button>
                                    </a>
                                </td>
                            </tr>
				<?php endwhile; ?>
                                    <?php if ($x === 0) : ?>
                            <tr>
                                <td colspan="8">
                                    <p align="center">
                                        <a href="add-driver-bank.php?d_id=<?php echo $d_id; ?>" class="btn btn-primary d-none d-sm-inline-block">
                                            <i class="ti ti-car"></i>
                                            Add Bank Details
                                        </a>
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
        $('#table-bank').DataTable();
});
</script>