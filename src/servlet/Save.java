package servlet;

import java.io.IOException;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jspsmart.upload.SmartUpload;

/**
 * Servlet implementation class Save
 */

public class Save extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Save() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8"); 
		HttpSession session = request.getSession(); 
		try
		{

		//首先把文件上传至服务器
			//request.setCharacterEncoding("utf-8");
			

		  SmartUpload mySmartUpload = new SmartUpload();
		  mySmartUpload.initialize(this.getServletConfig(),request,response);
		  // mySmartUpload.service(request,response); 
		   mySmartUpload.upload(); 

		   String fileName=mySmartUpload.getFiles().getFile(0).getFileName();
		   mySmartUpload.save("D:/down/"); 
		   
		 //String fileName=new String(fileN.getBytes("ISO-8859-1"),"utf-8");
		  fileName=new String(fileName.getBytes(),"utf-8");
		      
		//存入数据库
		   
		  String filepath="D:/down/"+fileName;
		  String id =fileName;
		  String people=(String)session.getAttribute("username");
          String Class1=(String)session.getAttribute("class");
          String kind =request.getParameter("kind");
          System.out.print(kind);
		   //Date date=new Date(); "java.util.*"和java.sql.*两个包里都有date类，所以必须指定
		   java.util.Date date = new java.util.Date();

		   String time="";
		   SimpleDateFormat s = new SimpleDateFormat("YYYYMMddHHmmss"); 
		   time=s.format(date);//DATE型转换为String类型

		//连接数据库： 
		String sql="";
		String sql1="";
		Statement stmt = null;
        
		
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		//Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		String url="jdbc:mysql://localhost/down";
		Connection dbcon=DriverManager.getConnection(url, "root", "123456");

		stmt = dbcon.createStatement();
		sql="insert into content (id,Class,name,people,time,kind)  values ('"+id+"','"+Class1+"','"+filepath+"','"+people+"','"+time+"','"+kind+"')";
		sql1="insert into jilu(name,time,kind,bookn) values('"+people+"','"+time+"','"+Class1+"','"+id+"')";
		stmt.executeUpdate(sql);
		stmt.executeUpdate(sql1);

/*		RequestDispatcher requestDispatcher=request.getRequestDispatcher("/index.jsp");
		requestDispatcher.forward(request,response);*/
/*		request.getRequestDispatcher("/select").forward(request,response);*/
		 response.sendRedirect("/gh/select?fla=1");
		}

		catch (Exception e) 
		{ 
		      e.printStackTrace(); 

		}
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			   throws ServletException, IOException {
			  doGet(req,resp);
			 }


}
