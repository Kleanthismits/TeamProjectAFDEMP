<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="demo.css">
<link rel="stylesheet" href="showMessages.css">
<meta charset="UTF-8">
<title>Show Messages</title>
</head>
<body>

<div class="imgcontainer">
    <img src="pictures/dog-footprint.png" alt="login_icon" class="login_icon">
  </div>
<div>${userNotFound}${user}</div>
<p>Edo!!!<c:out value="${user.id}"/></p>
	<div style="text-align: center">
		<table border="1" style="display: inline-block">
			<tr>
				<td colspan="6" style="border: none; text-align: center;">
					<h2 class="codrops-demos a">${messageType}</h2>
				</td>
			</tr>
			<tr><th>Receiver</th>
				<th>Date Sent</th>
				<th>Date Updated</th>
				<th>Subject</th>
			</tr>
			<c:forEach items="${messageList}" var="item" varStatus = "status">
				<tr>
					<td>${item.receiver_id}</td>
					<td>${item.sent_at}</td>
					<td>${item.updated_at}</td>
					<td>${item.subject}</td>
				</tr>
			</c:forEach>


		</table>
	</div>

	<a href="pages/userDetails.jsp" style="float: right">Go Back</a>
	<br />
	

	
</body>
</html>