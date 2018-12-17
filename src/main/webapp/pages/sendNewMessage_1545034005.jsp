<html>
<head>
<meta charset="UTF-8">
<title>Send New Message</title>
<!-- <link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="demo.css"> -->
<link rel="stylesheet" type="text/css" href="sendNewMessage.css">
</head>
<body>

<div class="imgcontainer">
    <img src="pictures/werewolf.png" alt="login_icon" class="login_icon">
  </div>
  
  <div>
  <p class="welcome">Give a howl</p>
  </div>
<fieldset id="userList">
<form  method = "post" action = "messages/${user.id}">
	<table border="1" style="display: inline-block; float:left;">
		
		
		<tr>
			<td>Receiver : <input type="text" name="receiver_id" placeholder="Receiver"></td>
				</tr>
		<tr>
			<td>Subject : <input type="text" name="subject" placeholder="Subject"></td>
				</tr>
		</table>
		
		<table border="1" style="display: inline-block; float:right;">
		<tr>
			<td><p style="float:left">Text :<p><textarea rows="5" cols="50" input type="text" name="text_content" placeholder="Input text here"></textarea></td>
				</tr>

		<input type="text" name="sender_id" value="${user.id}" hidden="true">

		<tr>
			<td><button type="submit">Send</button></td>
				</tr>
				</table>
	
</form>
</fieldset>

<br><br>



</body>
</html>