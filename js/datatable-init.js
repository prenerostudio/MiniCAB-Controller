/*!
* Tabler v1.0.0-beta20 (https://tabler.io)
* @version 1.0.0-beta20
* @link https://tabler.io
* Copyright 2018-2023 The Tabler Authors
* Copyright 2018-2023 codecalm.net Paweł Kuna
* Licensed under MIT (https://github.com/tabler/tabler/blob/master/LICENSE)
*/

$(document).ready(function() {      
    $('#table-active').DataTable({                                          
        dom: 'Bfrtip',                            
        buttons: ['copy', 'csv', 'excel', 'pdf', 'print'],                            
        language: {                    
            emptyTable: "No Driver Found!" // ✅ Handles empty table cleanly                                    
        }                        
    });            


    $('#table-zones').DataTable({                                           
        dom: 'Bfrtip',                            
        buttons: ['copy', 'csv', 'excel', 'pdf', 'print'],                            
        language: {                    
            emptyTable: "No Zone Found!" // ✅ Handles empty table cleanly                                    
        }                        
    });            


    $('#table-pob').DataTable({                                           
        dom: 'Bfrtip',                            
        buttons: ['copy', 'csv', 'excel', 'pdf', 'print'],                            
        language: {                    
            emptyTable: "No Driver Found!" // ✅ Handles empty table cleanly                                    
        }                        
    });            


    $('#table-dashboard').DataTable({                                           
        dom: 'Bfrtip',                            
        buttons: ['copy', 'csv', 'excel', 'pdf', 'print'],                            
        language: {                    
            emptyTable: "No Booking Found!" // ✅ Handles empty table cleanly                                    
        }                        
    });            
});





