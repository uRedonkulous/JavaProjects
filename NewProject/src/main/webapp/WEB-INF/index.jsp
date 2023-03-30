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
<div class="container">
	<h1 class="text-center">Welcome! Register Here!</h1>
	<form:form action="/register" method="post" modelAttribute="newUser">

	<div class="my-5 mx-auto">
	    	<div>
	            <h2>Register</h2>
	        </div>
	    <form style="max-width: 600px; margin: 0 auto;">
	    	<div class="form-group row">
				<label class="col-4 col-form-label">User Name:</label>
				<form:input class="input" path="userName"/>
	            <form:errors path="userName" class="text-danger"/>					
	        </div>
	        <div class="form-group row">
	            <label class="col-4 col-form-label">Email:</label>
				<form:input class="input" path="email"/>
	            <form:errors path="email" class="text-danger"/>
	        </div>
	        <div class="form-group row">
	            <label class="col-4 col-form-label">Password:</label>
				<form:input class="input" type="password" path="password"/>
	            <form:errors path="password" class="text-danger"/>
	        </div>
	        <div class="form-group row">
	            <label class="col-4 col-form-label">Confirm PW:</label>
				<form:input class="input" type="password" path="confirm"/>
				<form:errors path="confirm" class="text-danger"/>
	        </div>
	        <div>
	        	<input class="input btn-primary" type="submit" value="Submit"/>
	        </div>
	    </form>
	</div>
</form:form>
<hr>
<form:form action="/login" method="post" modelAttribute="newLogin">

	<div class="my-5 mx-auto">
		<div>
	         <h2>Log In</h2>
	    </div>
	        <div class="form-group row">
	            <label class="col-4 col-form-label">Email:</label>
				<form:input class="input" path="email"/>
	            <form:errors path="email" class="text-danger"/>
	        </div>
	        <div class="form-group row">
	            <label class="col-4 col-form-label">Password:</label>
				<form:input class="input" type="password" path="password"/>
	            <form:errors path="password" class="text-danger"/>
	        </div>
	        <div>
	        	<input class="input btn btn-success" type="submit" value="Log In"/>
	        </div>

	</div>
</form:form>
</div>
</body>
</html>

