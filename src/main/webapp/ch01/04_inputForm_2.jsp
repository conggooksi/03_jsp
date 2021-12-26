<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	body{font-size:20pt;}
	table{
	margin:auto;
	background-color:pink;
	border:1px;
	font-size:20pt;
	}
	tr{line-height:30px;}
	h2{text-align:center;}
</style>

</head>
<body bgcolor=skyblue>
	<h2>아래 내용을 채워주세요</h2>
	<form method=post action="04_inputPro.jsp">
		<table>
			<tr>
				<td>
					<input type="text" name=name id=id placeholder="이름입력">
				</td>
			</tr>
			
			<tr>
				<td>
					<input type="text" name=id id=id placeholder="ID입력">
				</td>
			</tr>
			
			<tr>
				<td>
					<input type=password name=pw id=pw placeholder="암호입력">
				</td>
			</tr>
			
			<tr>
				<td align=center>
					<input type=submit value="전송">
					<input type=reset value="취소">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>