<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome to CryWolf</title>
<link rel="stylesheet" type="text/css" href="user3.css">
</head>
<body>

  <div class="imgcontainer">
    <img src="pictures/werewolf.png" alt="login_icon" class="login_icon">
  </div>
  
  <div>
  <p class="welcome">Welcome ${welcomeUser} </p> <p class="welcome" style="font-size:20px;"> What would you like to do? </p>
  </div>
	
  <fieldset>
  <div class="container">
  
<div style="float:left;">
  <form action = "findReceivedMessages" method ="get">
  <button type="submit" id="buttonDivs" >View Inbox</button>
  </form>
  </div>
  
  <div style="float:right;">
   <form action = "getSentMessages" method ="get">
  <button type="submit" id="buttonDivs" >View Outbox</button>
  </form>
  </div>
  
  <br></br>
  <br></br>
  
<div style="margin:auto;">
  <form action="showCreateMessage" method="get">
  <button type="submit" id="buttonDivs" style="background-color:#008000">Send New Message</button>
  </form>
  </div>
  
  <br></br>
  <br></br>
  
  <c:if test="${userRole == 'r1'}">
  <div style="float:left;">
  <form action = "getAllMessages" method ="get">
  <button type="submit" id="buttonDivs" style="background-color:#008000" >View All Messages</button>
  </form>
  </div>
  
  <div style="float:right;">
  <form action = "findByNameSorted" method ="get">
  <button type="submit" id="buttonDivs" style="background-color:#008000" >Edit Users</button>
  </form>
  </div>
  </c:if>
  <br></br>
  <br></br>
 <div style="float:right;">
 <form action="login" method = "post">
	<button type="submit" style="max-width:100px; ">Logout</button>
	</form>
	</div>
  
 
  <!-- <div style="float:right;">
   
   </div> -->
  
   <!--  <label for="uname"><b>Username</b></label>
    <input type="text" placeholder="Enter Username" name="username" required>

    <label for="psw"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="password" required> -->


	
    <!-- <label>
      <input type="checkbox" checked="checked" name="remember"> Remember me
    </label> -->
    <!-- <label>
      <a href="register.jsp">Register</a>
    </label> -->
  </div>
   <br></br>
  <br></br>
  </fieldset>

  <!-- <div class="container" style="background-color:#f1f1f1">
    <a href="register2.jsp">Register</a>
    <span class="psw">Forgot <a href="#">password?</a></span>
  </div> -->


</body>
</html>