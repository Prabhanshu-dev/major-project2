<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="com.learn.mycart.entities.Category"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>
<%@page import="com.learn.mycart.entities.Product"%>
<%@page import="com.learn.mycart.dao.ProductDao"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="com.learn.mycart.helper.Helper"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Panel</title>
<%@include file="components/common_css_js.jsp"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">




<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<script src="js/script.js"></script>
<link rel="stylesheet" href="css/style.css">

</head>
<body>
	<%@include file="components/navbar.jsp"%>
	<h1 style="color: #eb0e19">Welcome to the Faujikart</h1>

	<div class="container">

		<%
			ProductDao dao = new ProductDao(FactoryProvider.getFactory());
		List<Product> list = dao.getAllProducts();
		CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
		List<Category> clist = cdao.getCategories();
		%>


		<div class="row-10">


			<%
				for (Category c : clist) {
			%>

			<a href="#" class="btn btn-primary btn-lg active" role="button"
				aria-pressed="true"><%=c.getCategoryTitle()%></a>


			<%
				}
			%>


		</div>

		<div>

			<div id="carouselExampleIndicators" class="carousel slide"
				data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#carouselExampleIndicators" data-slide-to="0"
						class="active"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
				</ol>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img class="d-block w-100" src="img/img1.jpeg" alt="First slide">
					</div>
					<div class="carousel-item">
						<img class="d-block w-100" src="img/img2.jpeg" alt="Second slide">
					</div>
					<div class="carousel-item">
						<img class="d-block w-100" src="img/img3.jpeg" alt="Third slide">
					</div>
				</div>
				<a class="carousel-control-prev" href="#carouselExampleIndicators"
					role="button" data-slide="prev"> <span
					class="carousel-control-prev-icon" aria-hidden="true"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
					role="button" data-slide="next"> <span
					class="carousel-control-next-icon" aria-hidden="true"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>


		</div>

	</div>

	<div class="card-columns">

		<%
			for (Product p : list) {
		%>

		<div class="card">

			<img class="card-img-top" src="img/products/laptop"
				alt="Card image cap">


			<div class="card-body">
				<h5 class="card-title"><%=p.getpName()%></h5>

				<p class="card-text">
					<%=Helper.get10Words(p.getpDesc())%>

				</p>
			</div>

			<div class="card-footer">
				<button class="btn custom-bg text-white">Add to cart</button>
				<button class="btn btn-outline-primary">
					&#8377;
					<%=p.getpPrice()%></button>

			</div>

		</div>



		<%
			}
		%>

	</div>

</body>
</html>
</body>
</html>