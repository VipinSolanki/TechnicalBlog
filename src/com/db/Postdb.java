package com.db;

import java.sql.*;
import java.util.ArrayList;

import com.entities.Category;
import com.entities.Post;

public class Postdb
{
   public Connection con;

	public Postdb(Connection con)
	{
		this.con=con;
	
	}	
	public ArrayList<Category> getAllCategories()
   	{
		ArrayList<Category> list=new ArrayList<>();   
	
		try
		{
	      Class.forName("com.mysql.jdbc.Driver");
	      Connection con=DriverManager.getConnection("jdbc:mysql://localhost/formdb","root","");
	      String sql="select * from categories";
	      Statement stmt=con.createStatement();
	      ResultSet rs=stmt.executeQuery(sql);
	      while(rs.next())
	       {
	         int cid=rs.getInt("cid");
	         String name=rs.getString("name");
	         String description=rs.getString("description");
	         Category c=new Category(cid,name,description);
	         list.add(c);
	         
	         
	       }
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return list;
	}

	public boolean savePost(Post p)
	{
		boolean f=false;
	try
	{
		String sql=("insert into post (pTitle,pContent,pCode,pPic,catId,Id) values(?,?,?,?,?,?))");
	    PreparedStatement stmt=con.prepareStatement(sql);
	    stmt.setString(1,p.getpTtitle());
	    stmt.setString(2,p.getpContent());
	    stmt.setString(3,p.getpCode());
	    stmt.setString(4,p.getpPic());
	    stmt.setInt(5,p.getCatId());
	    stmt.setInt(6,p.getId());
	    stmt.executeUpdate();
	    f=true;
	    
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	return false;
	
		
    
    
    }
	
}