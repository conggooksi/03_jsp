<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--01_Session_2.jsp--%>

<%
request.setCharacterEncoding("utf-8");

String season=request.getParameter("season");
String fruit=request.getParameter("fruit");

String id=(String)session.getAttribute("id");

String sessionID=session.getId();//session id는 자동으로 부여된다

int intervalTime=session.getMaxInactiveInterval();//세션 유지 시간 얻기
%>

<%
if(id != null){//로그인 상태이면
	%>
	<b><%= id%></b>님이 좋아하는 계절과 과일은<br>
	<b><%= season %></b>과<b><%= fruit %></b>입니다<br>
	
	sessionID : <%= sessionID %><br>
	
	세션유지 시간 : <%= intervalTime %><br>
	
	<%
	session.invalidate();//세션 무효화, 로그아웃할 떄 사용
}else{//로그인 상태가 아니면
	out.println("세션시간이 경과 하였거나 다른 이유로 연결할 수 없습니다. 로그인을 해보세요");
}//else-end
%>