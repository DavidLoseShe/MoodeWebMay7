// JavaScript Document
var Arraycolor=new Array("#00FF66","#FFFF99","#99CCFF","#FFCCFF","#FFCC99","#00FFFF","#FFFF00","#FFCC00","#FF00FF");
var Arrayimage=new Array("URL(image/left2.jpg)","URL(image/left.jpg)");
var ArrayNum = new Array("1","2","3","4","5","6","7","8","9");
var n=0;
var m=0;
function turncolors(){
	n++;
	m++;
    if (m==(ArrayNum.length)) m=0;
 document.getElementById("BigImg").textContent = ArrayNum[m];
		
	if (n==(Arraycolor.length)) n=0;
//设置页面的背景颜色
 //  document.getElementById("foot").style.backgroundColor="blue"
  // document.getElementById("foot").style.color = "Arraycolor[n]";
	//document.fgColor=Arraycolor[n-1];		//设置页面的文字颜色
	document.getElementById("foot").style.color = Arraycolor[n];
	
	
	setTimeout("turncolors()",1000);
}

