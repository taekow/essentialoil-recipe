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
<title>Edit Recipe Page</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<script type="text/javascript" src="js/app.js"></script>
<!-- for Bootstrap CSS -->


<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- For any Bootstrap that uses JS or jQuery-->
<script src="/webjars/jquery/jquery.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="row mt-5">
			<div class="d-flex">
				<div class="flex-fill p-2">
					<h1 class="pt-5">Edit <c:out value="${recipe.name}"></c:out> Recipe</h1>
				</div>
				<div class="align-self-end mb-3">
					<a href="/dashboard">Back</a> |
					<a href="/logout">Log out</a>
				</div>
			</div>
		</div>
		<div class="row">
			<form:form action="/recipes/${recipe.id}" method="post"
				modelAttribute="recipe">
				<div class="form-group pt-3">
					<form:label path="name">Name:</form:label>
					<form:errors path="name" class="text-danger" />
					<form:input type="text" path="name" class="form-control"
						style="width:500px;" />
				</div>
				<div class="form-group pt-3">
					<form:label path="category">Category:</form:label>
					<form:errors path="category" class="text-danger" />
					<form:input type="text" path="category" class="form-control"
						style="width:500px;" />
				</div>
				<div class="form-group pt-3">
					<form:label path="ingredient">Ingredients:</form:label>
					<form:errors path="ingredient" class="text-danger" />
					<form:textarea path="ingredient" class="form-control" rows="5"
						style="width:500px;" />
				</div>
				<div class="form-group pt-3">
					<form:label path="description">Descriptions:</form:label>
					<form:errors path="description" class="text-danger" />
					<form:textarea path="description" class="form-control" rows="5"
						style="width:500px;" />
				</div>
					<!-- hidden -->
					<form:input type="hidden" value="${loggedInUser.id}" path="user"/>
				<div>
					<input type="submit" class="btn btn-info mt-3" value="Update" />
				</div>
			</form:form>
		</div>
	</div>
</body>
</html>