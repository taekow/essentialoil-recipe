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
<title>Favorites Page</title>
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
			<ul class="nav justify-content-end">
				<li class="nav-item"><a class="nav-link active" href="/dashboard">Back</a></li>
				<li class="nav-item"><a class="nav-link" href="/logout">Log out</a></li>
			</ul>
		</div>
	</nav>
	<div class="container">
		<div class="row">
			<div class="d-flex">
				<div class="flex-fill p-2">
					<h2 class="pt-5">My favorite Recipes</h2>
				</div>
			</div>
		</div>
		<div class="row mt-4 d-flex justify-content-evenly">
			<div class="col-10">
				<table class="table table-borderless">
					<tbody>
						<c:forEach var="recipe" items="${loggedInUser.favoritedRecipes}">
							<tr>
								<td><a href="recipes/details/${recipe.id}">${recipe.name}</a></td>
								<td>
									<div class="btn-group ms-3">
										<form:form action="/recipes/${recipe.id}/unfavorite" method="post">
											<input type="submit" class="btn btn-secondary" value="Remove" />
											<input type="hidden" name="redirectRoute" value="/favorites" />
										</form:form>
									</div>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>
