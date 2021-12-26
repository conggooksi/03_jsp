<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="board2.*"
    %>
<%--boardPro.jsp --%>

<%
request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="dto" class="board2.BoardDTO">
	<jsp:setProperty name="dto" property="*"/><%--name에는 바로 위의 id 즉 객체명을 넣는다 --%>
</jsp:useBean>

<%
BoardDAO dao=new BoardDAO();//객체생성
dao.insertBoard(dto);//객체.메서드() //서버가 insert 작업을 해준다

response.sendRedirect("boardList.jsp");
%>