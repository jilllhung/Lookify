<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%--import c tag --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--import form:from tag --%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Song</title>
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
	<form:form action="/songs" method="post" modelAttribute="song" class="create-form">
		<div class="form-group row">
			<form:label path="title" class="col-sm-3 col-form-label">Title</form:label>
			<div class="col-sm-9 input-error-container">
				<form:input path="title" class="form-control"/>
				<form:errors path="title" class="error-message"/>
			</div>
		</div>
		<div class="form-group row">
			<form:label path="artist" class="col-sm-3 col-form-label">Artist</form:label>
			<div class="col-sm-9 input-error-container">
				<form:input path="artist" class="form-control"/>
				<form:errors path="artist" class="error-message"/>
			</div>
		</div>
		<div class="form-group row">
			<form:label path="rating" class="col-sm-3 col-form-label">Rating</form:label>
			<div class="col-sm-9 input-error-container">
				<form:input path="rating" class="form-control"/>
				<form:errors path="rating" class="error-message"/>
			</div>
		</div>
		<div class="button-container">
			<input type="submit" value="Add Song" class="btn btn-primary" />
		</div>
	</form:form>
</body>
</html>