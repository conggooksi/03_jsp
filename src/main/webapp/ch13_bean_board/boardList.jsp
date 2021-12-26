<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*" 
    import="board.*"
    %>
<%--boardList.jsp --%>
<%
BoardDAO dao=new BoardDAO();//메서드 호출 할려고 객체생성함
Vector<BoardDTO> vec=dao.getBoardList();//dao메서드 호출
%>

<table border="1">
	<tr>
	<td colspan="5" align="right">
		<a href="boardForm.jsp">글쓰기</a>
	</td>
	</tr>
	
	<tr>
		<td>글번호</td>
		<td>글쓴이</td>
		<td>글제목</td>
		<td>날짜</td>
		<td>ip</td>
	</tr>
	
	<%
	for(int i=0; i<vec.size(); i++){
		BoardDTO dto=(BoardDTO)vec.get(i);
	%>
		<tr>
			<td><%= dto.getNum() %></td>
			<td><%= dto.getWriter() %></td>
			<td><%= dto.getSubject() %></td>
			<td><%= dto.getWdate() %></td>
			<td><%= dto.getIp() %></td>
		</tr>
	<%
	}//for-end
	%>
</table>