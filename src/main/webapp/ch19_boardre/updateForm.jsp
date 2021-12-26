<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="boardre.*"
    %>
    
<%
request.setCharacterEncoding("UTF-8");

//content.jsp에서 보내준 데이터 받기
int nowPage=Integer.parseInt(request.getParameter("page"));
int num=Integer.parseInt(request.getParameter("num"));

BoardDAO dao=new BoardDAO();//객체생성
BoardDTO dto=dao.getBoard(num);//객체.메서드() dto를 받는다

String subject=dto.getSubject();
String name=dto.getName();
String content=dto.getContent();
%>
<%--updateForm.jsp --%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>updateForm.jsp</title>
<script type="text/javascript">
	function check(){
		if(document.updateForm.pw.value==''){
			alert("암호를 입력하세요");
			document.updateForm.pw.focus();
			return false;
		}
		document.updateForm.submit();//서버로 전송
	}//check()-end
</script>

</head>
<body bgcolor="#FFEBCD">
	<table width="70%" cellspacing="0" cellpadding="3" align="center">
		<tr>
			<td bgcolor="#FFB6C1" height="22" align="center">
				<font size="4">글 수정하기</font>
			</td>
		</tr>
	</table>
	
	<form method="post" name="updateForm" action="updatePro.jsp">
		<table width="70%" cellspacing="0" cellpadding="7" align="center" border="1">
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" value="<%= name%>" size="30"></td>
			</tr>
			
			<tr>
				<td>글제목</td>
				<td><input type="text" name="subject" value="<%= subject%>" size="50"></td>
			</tr>
			
			<tr>
				<td>글내용</td>
				<td>
					<textarea name="content" rows="10" cols="50"><%= content%></textarea>
				</td>
			</tr>
			
			<tr>
				<td>암호</td>
				<td><input type="password" name="pw" size="15">
					<font color="red">글 수정시에는 암호가 필요합니다</font>
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="글수정" onClick="check()">
					<input type="reset" value="다시 수정하기">
					<input type="button" value="뒤로" onClick="history.back()">
					
					<input type="hidden" name="num" value="<%= num%>">
					<input type="hidden" name="page" value="<%= nowPage%>">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>