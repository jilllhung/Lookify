<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%--import c tag --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--import form:from tag --%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Lookify!</title>
<%--bootstrap --%>
<link rel="stylesheet"
	href="/webjars/bootstrap/4.5.0/css/bootstrap.min.css" />
<script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<%--link static files--%>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<%--<script type="text/javascript" src="js/script.js"></script>--%>
</head>
<body class="container">
	<header>
		<a href="/songs/new">Add New Song</a> 
		<a href="/search/topTen">Top Songs</a>
		<form action="/search/artist" method="post" class="form-inline">
			<div class="form-group mx-sm-3 mb-2">
				<label for="artist" class="sr-only">Artist</label> 
				<input type="text" class="form-control" id="artist" name="artist" placeholder="Artist">
			</div>
			<button type="submit" class="btn btn-primary mb-2">Search Artist</button>
		</form>
	</header>
	<div class="error-message">${noSong}</div>
	<table class="table table-bordered table-hover">
		<%--table-striped  --%>
		<thead>
			<tr>
				<th scope="col">Name</th>
				<th scope="col">Rating</th>
				<th scope="col">Actions</th>
		</thead>
		<tbody>
			<c:forEach items="${songs}" var="s">
				<tr>
					<td><a href="/songs/${s.id}"><c:out value="${s.title}" /></a></td>
					<td><c:out value="${s.rating}" /></td>
					<td>
						<form action="/songs/${s.id}" method="post" id="deleteSong${s.id}">
							<input type="hidden" name="_method" value="delete"> 
								<a onclick="(function(){console.log('delete!!');document.getElementById('deleteSong${s.id}').submit()})()" href="#">Delete</a>
						</form>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>