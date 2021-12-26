<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page buffer="10kb" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>out내장 객체</h2>
<%
int total=out.getBufferSize();//전체 버퍼 size구한다(8kb)
int rate=out.getRemaining();//남아 있는 버퍼 size를 구한다
out.println("출력");
%>

전체 버퍼 : <%=total %><br>
남아 있는 버퍼 : <%=rate %><br>
사용중인 버퍼 : <%=total-rate %>

</body>
</html>