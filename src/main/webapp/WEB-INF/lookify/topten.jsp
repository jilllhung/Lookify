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
	<header>
		<h3>Top Ten Songs:</h3>
		<div class="right-align"><a href="/dashboard">Dashboard</a></div>
	</header>
	<ul>
		<c:forEach items="${songs}" var="s">
			<li class="row">
				<div class="col col-sm-2"><c:out value="${s.rating}"/></div>
				<div class="col col-sm-5"><c:out value="${s.title}"/></div>
				<div class="col col-sm-5"><c:out value="${s.artist}"/></div>
			</li>
		</c:forEach>
	</ul>
</body>
</html>