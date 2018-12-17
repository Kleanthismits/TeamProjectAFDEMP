<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<head></head>
<body>
  <form  method = "post" action = "updateMessage">
  <table>
				<tr>
					<td>Receiver : ${item.receiver_id}</td>
				</tr>
				
				<tr>
					<td>Date Sent : ${item.sent_at}</td>
				</tr>
				
				<tr>
					<td>Date Updated : ${item.updated_at}</td>
				<tr>
					<td>Subject : <input type="text" name="subject" value="${item.subject}"></td>
				</tr>
				
				<tr>
					<td>Text :<input type="text" name="text_content" value="${item.text_content}"></td>
				</tr>
				
				<tr>
					<td><input type="hidden" name="id" value="${message.id}" ></td>
					</tr>
				<tr>
					<td><button type="submit">Edit</button></td>
					
					<%-- <c:set var ="messageId" value="${item.id}" scope="session"/>
					<c:set var ="receiverId" value="${item.receiver_id}" scope="session"/> --%>
				</tr>	
					</table>
					</form>
				
</body>
</html>