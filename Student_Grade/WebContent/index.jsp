<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


</head>
<body>
<header>
	<%@include file="header.jsp" %>
</header>
<nav>
	<%@include file="nav.jsp" %>
</nav>
<%
	String section = request.getParameter("section");
%>
<section>
<% 
	if (request.getParameter("section") == null) {
%>
	<%@include file="section.jsp" %>
	<%
	} else{ 
	%>	
	<jsp:include page="<%=section %>" />
	<%
	}
	%>
</section>
<footer>
	<%@include file="footer.jsp" %>
</footer>
</body>
</html>



