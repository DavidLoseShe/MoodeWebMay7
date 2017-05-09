<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="user.users" import="user.jilu"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="style/homepage.css" />
<script language="javascript" src="javascriptindex.js">
	
</script>
</head>

<body>
	<div id="mainContent">
		<div id="header">
			<div id="menu">
				<ul class="nav">
					<li><a href="http://localhost:8080/select?fla=1">所有资料</a></li>
					<li><a href="http://localhost:8080/select?fla=2">大一</a></li>
					<li><a href="http://localhost:8080/select?fla=3">大二</a></li>
					<li><a href="http://localhost:8080/select?fla=4">大三</a></li>
					<li><a href="http://localhost:8080/select?fla=5">大四</a></li>
					<li><a href="center2.jsp">上传资料</a></li>
					<li><a href="exit.jsp">退出系统</a></li>
				</ul>
			</div>
		</div>
		<div id="content">
			<div id="left">
				<%
					try {
						ResultSet rs1 = null;
						rs1 = (ResultSet) request.getAttribute("jilu");
				%>
				<div class="title">上传历史记录</div>
				<%
					while (rs1.next()) {
				%>
				<div class="titleimg">
					<div class="titlecontent">
						<%=rs1.getString(1)%>上传了
						<%=rs1.getString(3)%>年级的作业

					</div>
				</div>
				<%
					}
					} catch (Exception e) {
						System.out.println(e.toString());
					}
				%>
			</div>

			<div id="right">
				<div class="rtitle">
					<div class="title">个人信息</div>
					<%
						users u = new users();
						u = (users) request.getAttribute("u");
					%>
					<div class="rtitleimg"></div>
					<div class="rtitlecontent">
						<%=u.getUsername()%><a href="#">:姓名</a>
					</div>
					<div class="rtitleimg"></div>
					<div class="rtitlecontent">
						<%=u.getSex()%><a href="#">:性别</a>
					</div>
					<div class="rtitleimg"></div>
					<div class="rtitlecontent">
						<%=u.getClass1()%><a href="#">:班级</a>
					</div>
					<div class="rtitleimg"></div>
					<div class="rtitlecontent">
						<%=u.getLike()%><a href="#">:爱好</a>
					</div>
					<div class="rtitleimg"></div>
					<div class="rtitlecontent">
						<a href="#">个人签名</a><br/>
						<%=u.getPersonal()%>
					</div>

				</div>
				<div class="rtitle">
					<div class="title">友情链接</div>
					<div id="youqing">
						<ul >
							<li id="nodian"><a href="http://www.ccec.edu.cn/">山东工商学院</a></li>
							<li id="nodian"><a href="http://sdibt.acm.edu.cn/">山东工商学院ACM</a></li>
							<li id="nodian"><a href="http://www.yte.edu.cn/">烟台大学</a></li>
							<li id="nodian"><a href="http://www.baidu.con/">白度一下</a></li>
							<li id="nodian"><a href="http://www.google.com.hk/">谷歌搜索</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div id="center">
				<div class="title">主要内容</div>
				<div id="BigImg">
					<%@include file="center.jsp"%>

					<%--  <jsp:include flush="true"page="center.jsp"></jsp:include> --%>
				</div>
			</div>

		</div>
		<div id="foot">@copyright guhao</div>

	</div>

</body>
</html>
