<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><html>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<form  method = "post" action = "createMessage">
	<table border="1" style="display: inline-block">
		
		<tr>
			<td>Receiver : <select name = "receiver_id">
								<c:forEach items="${userList}" var="user" varStatus = "status">
									<option name="receiver_id" value="${user.id}">${user.username}</option>
								</c:forEach>
							</select>
			</td>
				</tr>
		<tr>
			<td>Subject : <input type="text" name="subject" placeholder="Subject"></td>
				</tr>
				<tr>
			<td>Text :<input maxlength="3" size="3" value="250" id="counter">
						<textarea name = "text_content" onkeyup="textCounter(this,'counter',250);" rows="5" cols="50" id="message" maxlength="250" placeholder="Input text here"></textarea></td>
				</tr>
				<input type="text" name="sender_id" value="${user.id}" >
				<tr>
			<td><button type="submit">Send</button></td>
				</tr>
	</table>
</form>
<script>
function textCounter(field,field2,maxlimit)
{
 var countfield = document.getElementById(field2);
 if ( field.value.length > maxlimit ) {
  field.value = field.value.substring( 0, maxlimit );
  return false;
 } else {
  countfield.value = maxlimit - field.value.length;
 }
}
</script>

</body>
</html>