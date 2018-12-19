<html>
<head>
<meta charset="ISO-8859-1">
<title>Received Message</title>
<!-- <link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="demo.css"> -->
<link rel="stylesheet" type="text/css" href="receivedMessage5.css">
</head>
<body>

<div class="imgcontainer">
    <img src="pictures/werewolf.png" alt="login_icon" class="login_icon">
  </div>
  
  <div>
  <p class="welcome">Received Message</p>
  </div>
  
  
<fieldset id="userList">


<form  method = "post" action = "messages/${user.id}">


<table border="1" style="display: inline-block; float:left;">
		
		
		
    <img src="pictures/wolfie.png" alt="login_icon" style="width: 30%;"class="login_icon">
 
		</table>



	<table border="1" style="display: inline-block; float:right">
		
		
		<tr>
			<td style="float:left;">Message sent from: ${username}</td>
				</tr>
		<tr>
			<td style="float:left;">Received at: ${DateTime}</td>
				</tr>
		
		<tr>
			<td><p style="float:left">Text :<p><textarea rows="5" cols="50" input type="text" name="text_content" placeholder="Input text here"></textarea></td>
				</tr>

		<input type="text" name="sender_id" value="${user.id}" hidden="true">

		<tr>
			<td><button type="submit">Return</button></td>
				</tr>
				</table>
	
</form>
</fieldset>

<br><br>



</body>
</html>