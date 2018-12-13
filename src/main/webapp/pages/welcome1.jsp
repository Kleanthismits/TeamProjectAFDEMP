<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome to CryWolf</title>
<link rel="stylesheet" type="text/css" href="welcome1.css">
</head>
<body>

<form action="loggedIn" method="post">
  <div class="imgcontainer">
    <img src="pictures/howling_wolf.jpg" alt="login_icon" class="login_icon">
  </div>
  
  <div>
  <p class="welcome"> CryWolf </p> <p class="welcome" style="font-size:20px;"> Messenger </p>
  </div>

  <div class="container">
    <label for="uname"><b>Username</b></label>
    <input type="text" placeholder="Enter Username" name="username" required>

    <label for="psw"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="password" required>
 <input type="submit" value = "Login" class = "submit">
    <!-- <label>
      <input type="checkbox" checked="checked" name="remember"> Remember me
    </label> -->
    <!-- <label>
      <a href="register.jsp">Register</a>
    </label> -->
  </div>
  

  <div class="container" style="background-color:#f1f1f1">
    <a href="register2.jsp">Register</a>
    <!-- <span class="psw">Forgot <a href="#">password?</a></span> -->
  </div>
</form>

</body>
</html>