<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>JSP Page</title>

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
<%@include file="navbar.jsp" %> 

<!-- banner -->

<div class="container-fluid p-0 m-0">
 
 <div class="jumbotron primary-background">
 <div class="container">
 
 
    <h3 class="dispaly-3">Go Corona Go</h3>
    <h3>Arrow</h3>
    <p>My name is Oliver Queen,after 5 yrs in a hell i have return home with only 1 goal
       to save my city but my old approach was not enough i have become someone else
        i have become something else i have a green arrow</p>
        
        <button class="btn btn-outline-dark"><span class="fa fa-external-link"> </span>Start !Its free </button>
        <a href="Login.jsp" class="btn btn-outline-dark"><span class="fa fa-user-circle fa-spin"></span>Login</a>
</div>
</div>
</div>


  <!-- cards -->
   
   <div class="container">
   
     <div class="row mb-2">
         
         <div class="col-md-4">
         
        <div class="card">
 
    <div class="card-body">
    <h5 class="card-title">Java</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn btn-primary-background text-dark">Sterling</a>
  
  </div>
</div>
  </div>
         <div class="col-md-4">
         
        <div class="card">
 
    <div class="card-body">
    <h5 class="card-title">Java</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn btn-primary-background text-dark">Sterling</a>
  
  </div>
</div>
  </div>
         <div class="col-md-4">
         
        <div class="card">
 
    <div class="card-body">
    <h5 class="card-title">Java</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn btn-primary-background text-dark">Sterling</a>
  
  </div>
</div>
  </div>
         <div class="col-md-4">
         
        <div class="card">
 
    <div class="card-body">
    <h5 class="card-title">Java</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn btn-primary-background text-dark">Sterling</a>
  
  </div>
</div>
  </div>
         <div class="col-md-4">
         
        <div class="card">
 
    <div class="card-body">
    <h5 class="card-title">Java</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn btn-primary-background text-dark">Sterling</a>
  
  </div>
</div>
  </div>
         <div class="col-md-4">
         
        <div class="card">
 
    <div class="card-body">
    <h5 class="card-title">Java</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn btn-primary-background text-dark">Sterling</a>
  
  </div>
</div>
  </div>
  
  
      </div>
      </div>
   
<!-- javascripts -->

<script src="https://code.jquery.com/jquery-3.5.0.slim.js" integrity="sha256-sCexhaKpAfuqulKjtSY7V9H7QT0TCN90H+Y5NlmqOUE=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="js/myjsp.jsp" type="text/javascript"></script>

</body>
</html>