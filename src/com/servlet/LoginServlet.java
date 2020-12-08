 package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.db.UserDb;
import com.entities.Message;
import com.entities.User;
import com.helper.connection;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		//	fetch username and password from request
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
			
		
	   String userEmail=request.getParameter("email");
	   String userPassword=request.getParameter("password");
	   
	   UserDb db=new UserDb(connection.getConnection());
	   
	   User u=db.getUserByEmailAndPassword(userEmail,userPassword);
	   
	   if(u==null)
	   {
		 // Login Error...
	//	out.println("Invalid details");   
		  
		
		   Message msg =new Message("Invalid details","error","alert-danger");
           response.sendRedirect("Login.jsp");
	       HttpSession s=request.getSession();
	       s.setAttribute("msg", msg);
	   }
	   else
	   {
		   //Login Success...
		   HttpSession s=request.getSession();
		   s.setAttribute("currentuser",u);
		   response.sendRedirect("profile.jsp");

	   }
	   

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
	   
	   
	   
	}

}
