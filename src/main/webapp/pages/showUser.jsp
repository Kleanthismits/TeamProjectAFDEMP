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
<link rel="stylesheet" href="general.css">
<meta charset="UTF-8">
<title>Users List</title>
</head>
<body>

<br>
	<div class="imgcontainer">
    <img src="pictures/wolf_pack.jpg" alt="login_icon" class="login_icon">
  </div>
  <br>
	<div style="text-align: center">
	<fieldset id="userList">
	${user.username}
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
<br><br><br>

	<div class="container" style="text-align: center;">
		<h5 class="codrops-top"
			style="font-size: large; font-family: calibri;">Edit user info</h5>
			
		<br>

		<div id="confirmationDiv">
			<%-- ${user} --%>
			<p>${userUpdated}</p>
		</div>

		<div id="confirmationDiv">
			<%-- ${user} --%>
			<p>${userDeleted}</p>
		</div>

		<br>

		<fieldset class="second">

			<form action="updateUser" method="POST">
				<fieldset class="third" style="float: left;">
					<legend>Update user</legend>
					<br>
					<div>
						Id: <select name="userId" required
							oninvalid="this.setCustomValidity('Please choose an ID')">
							<!-- change -->
							<option value="" disabled selected>Select user</option>
							<!-- change -->
							<c:forEach items="${userList}" var="user" varStatus="status">
								<option name="userId" value="${user.id}">${user.id}.${user.username}</option>
							</c:forEach>
						</select>
					</div>
					<br />
					<div>
						UserName: <input type="text" name="userUsername">
					</div>
					<br />
					<div>
						Password: <input type="text" name="userPassword">
					</div>
					<br />
					<div>
						Role: <input type="text" name="userRole">
					</div>
					<br /> <br> <input class="updatebutton" type="submit"
						value="Update" style="font-family: calibri;" /> <br></br>
				</fieldset>
			</form>

			<!-- </div>
	<div class="container" style="text-align:center;">
		<h5 class="codrops-top" style=" font-size: large; font-family: calibri;">Delete User By ID</h5> -->

			<form action="deleteUser" method="POST">
				<fieldset class="third" style="float: right;">
					<legend>Delete user</legend>
					<br>
					<div>
						Id: <select name="userId" required
							oninvalid="this.setCustomValidity('Please choose an ID')">
							<option value="" disabled selected>Select user</option>
							<c:forEach items="${userList}" var="item" varStatus="status">
							<c:if test="${user.username != item.username}">
								<option name="userId" value="${item.id}">${item.id}.${item.username}</option>
								</c:if>
							</c:forEach>
						</select>
						<!-- <input style="float:right"type="text" name="userId"></div><br /> -->
						<br>
					</div>
					<br /> <br> <input class="updatebutton" type="submit"
						value="Delete" style="font-family: calibri;" /> <br></br>
				</fieldset>
			</form>

			<br><br></br>

		</fieldset>
	</div>

	<br><br><br>

</body>
</html>