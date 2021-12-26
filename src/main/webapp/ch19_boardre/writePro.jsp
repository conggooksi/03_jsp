<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--writePro.jsp --%>

<%
request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="dto" class="boardre.BoardDTO">
	<jsp:setProperty name="dto" property="*"/>
</jsp:useBean>
<%--DB,JAVA,HTML 변수명이 모두 같기 때문에 property="*"가능 --%>

<%
boardre.BoardDAO dao=new boardre.BoardDAO();//객체생성
dao.insertBoard(dto);//객체.메서드(인수)==>서버로 보낸다

response.sendRedirect("list.jsp");
%>