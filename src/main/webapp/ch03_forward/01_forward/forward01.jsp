<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>forward01.jsp</title>
</head>
<body>
<h2>forward01.jsp</h2>
<h2>포워드액션</h2>
	<form method="post" action="forward02.jsp">
		<table border="1">
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" size="30"></td>
			</tr>

			<tr>
				<td>나이</td>
				<td><input type="text" name="age" size="3"></td>
			</tr>

			<tr>
				<td>주소</td>
				<td><input type="text" name="addr" size="50"></td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="전송">
					<input type="reset" value="취소">
				</td>
			</tr>
		</table>
	</form>


</body>
</html>