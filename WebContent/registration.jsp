<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration</title>


<!-- css -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" 
 integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href="css/style.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


</head>
<body>

<%@include file="navbar.jsp" %> 

<main>
  
   <div class="container">
    <div class="col-md-4 offset-md-4">
    <div class="card">
    
    <div class="card-header  text-center">
    
   <span class="fa fa-2x fa-user-circle"></span>
   <br >
   Registration here
    
    </div>
    <div class="card-body">
    
    <form action="RegisterServlet" >
    
   
    
    <div class="form-group">
    <label for="user_name">User Name</label>
    <input name="user_name" type="text" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter name">
     </div>
 
  <div class="form-group">
    <label for="user_email">Email address</label>
    <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  
   <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input name="user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
  </div>
 
 
  <div class="form-group">
    <label for="gender">Gender</label>
    
    <br>
    
    <input type="radio"  id="gender" name="gender" value="male" >Male
     
     <input type="radio"  id="gender" name="gender" value="female">Female
     
  </div>
 
 
  <div class="form-check">
    <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
    <label class="form-check-label" for="exampleCheck1">Terms and Conditions</label>
    
  </div>                                                                                      
 <br>  
  <div class="container text-center" id="loader" style="display:none;">
  
  <span class="fa fa-refresh fa-spin fa-3x "></span>
     <h4>Please Wait..</h4>
  </div>
  
  <button id="submit-btn" type="submit" class="btn btn-primary">Submit</button>
</form>
    
    </div>
   
    </div>
    
    </div>
   
   </div>

<!-- javascripts -->

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="js/myjsp.jsp" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<script>
 $(document).ready(function){
	 console.log("loaded...")
	 
	 $('#reg-form').on('submit',function(event){
	       event.preventDefault();
	       
	       let form=new FormData(this);
	       
	       $("#submit-btn").hide();
	       $("#loader").show();
	
	        //send register servlet
	        $.ajax({
	        	url:"RegisterServlet",
	        	type: Get,
	        	data: form,
	        	success: function (data,textStatus,jqXHR){
	        		console.log(data)
	        		
	        		  $("#submit-btn").hide();
	                   $("#loader").show();
	                   
	                   if(data.trim()=='done')
	                	   
	        		
	        		swal("registered succesfully..we redirecting to login page")
                   .then((value) => {
    				 window.location="Login.jsp"
});
	        	}
	        else
	        	{
	        	swal(data);
	        	}
	        		
	        		 $("#submit-btn").show();
	     	       $("#loader").hide();
	        	},
	        	error: (jqXHR,textStatus,errorThrown){

	        		  $("#submit-btn").hide();
	                   $("#loader").show();
	        		swal("Something went wrong")
	                   
	});
	        	},
	        	   processData: false,
	        	   contentType: false
	        	
	        	
	        });
	        
	 });
 });

</script>
</body>
</html>