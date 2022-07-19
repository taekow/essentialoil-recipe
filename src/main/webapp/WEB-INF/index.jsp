<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<title>Login Page</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<script type="text/javascript" src="js/app.js"></script>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- For any Bootstrap that uses JS or jQuery-->
<script src="/webjars/jquery/jquery.min.js"></script>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light"
		style="background-color: #e3f2fd;">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand mb-0 h1" href="/dashboard">Essential Oil
					Recipes</a>
			</div>
		</div>
	</nav>
	<div class="container">
		<div class="row justify-content-evenly pt-5">
			<h2 class="text-info text-left pb-3">Welcome !</h2>
			<div class="col-5 pt-5 p">
				<h2>Register</h2>
				<form:form action="/register" method="post" modelAttribute="newUser">
					<div class="form-group pt-3">
						<form:label path="name">Name:</form:label>
						<form:errors path="name" class="text-danger" />
						<form:input type="text" path="name" class="form-control"
							style="width:520px;" />
					</div>
					<div class="form-group pt-3">
						<form:label path="email">Email:</form:label>
						<form:errors path="email" class="text-danger" />
						<form:input type="email" path="email" class="form-control"
							style="width:520px;" />
					</div>
					<div class="form-group pt-3">
						<form:label path="password">Password:</form:label>
						<form:errors path="password" class="text-danger" />
						<form:password path="password" class="form-control"
							style="width:520px;" />
					</div>
					<div class="form-group pt-3">
						<form:label path="confirm">Confirmation Password:</form:label>
						<form:errors path="confirm" class="text-danger" />
						<form:password path="confirm" class="form-control"
							style="width:520px;" />
					</div>
					<div class="form-group text-right">
						<input type="submit" class="btn btn-info mt-4 float-end"
							value="Register" />
					</div>
				</form:form>
			</div>
			<div class="col-5 pt-5">
				<h2>Login</h2>
				<form:form action="/login" modelAttribute="newLogin">
					<div class="form-group pt-3">
						<form:label path="email">Email:</form:label>
						<br />
						<form:errors path="email" class="text-danger" />
						<form:input type="email" path="email" class="form-control"
							style="width:520px;" />
					</div>
					<div>
						<form:label path="password">Password: </form:label>
						<br />
						<form:errors path="password" class="text-danger" />
						<form:password path="password" class="form-control"
							style="width:520px;" />
					</div>
					<div class="form-group">
						<input type="submit" class="btn btn-info mt-4 float-end" value="login" />
					</div>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>