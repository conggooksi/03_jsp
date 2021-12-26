<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="mybean.*"
    %>
<%--testBean2.jsp --%>
<%
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="bb" class="mybean.TestDTO2"> <%-- <--이게 객체생성하는 거와 같다  --%>
	<jsp:setProperty name="bb" property="*"/>
</jsp:useBean>

<%-- 웹으로 응답(출력) --%>

ID : <jsp:getProperty name="bb" property="id"/><br>
이름 : <jsp:getProperty name="bb" property="name"/><br>
이메일 : <jsp:getProperty name="bb" property="email"/><br>
<br>
ID : <%= bb.getId()%><br>
이름 : <%= bb.getName()%><br>
이메일 : <%= bb.getEmail()%><br>