<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/demo.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/showMessages.css">

<meta charset="UTF-8">
<title>Show Messages</title>
</head>
<body>

<div class="imgcontainer">
    <img src="${pageContext.request.contextPath}/pictures/dog-footprint.png" alt="login_icon" class="login_icon">
  </div>

	<div style="text-align: center">
	<p><c:out value="${user.username}"/></p>
		<table border="1" style="display: inline-block">
			<tr>
				<td colspan="6" style="border: none; text-align: center;">
					<h2 class="codrops-demos a">Sent Messages</h2>
				</td>
			</tr>
			<tr><th>Receiver</th>
				<th>Date Sent</th>
				<th>Date Updated</th>
				<th>Subject</th>
			</tr>
			<c:forEach items="${messageList}" var="item" varStatus = "status">
			
				<tr>
					<td>${item.username}</td>
					<td>${item.sent_at}</td>
					<td>${item.updated_at}</td>
					<td>${item.subject}</td>
					<td>
					<form  method = "get" action = "showMessage/${item.id}">
					<button type="submit">View</button>
					</form>
					</td>
					
				</tr>
				
			</c:forEach>


		</table>
	</div>

	<form method = "get" action ="/loggedIn">
		<button type = "submit" id="returnButton"  style="margin:auto;">Go Back</button>
		</form>
	<br />
	

	
</body>
</html>