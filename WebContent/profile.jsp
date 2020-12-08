
<%@page import="com.entities.User"%>
<%@page errorPage="errorpage.jsp" %>
<%@page import="com.entities.Message"%>
<%@page import="com.entities.Category"%>
<%@page import="com.entities.Post"%>
<%@page import="com.helper.connection"%>
<%@page import="com.db.Postdb"%>
<%@page import="java.sql.*" %>  
<%@page import= "java.util.ArrayList"%>


<%  User user=(User)session.getAttribute("currentuser");

if(user==null)
{
  response.sendRedirect("Login.jsp");
  
}

%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<!-- css -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" 
 integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href="css/style.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
   .banner-background{

		clip-path: polygon(30% 0%,70% 0%,100% 0,100% 91%,63% 100%,22% 91%,0 99%,0 0);
   }
 </style>
</head>
<body>


  <!-- navbar -->
  
  <nav class="navbar navbar-expand-lg navbar-light bg-light primary background">
  <a class="navbar-brand" href="index.jsp"><span class="fa fa-info-circle">Texaslawn.tech</span></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
      </li>
     
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
         Category
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link disabled" href="#" ><span class="fa fa-mobile "></span>Contact</a>
      </li>
      
          <li class="nav-item">
        <a class="nav-link disabled" href="#"data-toggle="modal" data-target="#add-post-modal"><span class="fa fa-navicon "></span>Post</a>
      </li>
    
    </ul>
   <ul class="navbar-nav mr-right">
   <li class="nav-item">
        <a class="nav-link " href="#!"data-toggle="modal" data-target="#profile-modal"><span class="fa fa-user-circle"></span> <%= user.getName() %> </a>
      </li>
      
    <li class="nav-item">
        <a class="nav-link disabled" href="LogoutServlet"><span class="fa fa-user-circle"></span>Logout</a>
      </li>
   </ul>
  </div>
</nav>
  
  <!-- end of navbar -->
  
    <% Message m=(Message) session.getAttribute("msg");
          if(m!=null)
          {
      
      %>
            <div class="alert <%=m.getCssContent() %>" role="alert">
 			
 			 <%= m.getContent() %>
        </div>
        <%
			session.removeAttribute("msg");        
            }
        %>     
  
  <!-- profile modal -->

<!-- Modal -->
<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header primary-backround text-black text-center">
        <h5 class="modal-title" id="exampleModalLabel">Texaslawn.tech</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
           <div class="container text-center">
            
            <img src="pics/default.png <%= user.getProfile()%>">
            <h5 class="modal-title" id="exampleModalLabel"><%= user.getName() %></h5>
      
          <!-- details -->
      
         <div id="profile-details">    
          <table class="table">
 
  <tbody>
    <tr>
      <th scope="row">ID :</th>
      <td><%=user.getId() %></td>
     
    </tr>
     
     <tr>
      <th scope="row">Email :</th>
      <td><%=user.getEmail() %></td>
     </tr>
   
      <tr>
      <th scope="row">Gender :</th>
      <td><%=user.getGender() %></td>
     
    </tr>
     
     
    
  		</tbody>
	</table>
</div>
			<!-- profile Edit -->
			
			<div id="profile-edit" style="display:none;">
					    <h3 class="mt-2">Edit</h3>
					    <form action="EditServlet" method="post" enctype="multipart/form-data">
					    <table class="table">
					    <tr>
					      <td>ID: </td>
					      <td><%=user.getId() %></td>
					      <td></td>
					    </tr>
					    <tr>
					      <td>Email: </td>
					      <td><input type="email" name="user_email" class="form-control" value="<%=user.getEmail()%>"></td>
					      <td></td>
					    </tr>
					     
					     <tr>
					      <td>Name: </td>
					      <td><input type="text" name="user_name" class="form-control" value="<%=user.getName()%>"></td>
					      <td></td>
					    </tr>
					    
					      <tr>
					      <td>Password: </td>
					      <td><input type="password" name="user_password" class="form-control" value="<%=user.getPassword()%>"></td>
					      <td></td>
					    </tr>
					    
					      <tr>
					      <td>Gender: </td>
					      <td><input type="text" name="user_gender" class="form-control" value="<%=user.getGender()%>"></td>
					      <td></td>
					    </tr>
					    
					   <tr>
					      <td>Select new pic: </td>
					     <td>
					      <input type="file" name="image">
					    </td>
					    </tr>        
					    </table>
		
		                 <div class="container">
		                    <button type="submit" class="btn btn-outline-primary">Save</button>
  
		                 </div>			    
	   				    </form>     
        </div>
            </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button id="edit-profile-button" type="button" class="btn btn-primary">Edit</button>
      </div>
    </div>
  </div>
</div>

  <!-- End of profile modal -->
  
  <!-- Post modal -->
  
  

<!-- Modal -->
<div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Provide post details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      
        <form id="add-post-form" action="AddPostServlet">
        
         <div class="form-group">
         
           <select class="form-control" name="cid">
             <option selected disable>Select Category</option>
             <%    
                Postdb db=new Postdb(connection.getConnection());
         
            	ArrayList<Category> list=db.getAllCategories();  
           
               for(Category c:list)
                {
             %>
                  <option value="<%= c.getCid() %>"><%= c.getName() %></option>
          <%
                }         
          %>
                      
           </select>
         </div>
        
        <div class="form-group">
           <input name="pTitle" type="text" placeholder="Enter post title" class="form-control"/>    
        </div>
      
          <div class="form-group">
           <textarea name="pContent" class="form-control" style=height:100px placeholder="Enter Content"></textarea>
         </div>
          
       
          <div class="form-group">
            <textarea name="pCode" class="form-control" style=height:100px placeholder="Enter your program"></textarea>
         </div>
           
        <div class="for-group">
           <label>Select your pic:</label>
           <br/>
           <input type="file" name="pic">
         </div>  
              <div class="container text-center">
              <button type="submit" class="btn btn-outline-primary mt-2">Post</button></div>
    </form>           
 </div>
 </div>
 </div>
 
</div>

  <!-- End of post modal -->
  
  <!-- javascripts -->

<script src="https://code.jquery.com/jquery-3.5.0.slim.js" integrity="sha256-sCexhaKpAfuqulKjtSY7V9H7QT0TCN90H+Y5NlmqOUE=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<script src="js/myjsp.jsp" type="text/javascript"></script>
 		
 				<script>
 				    $(document).ready(function()  {
 				    	let editStatus=false;
 				    	
 				    	
 				    	$('#edit-profile-button').click(function()
 				    	 {
 							if(editStatus==false)
 								{
 	 				    		$('#profile-details').hide()  
 	 			                $('#profile-edit').show()  
 	 	 				         editStatus=true;
 	 				    		  $(this).text("Back");
 								 }else
 									 {
 									$('#profile-details').show()  
 				 	 			    $('#profile-edit').hide()  
 	 	 	 				         editStatus=false;
 									  $(this).text("Edit");
 									 }
 				    	
 				    	})
 				    	
 				    });
 				</script>  
 				<!-- Add post js -->
 				 <script>
 				    $(document).ready(function(e)
 				    {
 				    	$("#add-post-form").on("submit",function(event)
 				    			{
 				    		      //this code calls when form is submitted..
 				    		      event.preventDefault();
 				    		      event.preventDefault("you have clicked on submit")
 				    		      let form=new FormData(this);
 				    		      
 				    		      //now requesting to server...
 				    		        $.ajax({
 				    		        	url:"AddPostServlet",
 				    		            type:Get,
 				    		            data:form,
 				    		            success: function (data, textStatus, jqXHR)
 				    		             {
 				    		            	//success..
 				    		            	console.log(data);
 				    		            	if(data.trim()=='done')
 				    		            		{
 				    		            		swal("Good job", "Saved Succesfully", "success");
 				    		            		}
 				    		            	else
 				    		            		{
 				    		            		swal("Error..", "Something Went Wrong!!", "error")
 				    		            		}
 				    		            	
 				    		             },
 				    		             error:  function (jqXHR, textStatus, errorThrown)
 				    		             {
 				    		            	swal("Error!", "Something Went Wrong!!", "error")
 				    		            	 
 				    		             },
 				          					processData: false,
 				          					contentType: false
 				    		               })
 				    			})
 				    })
 				 </script>

</body>
</html>