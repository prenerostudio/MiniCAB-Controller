<div class="card-body">				
    <h2 class="mb-4">						    
        Activity Logs					        
    </h2>														    
    <div class="row mb-3">															    
        <div class="card">				        
            <div class="card-body border-bottom py-3">            
                <div id="table-adriver" class="table-responsive">                
                    <table class="table" id="blogs">						                    
                        <thead>						                        
                            <tr>															                            
                                <th>ID</th>							
                                <th>Activity Type</th>							                                
                                <th>Details</th>                                
                                <th>Time</th>                                                    
                            </tr>                            
                        </thead>
                        <tbody class="table-tbody">                                                        
                            <?php                            
                            $x = 0;	
                            $acsql = mysqli_query($connect, "SELECT activity_log.* FROM activity_log WHERE activity_log.user_type = 'client' AND activity_log.user_id = $c_id");                            
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
                            
                            
                        </tbody>		                        
                    </table>						                    
                </div>                
            </div>             
        </div>        
    </div>    
</div>			                                                       
<script>					    
    	
    $(document).ready(function() {      
        $('#blogs').DataTable({                                      
            dom: 'Bfrtip',                    
            buttons: ['copy', 'csv', 'excel', 'pdf', 'print'],                    
            language: {            
                emptyTable: "No Log Found!" // ✅ Handles empty table cleanly                        
            }                
        });        
    });
</script>