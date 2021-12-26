<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%--
09_exception.jsp에서 에러가 발생하면 09_err.jsp로 오도록 할 것임
 --%>

<%
String msg=exception.getMessage();//메시지
String obj=exception.toString();//에러 객체, 메시지
%>

에러 메시지 : <%= msg %><br>
에러 실체의 클래스명과 에러 메시지 : <%= obj%><br>
</body>
</html>