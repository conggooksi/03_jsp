<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2>bloodType.jsp</h2>
<%
request.setCharacterEncoding("utf-8");
%>

<%
String name="하후돈";
String bloodType=request.getParameter("bloodType");
bloodType=bloodType+".jsp";
//					A.jsp
//					B.jsp
%>

<jsp:forward page="<%= bloodType %>">
	<jsp:param name="name" value="<%=name %>"/>
</jsp:forward>