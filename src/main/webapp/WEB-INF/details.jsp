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
<title>Recipe Detail Page</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
				<a class="navbar-brand mb-0 h1" href="/dashboard">Essential Oil Recipes</a>
			</div>
			<ul class="nav justify-content-end">
				<li class="nav-item"><a class="nav-link active" href="/dashboard">Back</a></li>
				<li class="nav-item"><a class="nav-link" href="/logout">Log out</a></li>
			</ul>
		</div>
	</nav>
	<div class="container">
		<div class="row mt-5">
			<div class="d-flex">
				<div class="flex-fill p-2">
					<h2 class="pt-5">
						<c:out value="${recipe.name}"></c:out>
					</h2>
				</div>
			</div>
		</div>
		<%-- <div class="row mt-5 justify-content-center">
		  <table class="table table-borderless">
			<tbody>
				<tr>
					<th scope="row">Name:</th>
					<td><c:out value="${recipe.name}"></c:out></td>
				</tr>
				<tr>
					<th scope="row">Category:</th>
					<td><c:out value="${recipe.category}"></c:out></td>
				</tr>
				<tr>
					<th scope="row">Ingredients:</th>
					<td><c:out value="${recipe.ingredient}"></c:out></td>
				</tr>
			</tbody>
		</table>
		</div> --%>
		<div class="row mt-5 justify-content-center">
		    <div class="col-2 fw-bold">
		    	Name:
		    </div>
		    <div class="col-6">
		    	<c:out value="${recipe.name}"></c:out>
		    </div>
		    <div class="col-1" class="align-top">
	    		<c:choose>
					<c:when test="${isFavoriteRecipe}">
						<form:form action="/recipes/${recipe.id}/unfavorite" method="post">
							<button type="submit" class="btn btn-outline-dark border-0 p-0"><i class="fa fa-heart fa-2x"></i></button>
							<input type="hidden" name="redirectRoute" value="/recipes/details/${recipe.id}" />
						</form:form>
					</c:when>
					<c:otherwise>
						<form:form action="/recipes/${recipe.id}/favorite" method="post">
							<button type="submit" class="btn btn-outline-dark border-0 p-0"><i class="fa fa-heart-o fa-2x"></i></button>
							<input type="hidden" name="redirectRoute" value="/recipes/details/${recipe.id}" />
						</form:form>
					</c:otherwise>
				</c:choose>
		    </div>
	    </div>
	    <div class="row mt-4 justify-content-center">
		    <div class="col-2 fw-bold">
		    	Category:
		    </div>
		    <div class="col-7">
		    	<c:out value="${recipe.category}"></c:out>
		    </div>
		</div>
		<div class="row mt-4 justify-content-center">
		    <div class="col-2 fw-bold">
		    	Ingredients:
		    </div>
		    <div class="col-7">
		    	<c:out value="${recipe.ingredient}"></c:out>
		    </div>
		</div>
		<div class="row mt-4 justify-content-center">
		    <div class="col-2 fw-bold">
		    	Description:
		    </div>
		    <div class="col-7">
		    	<c:out value="${recipe.description}"></c:out>
		    </div>
		</div>
	</div>
</body>
</html>