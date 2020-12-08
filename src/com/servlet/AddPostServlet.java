package com.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.db.Postdb;
import com.entities.Post;
import com.entities.User;
import com.helper.Helper;
import com.helper.connection;

/**
 * Servlet implementation class AddPostServlet
 */

@WebServlet("/AddPostServlet")

public class AddPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddPostServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		
		try(PrintWriter out=response.getWriter())
		{
			int cid=Integer.parseInt(request.getParameter("cid"));
			String pTitle=request.getParameter("pTitle");
			String pContent=request.getParameter("pContent");
			String pCode=request.getParameter("pCode");
			Part part=request.getPart("pPic");
		
			// getting currentuser id..
			
			HttpSession session=request.getSession();
			User user=(User) session.getAttribute("currentuser");
			
	    	out.print("your post title is:"+ pTitle);
			out.println(part.getSubmittedFileName());
			
			Post p=new Post(pTitle,pContent,pCode,part.getSubmittedFileName(), null,cid,user.getId());
			Postdb db=new Postdb(connection.getConnection());
			if(db.savePost(p))
			{
				String path=request.getParameter("/")+"blogpics"+File.separator+ part.getSubmittedFileName();
				
				System.out.print("done");
				Helper.saveFile(part.getInputStream(),path);
				out.print("done");
			}
			else
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
		doGet(request, response);
	}

}
