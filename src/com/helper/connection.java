package com.helper;

import java.sql.*;

public class connection {

	
	public static Connection con;
	
	public static Connection getConnection()
	{
		try
		{
			if(con==null)
			{
				Class.forName("com.mysql.jdbc.Driver");
			
				DriverManager.getConnection("jdbc:mysql://localhost/formdb","root","");
			
			}
		}
		 catch(Exception e)
		{
			 e.printStackTrace();
			
		}
		
		return con;
	}
}
