<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--boardForm.jsp --%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>boardForm.jsp</title>
</head>
<body>
<h2>게시판 글쓰기</h2>
<form method="post" action="boardPro.jsp">
	<table border="1">
		<tr>
			<td>글쓴이</td>
			<td><input type="text" name="writer" size="20"></td>
		</tr>

		<tr>
			<td>글제목</td>
			<td><input type="text" name="subject" size="40"></td>
		</tr>

		<tr>
			<td>글내용</td>
			<td>
			<textarea name="content" rows="10" cols="50"></textarea>
			</td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="글쓰기">
				<input type="reset" value="취소">
			</td>
		</tr>
	</table>
</form>
</body>
</html>