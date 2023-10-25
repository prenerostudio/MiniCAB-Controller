<!doctype html>
<html lang="en">  
	<head>    
		<meta charset="utf-8"/>    
		<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover"/>    
		<meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    
		<title>Sign in - Mini Cab Taxi Dispatch System.</title>
	
		<script defer data-api="/stats/api/event" data-domain="preview.tabler.io" src="stats/js/script.js"></script>
    	
		<meta name="msapplication-TileColor" content="#0054a6"/>    
		<meta name="theme-color" content="#0054a6"/>    
		<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent"/>    
		<meta name="apple-mobile-web-app-capable" content="yes"/>    
		<meta name="mobile-web-app-capable" content="yes"/>    
		<meta name="HandheldFriendly" content="True"/>    
		<meta name="MobileOptimized" content="320"/>
   	
		<link rel="icon" href="favicon.ico" type="image/x-icon"/>    
		<link rel="shortcut icon" href="favicon.ico" type="image/x-icon"/>       
		<!-- CSS files -->    
		<link href="css/tabler.min.css" rel="stylesheet"/>    
		<link href="css/tabler-flags.min.css" rel="stylesheet"/>    
		<link href="css/tabler-payments.min.css" rel="stylesheet"/>    
		<link href="css/tabler-vendors.min.css" rel="stylesheet"/>    
		<link href="css/demo.min.css" rel="stylesheet"/>		  
	</head>  
	<body  class=" d-flex flex-column">        
		<div class="page page-center">      
			<div class="container container-tight py-4">        
				<div class="text-center mb-4">          
					<a href="index.php" class="navbar-brand navbar-brand-autodark">            
						<img src="img/logo.png" width="170"  alt="Minicab" class="navbar-brand-image">          
					</a>        
				</div>        
				<div class="card card-md">          
					<div class="card-body">            
						<h2 class="h2 text-center mb-4">Login to your account</h2>            
						<form action="functions.php" method="post" autocomplete="off" novalidate>              
							<div class="mb-3">                
								<label class="form-label">Email address</label>                
								<input type="email" class="form-control" placeholder="your@email.com" name="email" autocomplete="off">              
							</div>              
							<div class="mb-2">                
								<label class="form-label">                  
									Password                  
									<span class="form-label-description">                    
										<a href="#">I forgot password</a>                  
									</span>                
								</label>                
								<div class="input-group input-group-flat">                  
									<input type="password" class="form-control"  placeholder="Your password" name="password"  autocomplete="off">				                
								</div>              
							</div>              
							<div class="mb-2">                
								<label class="form-check">                  
									<input type="checkbox" class="form-check-input"/>                  
									<span class="form-check-label">Remember me on this device</span>                
								</label>              
							</div>              
							<div class="form-footer">                
								<button type="submit" class="btn btn-primary w-100" name="login_user">Sign in</button>              
							</div>            
						</form>          
					</div>          
					<div class="hr-text"> </div>					        
				</div>        
				<div class="text-center text-secondary mt-3">          
					Don't have account yet? <a href="#" tabindex="-1">Sign up</a>        
				</div>      
			</div>    
		</div>        
		<script src="js/tabler.min.js" defer></script>    
		<script src="js/demo.min.js" defer></script>  
	</body>	
</html>