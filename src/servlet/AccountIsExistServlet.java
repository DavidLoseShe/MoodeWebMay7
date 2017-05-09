package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AccountIsExistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */

        protected void doGet(HttpServletRequest request,
                HttpServletResponse response) throws ServletException, IOException {
            // 阻止缓存
            response.setContentType("text/xml");
            response.setHeader("Cache-Control", "no-store"); // HTTP1.1
            response.setHeader("Pragma", "no-cache"); // HTTP1.0
            response.setDateHeader("Expires", 0); // prevents catching at proxy
            response.setCharacterEncoding("UTF-8");                                     // server
     
            PrintWriter out = response.getWriter();
             
            //js传过来的汉字进行转码，避免汉字的时候会出现乱码
            String account = request.getParameter("account");

    		String sql="";
 
    		Statement stmt1 = null;
    		ResultSet rs=null;
    		Boolean states =true;
            
    	try{	
    		Class.forName("com.mysql.jdbc.Driver").newInstance();
    		//Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
    		String url="jdbc:mysql://localhost/down";
    		Connection dbcon=DriverManager.getConnection(url, "root", "123456");
    		stmt1=dbcon.createStatement();
    		sql="select username from user where username='"+account+"'";
    		rs=stmt1.executeQuery(sql);
    		while(rs.next()){
    			states =false;
    		}
            if (!states) {
                out.print("用户名已存在，请重新输入。");
            }
        
     
    }catch (Exception e) 
		{ 
	      e.printStackTrace(); 

	}
        }


}
