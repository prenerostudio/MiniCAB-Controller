<?php
include('header.php');
?>    

<div class="page-header d-print-none">

	<div class="container-xl">    
	
		<div class="row g-2 align-items-center">        
		
			<div class="col">            
			
				<h2 class="page-title">                
				
					Chat                
				
				</h2>              
			
			</div>
		
		</div>
	
	</div>    

</div>


<div class="page-body">

	<div class="container-xl">    
	
		<div class="card">       
		
			 <div class="row g-0">            
        <div class="col-12 col-lg-5 col-xl-3 border-end">                
            <div class="card-header d-none d-md-block">                    
                <div class="input-icon">                      
                    <i class="ti ti-search"></i>                     
                    <input type="text" value="" class="form-control" placeholder="Search…" aria-label="Search" />
                </div>                 
            </div>                 
            <div class="card-body p-0 scrollable" style="max-height: 35rem">                    
                <div class="nav flex-column nav-pills" role="tablist">                      
                    <?php include('user_list.php'); ?> <!-- Include PHP script to fetch and display users -->
                </div>
            </div>
        </div>
        <div class="col-12 col-lg-7 col-xl-9 d-flex flex-column">
            <div class="card-body scrollable" style="height: 35rem">
                <div id="chat-messages">
                    <!-- This section will be populated dynamically with chat messages -->
                </div>
            </div>
            <div class="card-footer">
                <!-- Form for sending messages -->
                <form id="send-message-form" action="send_message.php" method="post">
                    <div class="input-group input-group-flat">
                        <input type="text" name="message" class="form-control" autocomplete="off" placeholder="Type message" />
                        <input type="hidden" name="receiver_id" id="receiver_id" value="" /> <!-- Hidden input to store receiver's ID -->
                        <span class="input-group-text">
                            <button type="submit" class="btn btn-primary">Send</button>
                        </span>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- jQuery Library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- JavaScript for handling user selection and fetching chat messages -->
    <script>
    $(document).ready(function() {
        // Function to fetch and display chat messages
        function fetchMessages(receiverId) {
            $.ajax({
                url: 'chat_messages.php',
                type: 'GET',
                data: { receiver_id: receiverId },
                success: function(response) {
                    $('#chat-messages').html(response);
                },
                error: function(xhr, status, error) {
                    console.error(error);
                }
            });
        }

        // Event listener for user selection
        $('.nav-link').click(function() {
            var receiverId = $(this).data('user-id');
            $('#receiver_id').val(receiverId);
            fetchMessages(receiverId); // Fetch and display chat messages for the selected user
        });

        // Fetch and display initial chat messages for the first user in the list (optional)
        var initialReceiverId = $('.nav-link').first().data('user-id');
        fetchMessages(initialReceiverId);
    });
    </script>
		</div>

	</div>
        
</div>
		  

<?php
include('footer.php');
?>