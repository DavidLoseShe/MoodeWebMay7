package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import user.jilu;
import user.userInformation;
import user.users;


public class select extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public select() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8"); 
		String sql="";
		String sqlm="";
		String sqle="";
		String sqlc="";
		String sqlw="";
		Statement stmt = null;
        ResultSet rsc =null;
        HttpSession session = request.getSession(); 
        
        try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			String url="jdbc:mysql://localhost/down";
			
			Connection dbcon=DriverManager.getConnection(url, "root", "123456");
			stmt = dbcon.createStatement();
			sql="select kind,class,id,people, time,name from content order by time desc ";
			sqlm="select kind,class,id,people, time,name from content where class='大一' order by time desc ";
			sqle="select kind,class,id,people, time,name from content where class='大二' order by time desc ";
			sqlc="select kind,class,id,people, time,name from content where class='大三' order by time desc ";
			sqlw="select kind,class,id,people, time,name from content where class='大四' order by time desc ";
			if(request.getParameter("fla").equals("1"))
			rsc=stmt.executeQuery(sql);
			else if(request.getParameter("fla").equals("2"))
			rsc=stmt.executeQuery(sqlm);
			else if(request.getParameter("fla").equals("3"))
				rsc=stmt.executeQuery(sqle);
			else if(request.getParameter("fla").equals("4"))
				rsc=stmt.executeQuery(sqlc);
			else if(request.getParameter("fla").equals("5"))
				rsc=stmt.executeQuery(sqlw);
			request.setAttribute("rs",rsc);

			
		} catch (SQLException | InstantiationException | IllegalAccessException | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		userInformation user = new userInformation();
		users u= new users();
		String name=(String) session.getAttribute("username");
			u=user.selectUserInf(name);
			session.setAttribute("class", u.getClass1());
		request.setAttribute("u",u);
		
		ResultSet j=null;
		j=user.selectjilu();
		request.setAttribute("jilu", j);
		
		RequestDispatcher requestDispatcher=request.getRequestDispatcher("/index.jsp");
		requestDispatcher.forward(request,response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
