<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>forward03.jsp</title>
</head>
<body>
	<h2>forward03.jsp</h2>
	<h2>포워드액션</h2>
	<%--웹으로 응답 --%>
	<table border="1">
		<tr>
			<td>이름</td>
			<td><%=request.getParameter("name") %></td>
		</tr>

		<tr>
			<td>나이</td>
			<td><%=request.getParameter("age") %></td>
		</tr>

		<tr>
			<td>주소</td>
			<td><%=request.getParameter("addr") %></td>
		</tr>

		<tr>
			<td>전화</td>
			<td><%=request.getParameter("tel") %></td>
		</tr>

		<tr>
			<td>이메일</td>
			<td><%=request.getParameter("email") %></td>
		</tr>
	</table>
</body>
</html>