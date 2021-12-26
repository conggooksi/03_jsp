<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>02_request.jsp</title>
</head>
<body>
<%
String ip=request.getRemoteAddr();//다른 사람 서버를 접속하면 확인할 수 있음


/* if(ip.equals("192.168.0.50")){
	out.println("이 ip로는 접속할 수 없습니다");
	return;
} */
%>
<ol>
	<li>메서드 방식 : <%=request.getMethod() %>
	<li>요청 URI : <%=request.getRequestURI() %>
	<li>요청 URL : <%=request.getRequestURL() %>
	<%--
		요청 URI : /03_jsp/ch02_object/02_request.jsp
		요청 URL : http://localhost:9001/03_jsp/ch02_object/02_request.jsp
	 --%>
	
	<p>
	<li>프로토콜 : <%=request.getProtocol() %><%--서버HTTP/1.1 --%>
	<li>서버이름 : <%=request.getServerName() %>
	<li>서버포트이름 : <%=request.getServerPort() %><%--9001 --%>
	<p>
	<li>사용자 컴퓨터 주소 : <%= request.getRemoteAddr() %>
	<li>사용자 컴퓨터 이름 : <%= request.getRemoteHost() %>
	<p>
	<li>현재 사용중인 웹 브라우저 : 
	<%=request.getHeader("User-Agent") %>
	<p>
	<li>브라우저를 지원하는 file의 type : 
	<%=request.getHeader("Accept") %>
	<p>
	<li>이전 URL알아내기 : 
	<%=request.getHeader("referer") %>
</ol>
</body>
</html>