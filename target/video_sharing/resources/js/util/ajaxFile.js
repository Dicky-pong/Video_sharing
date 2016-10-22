/**
 * 
 */
setTimeout(function(){
	
	$.ajaxSetup({
		 contentType:"application/x-www-form-urlencoded;charset=utf-8",   
		 complete:function(XMLHttpRequest,date){
			 if(XMLHttpRequest.status==68001){
				 window.location.href = webRoot;
			 };
		 }
	});
	
},1000)
