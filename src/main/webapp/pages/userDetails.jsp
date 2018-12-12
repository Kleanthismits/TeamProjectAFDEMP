<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<head>
<link rel="stylesheet" href="demo.css">
<!-- <style>           
.blue-button{
	background: #25A6E1;
	filter: progid: DXImageTransform.Microsoft.gradient( startColorstr='#25A6E1',endColorstr='#188BC0',GradientType=0);
	padding:3px 5px;
	color:#fff;
	font-family:'Helvetica Neue',sans-serif;
	font-size:12px;
	border-radius:2px;
	-moz-border-radius:2px;
	-webkit-border-radius:4px;
	border:1px solid #1A87B9
}     
table {
  font-family: "Helvetica Neue", Helvetica, sans-serif;
   width: 50%;
}
th {
  background: SteelBlue;
  color: white;
}
 td,th{
                border: 1px solid gray;
                width: 25%;
                text-align: left;
                padding: 5px 10px;
            }
</style> -->
</head>
<body>
<div class = "container" style=text-align:center>
<h5 class ="codrops-top">Create a new user</h5>
<form action="createUser" method = "POST">
UserName: <input type="text" name="username"><br/>
Password: <input type="text" name="password"><br/>
Role: <input type="text" name="role"><br/>
<input type="submit"/>
</form><br/>





<h5 class = "codrops-top a">Select a user id to display</h5>
<form action="getUser">
Id: <input type="text" name="userId">
${userNotFound}
<br/>

<input type="submit"/>
</form><br/>



<h5>See users by sorted username</h5>
<form action="/findByNameSorted">
<input type="submit"/>
</form>
</div>
<%-- <form:form method="post" modelAttribute="user" action="createUser">
<table>
		<tr>
			<th colspan="2">Add User</th>
		</tr>
		<tr>
	<form:hidden path="id" />
          <td><form:label path="username">Username:</form:label></td>
          <td><form:input path="username" size="30" maxlength="30"></form:input></td>
        </tr>
		<tr>
			    <td><form:label path="password">Password:</form:label></td>
          <td><form:input path="password" size="30" maxlength="30"></form:input></td>
		</tr>
		<tr>
			    <td><form:label path="role">Role:</form:label></td>
          <td><form:input path="role" size="30" maxlength="30"></form:input></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit"
				class = "bluebutton" /></td>
		</tr>
	</table> 
</form:form> --%>
<%-- 
<c:if test=""></c:if>
<br/>
<h3>Notes List</h3>
<c:if test="${!empty listOfCountries}">
	<table class="tg">
	<tr>
		<th width="80">Id</th>
		<th width="120">Country Name</th>
		<th width="120">Population</th>
		<th width="60">Edit</th>
		<th width="60">Delete</th>
	</tr>
	<c:forEach items="${listOfCountries}" var="country">
		<tr>
			<td>${country.id}</td>
			<td>${country.countryName}</td>
			<td>${country.population}</td>
			<td><a href="<c:url value='/updateCountry/${country.id}' />" >Edit</a></td>
			<td><a href="<c:url value='/deleteCountry/${country.id}' />" >Delete</a></td>
		</tr>
	</c:forEach>
	</table>
</c:if>--%>

</body>
</html>