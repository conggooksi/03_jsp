<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--main.jsp --%>
<html>

<body>
	<jsp:forward page="template.jsp">
		<jsp:param name="contentPage" value="content.jsp"/>
	</jsp:forward>
</body>
</html>