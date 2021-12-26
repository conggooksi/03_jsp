<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--mailUpload.jsp --%>
<%
//request.setCharacterEncoding("utf-8");
%>

<%--객체생성 --%>
<jsp:useBean id="bean" class="mailupload.MailUpload"/>

<%= bean.upload(request)%>