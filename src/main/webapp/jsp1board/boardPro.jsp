<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="jsp1board.*"
    %>
<%--boardPro.jsp --%>
<%
request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="dto" class="jsp1board.BoardDTO">
	<jsp:setProperty name="dto" property="*"/>
</jsp:useBean>

<%
BoardDAO dao=new BoardDAO();
dao.insertBoard(dto);
%>