<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>04_response.jsp</title>
</head>
<body>
<%
//2초후에 네이버로 이동하기
//response.setHeader("Refresh", "2;URL=https://www.naver.com");

//웹페이지 이동
//외부 url
//response.sendRedirect("https://www.daum.net");

//내부 url
//response.sendRedirect("02_request.jsp");
%>

<%--외부 url 안된다 --%>
<%--
<jsp:forward page="https://www.daum.net"/>
--%>

<%--내부 url 된다 --%>
<jsp:forward page="02_request.jsp"/>

</body>
</html>