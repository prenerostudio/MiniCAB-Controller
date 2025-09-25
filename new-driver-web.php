<?php
include('header.php');
?>
<div class="page-header d-print-none page_padding">
    <div class="row g-2 align-items-center">
        <div class="col">
            <div class="page-pretitle">
                Overview 
            </div>
            <h2 class="page-title">                				
                Drivers Section                						
            </h2>              				
        </div>			       		
    </div>	
</div>
<div class="page-body page_padding">          	
    <div class="row row-deck row-cards">		                    						
        <div class="col-12">											
            <div class="card">								                
                <div class="card-header">											
                    <h3 class="card-title">		
                        New Drivers Request List			
                    </h3>											
                </div>																		
                <div class="card-body border-bottom py-3">											
                    <div id="table-ndriver" class="table-responsive">		
                        <table class="table" id="table-new">			
                            <thead>																						
                                <tr>				
                                    <th>ID</th>				
                                    <th>Image</th>				
                                    <th>Name</th>                                    
                                    <th>Email</th>				
                                    <th>Phone</th>				
                                    <th>Postcode</th>				
                                    <th>Shift Timing</th>															
                                    <th>Actions</th>				
                                </tr>				
                            </thead>																				
                            <tbody class="table-tbody">                            								
                                <?php                                        
                                $y = 0;								
                                $ndsql = mysqli_query($connect, "SELECT drivers.* FROM drivers WHERE drivers.signup_type = 3 AND drivers.acount_status = 0 ORDER BY drivers.d_id DESC");				
                                while ($ndrow = mysqli_fetch_array($ndsql)) :	
                                    $y++;                            								
                                ?>                                								
                                <tr>                                									
                                    <td>										
                                        <?php echo $y; ?>									
                                    </td>                                    									
                                    <td>                                        										
                                        <?php if (!$ndrow['d_pic']) : ?>
                                        <img src="img/user-1.jpg" alt="Driver Img" style="width: 50px; height: 50px; border-radius: 5px;">										
                                        <?php else : ?>										
                                        <img src="img/drivers/<?php echo $ndrow['d_pic']; ?>" alt="Driver Img" style="width: 50px; height: 50px; border-radius: 5px;">
                                        <?php endif; ?>									
                                    </td>                                    
                                    <td>										
                                        <?php echo $ndrow['d_name']; ?>
                                    </td>                                    
                                    <td>										
                                        <?php echo $ndrow['d_email']; ?>
                                    </td>                                    
                                    <td>										
                                        <?php echo $ndrow['d_phone']; ?>
                                    </td>                                    
                                    <td>										
                                        <?php echo $ndrow['d_post_code']; ?>
                                    </td>                                    
                                    <td>										
                                        <?php echo $ndrow['d_shift']; ?>
                                    </td>                                    
                                    <td>                                    
                                        <a href="includes/drivers/accept-driver.php?d_id=<?php echo $ndrow['d_id']; ?>" class="btn btn-success" title="Accept Driver">                                                
                                            <i class="ti ti-checks"></i> Accept Driver										
                                        </a>                                       
                                    </td>
                                </tr>								
                                <?php endwhile; ?>								                                								
                                <?php if ($y === 0) : ?>
                                <tr>				
                                    <td colspan="8">													
                                        <p align="center">															
                                            No Driver Found!															
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
</div>   
<script>	
    $(document).ready(function() {			
        $('#table-new').DataTable();	
    });	
</script>
<?php
include('footer.php');
?>