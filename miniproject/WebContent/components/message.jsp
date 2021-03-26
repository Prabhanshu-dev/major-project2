
<%
	String message = (String) session.getAttribute("message");
if (message != null) {
	
	if(message == "Registration Successful !!"){
%>
       
  
<div class="alert alert-success alert-dismissible fade show"
	role="alert">
	<strong><%= message %></strong>
	<button type="button" class="close" data-dismiss="alert"
		aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
</div>

<%
	
	}else if(message=="You are not logged in !! Login first to access checkout page"||message == "Registration Failed !!"|| message == "Invalid Details"){ %>
			
			<div class="alert alert-danger alert-dismissible fade show"
	role="alert">
	<strong><%= message %></strong>
	<button type="button" class="close" data-dismiss="alert"
		aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
</div>
			
			
			
			
<%		
	}else{ %>
		
		<div class="alert alert-success alert-dismissible fade show"
				role="alert">
				<strong><%= message %></strong>
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
<%	}
	
	session.removeAttribute("message");
}

%>