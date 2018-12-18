<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<meta charset="UTF-8">
<title>Send New Message</title>
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
		<form method="post" action="createMessage">
			<table border="1" style="display: inline-block; float: left;">


				<tr>
					<td>Receiver : <select name="receiver_id">
							<c:forEach items="${userList}" var="user" varStatus="status">
								<option name="receiver_id" value="${user.id}">${user.username}</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td>Subject : <input type="text" name="subject"
						placeholder="Subject"></td>
				</tr>
			</table>

			<table border="1" style="display: inline-block; float: right;">
				<tr>
					<td><p style="float: left">Text :
						<p>
							Text :<input maxlength="3" size="3" value="250" id="counter">
							<textarea name="text_content"
								onkeyup="textCounter(this,'counter',250);" rows="5" cols="50"
								id="message" maxlength="250" placeholder="Input text here"></textarea></td>
				</tr>
				<tr>
					<td><button type="submit">Send</button></td>
				</tr>
				<tr>
					<input type="text" name="sender_id" value="${user.id}" hidden = "true">
				</tr>
			</table>
		</form>
	</fieldset>
<form method = "get" action ="/loggedIn">
		<button type = "submit" id="returnButton"  style="margin:auto;">Return</button>
		</form>
	<br>
	<br>
	<script>
		function textCounter(field, field2, maxlimit) {
			var countfield = document.getElementById(field2);
			if (field.value.length > maxlimit) {
				field.value = field.value.substring(0, maxlimit);
				return false;
			} else {
				countfield.value = maxlimit - field.value.length;
			}
		}
	</script>

</body>
</html>