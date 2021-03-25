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



<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<script src="js/script.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
<link rel="stylesheet" href="css/style.css">
<!-- linking css style with index jsp page -->

</head>
<body>
	<%@include file="components/navbar.jsp"%>
	<!-- <h1 style="color: #eb0e19">Welcome to the Faujikart</h1> -->
	<div class="container-fluid">
		<div class="row mt-3">
			<%
				String cat = request.getParameter("category");
			//  out.println(cat);
			ProductDao dao = new ProductDao(FactoryProvider.getFactory()); // margin top 3 to bring down the content,Dao class is the link to database, so object of dao class will help to access database from java program 
			List<Product> list = null;
			if (cat == null) {
				list = dao.getAllProducts();
			} else if (cat.trim().equals("all")) {
				list = dao.getAllProducts();
			} else {
				int cid = Integer.parseInt(cat.trim());// trim is used to remove extra white spaces
				list = dao.getAllProductsById(cid);
			}

			CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
			List<Category> clist = cdao.getCategories();
			%>

			<div class="col-md-2">

				<div class="list-group mt-4">
					<a href="index.jsp?category=all"
						class="list-group-item list-group-item-action active"
						aria-current="true"> All Products </a>
					<%
						for (Category category : clist) {
					%>
					<a href="index.jsp?category=<%=category.getCategoryId()%>"
						class="list-group-item list-group-item-action"><%=category.getCategoryTitle()%></a>
					<%
						}
					%>
				</div>

			</div>

			<div class="col-md-10">

				<div clas="row mt-4">
					<!-- col:12 -->
					<div class="col-md-12 mt-4">
						<div class="card-columns">

							<%
								for (Product p : list) {
							%>
							<div class="card">
								<div class="container text-center">
									<img class="card-img-top m-2"
										src="img/products/<%=p.getpPhoto()%>"
										style="max-height: 100px; max-width: 100%; width: auto">
								</div>
								<div class="card-body">

									<h5 class="card-title"><%=p.getpName()%></h5>
									<p class="card-text">
										<%=Helper.get10Words(p.getpDesc())%>
									</p>

								</div>

								<div class="card-footer text-center">
									<button class="btn custom-bg text-white" onclick="add_to_cart(<%=p.getId()%>, '<%=p.getpName()%>',<%=p.getPriceAfterApplyingDiscount()%>)">Add to Cart</button>
									<button class="btn btn-success">
										&#8377;<%=p.getPriceAfterApplyingDiscount()%>/-<span
											style="text-decoration: line-through !important;">&#8377;<%=p.getpPrice()%>
											<%=p.getpDiscount()%>% off
										</span>
									</button>

								</div>


							</div>


							<%
								}
							if (list.size() == 0) {
							out.println("<h3>No item in this category<h3>");
							}
							%>

						</div>


					</div>


				</div>

			</div>

		</div>
	</div>
	
<%@include file="components/common_model.jsp"%>	
	
</body>
</html>
