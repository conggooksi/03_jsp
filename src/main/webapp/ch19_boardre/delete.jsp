<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="boardre.*"
    %>
<%--delete.jsp --%>

<%
//content.jsp 보내준 데이터 받기
int num=Integer.parseInt(request.getParameter("num"));
int nowPage=Integer.parseInt(request.getParameter("page"));

String inpw="";
String dbpw="";

BoardDAO dao=new BoardDAO();//객체생성

if(request.getParameter("pw") != null){
	//암호가 입력 되었으면
	BoardDTO dto=dao.getBoard(num);
	inpw=request.getParameter("pw");
	dbpw=dto.getPw();
	
	if(inpw.equals(dbpw)){
		//암호가 일치하면 삭제
		dao.deleteBoard(num);//객체.메서드() 글삭제
		response.sendRedirect("list.jsp?page="+nowPage);
	}else{
		//암호가 일치 하지 않으면
		%>
		<script>
		alert("암호가 틀립니다");
		history.go(-1);
		</script> 
		
		<%
	}//else-end
}//if-end 암호가 입력 되었으면
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>delete.jsp</title>
<script>
	function check(){
		if(document.delForm.pw.value==''){
			alert("암호를 입력하세요");
			document.delForm.pw.focus();
			return false;
		}
		
		document.delForm.submit();//서버로 전송 delete.jsp로 간다
	}//check()-end
</script>

</head>
<body>
	<table width="70%" cellspacing="0" cellpadding="3">
		<tr>
			<td bgcolor="#E0FFFF" height="22" align="center" style="font-family:궁서체;font-size:14pt;font-color:red;">
			비밀번호를 입력 하세요
			</td>
		</tr>
	</table>
	
	<form name="delForm" method="post" action="delete.jsp">
		<table width="70%" cellpadding="2" cellspacing="0">
			<tr>
				<td>
					<input type="password" name="pw" size="15" >
				</td>
			</tr>
			
			<tr>
				<td>
					<hr color="#eeeeee">
				</td>
			</tr>
			
			<tr>
				<td align="center">
					<input type="button" value="글삭제" onClick="check()">
					<input type="reset" value="다시쓰기">
					<input type="button" value="뒤로" onClick="history.back()">
					
					<input type="hidden" name="page" value="<%= nowPage%>">
					<input type="hidden" name="num" value="<%= num%>">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>