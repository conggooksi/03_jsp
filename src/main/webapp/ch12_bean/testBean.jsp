<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="mybean.*"%>
<%--testBean.jsp --%>
<html>
<body>
	<jsp:useBean id="bb" class="mybean.TestDTO">
		<jsp:setProperty name="bb" property="id" value="lee"/>	
		<jsp:setProperty name="bb" property="name" value="이도현"/>
		
		ID : <jsp:getProperty name="bb" property="id"/><br>	
		이름 : <jsp:getProperty name="bb" property="name"/><br>	
	</jsp:useBean>
	
	<br>
	ID : <%= bb.getId() %><br>
	이름 : <%= bb.getName() %>
</body>
</html>