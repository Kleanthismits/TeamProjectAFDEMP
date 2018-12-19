<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome to CryWolf</title>
<link rel="stylesheet" type="text/css" href="user3.css">
<link rel="stylesheet" type="text/css" href="general.css">
</head>
<body>

	<div class="imgcontainer">
		<img src="pictures/werewolf.png" alt="login_icon" class="login_icon">
	</div>

	<div>
		<p class="welcome">Welcome ${welcomeUser}</p>
	</div>

	<fieldset>
		<div class="container">

			<div style="float: left;">
				<form action="findReceivedMessages" method="get">
					<button type="submit" id="buttonDivs">View Inbox</button>
				</form>
			</div>

			<div style="float: right;">
				<form action="getSentMessages" method="get">
					<button type="submit" id="buttonDivs">View Outbox</button>
				</form>
			</div>

			<br></br> <br></br>

			<div style="margin: auto;">
				<form action="showCreateMessage" method="get">
					<button type="submit" id="buttonDivs"
						style="background-color: #008000">Send New Message</button>
				</form>
			</div>

			<br></br> <br></br>

			<c:if test="${userRole.equals('r1')}">
				<div style="float: left;">
					<form action="getAllMessages" method="get">
						<button type="submit" id="buttonDivs"
							style="background-color: #008000">View All Messages</button>
					</form>
				</div>

				<div style="float: right;">
					<form action="findByNameSorted" method="get">
						<button type="submit" id="buttonDivs"
							style="background-color: #008000">Edit Users</button>
					</form>
				</div>
			</c:if>
			<br></br> <br></br>
			<div style="float: left;">
			<c:if test="${userRole.equals('r1')}">
				<form action="pdfAllReport" method="get" target=_blank>
					<button type="submit" style="max-width: 100px;">Print All Messages</button>
				</form>
				</c:if>
			</div>
			
			<div style="float: left;">
				<form action="pdfYourReport" method="get" target=_blank>
					<button type="submit" style="max-width: 100px;">Print your Messages</button>
				</form>
			</div>
			
			<div style="float: right;">
				<form action="login" method="post">
					<button type="submit" style="max-width: 100px;">Logout</button>
				</form>
			</div>
		</div>
		<br></br> <br></br>
	</fieldset>
</body>
</html>