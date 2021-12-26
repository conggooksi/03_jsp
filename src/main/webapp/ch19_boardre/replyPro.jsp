<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="boardre.*"
    %>
<%--replyPro.jsp --%>

<%
request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="dto" class="boardre.BoardDTO">
	<jsp:setProperty name="dto" property="*"/>
</jsp:useBean>

<%
int num=Integer.parseInt(request.getParameter("num"));
int nowPage=Integer.parseInt(request.getParameter("page"));

BoardDAO dao=new BoardDAO();
BoardDTO dto2=dao.getBoard(num);//객체.메서드()

int pos=dto2.getPos();//현재 위치
int depth=dto2.getDepth();//글 깊이

dto.setPos(pos);//setter<-- setter 작업 했다는 뜻
dto.setDepth(depth);//setter

dao.replyPos(dto);//답글 쓰기 위치 확보
dao.replyBoard(dto);//답글 쓰기

response.sendRedirect("list.jsp?page="+nowPage);
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>replyPro.jsp</title>
</head>
<body>

</body>
</html>