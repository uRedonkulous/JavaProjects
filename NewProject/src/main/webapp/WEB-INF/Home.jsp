<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Homepage</title>
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
				<td><a href="teams/${game.id}"><c:out value="${game.gameName}"/></a></td>
				<td><c:out value="${game.level}"/></td>
				<td><c:out value="${game.genre}"/></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>