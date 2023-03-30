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
    <title>Edit Game</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
   <div class="container">
	
	<h2 class="text-center">Update your Upload!</h2>

	<a href="/home">Back to Home</a>

	<div class="container">
		<form:form action="/games/${game.id}" modelAttribute="game" class="form" method="post">
			<input type="hidden" name="_method" value="put"/>
		
			<div class="form-row">
				<form:label for="gameName" path="gameName">Game Name:</form:label>
				<form:input type="text" path="gameName" class="form-control"/>
				<form:errors path="gameName" class="text-danger"/>
			</div>
			
			<div class="form-row">
				<form:label for="level" path="level">Skill Level: (1-5)</form:label>
				<form:input type="int" path="level" class="form-control"/>
				<form:errors path="level" class="text-danger"/>
			</div>
			
			<div class="form-row">
				<form:label for="genre" path="genre">Genre:</form:label>
				<form:input type="text" path="genre" class="form-control"/>
				<form:errors path="genre" class="text-danger"/>
			</div>
			
			<div class="form-row">
				<form:input type="hidden" path="user" value="${user.id}" class="form-control"/>
				<form:errors path="user" class="error"/>
			</div>
			
			<div class="form-row">
				<input type="submit" value="Update" class="btn-primary"/>
			</div>
			
		</form:form>
	</div>

</div>
</body>
</html>

