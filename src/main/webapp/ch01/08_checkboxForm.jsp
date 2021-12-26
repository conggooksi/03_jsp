<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>08_checkboxForm.jsp</title>
</head>
<body>
<h2>checkboxForm</h2>
<form method="post" action="08_checkboxPro.jsp">
	이름 : <input type="text" name="name" size="30"><br>
	주소 : <input type="text" name="addr" size="50"><br>
	<br>
	당신이 좋아하는 과일을 선택 하시오<br>
	<input type="checkbox" name="과일" value="사과">사과<br>
	<input type="checkbox" name="과일" value="딸기">딸기<br>
	<input type="checkbox" name="과일" value="바나나">바나나<br>
	<input type="checkbox" name="과일" value="키위">키위<br>
	<input type="checkbox" name="과일" value="오렌지">오렌지<br>
	
	<input type="submit" value="전송">
	<input type="reset" value="취소">
	
</form>
</body>
</html>