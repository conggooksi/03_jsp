<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--06_gugudan.jsp --%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>06_gugudan.jsp</title>
<style type="text/css">

</style>

</head>
<body>
	<h2>구구단,table사용,2중 for</h2>
	
	<table border="1">
		<%
		for(int i=1;i<=9;i++){
			%>
			<tr>
			<%
			for(int j=2; j<=9; j++){
				%>
				<td>
				<%=j+"*"+i+"="+(j*i) %>
				</td>
				<%
			}
			%>
			
			</tr>
			
			<%
		}//out for-end

		%>	
	</table>
	
	<table border="1">
	
	<% for(int i=1; i<=9; i++){
		%>
		<tr>
		<% for(int j=2; j<=9; j++){
			%>
			<td> <%= j+"*" +i+"="+(j*i) %></td>
			<%
		}
		%>
		</tr>
		<%
	}
	%>
	
	</table>
	

</body>
</html>