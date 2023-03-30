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
    <title>Game Page</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
   <h1>${game.gameName}</h1>

<a href="/home">Back to Homepage!</a>

<div class="container">

	<div>
		Game Name: ${game.gameName}
	</div>
	<div>
		Skill Level: ${game.level}
	</div>
	<div>
		Game Genre: ${game.genre}
	</div>
	<div>
		Players:

	</div>
	
<a href="/games/${id}/edit" class="btn btn-success">Edit Game</a>
<a href="/${id}/delete" class="btn btn-danger">Delete Game</a>
</div>

</body>
</html>

