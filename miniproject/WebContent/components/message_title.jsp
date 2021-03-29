<%
	String message6 = (String) session.getAttribute("message6");
if (message6!=null) {
%>
 
			<div class="alert alert-danger alert-dismissible fade show"
	role="alert">
	<strong><%= message6 %></strong>
	<button type="button" class="close" data-dismiss="alert"
		aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
</div>

<%	

 session.removeAttribute("message6");

} 
%>    