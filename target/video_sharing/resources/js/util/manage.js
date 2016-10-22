/**************************************************
 * dom-drag.js
 * 09.25.2001
 * www.youngpup.net
 * Script featured on Dynamic Drive (http://www.dynamicdrive.com) 12.08.2005
 **************************************************
 * 10.28.2001 - fixed minor bug where events
 * sometimes fired off the handle, not the root.
 **************************************************/
function pageWidth(){
    return window.innerWidth != null ? window.innerWidth : document.documentElement && document.documentElement.clientWidth ? document.documentElement.clientWidth : document.body != null ? document.body.clientWidth : null;
}
function fBigDiv(){
	var sWidth = "100%";
	var sHeight = document.body.clientHeight > window.screen.availHeight?document.body.clientHeight:window.screen.availHeight;
	var div = document.createElement("div");
	div.setAttribute("id","BigDiv");
	div.style.width = sWidth;
	div.style.height = sHeight + "px";
	div.style.position = "absolute";	
	div.style.top = "0px";
	div.style.left = "0px";
	div.style.zIndex = 5000;
	div.style.backgroundColor = "#777"
	div.style.filter = "Alpha(opacity=60)";
    div.style.opacity = "0.6";
	document.body.appendChild(div);
	var sMyDiv =document.getElementById("MyDiv");
	sMyDiv.style.top = "100px";
	sMyDiv.style.left = "200px";
	sMyDiv.style.display = "block";
}

window.onload=function(){
	document.getElementById("button1").onclick = function(){
		fBigDiv();
	}
	document.getElementById("button2").onclick = function(){
		document.getElementById("MyDiv").style.display="none";
		document.body.removeChild(BigDiv);
	}
}
