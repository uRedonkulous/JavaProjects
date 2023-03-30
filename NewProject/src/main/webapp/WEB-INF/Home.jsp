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
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<meta charset="UTF-8">
    <title>Homepage</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<h1>Welcome, <c:out value="${user.userName}"/>!</h1>
	<a href="/logout">Logout</a>
	<a href="/addGame">Create a game!</a>
	
	<table class="table table-striped table-bordered table-hover">
		<tr>
			<th>Game Name:</th>
			<th>Difficulty:</th>
			<th>Genre:</th>
		</tr>
		<c:forEach var="game" items="${games}">
			<tr>
				<td><a href="games/${game.id}"><c:out value="${game.gameName}"/></a></td>
				<td><c:out value="${game.level}"/></td>
				<td><c:out value="${game.genre}"/></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>