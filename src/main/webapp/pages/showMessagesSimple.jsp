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
<link rel="stylesheet" href="${pageContext.request.contextPath}/general.css">
<meta charset="UTF-8">
<title>Sent Messages</title>
</head>
<body>

<div class="imgcontainer">
    <img src="${pageContext.request.contextPath}/pictures/dog-footprint.png" alt="login_icon" class="login_icon">
  </div>

	<div style="text-align: center">
	<p><c:out value="${user.username}"/></p>
	<fieldset id="userList">
		<table border="1" style="margin:auto;">
			<tr>
				<td colspan="6" style="border: none; text-align: center;">
					<h2 id="userListTitle" class="codrops-demos a">Sent Messages</h2>
				</td>
			</tr>
			<tr class="header">
			<th id="userListColumns">Receiver</th>
				<th id="userListColumns">Date Sent</th>
				<th id="userListColumns">Date Updated</th>
				<th id="userListColumns">Subject</th>
			</tr>
			<c:forEach items="${messageList}" var="item" varStatus = "status">
			
				<tr id="userListItems" class="list">
					<td>${item.receiverName}</td>
					<td>${item.sent_at}</td>
					<td>${item.updated_at}</td>
					<td>${item.subject}</td>
					<td>
					<form  method = "get" action = "showMessage/${item.id}">
					<button type="submit" id="viewButton">View</button>
					</form>
					</td>
					
				</tr>
				
			</c:forEach>


		</table>
	

	<form method = "get" action ="/loggedIn">
		<button type = "submit" id="returnButton"  style="margin:auto;">Go Back</button>
		</form>
		</fieldset>
		</div>
	<br />
	

	
</body>
</html>