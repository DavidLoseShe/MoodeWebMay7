<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="java.net.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;utf-8">
<link rel="stylesheet" type="text/css" href="style/zhuce.css" />

<script type="text/javascript">
    function init(){
        document.getElementById("username").focus();
    }
    function validate(userfield) {
        if (userfield.value) {
            var xmlHttpRequest = null;
            var url = "http://localhost:8080/gh/AccountIsExistServlet?account=" + userfield.value;
            var usermsg = document.getElementById("usermsg");
            if (window.XMLHttpRequest) {//表示当前浏览器不是IE
                xmlHttpRequest = new XMLHttpRequest();
            } else if (window.ActiveXObject) {
                xmlHttpRequest = new ActiveXObject("Microsoft.XMLHTTP");
            }
            xmlHttpRequest.open("GET", url, true);//设置请求方式为GET，设置请求的URL，设置为异步提交
            xmlHttpRequest.onreadystatechange = function(){//将方法地址复制给onreadystatechange属性
                if(xmlHttpRequest.readyState == 4){//Ajax引擎状态为成功
                    if(xmlHttpRequest.status == 200){//HTTP协议状态为成功
                        if(xmlHttpRequest.responseText){
                            usermsg.innerHTML = "<font color='red'>" + xmlHttpRequest.responseText.toString() + "</font>";
                           // userfield.focus();
                           document.getElementById("zhucee").disabled=true;
                        }else{
                            usermsg.innerHTML = "恭喜您，用户名可以使用。 ";
                           document.getElementById("zhucee").disabled=false;
                        }
                    }else{
                        alert("请求失败，错误码=" + xmlHttp.status);
                    }
                }
            };
            xmlHttpRequest.send(null);//将设置信息发送到Ajax引擎
        }else{
            usermsg.innerHTML = "12";
        }
    }

    function validate1() {
       var pw=document.loginForm.pass.value;
       var pw1=document.loginForm.pass1.value;
       if(pw==pw1){
    	   document.getElementById("passmsg").innerHTML="<font color='green'>两次密码一致</font>";
    	   document.getElementById("zhucee").disabled=false;
       }
       else  {
    	   document.getElementById("passmsg").innerHTML="<font color='red'>两次密码不一致</font>";
           document.getElementById("zhucee").disabled=true;
       }
    }
</script>
<title>Insert title here</title>
</head>
<body>
	<%-- <%request.setAttribute("states", true); System.out.print("14654654");%> --%>
	<div id="mainContent">
		<div id="header"></div>
		<div id="content">
			<div id="formT">
				<form name="loginForm" method="post" action="zhuce">
					<table align="center" width="380px" height="200px" border="0" style="font-size:18px;">
						<tr>
							<td colspan="2" align="center">注册</td>			
						</tr>
						<tr><td>&nbsp;</td></tr>
						<tr>
<!-- 							<td>用户名：</td>
							<td><input type="text" name="userName" size="20" value=""
								style="width: 160px; height: 20px;" /></td> -->
								
								<td><font>用户名：</font></td>
								<td><input type="text" size="20"
									style="width: 160px; height: 20px;" name="account" id="username" onblur="validate(this)" maxlength="12" /></td>
									<td width="100px"><span id="usermsg"></span></td>

						</tr>
						<tr><td>&nbsp;</td></tr>
						<tr>
							<td>密码：</td>
							<td><input type="password" name="pass" size="20" value=""
								style="width: 160px; height: 20px;" id="password" /></td>
						</tr>
						<tr><td>&nbsp;</td></tr>
						<tr>
							<td>确认密码：</td>
							<td><input type="password" name="pass1" size="20" value=""
								style="width: 160px; height: 20px;" id="password1" onblur="validate1()"/></td>
								<td width="100px"><span id="passmsg"></span></td>

						</tr>
						<tr><td>&nbsp;</td></tr>
						<tr>
							<td>性别：</td>
							<td>
								<!-- <input type="text" name="sex" size="20" value=""
								style="width: 160px; height: 20px;" /> --> 
								<select id="sex" name="sex">
									<option value="男">男</option>
									<option value="女">女</option>
							</select>
							</td>

						</tr>
						<tr><td>&nbsp;</td></tr>
						<tr>
							<td>年级：</td>
							<td><!-- input type="text" name="class" size="20" value=""
								style="width: 160px; height: 20px;" /> -->
								<select id="class" name="class">
									<option value="大一">大一</option>
									<option value="大二">大二</option>
									<option value="大三">大三</option>
									<option value="大四">大四</option>
							</select>
								</td>

						</tr>
						<tr><td>&nbsp;</td></tr>
						<tr>
							<td>爱好：</td>
							<td><input type="text" name="like" size="20" value=""
								style="width: 160px; height: 20px;" /></td>

						</tr>
						<tr><td>&nbsp;</td></tr>
						<tr>
							<td>个性签名：</td>
							<td><input type="text" name="personal" size="20" value=""
								style="width: 160px; height: 20px;" /></td>

						</tr>

						<tr>
							<td align="center" colspan="2"><input type="submit"
								value="注册" id="zhucee">
						</tr>
					</table>
				</form>
			</div>
		</div>
		<div id="foot">@copyright guhao</div>
	</div>
</body>
</html>