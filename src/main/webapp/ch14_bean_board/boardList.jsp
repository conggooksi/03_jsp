<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="board2.*"
    %>
<%--boardList.jsp --%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>boardList.jsp</title>

<style type="text/css">
	h2{text-align : center;}
	table{
		margin : auto;
		/* border : 1px solid black; */
	}
</style>

</head>

<%
BoardDAO dao=new BoardDAO();
Vector vec=dao.getBoardList();//객체.메서드();
%>

<body>
	<h2>게시판 리스트</h2>
	<table border="1">
		<tr>
			<td colspan="4" align="right">
				<a href="boardForm.jsp">글쓰기</a>
			</td>
		</tr>
		
		<tr>
			<td>글번호</td>
			<td>글쓴이</td>
			<td>글제목</td>
			<td>날짜</td>
		</tr>
		<%
		for(int i=0; i<vec.size(); i++){
			BoardDTO dto=(BoardDTO)vec.get(i);
		%>	
			<tr>
				<td><%= dto.getNum()%></td>
				<td><%= dto.getName()%></td>
				<td><%= dto.getTitle()%></td>
				<td><%= dto.getRegdate()%></td>
			</tr>	
			
		<%	
		}//for-end
				%>
		
	</table>



</body>
</html>