<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit User</title>
</head>
<body>
	<div>


		<form:form action="edit" method="post" modelAttribute="user">
			<c:set var="element" value="${user}" />
			<table>
				<tr>
					<td align="center">Edit User</td>
				</tr>
				<tr>
					<td>User Name:</td>
					<td><form:input path="userName" value="${element.userName}" /></td>
				</tr>
				<tr>
					<td>E-mail:</td>
					<td><form:input path="email" value="${element.email}" /></td>
				</tr>
				<tr>
					<td>City</td>
					<td><form:input path="city" value="${element.city}" /></td>
				</tr>
				<tr>
					<td>State</td>
					<td><form:input path="state" value="${element.state}" /></td>
				</tr>
				<tr>
					<td>Country</td>
					<td><form:input path="country" value="${element.country}" /></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit"
						value="Edit" /></td>
				</tr>
			</table>
		</form:form>
		<form:form action="logout" commandName="user">
			<td align="center"><input type="submit" value="Logout" /></td>
		</form:form>
	</div>
</body>
</html>