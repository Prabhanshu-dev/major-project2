<%@page import="com.learn.mycart.entities.User"%>
<%@include file="components/common_css_js.jsp"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>
<%@page import="com.learn.mycart.entities.User"%>
<%@page import="com.learn.mycart.entities.Category"%>
<%@page import="com.learn.mycart.helper.Helper"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	User user = (User) session.getAttribute("current-user");
if (user == null) {

	session.setAttribute("message", "You are not logged in !! Login first");
	response.sendRedirect("login.jsp");
	return;

} else {

	if (user.getUserType().equals("normal")) {

		session.setAttribute("message", "You are not admin ! Do not access this page");
		response.sendRedirect("login.jsp");
		return;

	}

}
%>
<%
							CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
							List<Category> list = cdao.getCategories();
							
		Map<String,Long>m = Helper.getCounts(FactoryProvider.getFactory());					
						%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Panel</title>
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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
       <%@include file="components/navbar.jsp"%>
	  <div class="container admin">
		<div class="container-fluid mt-3">
			<%@include file="components/message.jsp"%>
		</div>
		<div class="row mt-4">
			<div class="col-md-4">
				<div class="card"
					style="border: 1px solid #673ab7; pointer-events: auto">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 125px" class="img-fluid"
								src="img/profile-user.png" alt="user_icon">
						</div>
						<h1><%= m.get("userCount") %></h1>
						<h1>Users</h1>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card"
					style="border: 1px solid #673ab7; pointer-events: auto">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 125px" class="img-fluid"
								src="img/checklist.png" alt="user_icon">
						</div>
						<h1><%= list.size() %></h1>
						<h1>List</h1>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card"
					style="border: 1px solid #673ab7; pointer-events: auto">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 125px" class="img-fluid"
								src="img/product.png" alt="user_icon">
						</div>
						<h1><%= m.get("productCount") %></h1>
						<h1>Products</h1>
					</div>
				</div>
			</div>
		</div>
		<div class="row mt-3">
			<div class="col-md-6">
				<div class="card" data-toggle="modal"
					data-target="#add-category-modal"
					style="border: 1px solid #673ab7; pointer-events: auto">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 125px" class="img-fluid"
								src="img/follow.png" alt="user_icon">
						</div>

						<h1>Add Category</h1>
					</div>
				</div>


			</div>
			<div class="col-md-6">
				<div class="card" data-toggle="modal"
					data-target="#add-product-modal" style="border: 1px solid #673ab7">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 125px" class="img-fluid"
								src="img/plus.png" alt="user_icon">
						</div>

						<h1>Add Product</h1>
					</div>
				</div>



			</div>
		</div>
	</div>
	<!-- Button trigger modal -->


	<!-- Modal -->
	<div class="modal fade" id="add-category-modal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header custom-bg text-white">
					<h5 class="modal-title" id="exampleModalLabel">Fill Category
						Details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="ProductOperationServlet" method="post">
						<input type="hidden" name="operation" value="addcategory">
						<div class=form-group>
							<input type="text" class="form-control" name="catTitle"
								placeholder="Enter category title" required />
						</div>
						<div class="form-group">
							<textarea style="height: 350px" class="form-control"
								placeholder="Enter category description" name="catDescription"
								required></textarea>
						</div>
						<div class="container text-center">
							<button class="btn btn-outline-success">Add Category</button>
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

<!-- -------------------------------------------------------------------------- -->

	<!-- Modal -->
	<div class="modal fade" id="add-product-modal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Fill Product
						Details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="ProductOperationServlet" method="post"
						enctype="multipart/form-data">
						<input type="hidden" name="operation" value="addproduct" />
						<div class=form-group>
							<input type="text" class="form-control" name="pName"
								placeholder="Enter product title">
						</div>
						<div class=form-group>
							<textarea type="text" class="form-control" name="pDesc"
								placeholder="Enter product Description"></textarea>
						</div>
						<div class="form-group">
							<input type="number" class="form-control"
								placeholder="Enter product Discount" name="pDiscount" required>
						</div>
						<div class="form-group">
							<input type="number" class="form-control"
								placeholder="Enter price of the product" name="pPrice">
						</div>
						<div class="form-group">
							<input type="number" class="form-control"
								placeholder="Enter product Quantity" name="pQuantity">
						</div>
						
						<div class="form-group">
							<select name="catId" class="form-control" id="">
								<%
									for (Category c : list) {
								%>
								<option value="<%=c.getCategoryId()%>">
									<%=c.getCategoryTitle()%>
								</option>
								<%
									}
								%>
							</select>
						</div>
						
						<div class="form-group">
						<label for="pPic">Select Picture of product</label>
						<br>
						<input type="file" id="pPic" name="pPic" required/>
						
						</div>
						
						<div class="container text-center">
							<button class="btn btn-outline-success">Add Product</button>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>

				</div>
			</div>
		</div>
	</div>



</body>
</html>