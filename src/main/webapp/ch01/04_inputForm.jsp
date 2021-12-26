<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--04_inputForm.jsp --%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>04_inputForm.jsp</title>

<style type="text/css">
	body{font-size:16px;}
	
	table{
		margin:auto;/* 바깥여백, 테이블 가운데 정렬 */
		background-color: #D2691E;
		border:1px solid blue;
		font-size:60px;
	}
	
	tr{line-height:30px;}
	h2{text-align:center;}
</style>
</head>
<body bgcolor="skyblue">
	<h2>아래 내용을 체워 주세요</h2>
	<form method="post" action="04_inputPro.jsp">
		<table>
			<tr>
				<td>
					<input type="text" name="name" id="name" placeholder="이름입력">
				</td>
			</tr>
			<tr>
				<td>
					<input type="text" name="id" id="id" placeholder="ID입력">
				</td>
			</tr>
			<tr>
				<td>
					<input type="password" name="pw" id="pw" placeholder="암호입력">
				</td>
			</tr>
			
			<tr>
				<td align="center">
					<input type="submit" value="전송">
					<input type="reset" value="취소">
				</td>
			</tr>
			
			
		</table>
	
	</form>

</body>
</html>