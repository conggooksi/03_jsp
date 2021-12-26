<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--boardPro.jsp --%>
<%
request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="dto" class="board.BoardDTO">
	<jsp:setProperty name="dto" property="*"/>
</jsp:useBean>

<%
String ip=request.getRemoteAddr();//ip구한다
dto.setIp(ip);//setter 작업

board.BoardDAO dao=new board.BoardDAO();//객체 생성
dao.insertBoard(dto);//dao메서드 호출, insert

response.sendRedirect("boardList.jsp");
%>