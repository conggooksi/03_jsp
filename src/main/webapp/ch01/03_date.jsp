<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%--03_date.jsp --%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>03_date.jsp</title>
</head>
<body>
	<font size=5>오늘 날짜 출력</font><br>
	<%
	Date date=new Date();//객체 생성
	SimpleDateFormat sdf=new SimpleDateFormat("yyy/MM/dd HH:mm:ss EEEE");
	%>
	
	<%=sdf.format(date) %> <%-- 표현식, 웹으로 응답 --%>
	
</body>
</html>