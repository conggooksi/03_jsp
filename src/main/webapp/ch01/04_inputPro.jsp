<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--04_inputPro.jsp --%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>04_inputPro.jsp</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");//post 요청 한글 처리하기 위한 인코딩 설정

//클라이언트가 보낸 데이터 받기
String name=request.getParameter("name");//html의 파라미터이름=java변수명=DB필드명
String id=request.getParameter("id");
String pw=request.getParameter("pw");
%>

<h2>입력한 정보는 다음과 같습니다</h2> 

이름 : <%=name %><br>
ID : <%=id %><br>
암호 : <%=pw %><br>
<br>
이름 : <%=request.getParameter("name") %><br>
ID : <%=request.getParameter("id") %><br>
암호 : <%=request.getParameter("pw") %><br>

</body>
</html>