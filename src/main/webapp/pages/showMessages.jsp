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
<link rel="stylesheet" href="general.css">
<meta charset="UTF-8">
<title>Messages list</title>
</head>
<body>

<div class="imgcontainer">
    <img src="pictures/dog-footprint.png" alt="login_icon" class="login_icon">
  </div>

	<div style="text-align: center">
	<fieldset id="userList">
		<table border="1" style="display: inline-block">
			<tr>
				<td colspan="10" style="border: none; text-align: center;">
					<h2 id="userListTitle"  class="codrops-demos a">Received Messages</h2>
				</td>
			</tr>
			<tr class="header">
				<th id="userListColumns">Sender</th>
				<th id="userListColumns">Receiver</th>
				<th id="userListColumns">Date Sent</th>
				<th id="userListColumns">Date Updated</th>
				<th id="userListColumns">Subject</th>
				<th id="userListColumns">Text Content</th>
			</tr>
			<c:forEach items="${messageList}" var="item">
				<tr id="userListItems" class="list">
					<td>${item.senderName}</td>
					<td>${item.receiverName}</td>
					<td>${item.sent_at}</td>
					<td>${item.updated_at}</td>
					<td>${item.subject}</td>
					<td>${item.text_content}</td>
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