<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Send New Message</title>
</head>
<body>

<br>
	<div class="imgcontainer">
    <img src="pictures/wolf_pack.jpg" alt="login_icon" class="login_icon">
  </div>
  <br>
	<div style="text-align: center">
	<fieldset id="userList">
		<table id="userlistTable" border="1" style="display: inline-block">
			<tr>
				<td colspan="6" style="border: none; text-align: center">
					<h2 id="userListTitle" class="codrops-demos a">User List</h2>
				</td>
			</tr>
			<tr class="header">
				<th id="userListColumns">Username</th>
				
			</tr>
			<c:forEach items="${userList}" var="item">
				<tr id="userListItems" class="list">
					<td>${item.username}</td>
					</tr>
			</c:forEach>
		</table>
		<a id="returnButton" href="/" style="margin:auto;">Return</a>
		
		</fieldset>
	</div>
	<br>
				
</body>
</html>