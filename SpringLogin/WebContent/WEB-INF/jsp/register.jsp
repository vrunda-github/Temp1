<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register User</title>
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<style type="text/css">
.error {
	color: #ff0000;
	font-style: italic;
	font-weight: bold;
}
</style>
<script type="text/javascript">
	function mandatory() {
		var flag = true;

		document.getElementById("userNameDiv").innerHTML = "";
		document.getElementById("passwordDiv").innerHTML = "";
		document.getElementById("emailDiv").innerHTML = "";
		document.getElementById("cityDiv").innerHTML = "";
		document.getElementById("stateDiv").innerHTML = "";
		document.getElementById("countryDiv").innerHTML = "";

		document.getElementById("userNameDiv").style.display = 'none';
		document.getElementById("passwordDiv").style.display = 'none';
		document.getElementById("emailDiv").style.display = 'none';
		document.getElementById("cityDiv").style.display = 'none';
		document.getElementById("stateDiv").style.display = 'none';
		document.getElementById("countryDiv").style.display = 'none';

		if (document.getElementById("userName").value == "") {
			document.getElementById("userNameDiv").style.display = 'inline';
			document.getElementById("userNameDiv").innerHTML = "Enter user name";
			flag = false;
		}
		if (document.getElementById("password").value == "") {
			document.getElementById("passwordDiv").style.display = 'inline';
			document.getElementById("passwordDiv").innerHTML = "Enter password";
			flag = false;
		}
		if (document.getElementById("email").value == "") {
			document.getElementById("emailDiv").style.display = 'inline';
			document.getElementById("emailDiv").innerHTML = "Enter email";
			flag = false;
		}
		if (document.getElementById("city").value == "") {
			document.getElementById("cityDiv").style.display = 'inline';
			document.getElementById("cityDiv").innerHTML = "Enter city";
			flag = false;
		}
		if (document.getElementById("state").value == "") {
			document.getElementById("stateDiv").style.display = 'inline';
			document.getElementById("stateDiv").innerHTML = "Enter state";
			flag = false;
		}
		if (document.getElementById("country").value == "") {
			document.getElementById("countryDiv").style.display = 'inline';
			document.getElementById("countryDiv").innerHTML = "Enter country";
			flag = false;
		}
		return flag;
	}
	function checkEmail() {

	    var email = document.getElementById('email');
	    var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;

	    if (!filter.test(email.value)) {
	    alert('Please provide a valid email address');
	    email.focus;
	    return false;
	 }
	}
</script>
</head>
<body>
<a href="?lang=en">English</a>  |  <a href="?lang=fr">French</a>
	<form:form action="register" method="post" modelAttribute="user"
		onsubmit="return mandatory();">
		<table>
			<tr>
				<td align="center">Register</td>
			</tr>
			<tr>
				<td><form:label path="userName"><spring:message code="label.userName"/></form:label></td>
				<td><form:input path="userName" /> <form:errors
						path="userName" cssClass="error"></form:errors></td>
				<td id="userNameDiv" class="error"
					style="display: none; text-align: right;"></td>
			</tr>
			<tr>
				<td><form:label path="password"><spring:message code="label.password"/></form:label></td>
				<td><form:password path="password" /> <form:errors
						path="password" cssClass="error"></form:errors></td>
				<td id="passwordDiv" class="error"
					style="display: none; text-align: right;"></td>
			</tr>

			<tr>
				<td><form:label path="email"><spring:message code="label.email"/></form:label></td>
				<td><form:input path="email" onblur="return checkEmail();" /> <form:errors path="email"
						cssClass="error"></form:errors></td>
				<td id="emailDiv" class="error"
					style="display: none; text-align: right;"></td>
			</tr>
			<tr>
				<td><form:label path="city"><spring:message code="label.city"/></form:label></td>
				<td><form:input path="city" /> <form:errors path="city"
						cssClass="error"></form:errors></td>
				<td id="cityDiv" class="error"
					style="display: none; text-align: right;"></td>
			</tr>
			<tr>
				<td><form:label path="state"><spring:message code="label.state"/></form:label></td>
				<td><form:input path="state" /> <form:errors path="state"
						cssClass="error"></form:errors></td>
				<td id="stateDiv" class="error"
					style="display: none; text-align: right;"></td>
			</tr>
			<tr>
				<td><form:label path="country"><spring:message code="label.country"/></form:label></td>
				<td><form:input path="country" /> <form:errors path="country"
						cssClass="error"></form:errors></td>
				<td id="countryDiv" class="error"
					style="display: none; text-align: right;"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit"
					value="Register" /></td>
			</tr>
		</table>
	</form:form>

</body>
</html>