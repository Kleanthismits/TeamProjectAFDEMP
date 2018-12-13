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
<meta charset="UTF-8">
<title>Show User</title>
</head>
<body>

	<div style="text-align: center">
		<table border="1" style="display: inline-block">
			<tr>
				<td colspan="6" style="border: none; text-align: center">
					<h2 class="codrops-demos a">User List</h2>
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
	</div>

	<a href="/">Go Back</a>
	<br />
	<div style="text-align: center">${user}</div>
	<br />

	<div class="container" style="text-align: center">
		<h5 class="codrops-top">Update a user</h5>

		<form action="updateUser" method="POST">
			Id: <input type="text" name="userId"><br /> 
			UserName: <input type="text" name="username"><br /> 
			Password: <input type="text" name="password"><br /> 
			Role: <input type="text" name="role"><br /> <input type="submit" />
		</form>
		<br />
	</div>
	<div class="container" style="text-align: center">
		<h5 class="codrops-top">Delete a user</h5>

		<form action="deleteUser" method="Post">
			Id: <input type="text" name="userId"><br /> 
			 <input type="submit" />
		</form>
		<br />
	</div>
</body>
</html>