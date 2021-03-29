<%
	String message3 = (String) session.getAttribute("message3");
if (message3!=null) {
%>
 
			<div class="alert alert-danger alert-dismissible fade show"
	role="alert">
	<strong><%= message3 %></strong>
	<button type="button" class="close" data-dismiss="alert"
		aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
</div>

<%	

 session.removeAttribute("message3");

} 
%>     
