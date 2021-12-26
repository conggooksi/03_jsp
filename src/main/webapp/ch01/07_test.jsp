<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 07_test.jsp -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>07_test.jsp</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");//post요청 한글 처리
%>
<h1>
메서드 방식 : <%= request.getMethod() %>
</h1>

이름 : <%=request.getParameter("name") %><br>
주소 : <%=request.getParameter("addr") %><br>
<%-- 
Get은 소량 데이터 전송시 사용하세요.
중요한 데이터는 Get방식으로 하지 마세요
url에 표시가 됩니다

Post요청은 중요한 데이터 전송시 사용 하세요
많은 데이터 보낼 때 사용 하세요
post요청시 데이터를 http내부에 숨겨서 보낸다
--%>
</body>
</html>