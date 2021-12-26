<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--01_includeTag.jsp --%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>01_includeTag.jsp</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
%>

<hr color="red">
<jsp:include page="01_includeTagTop.jsp">
	<jsp:param name="name" value="김다미"/>
	<jsp:param name="addr" value="서울 구로구"/>
	<jsp:param name="tel" value="010-445-5566"/>
</jsp:include>
<hr color="red">
01_includeTag.jsp <br>
01_includeTag.jsp <br>
01_includeTag.jsp <br>

</body>
</html>