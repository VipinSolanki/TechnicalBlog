package com.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.db.UserDb;
import com.entities.Message;
import com.entities.User;
import com.helper.Helper;
import com.helper.connection;

/**
 * Servlet implementation class EditServlet
 */
@MultipartConfig
@WebServlet("/EditServlet")
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
	    //  fetch all data...
		
		String userEmail=request.getParameter("user_email");
		String userName=request.getParameter("user_name");
		String userPassword=request.getParameter("user_password");
		String userGender=request.getParameter("user_gender");
	    Part part=request.getPart("image");
		String imageName=part.getSubmittedFileName();
		
		//get user from the session...
		
		HttpSession s=request.getSession();
		User user=(User)s.getAttribute("currentuser");
		
		user.setEmail(userEmail);
		user.setName(userName);
		user.setPassword(userPassword);
		user.setGender(userGender);
		String oldFile=user.getProfile();
		user.setProfile(imageName);

        //update db...
		
		UserDb userDb=new UserDb(connection.getConnection());
		
		boolean ans=userDb.updateUser(user);
	     if(ans)
	    	 
	   /*  {
	    	 out.println("Data updated succesfully...");	    	 
	     }*/
		{		
			String path=request.getParameter("/")+"pics"+File.separator+user.getProfile();
		
		//	Delete code...
			
			String pathOldFile=request.getParameter("/")+"pics"+File.separator+ oldFile;
			
			//if(!oldFile.equals("default.png"))
			
			//	Helper.deleteFile(pathOldFile);
				{
				if(Helper.saveFile(part.getInputStream(), path))
				{
					out.println("Data update succesfully...");
					   Message msg =new Message("Profile update..","success","alert-success");
	       			    s.setAttribute("msg", msg);
				}
				else
				{
				    out.println("not");
				    Message msg =new Message("Data updated succesfully...","error","alert-danger");
           		
	       		
	       			s.setAttribute("msg", msg);
				}
			}
		}
	     else
	     {
	    	 out.println("Oops!Something went wrong...");
	      }
	         response.sendRedirect("profile.jsp");       
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
