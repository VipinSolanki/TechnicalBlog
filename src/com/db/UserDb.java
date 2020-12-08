package com.db;

import java.sql.*;

import com.entities.User;

public class UserDb {
	
	public Connection con;
	
	public UserDb(Connection con)
	{
		this.con=con;
	}
	//method to insert user to db
	
	public boolean saveUser(User user)
	{
	boolean f=false;
	{
		try{
			//user-->db
			 Class.forName("com.mysql.jdbc.Driver");
	    	 Connection con=DriverManager.getConnection("jdbc:mysql://localhost/formdb","root","");
	    	
			PreparedStatement stmt=con.prepareStatement("insert into form(name,email,password,gender) values(?,?,?,?)");
			
			stmt.setString(1,user.getName());
			stmt.setString(2,user.getEmail());
			stmt.setString(3,user.getPassword());
			stmt.setString(4,user.getGender());
			
			
			stmt.executeUpdate();
			f=true;
			
		 }
		 catch(Exception e){
		  
			 e.printStackTrace();
	  	 
		 }
		 
		return f;
	}
}
	//get user by useremail and userpassword...
	
	public User getUserByEmailAndPassword(String email,String password)
	{
         User user=null;
         try
         {
            Class.forName("com.mysql.jdbc.Driver");
	        Connection con=DriverManager.getConnection("jdbc:mysql://localhost/formdb","root","");
	        PreparedStatement stmt=con.prepareStatement("select * from form where email=? and password=?");
		    stmt.setString(1,email);
           	stmt.setString(2,password);
        	
        	ResultSet rs=stmt.executeQuery();
        	
        	if(rs.next())
        	{
        		user=new User();
        	// data from db
        		String name=rs.getString("name");
        		user.setName(name);
        //  set to user object...
        		
        		
        		
        	    user.setId(rs.getInt("id"));  	
        		user.setEmail(rs.getString("email"));
        		user.setPassword(rs.getString("password"));
        		user.setGender(rs.getString("gender"));
        		user.setDateTime(rs.getTimestamp("regdate"));
        		user.setProfile(rs.getString("profile"));
        		
          
        //		System.out.print(rs.getInt("id"));
        		
        	}
         }
         catch(Exception e)
         {
        	 e.printStackTrace();
         }
         
         return user;
	}
	
	
	   public boolean updateUser(User user)
	   {
	     boolean f=false;
	   
		   try
		   {
		//	String sql="update user set name=? ,email=? ,password=? ,gender=? ,profile=? where id=?";
			
		//	PreparedStatement stmt=con.prepareStatement(sql);
			    Class.forName("com.mysql.jdbc.Driver");
		        Connection con=DriverManager.getConnection("jdbc:mysql://localhost/formdb","root","");
		        PreparedStatement stmt=con.prepareStatement("update form set name=? ,email=? ,password=? ,gender=? ,profile=? where id=?");
			
			
			
			stmt.setString(1, user.getName());
			stmt.setString(2, user.getEmail());
			stmt.setString(3, user.getPassword());
			stmt.setString(4, user.getGender());
			stmt.setString(5,user.getProfile());
			stmt.setInt(6, user.getId());
			
			stmt.executeUpdate();
			 f=true; 
		    }
	   
	     catch(Exception e)
	     { 
	     e.printStackTrace();
	     }
		   return f;
	   }   
}
	
	

	

