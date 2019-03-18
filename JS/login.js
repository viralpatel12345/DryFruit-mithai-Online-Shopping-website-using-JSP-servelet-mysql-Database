
          $(document).ready(function()
          { 
                $("#ip_username").focusin(function (){
                      $(".fa-user").css("color","#475c9b");
                });
                $("#ip_username").focusout(function (){
                     $(".fa-user").css("color","#b6bab8");
                
                });
                $("#ip_password").focusin(function (){
                    $(".fa-key").css("color","#475c9b");  
                });
                $("#ip_password").focusout(function (){
                    $(".fa-key").css("color","#b6bab8");  
                });
                
                $("#err").delay(5000).fadeOut(1200);
                $("#success").delay(5000).fadeOut(1200);
                $("#btn_submit").prop('disabled',true);
                
               // $("hr").delay(30).animate({width:"99%"},"slow");
                $("hr").css("border","1.5px solid #dadddc");
                
                 $(':input').keyup(function()
                 {
                         if($("#ip_username").val() !=='' &&  $("#ip_password").val() !=='')
                         {
                               $("#btn_submit").prop('disabled',false);
                         }
                         else
                         {
                               $("#btn_submit").prop('disabled',true);   
                         }      
                    });   
           });

 function change()
        {
            document.getElementById("sign-in-icon").className="fa fa-circle-o-notch fa-spin";
        }