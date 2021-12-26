<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--template.jsp --%>
<%
String contentPage=request.getParameter("contentPage");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>template.jsp</title>
</head>
<body>
	<table align="center" width="90%" height="90%" border="2" bgcolor="orange">
		<tr>
			<td colspan="2" bgcolor="margenta" height="10%">
				<jsp:include page="top.jsp" flush="false"/>
				<%--flush="false"는 출력 버퍼를 지우지 않게 하려고 --%>
			</td>
		</tr>
		
		<tr>
			<td width="10%" valign="top" bgcolor="pink">
				<jsp:include page="left.jsp" flush="false"/>
			</td>

			<td width="80%" valign="top">
				<jsp:include page="<%= contentPage%>" flush="false"/>
			</td>
		</tr>
		
		<tr>
		<td colspan="2" bgcolor="lightGray" height="10%">
			<jsp:include page="bottom.jsp" flush="false"/>
		</td>
		</tr>
	</table>
</body>
</html>