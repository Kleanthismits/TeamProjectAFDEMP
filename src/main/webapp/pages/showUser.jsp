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
<link rel="stylesheet" href="showUser.css">
<meta charset="UTF-8">
<title>Show User</title>
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
				<th id="userListColumns">ID</th>
				<th id="userListColumns">Username</th>
				<th id="userListColumns">Password</th>
				<th id="userListColumns">Role</th>
				<th id="userListColumns">Date Created</th>
				<th id="userListColumns">Date Updated</th>
			</tr>
			<c:forEach items="${userList}" var="item">
				<tr id="userListItems" class="list">
					<td id="userListId">${item.id}</td>
					<td>${item.username}</td>
					<td>${item.password}</td>
					<td>${item.role}</td>
					<td>${item.created_at}</td>
					<td>${item.updated_at}</td>
				</tr>
			</c:forEach>
		</table>
		
		<form method = "get" action ="/loggedIn">
		<button type = "submit" id="returnButton"  style="margin:auto;">Return</button>
		</form>
		</fieldset>
	</div>
	<br>
	
	<!-- <div style="float:right">
	<a id="returnButton" href="/" style="margin:auto;">Return</a>
	</div> -->
	
	<br />
	<div style="text-align: center"><%-- ${user} --%>
	
	<p>${userUpdated}</p>
	</div>
	<br />

	<div class="container" style="text-align:center;">
		<h5 class="codrops-top" style=" font-size: large; font-family: calibri;">Update user info</h5>
		
		<br>

		<form action="updateUser" method="POST">
		<fieldset>
		<!-- <legend>Update a user</legend> -->
		<br>
			<div>Id: <input style="float:right"type="text" name="userId"></div><br /> 
			<div>UserName: <input style="float:right" type="text" name="username"></div><br /> 
			<div>Password: <input style="float:right"type="text" name="password"></div><br /> 
			<div>Role: <input style="float:right"type="text" name="role"></div><br />
			
			<br>
			<input class="updatebutton" type="submit" value="Update" style="font-family: calibri;"/>
			<br></br>
			</fieldset>
		</form>
		<br />
		<br></br>
	</div>
	
	
		<div style="text-align: center"><%-- ${user} --%>
	<p>${userDeleted}</p>
	</div>
	<br />

	<div class="container" style="text-align:center;">
		<h5 class="codrops-top" style=" font-size: large; font-family: calibri;">Delete User By ID</h5>
		<br>
		<form action="deleteUser" method="POST">
		<fieldset>
		<br>
			<div>Id: <input style="float:right"type="text" name="userId"></div><br /> 
			<br>
			<input class="updatebutton" type="submit" value="Delete" style="font-family: calibri;"/>
			<br></br>
			</fieldset>
		</form>
		<br />
		<br></br>
	</div>
</body>
</html>