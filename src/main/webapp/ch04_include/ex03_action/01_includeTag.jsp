<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>01_includeTag.jsp</title>
</head>
<body>
<%--include액션 태그는 처리 결과가 들어온다 --%>
<%
request.setCharacterEncoding("utf-8");
%>
<jsp:include page="01_includeTagTop.jsp"/>

01_includeTag.jsp<br>
01_includeTag.jsp<br>
01_includeTag.jsp<br>
<%
String name="Korea Football !!! 화이팅";
%>

<%=name %>
</body>
</html>