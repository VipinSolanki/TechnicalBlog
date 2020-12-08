package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.db.UserDb;

import com.entities.User;
import com.helper.connection;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings({ })
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
			String check=request.getParameter("check");
			
		if(check==null)
		{
			out.print("Box not checked");
		}
		else
		{
			
			String name=request.getParameter("user_name");
			String email=request.getParameter("user_email");
			String password=request.getParameter("user_password");
			String gender=request.getParameter("gender");
		
			//create user object and set all data to that object...
			User user=new User(name,email,password,gender);
			
			//create userdb object
			UserDb db=new UserDb(connection.getConnection());
			
			if(db.saveUser(user))
			{
				//done..
				out.print("done");
				
			}else
			{
				out.print("error");
			}
		}
			
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

}
