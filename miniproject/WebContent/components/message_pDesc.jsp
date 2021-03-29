
<%
	String message2 = (String) session.getAttribute("message2");
if (message2!=null) {
%>
 
			<div class="alert alert-danger alert-dismissible fade show"
	role="alert">
	<strong><%= message2 %></strong>
	<button type="button" class="close" data-dismiss="alert"
		aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
</div>

<%	

 session.removeAttribute("message2");

}
%>     
