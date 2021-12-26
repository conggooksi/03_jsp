<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>07_config.jsp</title>
</head>
<body>
<%--07_config.jsp --%>
<ol>
	<li>서블릿 이름 : <%=config.getServletName() %>
	<li>서블릿 Context : <%=config.getServletContext() %>
	<li>이름 : <%=config.getServletContext().getInitParameter("name") %>
	<li>이름 : <%=application.getInitParameter("name") %>
</ol>

</body>
</html>