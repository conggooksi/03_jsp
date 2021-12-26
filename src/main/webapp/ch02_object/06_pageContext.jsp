<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>06_pageContext.jsp</title>
</head>
<body>
<%--pageContext 객체 실습 --%>
<%
JspWriter out2=pageContext.getOut();//out객체 얻기  <-- out 객체가 있는데 굳이 이렇게 만들어서 할 필요 없지만 굳이 해보는거
out2.print("2021년 12월 07일");
%>

<ol>
	<li>요청객체:<%=pageContext.getRequest() %>
	<li>세션객체:<%=pageContext.getSession() %>
	<li>예외객체:<%=pageContext.getException() %>
</ol>
<p>
<%
pageContext.getOut().print("술 마시고 늦게 온 장비<br>");
String name=pageContext.getServletContext().getInitParameter("name");
out.println("name:"+name);
%>

</body>
</html>