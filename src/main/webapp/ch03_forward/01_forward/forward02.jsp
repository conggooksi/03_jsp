<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>forward02.jsp</title>
</head>
<body>
<h2>forward02.jsp</h2>
<%
request.setCharacterEncoding("UTF-8");//post요청 한글 처리
%>
<h2>forward02.jsp</h2>
<jsp:forward page="forward03.jsp">
	<jsp:param name="tel" value="010-1234-7778"/>
	<jsp:param name="email" value="aaa@gmail.com"/>
</jsp:forward>

</body>
</html>