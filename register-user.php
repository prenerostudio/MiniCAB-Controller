<?php
include('config.php');
?>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8"/>	
        <meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover"/>	
        <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    	
        <title>Sign in - MiniCAB Taxi Booking Service.</title>
            		
        <script defer data-api="/stats/api/event" data-domain="MiniCAB Taxi Booking Service" src="stats/js/script.js"></script>
        <!-- CSS files -->    
        <link href="css/tabler.min.css" rel="stylesheet"/>    	
        <link href="css/tabler-flags.min.css" rel="stylesheet"/>    	
        <link href="css/tabler-payments.min.css" rel="stylesheet"/>    	
        <link href="css/tabler-vendors.min.css" rel="stylesheet"/>    	
        <link href="css/demo.min.css" rel="stylesheet"/>		
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@tabler/icons-webfont@latest/tabler-icons.min.css" />  	
    </head>  	
    <body  class=" d-flex flex-column">				
        <script src="js/demo-theme.min6a55.js?1695847769"></script>    	
        <div class="page page-center">      	
            <div class="container container-normal py-4">        	
                <div class="row align-items-center g-4">          		
                    <div class="col-lg">            		
                        <div class="container-tight">              			
                            <div class="text-center mb-4">                			
                                <a href="index.php" class="navbar-brand navbar-brand-autodark">				
                                    <img src="img/logo.png" height="110" alt="">				
                                </a>              				
                            </div>              			
                            <div class="card card-md">                			
                                <div class="card-body">			
                                    <h2 class="h2 text-center mb-4">				
                                        Login to your Account					
                                    </h2>                  				
                                    <form action="functions.php" method="post" autocomplete="off" novalidate>
										<div class="row">
										<div class="mb-3 col-md-6">                      					
                                            <label class="form-label">First Name</label>                      					
                                            <input type="text" class="form-control" placeholder="Enter Your First Name" name="fname" autocomplete="off" required>                    					
                                        </div>
										<div class="mb-3 col-md-6">                      					
                                            <label class="form-label">Last Name</label>                      					
                                            <input type="text" class="form-control" placeholder="Enter Your Last Name" name="lname" autocomplete="off" required>                    					
                                        </div>
										<div class="mb-3">                      					
                                            <label class="form-label">Phone Number</label>                      					
                                            <input type="text" class="form-control" placeholder="+xx xxx xxx xxxx" name="uphone" autocomplete="off" required>                    					
                                        </div>
                                        <div class="mb-3">                      					
                                            <label class="form-label">Email address</label>                      					
                                            <input type="email" class="form-control" placeholder="your@email.com" name="uemail" autocomplete="off" required>                    					
                                        </div>					
                                        <div class="mb-2">					
                                            <label class="form-label">                        					
                                                Password                        						
                                                <span class="form-label-description">                          						
                                                    <a href="#">I forgot password</a>                        						
                                                </span>                      						
                                            </label>                      					
                                            <div class="input-group input-group-flat">    					
                                                <input type="password" class="form-control" placeholder="Your password" name="upass" autocomplete="off" required>    						
                                                <span class="input-group-text">        						
                                                    <a href="#" class="link-secondary toggle-password" title="Show password" data-bs-toggle="tooltip">            						
                                                        <i class="ti ti-eye"></i>        							
                                                    </a>    						
                                                </span>						
                                            </div>					
                                        </div> 										
										<div class="mb-3">                            
											<label class="form-label">Country</label>                            
											<select class="form-select" name="country_id" required>                                
												<option value="" selected>Select Country</option>
												<?php                                
												$lsql=mysqli_query($connect,"SELECT * FROM `countries`");
												while($lrow = mysqli_fetch_array($lsql)){			
												?>                                
												<option value="<?php echo $lrow['country_id'] ?>">
													<?php echo $lrow['country_name']; ?>                                
												</option>								
												<?php                                
												}                                
												?>                            
											</select>                        
										</div>					
										<div class="mb-2">                      					
                                            <label class="form-check">                        					
                                                <input type="checkbox" class="form-check-input"/>
                                                <span class="form-check-label">Remember me on this device</span>
                                            </label>             					
                                        </div>  
											</div>
                                        <div class="form-footer">                      					
                                            <button type="submit" name="create_user" class="btn btn-primary w-100">					
                                                Create Account					
                                            </button>					
                                        </div>                  					
                                    </form>                				
                                </div>                				
                                <div class="hr-text">or</div>                				
                                <div class="card-body">                  				
                                    <div class="row">									                     				
                                        <div class="text-center text-secondary mt-3">                					
                                            Don't have account yet? 					
                                            <a href="index.php" tabindex="-1">Sign In</a>              					
                                        </div>                  					
                                    </div>                				
                                </div>              				
                            </div>							            			
                        </div>          			
                    </div>          		
                    <div class="col-lg d-none d-lg-block">            		
                        <img src="static/illustrations/undraw_secure_login_pdn4.svg" height="300" class="d-block mx-auto" alt="">
                    </div>        		
                </div>      		
            </div>    	
        </div>	        	
        <script src="js/tabler.min.js" defer></script>    	
        <script src="js/demo.min.js" defer></script>	  	
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>	
        <script>	    
			$(document).ready(function() {            
				$('.toggle-password').click(function() {        	        
					$(this).toggleClass('active');        	        
					var input = $($(this).closest('.input-group').find('input'));        	        
					if (input.attr('type') == 'password') {	            
						input.attr('type', 'text');        	        
					} else {            	            
						input.attr('type', 'password');        	        
					}    	    
				});    
			});        
		</script>  	
    </body>
</html>