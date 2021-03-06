<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New User</title>

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


<link rel="stylesheet" href="css/style.css">
</head>
<body style="background-image:url(img/signup.jpg);background-repeat:no-repeat;background-size:cover;">
	<%@include file="components/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row mt-5">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<%@include file="components/message.jsp"%>
					<div class="card-body px-5">
						<h3 class="text-center my-3">Sign up here!!</h3>
						<form action="RegisterServlet" method="get">
							<div class="form-group">
								<label for="name">User Name</label> <input name="user_name"
									type="text" class="form-control" id="name"
									 placeholder=" Enterhere"
									aria-describedby="emailHelp" placeholder="Enter email">
							<%@include file="components/message_userName.jsp"%>		
							</div>
							<div class="form-group">
								<label for="name">CardID</label> <input name="card_id"
									type="text" class="form-control" 
									 aria-describedby="emailHelp"
									placeholder="Enter here">
							<%@include file="components/message_usercardid.jsp"%>		
							</div>
							<div class="form-group">
								<label for="email">User Email</label> <input name="user_email"
									type="email" class="form-control" id="email"
									pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$"
									placeholder="Enter here" aria-describedby="emailHelp"
									placeholder="Enter email">
							<%@include file="components/message_useremail.jsp"%>		
							</div>
							<div class="form-group">
								<label for="password">User Password</label> <input
									name="user_password" type="password" class="form-control"
									id="password" pattern="^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@$!%*?&])([a-zA-Z0-9@$!%*?&]{8,})$" 
									placeholder="Enter here" aria-describedby="emailHelp"
									placeholder="Enter email" >
							<%@include file="components/message_userPassword.jsp"%>		
							</div>
							<div class="form-group">
								<label for="phone">Contact Number</label> <input
									name="user_phone" type="text" class="form-control" id="phone"
									placeholder="Enter here"
									aria-describedby="emailHelp" placeholder="Enter email">
								<%@include file="components/message_userPhone.jsp"%>	
							</div>
							<div class="form-group">
								<label for="Address">User Address</label>
								<textarea name="user_address" style="height: 200px"
									class="form-control" placeholder="Enter your Address"></textarea>
								<%@include file="components/message_userAddress.jsp"%>	
							</div>
							<div class="container text-center">
								<button class="btn btn-outline-success">Register</button>
								<button class="btn btn-outline-warning">Reset</button>

							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>