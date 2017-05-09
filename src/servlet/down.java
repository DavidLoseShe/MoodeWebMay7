package servlet;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspsmart.upload.SmartUpload;

public class down extends HttpServlet
{
private static final long serialVersionUID = 1L;
public down()
{
super();
}
public void destroy()
{
super.destroy(); 
}
public void doGet(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException
{
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8"); 
response.setContentType("text/html");
request.setCharacterEncoding("GBK");
// 新建一个SmartUpload对象
SmartUpload su = new SmartUpload();
//String name=new String(request.getParameter("name").getBytes("ISO-8859-1"));
// 初始化
su.initialize(this.getServletConfig(),request,response);
su.setContentDisposition(null);//如果要实现单击在浏览器打开,注释该即可.
// 下载文件
try
{
//System.out.print(name);
su.downloadFile(request.getParameter("filename"));//目录根据实际改变
}
catch(Exception e)
{
System.out.println(e);
}
}
}