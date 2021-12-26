<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="boardre.*"
    %>
<%--replyForm.jsp --%>

<%
request.setCharacterEncoding("utf-8");

//content.jsp가 보내준 데이터 받기
int nowPage=Integer.parseInt(request.getParameter("page"));
int num=Integer.parseInt(request.getParameter("num"));

BoardDAO dao=new BoardDAO();//객체생성
BoardDTO dto=dao.getBoard(num);//객체.메서드()

String subject=dto.getSubject();
String content=dto.getContent();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>replyForm.jsp</title>
<style type="text/css">
	table{border:1px solid black}
</style>

</head>
<body>
	<table width="60%" cellspacing="0" cellpadding="3" align="center">
		<tr>
			<td bgcolor="#FFD700" height="22" align="center">
				<font size="5">답글쓰기</font>
			</td>
		</tr>
	</table>
	
	<form method="post" name="reFrom" action="replyPro.jsp">
		<table width="60%" cellspacing="0" cellpadding="5" align="center">
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" size="30"></td>
			</tr>

			<tr>
				<td>글제목</td>
				<td><input type="text" name="subject" size="50" value="답글<%= subject%>"></td>
			</tr>		
			
			<tr>
				<td>글내용</td>
				<td>
				<textarea name="content" rows="10" cols="50"><%= content+"\n"%></textarea>
				</td>
			</tr>
			
			<tr>
				<td>암호</td>
				<td><input type="password" name="pw" size="15">
					<font color="red">답글 쓰기에서 암호는 필수 항목</font>
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="답글등록">
					<input type="reset" value="다시쓰기">
					<input type="button" value="뒤로" onClick="history.back()">
					
					<input type="hidden" name="ip" value="<%= request.getRemoteAddr()%>">
					<input type="hidden" name="page" value="<%= nowPage%>">
					<input type="hidden" name="num" value="<%= num%>">
				</td>
			</tr>
			
			
		</table>
	</form>

</body>
</html>