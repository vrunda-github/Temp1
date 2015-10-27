<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>List User</title>
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
</head>
<script type="text/javascript">
	function confirmDelete(userName) {
		var userName = userName;
		var result = confirm("Want to delete?");
		if (result == true) {
			$.ajax({
				url : "delete?userName=" + userName,
				type : "POST",
				contentType : "application/json; charset=utf-8",
				dataType : "json",
				success : function() {
					setTimeout(function() {
						window.location.reload(true);
					}, 10000);
				}

			});

		}

	}
</script>

<script type="text/javascript">
	function editUserFun(userName) {
		var userName = userName;
		$
				.ajax({
					url : "editUser?userName=" + userName,
					type : "POST",
					contentType : "application/json; charset=utf-8",
					dataType : "json",
					success : function(user) {
						var user = user;
						var form = $('<form action="edit" method="post">'
								+ '<input type="text" name="userName" value="' + user.userName  + '"></input>'
								+ '</br>'
								+ '<input type="text" name="email" value="' + user.email  + '"></input>'
								+ '</br>'
								+ '<input type="text" name="city" value="' + user.city  + '"></input>'
								+ '</br>'
								+ '<input type="text" name="state" value="' + user.state  + '"></input>'
								+ '</br>'
								+ '<input type="text" name="country" value="' + user.country  + '"></input>'
								+ '</br>'
								+ '<input type="submit" name="Edit"></input>'
								+ '</form>');
						$('.userForm').append(form);
						setTimeout(function() {
							window.location.reload(true);
						}, 10000);

					}
				});
	}
</script>
<body>

	<div>
		<table border="1">
			<tr>
				<td colspan="7" align="center"><h2>List of User</h2></td>
			</tr>
			<tr>
				<td>User Name</td>
				<td>Email</td>
				<td>City</td>
				<td>State</td>
				<td>Country</td>
				<c:set var="user" value="${user}" />
				<c:choose>
					<c:when test="${user.role eq 'admin'}">
						<td>Edit</td>
						<td>Delete</td>
					</c:when>
				</c:choose>

			</tr>
			<c:forEach var="element" items="${userList}">
				<tr>
					<td>${element.userName}</td>
					<td>${element.email}</td>
					<td>${element.city}</td>
					<td>${element.state}</td>
					<td>${element.country}</td>

					<c:set var="user" value="${user}" />
					<c:choose>
						<c:when test="${user.role eq 'admin'}">
							<td><a href="#" onclick="editUserFun('${element.userName}')">Edit</a></td>
							<c:set var="role" value="${element.role}" />
							<c:choose>
								<c:when test="${role eq 'user'}">
									<td><a href="#"
										onclick="confirmDelete('${element.userName}')">Delete</a></td>
								</c:when>
							</c:choose>

						</c:when>
					</c:choose>
				</tr>
			</c:forEach>
		</table>
		<div class="userForm"></div>
		<form:form action="logout" commandName="user">
			<td align="center"><input type="submit" value="Logout" /></td>
		</form:form>
	</div>
</body>
</html>