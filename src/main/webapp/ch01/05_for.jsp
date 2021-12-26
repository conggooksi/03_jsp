<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--05_for.jsp --%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>05_for.jsp</title>
</head>
<body>
<%!
//선언부
String name[]={"January","Feburary","March","April","May","Jun",
		"July","August","September","October","November","December"};
%>

<table border="1">
	<%
	for(int i=0; i<name.length; i++){
		%>
		<tr>
			<td><%=i+1 %>월&nbsp;</td>
			<td><%= name[i] %></td>
		</tr>
		<%
	}//for-end
	%>
</table>
<%


%>
</body>
</html>