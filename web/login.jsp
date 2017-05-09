<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="java.net.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;utf-8">
<link rel="stylesheet" type="text/css" href="style/login.css" />
<title>Insert title here</title>
</head>
<body>
	<%-- <%request.setAttribute("states", true); System.out.print("14654654");%> --%>
	<div id="mainContent">
		<div id="header"></div>
		<div id="content">
				<div id="formT">
					<form name="loginForm" method="post" action="tiaoz">
						<table align="center" width="300" height="200" border="0">
							<tr>
								<td colspan="2" align="center"><font size="+2">登录</font></td>
							</tr>
							<tr>
								<td><font size="+2">用户名：</font></td>
								<td><input type="text" name="userName" size="20" value=""
									style="width: 160px; height: 20px;" /></td>

							</tr>
							<tr>
								<td><font size="+2">密码：</font></td>
								<td><input type="password" name="pass" size="20" value=""
									style="width: 160px; height: 20px;" /></td>
							</tr>

							<tr>
								<td align="center" colspan="2"><input type="submit"
									value="登录" id ="button">&nbsp;&nbsp; &nbsp; <input type="button"
									value="注册" onclick="javascript:window.location.href='http://localhost:8080/gh/zhuce.jsp'" id="button"/></td>

							</tr>
						</table>
					</form>
				</div>
			</div>
		<div id="foot">@copyright guhao</div>
	</div>
</body>
</html>