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
						<form action="Save" method="post" enctype="multipart/form-data">
		<table align="center">
			<tr>

				<td>文件名: <input type="file" name="Text" size="20"></td>
			</tr>
			<tr>
				<td><input type="submit" value="上传" name="res"></td>
			</tr>
		</table>
	</form>
				</div>
			</div>
		<div id="foot">@copyright guhao</div>
	</div>
</body>
</html>