<div class="col-12">
    <div class="card-body">    
        <h2 class="card-title mt-4">Permissions</h2>        	
        <form method="post" action="grant-permissions.php">        			
            <input type="hidden" class="form-control" name="user_id" value="<?php echo $user_id;  ?>">	
            <div class="row g-3">            	
                <div class="col-md-4" style="border: 1px solid #31708f; padding: 25px;">                		
                    <div class="mb-3">                                        		
                        <label class="form-label h3" style="padding-bottom: 20px;">Bookings Section</label>
                        <div class="divide-y">                                                			
                            <div>                                                        			
                                <label class="row">                                                                				
                                    <span class="col">Add New Booking Page</span>                                                                      
                                    <span class="col-auto">
                                        <label class="form-check form-check-single form-switch">
                                            <input type="hidden" name="add-booking" value="0">
                                            <input class="form-check-input" type="checkbox" value="1" name="add-booking" <?php echo ($urow['add_booking'] == 1) ? 'checked' : ''; ?>>
                                        </label>
                                    </span>
                                </label>
                            </div>
                            <div>
                                <label class="row">                                  
                                    <span class="col">Open Bookings Page</span>                                  
                                    <span class="col-auto">
                                        <label class="form-check form-check-single form-switch">
                                            <input type="hidden" name="view-open-bookings" value="0">                                        
                                            <input class="form-check-input" type="checkbox" name="view-open-bookings" value="1" <?php echo ($urow['open_booking'] == 1) ? 'checked' : ''; ?>>                                        
                                        </label>
                                    </span>
                                </label>
                            </div>
                            <div>
                                <label class="row">
                                    <span class="col">All Bookings Page</span>
                                    <span class="col-auto">                                    
                                        <label class="form-check form-check-single form-switch">                                             
                                            <input type="hidden" name="manage-all-bookings" value="0">                                            
                                            <input class="form-check-input" type="checkbox" name="manage-all-bookings" value="1" <?php echo ($urow['all_booking'] == 1) ? 'checked' : ''; ?>>
                                        </label>
                                    </span>
                                </label>
                            </div>         
                            <div>
                                <label class="row">
                                    <span class="col">Upcoming Bookings Page</span>
                                    <span class="col-auto">
                                        <label class="form-check form-check-single form-switch">
                                            <input type="hidden" name="view-upcoming-bookings" value="0">
                                            <input class="form-check-input" type="checkbox" name="view-upcoming-bookings" value="1" <?php echo ($urow['upcoming_booking'] == 1) ? 'checked' : ''; ?>>
                                        </label>
                                    </span>
                                </label>
                            </div>
                            <div>                                
                                <label class="row">                                                                  
                                    <span class="col">InProcess Bookings Page</span>                                   
                                    <span class="col-auto">                                    
                                        <label class="form-check form-check-single form-switch">                                                                                   
                                            <input type="hidden" name="modify-inprocess-bookings" value="0">                                                                                   
                                            <input class="form-check-input" type="checkbox" name="modify-inprocess-bookings" value="1" <?php echo ($urow['inprocess_booking'] == 1) ? 'checked' : ''; ?>>
                                        </label>                                    
                                    </span>                                                                
                                </label>                                                          
                            </div>
                            <div>
                                <label class="row">                                  
                                    <span class="col">Completed Bookings Page</span>                               
                                    <span class="col-auto">
                                        <label class="form-check form-check-single form-switch">                                                                                  
                                            <input type="hidden" name="view-completed-bookings" value="0">                                            
                                            <input class="form-check-input" type="checkbox" name="view-completed-bookings" value="1" <?php echo ($urow['completed_booking'] == 1) ? 'checked' : ''; ?>>                                                                            
                                        </label>                                                                      
                                    </span>                                                                
                                </label>                                                          
                            </div>
                            <div>
                                <label class="row">                                  
                                    <span class="col">Cancelled Bookings Page</span>                                  
                                    <span class="col-auto">
                                        <label class="form-check form-check-single form-switch">                                                                                  
                                            <input type="hidden" name="manage-cancelled-bookings" value="0">                                            
                                            <input class="form-check-input" type="checkbox" name="manage-cancelled-bookings" value="1" <?php echo ($urow['cancelled_booking'] == 1) ? 'checked' : ''; ?>>                                                                        
                                        </label>                                                                      
                                    </span>                                                                
                                </label>                                                                                      
                            </div>                                                                            
                        </div>                                          
                    </div>                                                    
                </div>                                                 
                <div class="col-md-4" style="border: 1px solid #31708f; padding: 25px;">                
                    <div class="mb-3">                                        
                        <label class="form-label h3" style="padding-bottom: 20px;">TimeSlot Section</label>                                                
                        <div class="divide-y">                                                
                            <div>                                                        
                                <label class="row">                                                                
                                    <span class="col">Available TimeSlot</span>                                                                      
                                    <span class="col-auto">                                                                        
                                        <label class="form-check form-check-single form-switch">                                                                                       
                                            <input type="hidden" name="create-available-timeslot" value="0">                                                                               
                                            <input class="form-check-input" type="checkbox" name="create-available-timeslot" value="1" <?php echo ($urow['available_timeslot'] == 1) ? 'checked' : ''; ?>>                                                                                                                    
                                        </label>                                                                                                          
                                    </span>                                                                                                
                                </label>                                                                                      
                            </div>
                            <div>                                                                
                                <label class="row">                                                                  
                                    <span class="col">Waiting TimeSlot</span>                                                                                                          
                                    <span class="col-auto">                                    
                                        <label class="form-check form-check-single form-switch">                                                                                     
                                            <input type="hidden" name="monitor-waiting-timeslot" value="0">                                                                                     
                                            <input class="form-check-input" type="checkbox" name="monitor-waiting-timeslot" value="1" <?php echo ($urow['waiting_timeslot'] == 1) ? 'checked' : ''; ?>>                                                                                                                    
                                        </label>                                                                                                          
                                    </span>                                                                
                                </label>                                                                                
                            </div>                            
                            <div>                                
                                <label class="row">                                                                                                      
                                    <span class="col">Accepted TimeSlot</span>                                                                      
                                    <span class="col-auto">                                                                            
                                        <label class="form-check form-check-single form-switch">                                                                                      
                                            <input type="hidden" name="confirm-accepted-timeslot" value="0">                                    
                                            <input class="form-check-input" type="checkbox" name="confirm-accepted-timeslot" value="1" <?php echo ($urow['accepted_timeslot'] == 1) ? 'checked' : ''; ?>>
                                        </label>                                                                                                          
                                    </span>                                                                                                
                                </label>                                                                                      
                            </div>                            
                            <div>                                
                                <label class="row">                                  
                                    <span class="col">Cancelled TimeSlot</span>                                                                      
                                    <span class="col-auto">                                    
                                        <label class="form-check form-check-single form-switch">
                                            <input type="hidden" name="process-cancelled-timeslot" value="0">
                                            <input class="form-check-input" type="checkbox" name="process-cancelled-timeslot" value="1" <?php echo ($urow['cancelled_timeslot'] == 1) ? 'checked' : ''; ?>>
                                        </label>                                                                                                         
                                    </span>                                                                                               
                                </label>                                                                                    
                            </div>                                                      
                            <div>                                                            
                                <label class="row">                                                                  
                                    <span class="col">Withdrawn TimeSlot</span>                                                                             
                                    <span class="col-auto">                                                                        
                                        <label class="form-check form-check-single form-switch">                                                                                  
                                            <input type="hidden" name="track-withdrawn-timeslot" value="0">                                        
                                            <input class="form-check-input" type="checkbox" name="track-withdrawn-timeslot" value="1" <?php echo ($urow['withdrawn_timeslot'] == 1) ? 'checked' : ''; ?>>                                               
                                        </label>                                                                                                          
                                    </span>                                                                                                
                                </label>                                                                                      
                            </div>                            
                            <div>                                                            
                                <label class="row">                                                                  
                                    <span class="col">Completed TimeSlot</span>                                                                                                          
                                    <span class="col-auto">                                    
                                        <label class="form-check form-check-single form-switch">                                                                                     
                                            <input type="hidden" name="archive-completed-timeslot" value="0">                                                                                
                                            <input class="form-check-input" type="checkbox" name="archive-completed-timeslot" value="1" <?php echo ($urow['completed_timeslot'] == 1) ? 'checked' : ''; ?>>                                                                                                                   
                                        </label>                                                                                                          
                                    </span>                                                                                                
                                </label>                                                                                      
                            </div>                                                   
                        </div>                                            
                    </div>                                    
                </div>                                                               
                <div class="col-md-4" style="border: 1px solid #31708f; padding: 25px;">                              
                    <div class="mb-3">                                        
                        <label class="form-label h3" style="padding-bottom: 20px;">Bids Section</label>                                                
                        <div class="divide-y">                                                
                            <div>                                                        
                                <label class="row">                                                                
                                    <span class="col">Open New Bid</span>                                                                      
                                    <span class="col-auto">                                    
                                        <label class="form-check form-check-single form-switch">					
                                            <input type="hidden" name="initiate-new-bid" value="0">                                             
                                            <input class="form-check-input" type="checkbox" name="initiate-new-bid" value="1" <?php echo ($urow['new_bid'] == 1) ? 'checked' : ''; ?>>                                        
                                        </label>                                                                      
                                    </span>                                                                
                                </label>                                                          
                            </div>                                                      
                            <div>                            
                                <label class="row">                                                                  
                                    <span class="col">Bookings On Bids</span>                                                                      
                                    <span class="col-auto">                                    
                                        <label class="form-check form-check-single form-switch">                                                                                   
                                            <input type="hidden" name="manage-bid-bookings" value="0">                                             
                                            <input class="form-check-input" type="checkbox" name="manage-bid-bookings" value="1" <?php echo ($urow['bid_booking'] == 1) ? 'checked' : ''; ?>>                                        
                                        </label>                                                                      
                                    </span>                                                                
                                </label>                                                          
                            </div>                                       
                            <div>                                                        
                                <label class="row">                                                                
                                    <span class="col">Accepted Bids</span>                                                                      
                                    <span class="col-auto">                                    
                                        <label class="form-check form-check-single form-switch">					
                                            <input type="hidden" name="finalize-accepted-bids" value="0">                                             
                                            <input class="form-check-input" type="checkbox" name="finalize-accepted-bids" value="1" <?php echo ($urow['accepted_bids'] == 1) ? 'checked' : ''; ?>>                                        
                                        </label>                                                                      
                                    </span>                                                                
                                </label>                                                          
                            </div>                        
                        </div>                    
                    </div>
                    <div class="mb-3">                                                                
                        <label class="form-label h3" style="padding-bottom: 20px; padding-top: 20px;">Companies Section</label>                                                
                        <div class="divide-y">                                                                            
                            <div>                                                        
                                <label class="row">                                                                                                    
                                    <span class="col">Active Companies</span>                                                                      
                                    <span class="col-auto">                                                                            
                                        <label class="form-check form-check-single form-switch">
                                            <input type="hidden" name="access-active-companies" value="0">                                             
                                            <input class="form-check-input" type="checkbox" name="access-active-companies" value="1" <?php echo ($urow['active_companies'] == 1) ? 'checked' : ''; ?>>                                                                                                                    
                                        </label>                                                                                                          
                                    </span>                                                                                                
                                </label>                                                                                      
                            </div>
                            <div>                                                                
                                <label class="row">                                  
                                    <span class="col">Blocked Companies</span>                                                                                                          
                                    <span class="col-auto">
                                        <label class="form-check form-check-single form-switch"> 											
                                            <input type="hidden" name="manage-blocked-companies" value="0"> 
                                            <input class="form-check-input" type="checkbox" name="manage-blocked-companies" value="1" <?php echo ($urow['blocked_companies'] == 1) ? 'checked' : ''; ?>>                                                                                                                    
                                        </label>                                                                                                          
                                    </span>                                                                                                
                                </label>                                                                                      
                            </div>                           
                            <div>                                                                                        
                                <label class="row">                                                                
                                    <span class="col">Deleted Companies</span>                                                                                                          
                                    <span class="col-auto">                                    
                                        <label class="form-check form-check-single form-switch">                                              
                                            <input type="hidden" name="execute-company-deletion" value="0">
                                            <input class="form-check-input" type="checkbox" name="execute-company-deletion" value="1" <?php echo ($urow['deleted_companies'] == 1) ? 'checked' : ''; ?>>                                                                                                                    
                                        </label>                                                                                                          
                                    </span>                                                                
                                </label>                                                                                      
                            </div>                                                
                        </div>                                        
                    </div> 
                      
                </div>                 						                
                <div class="col-md-4" style="border: 1px solid #31708f; padding: 25px;">                                
                    <div class="mb-3">                                                            
                        <label class="form-label h3" style="padding-bottom: 20px;">Customers Section</label>
                        <div class="divide-y">                                                                        
                            <div>                                                                                    
                                <label class="row">                                                                                                
                                    <span class="col">Customer Accounts</span>                                                                                                          
                                    <span class="col-auto">                                                                                                            
                                        <label class="form-check form-check-single form-switch">                                                   
                                            <input type="hidden" name="manage-customer-accounts" value="0">                                                                                    
                                            <input class="form-check-input" type="checkbox" name="manage-customer-accounts" value="1" <?php echo ($urow['customer_accounts'] == 1) ? 'checked' : ''; ?>>                                                                            
                                        </label>                                                                                                          
                                    </span>                                                                                                
                                </label>                                                                                      
                            </div>
                            <div>                                
                                <label class="row">                                                                  
                                    <span class="col">Booker Account</span>                                  
                                    <span class="col-auto">                                        
                                        <label class="form-check form-check-single form-switch">                                              
                                            <input type="hidden" name="control-booker-accounts" value="0">                                             
                                            <input class="form-check-input" type="checkbox" name="control-booker-accounts" value="1" <?php echo ($urow['booker_accounts'] == 1) ? 'checked' : ''; ?>>                                                                           
                                        </label>                                                                      
                                    </span>                                                                
                                </label>                                                          
                            </div>
                            <div>                                
                                <label class="row">                                  
                                    <span class="col">Delete Account</span>                                  
                                    <span class="col-auto">
                                        <label class="form-check form-check-single form-switch">                                             
                                            <input type="hidden" name="perform-account-deletion" value="0">                                             
                                            <input class="form-check-input" type="checkbox" name="perform-account-deletion" value="1" <?php echo ($urow['deleted_accounts'] == 1) ? 'checked' : ''; ?>>                                                                            
                                        </label>                                                                      
                                    </span>                                                                
                                </label>                                                          
                            </div>                                                                                                       
                        </div>                                                                
                    </div>                     
                    <div class="mb-3">                                        
                        <label class="form-label h3" style="padding-bottom: 20px; padding-top: 20px;">Destinations Section</label>			
                        <div class="divide-y">                                            			
                            <div>                                                    			
                                <label class="row">                                                            				
                                    <span class="col">Zones</span>                                                                  				
                                    <span class="col-auto">                                                                    				
                                        <label class="form-check form-check-single form-switch">                                                 
                                            <input type="hidden" name="configure-zones" value="0">                                                                    
                                            <input class="form-check-input" type="checkbox" name="configure-zones" value="1" <?php echo ($urow['zones_list'] == 1) ? 'checked' : ''; ?>>
                                        </label>                                                                      					                                    
                                    </span>                                                                				                                
                                </label>                            				                            
                            </div>    			                            			                            
                            <div>                        			                            
                                <label class="row">                                                            				                                
                                    <span class="col">Airports</span>                                                                  				                                    
                                    <span class="col-auto">                                                                    				                                    
                                        <label class="form-check form-check-single form-switch">                                               
                                            <input type="hidden" name="manage-airports" value="0">                                 					                                                                                   
                                            <input class="form-check-input" type="checkbox" name="manage-airports" value="1" <?php echo ($urow['airports_list'] == 1) ? 'checked' : ''; ?>>                                                                            					                                        
                                        </label>                                                                      					                                    
                                    </span>                                                                				                                
                                </label>                                                          				                            
                            </div>			                            			
                            <div>                                                    			
                                <label class="row">                                                            				
                                    <span class="col">Destinations</span>                                                                  				
                                    <span class="col-auto">				
                                        <label class="form-check form-check-single form-switch">                                              
                                            <input type="hidden" name="maintain-destinations" value="0">                                            
                                            <input class="form-check-input" type="checkbox" name="maintain-destinations" value="1" <?php echo ($urow['destinations_list'] == 1) ? 'checked' : ''; ?>>                                        
                                        </label>                                                                      					                                    
                                    </span>                                                                				                                
                                </label>                                                          				                            
                            </div>			                            			
                            <div>                                                    			                                
                                <label class="row">                                                            				
                                    <span class="col">Railway Stations</span>                                                                  				                                    
                                    <span class="col-auto">                                                                    				
                                        <label class="form-check form-check-single form-switch">                                                 
                                            <input type="hidden" name="administer-railway-stations" value="0">                               					                                            
                                            <input class="form-check-input" type="checkbox" name="administer-railway-stations" value="1" <?php echo ($urow['railways_list'] == 1) ? 'checked' : ''; ?>>                                                                            					                                      
                                        </label>                                                                      					                                    
                                    </span>                                                                				                                
                                </label>                                                          				                            
                            </div>                                                    		                        
                        </div>                                                                    			                    
                    </div>		                                                    
                </div>								                
                <div class="col-md-4" style="border: 1px solid #31708f; padding: 25px;">                                
                    <div class="mb-3">                                                            
                        <label class="form-label h3" style="padding-bottom: 20px;">Drivers Section</label>                                                                        
                        <div class="divide-y">                                                                        
                            <div>                                                                                    
                                <label class="row">                                                                                                
                                    <span class="col">Drivers From Web</span>                                                                      
                                    <span class="col-auto">                                                                                                                
                                        <label class="form-check form-check-single form-switch">                                                
                                            <input type="hidden" name="import-web-drivers" value="0">                                             
                                            <input class="form-check-input" type="checkbox" name="import-web-drivers" value="1" <?php echo ($urow['web_driver'] == 1) ? 'checked' : ''; ?>>                                                                                                                    
                                        </label>                                                                                                          
                                    </span>                                                                                                
                                </label>                                                                                      
                            </div>
                            <div>                                                                
                                <label class="row">                                  
                                    <span class="col">New Drivers</span>                                                                                                          
                                    <span class="col-auto">
                                        <label class="form-check form-check-single form-switch">                                                   
                                            <input type="hidden" name="onboard-new-drivers" value="0">                                                                                        
                                            <input class="form-check-input" type="checkbox" name="onboard-new-drivers" value="1" <?php echo ($urow['new_driver'] == 1) ? 'checked' : ''; ?>>                                                                                                                    
                                        </label>                                                                                                          
                                    </span>                                                                                                
                                </label>                                                                                      
                            </div>                            
                            <div>                                                            
                                <label class="row">                                                                  
                                    <span class="col">Active Drivers</span>                                                                                                          
                                    <span class="col-auto">                                    
                                        <label class="form-check form-check-single form-switch">                                                 
                                            <input type="hidden" name="monitor-active-drivers" value="0">                                                                                                                             
                                            <input class="form-check-input" type="checkbox" name="monitor-active-drivers" value="1" <?php echo ($urow['active_driver'] == 1) ? 'checked' : ''; ?>>                                                                                                                    
                                        </label>                                                                                                          
                                    </span>                                                                                                
                                </label>                                                                                      
                            </div>                                                                                   
                            <div>                                                        
                                <label class="row">                                                                                                  
                                    <span class="col">InActive Drivers</span>                                                                                                          
                                    <span class="col-auto">                                                                        
                                        <label class="form-check form-check-single form-switch">                                               
                                            <input type="hidden" name="review-inactive-drivers" value="0">                                                                                                 
                                            <input class="form-check-input" type="checkbox" name="review-inactive-drivers" value="1" <?php echo ($urow['inactive_driver'] == 1) ? 'checked' : ''; ?>>                                                                                                                    
                                        </label>                                                                                                          
                                    </span>                                                                                                
                                </label>                                                                                      
                            </div>                            
                            <div>                                                            
                                <label class="row">                                                                  
                                    <span class="col">Old Drivers</span>                                                                                                          
                                    <span class="col-auto">                                    
                                        <label class="form-check form-check-single form-switch">                                              
                                            <input type="hidden" name="archive-old-drivers" value="0">                                                                                     
                                            <input class="form-check-input" type="checkbox" name="archive-old-drivers" value="1" <?php echo ($urow['old_driver'] == 1) ? 'checked' : ''; ?>>                                                                                                                    
                                        </label>                                                                                                          
                                    </span>                                                                                                
                                </label>                                                                                      
                            </div>
                            <div>                                                                
                                <label class="row">                                                                  
                                    <span class="col">Deleted Drivers</span>                                                                      
                                    <span class="col-auto">                                        
                                        <label class="form-check form-check-single form-switch">                                                    
                                            <input type="hidden" name="remove-driver-records" value="0">                                                                                     
                                            <input class="form-check-input" type="checkbox" name="remove-driver-records" value="1" <?php echo ($urow['deleted_drivers'] == 1) ? 'checked' : ''; ?>>                                                                                                                    
                                        </label>                                                                                                          
                                    </span>                                                                                                
                                </label>                                                                                      
                            </div> 
                            <div>                                                                
                                <label class="row">                                                                  
                                    <span class="col">Drivers Tracking</span>                                                                      
                                    <span class="col-auto">                                        
                                        <label class="form-check form-check-single form-switch">                                                    
                                            <input type="hidden" name="driver-tracker" value="0">                                                                                     
                                            <input class="form-check-input" type="checkbox" name="driver-tracker" value="1" <?php echo ($urow['driver_tracker'] == 1) ? 'checked' : ''; ?>>                                                                                                                    
                                        </label>                                                                                                          
                                    </span>                                                                                                
                                </label>                                                                                      
                            </div> 
                            
                        </div>                                                                                    
                    </div>   					
                    <div class="mb-3">                                                            
                        <label class="form-label h3" style="padding-bottom: 20px; padding-top: 20px;">Company Profile</label>                                                                        
                        <div class="divide-y">                                                
                            <div>                                                        
                                <label class="row">                                                                
                                    <span class="col">Company Profile</span>                                                                      
                                    <span class="col-auto">                                                                        
                                        <label class="form-check form-check-single form-switch">                                                
                                            <input type="hidden" name="edit-company-profile" value="0">                                                                                  
                                            <input class="form-check-input" type="checkbox" name="edit-company-profile" value="1" <?php echo ($urow['company_profile'] == 1) ? 'checked' : ''; ?>>                                                                                                                    
                                        </label>                                                                                                          
                                    </span>                                                                                                
                                </label>                                                                                      
                            </div>                                                                                               
                        </div>                                                                
                    </div> 
                  
                     <div class="mb-3">                                                                
                        <label class="form-label h3" style="padding-bottom: 20px; padding-top: 20px;">Fare Correction</label>                                                
                        <div class="divide-y">                                                                            
                            <div>                                                        
                                <label class="row">                                                                
                                    <span class="col">Fare Correction</span>                                                                      
                                    <span class="col-auto">                                                                        
                                        <label class="form-check form-check-single form-switch">                                                
                                            <input type="hidden" name="fare-correction" value="0">                                           
                                            <input class="form-check-input" type="checkbox" name="fare-correction" value="1" <?php echo ($urow['fare_corrections'] == 1) ? 'checked' : ''; ?>>                                                                                                                    
                                        </label>                                                                                                          
                                    </span>                                                                                                
                                </label>                                                                                      
                            </div>                                                                                               
                        </div>                                                                
                    </div>
                    
                    
                </div>               
                <div class="col-md-4" style="border: 1px solid #31708f; padding: 25px;">                   		
                    <div class="mb-3">                                                                
                        <label class="form-label h3" style="padding-bottom: 20px;">Vehicles Section</label>                                                
                        <div class="divide-y">                                                                            
                            <div>                                                                                    
                                <label class="row">                                                                
                                    <span class="col">Vehicles</span>                                                                                                      
                                    <span class="col-auto">                                                                                                            
                                        <label class="form-check form-check-single form-switch">                                                           
                                            <input type="hidden" name="maintain-vehicle-registry" value="0">                                                                                 
                                            <input class="form-check-input" type="checkbox" name="maintain-vehicle-registry" value="1" <?php echo ($urow['vehicles_list'] == 1) ? 'checked' : ''; ?>>                                                                                                                    
                                        </label>                                                                                                          
                                    </span>                                                                                                
                                </label>                                                                                      
                            </div>                                                                                               
                        </div>                                                                
                    </div>
                    <div class="mb-3">                    
                        <label class="form-label h3" style="padding-bottom: 20px; padding-top: 20px;">Pricing Section</label>                                                
                        <div class="divide-y">                        
                            <div>                                                            
                                <label class="row">                                
                                    <span class="col">Pricing</span>
                                    <span class="col-auto">                                    
                                        <label class="form-check form-check-single form-switch">                                                
                                            <input type="hidden" name="adjust-pricing-models" value="0">                                                                                     
                                            <input class="form-check-input" type="checkbox" name="adjust-pricing-models" value="1" <?php echo ($urow['pricing_models'] == 1) ? 'checked' : ''; ?>>                                                                                                                    
                                        </label>                                                                                                          
                                    </span>                                                                                                
                                </label>                                                                                      
                            </div>                                                                                               
                        </div>                                                                
                    </div>                    		                    
                    <div class="mb-3">                                                            
                        <label class="form-label h3" style="padding-bottom: 20px; padding-top: 20px;">Accounts Section</label>                                                                        
                        <div class="divide-y">                                                                        
                            <div>                                                                                    
                                <label class="row">                                                                                                
                                    <span class="col">Driver Report</span>                                                                                                          
                                    <span class="col-auto">                                                                        
                                        <label class="form-check form-check-single form-switch">                                             
                                            <input type="hidden" name="generate-driver-reports" value="0">                                                                                      
                                            <input class="form-check-input" type="checkbox" name="generate-driver-reports" value="1" <?php echo ($urow['driver_reports'] == 1) ? 'checked' : ''; ?>>                                                                                                                    
                                        </label>                                                                                                          
                                    </span>                                                                                                
                                </label>                                                                                      
                            </div>
                            <div>
                                <label class="row">                                                                      
                                    <span class="col">Customer Report</span>                                                                      
                                    <span class="col-auto">                                                                            
                                        <label class="form-check form-check-single form-switch"> 					
                                            <input type="hidden" name="export-customer-reports" value="0">                                             
                                            <input class="form-check-input" type="checkbox" name="export-customer-reports" value="1" <?php echo ($urow['customer_reports'] == 1) ? 'checked' : ''; ?>>                                        
                                        </label>                                                                                                          
                                    </span>                                                                                                
                                </label>                                                                                      
                            </div>
                            <div>                                
                                <label class="row">                                  
                                    <span class="col">Booker Report</span>                                                                      
                                    <span class="col-auto">
                                        <label class="form-check form-check-single form-switch">                                                    
                                            <input type="hidden" name="access-booker-analytics" value="0">                                             
                                            <input class="form-check-input" type="checkbox" name="access-booker-analytics" value="1" <?php echo ($urow['booker_reports'] == 1) ? 'checked' : ''; ?>>                                                                                                                    
                                        </label>                                                                                                          
                                    </span>                                                                                                
                                </label>                                                       
                            </div>                                                                           
                        </div>                                            
                    </div>                    	
                    <div class="mb-3">                                                                
                        <label class="form-label h3" style="padding-bottom: 20px; padding-top: 20px;">Activity Section</label>                                                
                        <div class="divide-y">                                                                            
                            <div>                                                        
                                <label class="row">                                                                
                                    <span class="col">Activity Logs</span>                                                                      
                                    <span class="col-auto">                                                                        
                                        <label class="form-check form-check-single form-switch">                                                
                                            <input type="hidden" name="audit-activity-logs" value="0">                                           
                                            <input class="form-check-input" type="checkbox" name="audit-activity-logs" value="1" <?php echo ($urow['activity_logs'] == 1) ? 'checked' : ''; ?>>                                                                                                                    
                                        </label>                                                                                                          
                                    </span>                                                                                                
                                </label>                                                                                      
                            </div>                                                                                               
                        </div>                                                                
                    </div>
                    
                    
                    
                   
                    
                    <div class="mb-3">                                                                
                        <label class="form-label h3" style="padding-bottom: 20px; padding-top: 20px;">All Users List</label>                                                
                        <div class="divide-y">                                                                            
                            <div>                                                        
                                <label class="row">                                                                
                                    <span class="col">All Users List</span>                                                                      
                                    <span class="col-auto">                                                                        
                                        <label class="form-check form-check-single form-switch">                                                
                                            <input type="hidden" name="all-user-list" value="0">                                           
                                            <input class="form-check-input" type="checkbox" name="all-user-list" value="1" <?php echo ($urow['activity_logs'] == 1) ? 'checked' : ''; ?>>                                                                                                                    
                                        </label>                                                                                                          
                                    </span>                                                                                                
                                </label>                                                                                      
                            </div>                                                                                               
                        </div>                                                                
                    </div>
                </div> 				                        
            </div>												          
            <div class="card-footer bg-transparent mt-auto">            
                <div class="btn-list justify-content-end">                
                    <a href="#" class="btn">
                        Cancel                        
                    </a>                    
                    <button class="btn btn-primary" type="submit">
                        Grant Permissions
                    </button>                  
                </div> 		
            </div>			            
        </form>        
    </div>	        
</div>     