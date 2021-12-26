<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>08_checkboxPro.jsp</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");//post요청 한글 처리
out.println("메서드 방식:"+request.getMethod()+"<br>");
String method=request.getMethod();

if(method.equalsIgnoreCase("POST")){
	out.println("<ul>");
	out.println("<li>이름"+" : "+request.getParameter("name"));
	out.println("<li>주소"+" : "+request.getParameter("addr"));
	
	String fruit[]=request.getParameterValues("과일");
	
	out.println("<li>과일<ol>");
	if(fruit != null){
		for(int i=0; i<fruit.length; i++){
			out.println("<li>"+fruit[i]);
		}
	}
	
	out.println("</ol>");
	out.println("</ul>");
}else{//get방식이면
	out.println(method+"방식으로는 사용할 수 없습니다");
%>
<a href="08_checkboxForm.jsp">이 페이지</a>에서 내용을 채워주세요
<%
}
%>
</body>
</html>