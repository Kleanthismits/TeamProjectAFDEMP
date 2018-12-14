<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome to CryWolf</title>
<link rel="stylesheet" type="text/css" href="user3.css">
</head>
<body>

<form action="action_page.php">
  <div class="imgcontainer">
    <img src="pictures/werewolf.png" alt="login_icon" class="login_icon">
  </div>
  
  <div>
  <p class="welcome">Welcome ${welcomeUser} </p> <p class="welcome" style="font-size:20px;"> What would you like to do? </p>
  </div>
	
  <fieldset>
  <div class="container">
  
  <div style="float:left;">
  <a id="buttonDivs" href="register2.jsp" >View Inbox</a>
  </div>
  
  <div style="float:right;">
  <a id="buttonDivs" href="register2.jsp">View Sent Messages</a>
  </div>
  
  <br></br>
  <br></br>
  
  <div style="margin:auto;">
  <a id="buttonDivs" href="register2.jsp">Send New Message</a>
  </div>
  
  <br></br>
  <br></br>
  
  <div style="float:left;">
  <a id="buttonDivs" style="background-color:#008000" href="register2.jsp">View All Messages</a>
  </div>
  
  <div style="float:right;">
  <a id="buttonDivs" style="background-color:#008000" href="register2.jsp">CRUD All Users</a> <br></br>
  </div>
  
  <br></br>
  <br></br>
 <div style="float:right;">
	<button type="submit" style="max-width:100px; ">Logout</button>
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
</form>

</body>
</html>