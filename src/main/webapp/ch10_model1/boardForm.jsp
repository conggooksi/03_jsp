<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--boardForm.jsp --%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>boardForm.jsp</title>
<style type="text/css">
h2{text_align:center;}
table{
	margin:auto;
	border:1px solid black;
}
</style>

<script src="//code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	function check(){
		if($('#writer').val()==''){
			alert("글쓴이를 입력 하세요");
			$('#writer').focus();
			return false;
		}
		
		if($('#subject').val()==''){
			alert("글제목을 입력 하세요");
			$('#subject').focus();
			return false;
		}
		
		if($('#content').val()==''){
			alert("글내용을 입력 하세요");
			$('#content').focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
<h2>게시판 글쓰기</h2>
<form method="post" action="boardPro.jsp" onSubmit="return check()">
	<table>
		<tr>
			<td>글쓴이</td>
			<td><input type="text" name="writer" id="writer" size="30" placeholder="이름입력"></td>
		</tr>

		<tr>
			<td>글제목</td>
			<td><input type="text" name="subject" id="subject" size="40" placeholder="글제목입력"></td>
		</tr>

		<tr>
			<td>글내용</td>
			<td>
				<textarea rows="10" cols="50" name="content" id="content" placeholder="글내용을 입력"></textarea>
				<%--</textarea>를 뒤에 해야지 다음줄에 하면 빈칸생긴다 --%>
			</td>
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