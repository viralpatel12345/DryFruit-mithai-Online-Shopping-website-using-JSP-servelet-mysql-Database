        $(document).ready(function (){
          
            var x=false;
            var y=false;
            var z=false;
            var w=false;
            var p=false;
            var q=false;
            var r=false;
            var s=false;
            var t=false;
            
            $("#select-style").tooltip({ html: true , placement: "top"   ,title: "Gender"  }) ;  
        
            $("#btn_submit").hide();
            $("#error").hide();
            $("#error1").hide();
            
            $("#ip_fname").keyup(function(){
               
                  var fname=$.trim($(this).val());
                  var pattern=/^[A-Za-z ]{2,40}$/;
                  if(!pattern.test(fname))
                  {
                      s=false;
                      $(this).css('border','1px solid red');
                      $("#btn_submit").hide();       
                  }
                  else
                  {
                      $(this).css('border','1px solid green');
                      s=true;
                      if(x===true && y===true && z===true && w===true && p===true && q===true && r===true && r===true && s===true && t===true)
                      {
                        $("#btn_submit").show();
                      }
                  }                  
            });
            
            $("#ip_lname").keyup(function(){
               
                  var lname=$.trim($(this).val());
                  var pattern=/^[A-Za-z ]{2,40}$/;
                  if(!pattern.test(lname))
                  {
                      t=false;
                      $(this).css('border','1px solid red');
                      $("#btn_submit").hide();       
                  }
                  else
                  {
                      $(this).css('border','1px solid green');
                      t=true;
                      if(x===true && y===true && z===true && w===true && p===true && q===true && r===true && r===true && s===true && t===true)
                      {
                        $("#btn_submit").show();
                      }
                  }                  
            });
        
            $("#ip_age").keyup(function(){
               
                  var age=$.trim($(this).val());
                  var pattern=/^0*[1-9][0-9]$/;
                  if(!pattern.test(age))
                  {
                      r=false;
                      $(this).css('border','1px solid red');
                      $("#btn_submit").hide();       
                  }
                  else
                  {
                      $(this).css('border','1px solid green');
                      r=true;
                      if(x===true && y===true && z===true && w===true && p===true && q===true && r===true && r===true && s===true && t===true)
                      {
                        $("#btn_submit").show();
                      }
                  }                  
             });
            
            $("#ip_email").keyup(function()
            {
                var email=$.trim($(this).val());
                var pattern=/^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
                if(!pattern.test(email))
                {
                    x=false;
                    $(this).css('border','1px solid red');
                    $("#btn_submit").hide();
                    
                }
                
                else
                {
                    $(this).css('border','1px solid green');
                    x=true;
                    if(x===true && y===true && z===true && w===true && p===true && q===true && r===true && s===true && t===true)
                    {
                        $("#btn_submit").show();
                    }
                }
            });
            
            $("#ip_mobile").keyup(function(){
               
                 var mobile=$.trim($(this).val());
                 var pattern=/^[6-9]\d{9}$/;
                 if(!pattern.test(mobile))
                 {
                    y=false; 
                    $(this).css('border','1px solid red');
                    $("#btn_submit").hide();
                 }
                
                else
                {
                    $(this).css('border','1px solid green');
                    y=true;
                    if(x===true && y===true && z===true&& w===true && p===true && q===true && r===true && s===true && t===true)
                    {
                        $("#btn_submit").show();
                    }
                }    
             });
            
            $("#ip_alt_mobile").keyup(function(){
               
                 var alt_mobile=$.trim($(this).val());
                 var pattern=/^[6-9]\d{9}$/;              
                 if(!pattern.test(alt_mobile))
                 {
                    z=false; 
                    $(this).css('border','1px solid red');
                    $("#btn_submit").hide();
                 }
                
                else
                {
                    $(this).css('border','1px solid green');
                    z=true;
                    if(x===true && y===true && z===true && w===true && p===true && q===true && r===true && s===true && t===true)
                    {
                        $("#btn_submit").show();
                    }
                }    
                    
            });
            
            $("#ip_username").keyup(function(){
               
                  var username=$.trim($(this).val());
                  var pattern=/^[a-zA-Z0-9]{8,16}$/;
                  if(!pattern.test(username))
                  {
                      w=false;
                      $(this).css('border','1px solid red');
                      $("#btn_submit").hide();
                      $("#error").html("Username should contain minimum 8 and maximum 16 characters including numbers. Special characters are strictly not allowed.").show();
                
                   }
                
                else
                {
                    $("#error").hide();
                    $(this).css('border','1px solid green');
                    w=true;
                    if(x===true && y===true && z===true && w===true && p===true && q===true && r===true && s===true && t===true)
                    {
                        $("#btn_submit").show();
                    }
                }      
                   
           });
            
           $("#ip_password").keyup(function(){
               
                  var password=$.trim($(this).val());
                  var pattern=/^[A-Za-z0-9]{8,16}$/;
                  if(!pattern.test(password))
                  {
                      p=false;
                      $(this).css('border','1px solid red');
                      $("#btn_submit").hide();
                      $("#error").html("Password should contain minimum 8 and maximum 16 characters including numbers. Special characters are strictly not allowed.").show();            
                  }
                
                else
                {
                    $("#error").hide();
                    $(this).css('border','1px solid green');
                    p=true;
                    if(x===true && y===true && z===true && w===true && p===true && q===true && r===true && s===true && t===true)
                    {
                        $("#btn_submit").show();
                    }
                }      
                   
            });
            
            $("#ip_address").keyup(function(){
               
                  var address=$.trim($(this).val());
                  var pattern=/^[A-Za-z0-9'\.\-\s\,\/]{30,180}$/;
                  if(!pattern.test(address))
                  {
                      q=false;
                      $(this).css('border','1px solid red');
                      $("#btn_submit").hide();
                      $("#error1").html("Address must contain minimum 30 and maximum 180 characters.").show();            
                  }
                
                else
                {
                    $("#error1").hide();
                    $(this).css('border','1px solid green');
                    q=true;
                    if(x===true && y===true && z===true && w===true && p===true && q===true && r===true && s===true && t===true)
                    {
                        $("#btn_submit").show();
                    }
                }                  
            });
          
        });
