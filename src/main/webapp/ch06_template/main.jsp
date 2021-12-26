<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--main.jsp --%>
<h2>template를 이용한 페이지의 모듈화 예제</h2>

<form method="post" action="pageController.jsp">
	<input type="radio" name="product" value="d">디지털 카메라<br>
	<input type="radio" name="product" value="p">PMP<br>
	
	<input type="submit" value="전송">

</form>