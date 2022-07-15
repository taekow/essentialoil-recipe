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
<title>Dashboard Page</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<script type="text/javascript" src="js/app.js"></script>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- For any Bootstrap that uses JS or jQuery-->
<script src="/webjars/jquery/jquery.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="d-flex">
				<div class="flex-fill p-2">
					<h1 class="mt-5 text-info">
						Hello,
						<c:out value="${loggedInUser.name}" /> !
					</h1>
				</div>
				<div class="align-self-end p-4">
					<a href="/favorite">My Favorite</a> |
					<a href="/logout">Log out</a>
				</div>
			</div>
		</div>
		<h3 class="mt-4">Essential Oil Recipes</h3>
		<div class="row mt-5 d-flex justify-content-center">
			<table class="table">
				<thead class="thead-dark">
					<tr>
						<th scope="col">Names</th>
						<th scope="col">Categories</th>
						<th scope="col">Actions</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="recipe" items="${recipes}">
						<tr>
							<td><a href="recipes/${recipe.id}">${recipe.name}</a></td>
							<td>${recipe.category}</td>
						</tr>
					</c:forEach>
						<tr>
						</tr>
				</tbody>
			</table>
		</div>
		<div>
			<a href="/recipes/new" class="btn btn-info mt-5" role="button">&lt; ADD NEW RECIPE</a>
		</div>
	</div>
</body>
</html>
