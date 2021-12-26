<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="mail.*"
    import="com.oreilly.servlet.*"
    %>
<%--MailSend.jsp --%>
<jsp:useBean id="bean" class="mail.MailSender">
	<jsp:setProperty name="bean" property="*"/>
</jsp:useBean>

<%= bean.send()%>