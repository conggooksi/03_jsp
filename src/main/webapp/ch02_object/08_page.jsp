<%@ page info="예제1" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>08_page.jsp</title>
</head>
<body>
<h2>page객체</h2>
<ol>
	<li>info:<%=this.getServletInfo() %>
	<li>서블릿이름:<%=this.getServletName() %>
	<li>클래스:<%=this.getClass() %>
</ol>
</body>
</html>