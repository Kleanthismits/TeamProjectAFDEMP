<html>
<head>
<meta charset="ISO-8859-1">
<title>Sent Message</title>
<!-- <link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="demo.css"> -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/sentMessage7.css">
</head>
<body>

	<div class="imgcontainer">
		<img src="${pageContext.request.contextPath}/pictures/werewolf.png"
			alt="login_icon" class="login_icon">
	</div>

	<div>
		<p class="welcome">Sent Message</p>
	</div>


	<fieldset id="userList">


		<form method="post" action="messages/${user.id}">


			<table border="1" style="display: inline-block; float: left;">



				<img
					src="${pageContext.request.contextPath}/pictures/wolfieserious.png"
					alt="login_icon" style="width: 30%;" class="login_icon">

			</table>



			<table border="1" style="display: inline-block; float: right">


				<tr>
					<td style="float: left;">Message sent to: ${receiver}</td>
				</tr>
				<tr>
					<td style="float: left;">Sent at: ${message.sent_at}</td>
				</tr>
				<tr>
					<td>Subject : <input name="subject"
						value="${message.subject}"></td>
				</tr>

				<tr>
					<td><p style="float: left">Text :
						<input name="text_content"
						value="${message.text_content}"><p></td>
				</tr>

				<input type="text" name="sender_id" value="${message.id}"
					hidden="true">
			</table>
		</form>

		
			<table border="1" style="display: inline-block; float: right">
				<tr>
				
					<td><form method="get" action="/getSentMessages">
					<button type="submit" id="returnButton" style="margin: auto;">Return</button>
				</form>
					<td><form><button type="submit">Edit</button></form></td>
					<td><form><button type="submit">Delete</button></form></td>
					
				</tr>
			</table>

		
	</fieldset>

	<br>
	<br>



</body>
</html>