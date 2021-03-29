<%
	String message5 = (String) session.getAttribute("message5");
if (message5!=null) {
%>
 
			<div class="alert alert-danger alert-dismissible fade show"
	role="alert">
	<strong><%= message5 %></strong>
	<button type="button" class="close" data-dismiss="alert"
		aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
</div>

<%	

 session.removeAttribute("message5");
}

%>     
