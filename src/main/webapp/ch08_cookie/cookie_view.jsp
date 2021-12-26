<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<%--cookie_view.jsp --%>
<html>
<body>
<%
Cookie cookies[]=request.getCookies();//모든 쿠키를 얻는다
String visitor=null;//변수

if(cookies != null){//쿠키가 있으면
	for(int i=0; i<cookies.length; i++){
		if(cookies[i].getName().equals("visitor")){
			visitor=URLDecoder.decode(cookies[i].getValue());
		}//if-end
	}//for-end
}//if-end
%>

<%
if(visitor==null){//처음 방문이면
%>

<form method="post" action="cookie_make.jsp">
이름을 입력 하시오<br>
	<input type="text" name="visitor">
	<input type="submit" value="전송">
</form>
<%	
}else{//처음 방문이 아닐 때
	out.println("<h3>"+visitor+"님 반가워요</h3>");
}
%>
</body>
</html>