<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--02_comment.jsp --%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>02_comment.jsp</title>
</head>
<body>
<h2>주석</h2>
1. java 주석<br>
2. html 주석, 소스 보기 에서 보여진다 보안x<br> <%-- <--보안이 전혀 안되어 진다는 뜻 --%>
3. JSP주석, 소스 보기에서 안보인다 보안o<br>

<%
//java 주석
/*java 주석*/
out.println("<h2>자바코드 부분</h2>");
out.println("<h2>자바코드 부분</h2>");
out.println("<h2>자바코드 부분</h2>");
%>

<h2>HTML 주석</h2>
<!-- HTML 주석 -->
<!-- HTML 주석 -->
<h2>HTML 코드로 출력</h2>
<h2>HTML 코드로 출력</h2>
<h2>HTML 코드로 출력</h2>
<h2>HTML 코드로 출력</h2>

<h2>JSP주석</h2>
<%--JSP 주석은 소스 보기에서 안보인다, 보안 된다 --%>
<%--JSP 주석은 소스 보기에서 안보인다, 보안 된다 --%>
<%= "JSP코드 부분" %><br>
<%= "JSP코드 부분" %><br>
<%= "JSP코드 부분" %><br>

<%--실제로 실행하고 소스보기 해보면 HTML 주석은 그 소스안에 보이고 다른 두가지는 안보인다 --%>

</body>
</html>