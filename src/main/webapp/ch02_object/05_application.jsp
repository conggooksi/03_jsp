<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%--web.xml초기 파라미터 설정 --%>
<ol>
	<li>이름:<%=application.getInitParameter("name") %>
	<li>전화:<%=application.getInitParameter("tel") %>
	<li>주소:<%=application.getInitParameter("addr") %>
</ol>
<ol>
	<li>서버 정보
	<li>
	<%=application.getServerInfo() %>
	<p>
	<li>aa.html MIME타입 알아보기:<%=application.getMimeType("aa.html") %>
	<p>
	<li> 메이저 버전 : <%= application.getMajorVersion() %>
	<li> 메이저 버전 : <%= application.getMinorVersion() %>
	<li> 실제 경로 : <%= application.getRealPath("/") %>
	<%-- C:\_jsp\_jspwork\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\03_jsp
	   이클립스에서 하면 이렇게 나오는데 이건 자기가 jar하고 하느라고 한거라 실제 경로가 아니다--%>
	<%--C:\Tomcat 8.0\webapps\03_jsp --%>
</ol>

<%
application.log("2021-12-07 건국 로그 기록입니다");
// (c:\Tomcat8.0\logs에 기록된다)
//              localhost.2021-12-07.log 메모장으로 끌어다 놓는다
%>
</body>
</html>