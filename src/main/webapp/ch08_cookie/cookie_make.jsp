<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<%--cookie_make.jsp --%>

<%
request.setCharacterEncoding("utf-8");
%>
<html>
<head>
<body>
<%
//쿠키 심기
String visitor=request.getParameter("visitor");

Cookie cookie=new Cookie("visitor",URLEncoder.encode(visitor));//쿠키생성 <--한글 깨지지 않도록 인코딩해서 쿠키 생성

cookie.setMaxAge(30*24*60*60);//쿠키 유효기간 설정
// 				30일*24시간*60분*60초

//쿠키를 클라이언트에 심기
response.addCookie(cookie);
%>

<a href="cookie_view.jsp">돌아가기</a>
<%-- cookie_make.jsp 여기서 실행--%>

</body>
</html>