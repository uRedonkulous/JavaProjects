<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <title>Registration</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<h1 class="text-center">Welcome! Register Here!</h1>
	<form:form action="/register" method="post" modelAttribute="newUser">

	<table class="table table-striped table-bordered">
		<thead>
	    	<tr>
	            <td>Register</td>
	        </tr>
	    </thead>
	    <thead>
	    	<tr>
	            <td>User Name:</td>
	            <td>
					<form:input class="input" path="userName"/>
	            	<form:errors path="userName" class="text-danger"/>					
	            </td>
	        </tr>
	        <tr>
	            <td>Email:</td>
	            <td>
					<form:input class="input" path="email"/>
	            	<form:errors path="email" class="text-danger"/>
	            </td>
	        </tr>
	        <tr>
	            <td>Password:</td>
	            <td>
					<form:input class="input" type="password" path="password"/>
	            	<form:errors path="password" class="text-danger"/>
	            </td>
	        </tr>
	        <tr>
	            <td>Confirm PW:</td>
	            <td>
					<form:input class="input" type="password" path="confirm"/>
					<form:errors path="confirm" class="text-danger"/>
	            </td>
	        </tr>
	        <tr>
	        	<td><input class="input btn-primary" type="submit" value="Submit"/></td>
	        </tr>
	    </thead>
	</table>
</form:form>
<hr>
<form:form action="/login" method="post" modelAttribute="newLogin">

	<table class="table table-striped table-bordered">
		<thead>
	    	<tr>
	            <td>Log In</td>
	        </tr>
	    </thead>
	    <thead>
	        <tr>
	            <td>Email:</td>
	            <td>
					<form:input class="input" path="email"/>
					<form:errors path="email" class="text-danger"/>
	            </td>
	        </tr>
	        <tr>
	            <td>Password:</td>
	            <td>
					<form:input class="input" type="password" path="password"/>
	            	<form:errors path="password"  class="text-danger"/>
	        </td>
	        </tr>
	        <tr>
	        	<td><input class="input btn btn-success" type="submit" value="Log In"/></td>
	        </tr>
	    </thead>
	</table>
</form:form>
</body>
</html>

