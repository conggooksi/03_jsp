<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--01_includeTagTop.jsp --%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>01_includeTagTop.jsp</title>
</head>
<body>
<%
String id=request.getParameter("id");
String pw=request.getParameter("pw");

String name=request.getParameter("name");
String addr=request.getParameter("addr");
String tel=request.getParameter("tel");
%>
<h2>01_includeTagTop.jsp 처리결과</h2>

ID:<%= id%><br>
암호:<%= pw%><br>
이름:<%= name%><br>
주소:<%= addr%><br>
전화:<%= tel%><br>
</body>
</html>