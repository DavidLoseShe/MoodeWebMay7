<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="com.jspsmart.upload.*" %>
<%@ page import="java.sql.*,java.io.*"%>
<%@ page import="java.text.*"%>

<jsp:useBean id="mySmartUpload" scope="page" class="com.jspsmart.upload.SmartUpload"/>

<%
String path = request.getContextPath();
//request.getScheme()返回的协议名称.默认是http,request.getServerName()就是获取你的网站的域名，如果是在本地的话就是localhost，request.getServerPort()  是你应用使用的端口，比如8080或者80  等等

String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
<body>
<%
try
{

//首先把文件上传至服务器

  // SmartUpload mySmartUpload = new SmartUpload();
   mySmartUpload.initialize(pageContext); 
   mySmartUpload.service(request,response); 
   mySmartUpload.upload(); 
   mySmartUpload.getFiles().getFile(0).getFieldName();

   String fn=mySmartUpload.getFiles().getFile(0).getFileName();
   
   mySmartUpload.getFiles().getFile(1).getFieldName(); 
   
    String fn2=mySmartUpload.getFiles().getFile(1).getFileName();

   mySmartUpload.save("D:/down/"); 
   out.print("恭喜您，文件上传到服务器成功……");
      
//存入数据库
   
   String filepath="D:/down/"+fn+"";
   String filepath2="D:/down/"+fn2+"";

   //Date date=new Date(); "java.util.*"和java.sql.*两个包里都有date类，所以必须指定
   java.util.Date date = new java.util.Date();

   String time="";
   SimpleDateFormat s = new SimpleDateFormat("yyyyMMddHHmmss"); 
   time=s.format(date);//DATE型转换为String类型

//连接数据库： 
String sql="";
Statement stmt = null;
ResultSet rs = null;

Class.forName("com.mysql.jdbc.Driver").newInstance();
//Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
String url="jdbc:mysql://localhost/down";
Connection dbcon=DriverManager.getConnection(url, "root", "123456");

stmt = dbcon.createStatement();
sql="insert into content (name,people)  values ('"+filepath+"','"+filepath2+"')";
stmt.executeUpdate(sql);

out.print("<p>");
out.print("恭喜您，文件信息保存到数据库成功……");
}

catch (Exception e) 
{ 
      e.printStackTrace(); 
      out.print(e);
}

%>

</body>
</html>