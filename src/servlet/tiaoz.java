package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import user.userInformation;

public class tiaoz extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public tiaoz() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8"); 
		String username=request.getParameter("userName");
	
		String password=request.getParameter("pass");
		userInformation user= new userInformation();
		 Boolean st=user.selectUser(username, password);
		 if(st){	
		HttpSession session = request.getSession(); 
		session.setAttribute("username", username);
		 response.sendRedirect("/gh/select?fla=1");
		 }
		 else
            {
			RequestDispatcher requestDispatcher=request.getRequestDispatcher("/Fail.jsp");
            requestDispatcher.forward(request,response);
            }
		/*request.getRequestDispatcher("/select").forward(request,response);*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
