<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--writeForm.jsp --%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>writeForm.jsp</title>

<script type="text/javascript">
	function check(){
		if(document.writeForm.name.value==''){
			alert("글쓴이를 입력하세요");
			document.writeForm.name.focus();
			return false;
		}
		
		if(document.writeForm.subject.value==''){
			alert("글제목을 입력하세요");
			document.writeForm.subject.focus();
			return false;
		}
		
		if(document.writeForm.content.value==''){
			alert("글내용을 입력하세요");
			document.writeForm.content.focus();
			return false;
		}
		
		if(document.writeForm.pw.value==''){
			alert("암호를 입력하세요");
			document.wirteForm.pw.focus();
			return false;
		}
		
		document.writeForm.submit();//서버로 전송
	}

</script>

</head>
<body bgColor="#DEB887">
<table width="80" cellpadding="3" cellspacing="0" align="center">
	<tr>
		<td bgcolor="#228B22" height="35" align="center">
			<b><font size="5">('ㅅ)b글쓰기</font></b>
		</td>
	</tr>
</table>

<br>
<form name="writeForm" method="post" action="writePro.jsp">
	<table border="1" width="80%" cellpadding="3" cellspacing="0" align="center">
		<tr>
			<td>이름</td>
			<td><input type="text" name="name" size="30"></td>
		</tr>
		
		<tr>
			<td>글제목</td>
			<td><input type="text" name="subject" size="50"></td>
		</tr>
		
		<tr>
			<td>글내용</td>
			<td>
				<textarea name="content" rows="10" cols="50"></textarea>
			</td>
		</tr>
		
		<tr>
			<td>암호</td>
			<td>
			<input type="password" name="pw" size="10">
			<input type="hidden" name="ip" value="<%=request.getRemoteAddr()%>">
			</td>
		</tr>
		
		<tr>
		<td colspan="2" align="center">
			<input type="button" value="글등록" onClick="check()">
			<input type="reset" value="다시쓰기">
		</td>
		</tr>
	</table>
</form>
</body>
</html>