<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="com.jspsmart.upload.*" %>
<%@ page import="java.sql.*,java.io.*"%>
<%@ page import="java.text.*"%>

<jsp:useBean id="mySmartUpload" scope="page" class="com.jspsmart.upload.SmartUpload"/>

<%
String path = request.getContextPath();
//request.getScheme()���ص�Э������.Ĭ����http,request.getServerName()���ǻ�ȡ�����վ��������������ڱ��صĻ�����localhost��request.getServerPort()  ����Ӧ��ʹ�õĶ˿ڣ�����8080����80  �ȵ�

String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
<body>
<%
try
{

//���Ȱ��ļ��ϴ���������

  // SmartUpload mySmartUpload = new SmartUpload();
   mySmartUpload.initialize(pageContext); 
   mySmartUpload.service(request,response); 
   mySmartUpload.upload(); 
   mySmartUpload.getFiles().getFile(0).getFieldName();

   String fn=mySmartUpload.getFiles().getFile(0).getFileName();
   
   mySmartUpload.getFiles().getFile(1).getFieldName(); 
   
    String fn2=mySmartUpload.getFiles().getFile(1).getFileName();

   mySmartUpload.save("D:/down/"); 
   out.print("��ϲ�����ļ��ϴ����������ɹ�����");
      
//�������ݿ�
   
   String filepath="D:/down/"+fn+"";
   String filepath2="D:/down/"+fn2+"";

   //Date date=new Date(); "java.util.*"��java.sql.*�������ﶼ��date�࣬���Ա���ָ��
   java.util.Date date = new java.util.Date();

   String time="";
   SimpleDateFormat s = new SimpleDateFormat("yyyyMMddHHmmss"); 
   time=s.format(date);//DATE��ת��ΪString����

//�������ݿ⣺ 
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
out.print("��ϲ�����ļ���Ϣ���浽���ݿ�ɹ�����");
}

catch (Exception e) 
{ 
      e.printStackTrace(); 
      out.print(e);
}

%>

</body>
</html>