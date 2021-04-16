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
<title>Title</title>
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
	<div class="right-align"><a href="/dashboard">Dashboard</a></div>
	<ul class="show-list">
		<li class="row">
			<div class="col col-sm-4">Title</div>
			<div class="col col-sm-8">
				<c:out value="${song.title}"></c:out>
			</div>
		</li>
		<li class="row">
			<div class="col col-sm-4">Artist</div>
			<div class="col col-sm-8">
				<c:out value="${song.artist}"></c:out>
			</div>
		</li>
		<li class="row">
			<div class="col col-sm-4">Rating(1-10)</div>
			<div class="col col-sm-8">
				<c:out value="${song.rating}"></c:out>
			</div>
		</li>
	</ul>
	<form action="/songs/${song.id}" method="post" id="deleteSong${song.id}">
		<input type="hidden" name="_method" value="delete"> <a
			onclick="(function(){console.log('delete!!');document.getElementById('deleteSong${song.id}').submit()})()"
			href="#">Delete</a>
	</form>
</body>
</html>