<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--01_Session.jsp --%>
<%
request.setCharacterEncoding("utf-8");

String id=request.getParameter("id");
String pw=request.getParameter("pw");

session.setAttribute("id", id);//세션 설정
session.setMaxInactiveInterval(60*5);//300초 유효시간 설정
%>

<form method="post" action="01_Session_2.jsp">
	1. 가장 좋아하는 계절을 선택하시오<br>
	
	<input type="radio" name="season" value="봄">봄<br>
	<input type="radio" name="season" value="여름">여름<br>
	<input type="radio" name="season" value="가을">가을<br>
	<input type="radio" name="season" value="겨울">겨울<br>
	<br>
	
	2. 가장 좋아하는 과일을 선택하시오<br>
	
	<input type="radio" name="fruit" value="사과">사과<br>
	<input type="radio" name="fruit" value="오렌지">오렌지<br>
	<input type="radio" name="fruit" value="수박">수박<br>
	<input type="radio" name="fruit" value="바나나">바나나<br>
	<br>
	<input type="submit" value="전송">
</form>