<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register New User</title>
<link rel="stylesheet" type="text/css" href="register2.css">
</head>
<body>

<form action="login" method = "post">
  <div class="imgcontainer">
    <img src="pictures/wolf_paw.png" alt="login_icon" class="login_icon">
  </div>
  
  <div>
  <p class="welcome"> Enter your info below </p>
  <!-- <p class="welcome"> CryWolf </p> <p class="welcome" style="font-size:20px;"> Messenger </p> -->
  </div>

  <div class="container">
    <label for="uname"><b>Username</b></label>
    <input type="text" placeholder="Enter New Username" name="username" required>

    <label for="psw"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="password" required>
    
    <br></br>

    <input type="submit" value = "Join the Pack" class = "submit">
    <!-- <label>
      <input type="checkbox" checked="checked" name="remember"> Remember me
    </label> -->
    <!-- <label>
      <a href="register.jsp">Register</a>
    </label> -->
  </div>
  

  <!-- <div class="container" style="background-color:#f1f1f1">
    <button type="button" class="cancelbtn">Cancel</button>
    <span class="psw">Forgot <a href="#">password?</a></span>
  </div> -->
</form>

</body>
</html>