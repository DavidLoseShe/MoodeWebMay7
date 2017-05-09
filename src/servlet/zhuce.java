package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class zhuce extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public zhuce() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8"); 
		
		String username=request.getParameter("account");
		String password=request.getParameter("pass");
		String password1=request.getParameter("pass1");
		String sex=request.getParameter("sex");
		String Clas=request.getParameter("class");
		String like=request.getParameter("like");
		String personal=request.getParameter("personal");
		
		String sql="";
		String sql1="";
		Statement stmt = null;
		Statement stmt1 = null;
		ResultSet rs=null;
		Boolean states =true;
        
	try{	
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		//Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		String url="jdbc:mysql://localhost/down";
		Connection dbcon=DriverManager.getConnection(url, "root", "123456");
        
		stmt1=dbcon.createStatement();
		sql="select username from user where username='"+username+"'";
		rs=stmt1.executeQuery(sql);
		while(rs.next()){
			states =false;
		}
		if(states){
		stmt = dbcon.createStatement();
		sql1="insert into user values('"+username+"','"+password+"','"+Clas+"','"+sex+"','"+personal+"','"+like+"')";
		stmt.executeUpdate(sql1);
       
	    RequestDispatcher requestDispatcher=request.getRequestDispatcher("/success.jsp");
		requestDispatcher.forward(request,response);
/*		request.getRequestDispatcher("/select").forward(request,response);*/
		// response.sendRedirect("/gh/select?fla=1");
		}
		else{
			RequestDispatcher requestDispatcher=request.getRequestDispatcher("/faill.jsp");
			requestDispatcher.forward(request,response);
		}
	}

		catch (Exception e) 
		{ 
		      e.printStackTrace(); 

		}
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
