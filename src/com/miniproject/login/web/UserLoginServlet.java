package com.miniproject.login.web;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import com.miniproject.login.bean.UserLoginBean;
import com.miniproject.login.dao.UserLoginDao;

/**
 * Servlet implementation class UserLoginServlet
 */
@WebServlet("/UserLoginServlet")
public class UserLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		UserLoginDao loginDao = new UserLoginDao();

		String username = request.getParameter("username");
		String password = request.getParameter("password");

		//UserLoginBean loginBean = new UserLoginBean();

		//loginBean.setUsername(username);
		//loginBean.setPassword(password);

		if (loginDao.check(username, password))
		{
			response.sendRedirect("user_home_page.jsp");
			
		}
		else 
		{
			
			response.sendRedirect("user_login.jsp?msg=invalid");
			
		}
	}

}
