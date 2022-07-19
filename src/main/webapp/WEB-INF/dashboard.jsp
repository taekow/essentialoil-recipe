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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
			<ul class="nav justify-content-end">
				<li class="nav-item"><a class="nav-link active"
					href="/favorites">My Favorite</a></li>
				<li class="nav-item"><a class="nav-link" href="/logout">Log
						out</a></li>
			</ul>
		</div>
	</nav>
	<div class="container">
		<div class="row">
			<div class="d-flex">
				<div class="flex-fill p-2">
					<h5 class="mt-4 text-info">
						Hello,
						<c:out value="${loggedInUser.name}"></c:out>
						!
					</h5>
				</div>
			</div>
		</div>
		<div class=row>
			<div class="col mt-4">
				<h2>Recipe List</h2>
			</div>
			<div class="col mt-4 text-end">
				<a href="/recipes/new">+ Add NEW RECIPE</a>
			</div>
		</div>
		<div class="row mt-4 d-flex justify-content-evenly">
			<div class="col-10">
				<table class="table">
					<thead class="thead-dark">
						<tr>
							<th scope="col">Name</th>
							<th scope="col"></th>
							<th scope="col">Categories</th>
							<th scope="col">Actions</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="recipe" items="${recipes}">
							<tr>
								<td class="align-middle"><a
									href="recipes/details/${recipe.id}">${recipe.name}</a></td>
								<td><c:choose>
										<c:when test="${favoritedRecipeIds.contains(recipe.id)}">
											<div class="">
												<form:form action="/recipes/${recipe.id}/unfavorite"
													method="post">
													<button type="submit"
														class="btn btn-outline-secondary border-0">
														<i class="fa fa-heart"></i>
													</button>
													<input type="hidden" name="redirectRoute"
														value="/dashboard" />
												</form:form>
											</div>
										</c:when>
										<c:otherwise>
											<div class="">
												<form:form action="/recipes/${recipe.id}/favorite"
													method="post">
													<button type="submit"
														class="btn btn-outline-secondary border-0">
														<i class="fa fa-heart-o"></i>
													</button>
													<input type="hidden" name="redirectRoute"
														value="/dashboard" />
												</form:form>
											</div>
										</c:otherwise>
									</c:choose></td>
								<td class="align-middle">${recipe.category}</td>
								<c:choose>
									<c:when test="${loggedInUser.id == recipe.user.id}">
										<td>
											<div class="btn-group ms-3">
												<form:form action="/recipes/${recipe.id}/edit" method="get">
													<input type="submit" class="btn btn-secondary" value="Edit" />
												</form:form>
											</div>
											<div class="btn-group ms-3">
												<form:form action="/recipes/${recipe.id}/delete"
													method="post">
													<input type="hidden" name="_method" value="delete" />
													<input type="submit" class="btn btn-danger" value="Delete" />
												</form:form>
											</div>
										</td>
									</c:when>
								</c:choose>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>
