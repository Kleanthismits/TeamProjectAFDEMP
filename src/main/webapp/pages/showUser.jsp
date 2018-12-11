<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Show User</title>
</head>
<body>


	<table border="1">
		<tr>
			<td colspan="6" style="border: none; text-align: center">
				<h2>User List</h2>
			</td>
		</tr>
		<tr>
			<th>ID</th>
			<th>username</th>
			<th>password</th>
			<th>role</th>
			<th>Date Created</th>
			<th>Date Updated</th>
		</tr>
		<c:forEach items="${userList}" var="item">
			<tr>
				<td>${item.id}</td>
				<td>${item.username}</td>
				<td>${item.password}</td>
				<td>${item.role}</td>
				<td>${item.created_at}</td>
				<td>${item.updated_at}</td>
			</tr>
		</c:forEach>


	</table>
	<a href="/">Go Back</a>
</body>
</html>