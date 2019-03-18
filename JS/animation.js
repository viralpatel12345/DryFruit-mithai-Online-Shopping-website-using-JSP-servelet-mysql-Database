var w=document.querySelector("hr");
w.style.width=0+"%";
var c=0;
var x=setInterval(function(){
    if(c<99)
    {
        c++;
       
        w.style.width=c+"%";
        
    }
    else
    {
        clearInterval(x);
    }
    
},8);