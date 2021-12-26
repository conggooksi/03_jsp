<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--copyright.jsp --%>
<%
request.setCharacterEncoding("utf-8");
%>

<hr size="3" color="red">
<h3>copyright.jsp</h3>

<%--name.txt, email.txt 포함 --%>
<a href="mailto:<%@ include file='email.txt'%>">
	<%@ include file="name.txt" %>
</a>
<h3>copyright.jsp</h3>
<hr size="3" color="red">