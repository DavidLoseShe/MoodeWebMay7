<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>

		<pre> 
            详细数据如下：
      </pre>

<%
	try{
		ResultSet rs=null;
		rs=(ResultSet)request.getAttribute("rs");
%>
	<div id="uu">
	<table width="500" style="border-collapse: collapse;" align="center"
		border="1">
		<tr>
			<td>年级</td>
			<td>文件名</td>
			<td>上传人</td>
			<td>上传时间</td>
			<td style="border-style:none"></td>
		</tr>
<%
		while(rs.next())
		{
%>
		<tr><td width="50"><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
		<td><%=rs.getString(4) %></td>
		<td><%=rs.getString(5) %></td>
		<!-- <a href = "shopping?flag =delete&goodId= >  -->
		      <td >        <% String filename=rs.getString(6);%>     <a href="down?filename=<%=new String(filename.getBytes(),"gbk")%>">下载</a></td></tr>	
<%
	}
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	
%>
	</table>
	</div>
</body>
</html>