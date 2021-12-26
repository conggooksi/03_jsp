<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--template.jsp --%>
<%
//보내준 값 받기
String control=request.getParameter("control");
String contentPage=request.getParameter("contentPage");
String pageTitle=request.getParameter("pageTitle");
String left=control+"left.jsp";//dcleft.jsp 또는 pmpleft.jsp
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body bgColor="orange" topmargin="5%">
	<h2>My page</h2>
	<table width="90%" height="95%" align="center" bgColor="margenta" border="1">
		<tr>
			<td colspan="2" align="center">
				<jsp:include page="top.jsp" flush="false"/>
			</td>
		</tr>
		
		<tr>
			<td width="100" valign="top">
				<jsp:include page="<%= left%>" flush="false"/>
			</td>
			
			<td width="450" valign="top">
				<jsp:include page="<%= contentPage%>" flush="false"/>
			
			</td>
		</tr>
		
		<tr>
			<td colspan="2" height="10%">
				<jsp:include page="bottom.jsp" flush="false"/>
			</td>
		</tr>
		
	</table>

</body>
</html>