<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="boardre.*"
    %>
<%--content.jsp --%>

<%
request.setCharacterEncoding("utf-8");
BoardDAO dao=new BoardDAO();//객체생성

//list.jsp에서 보내준 값들 받기
int num=Integer.parseInt(request.getParameter("num"));
int nowPage=Integer.parseInt(request.getParameter("page"));
String keyField=request.getParameter("keyField");
String keyWord=request.getParameter("keyWord");

dao.upCount(num);//조회수 증가
BoardDTO dto=dao.getBoard(num);//객체.메서드() dto를 얻는다

//모델빈 dto 내용을 변수에 넣기
String name=dto.getName();
String subject=dto.getSubject();
String content=dto.getContent();

String regdate=dto.getRegdate();
String ip=dto.getIp();
int count=dto.getCount();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>content.jsp</title>
<script type="text/javascript">
	function list(){
		document.listForm.action="list.jsp";
		document.listForm.submit();
	}
</script>

</head>
<body bgcolor="#D8BFD8">
	<table align="center" width="70%" border="1" cellpadding="3" cellspacing="0">
		<tr>
			<td bgcolor="#006400" height="25" align="center">
				<font size="7">>ㅅ○글내용 보기</font>
			</td>
		</tr>
		
		<tr>
			<td colspan="2">
				<table border="1" cellpadding="3" cellspacing="0" width="100%">
					<tr>
						<td>이름</td>
						<td><%= name%></td>
						
						<td>등록날짜</td>
						<td><%= regdate%></td>
					</tr>
					
					<tr>
						<td>글제목</td>
						<td colspan="3"><%= subject%></td>
					</tr>
					
					<tr>
						<td colspan="4">
						<%
						content=content.replace("\n", "<br>");
						%>
						
						<%= content%>
						</td>
					</tr>
					
					<tr>
						<td colspan="4" align="right">
							<%= ip%>로 부터 글을 남기셨습니다/조회수 : <%= count%>
						</td>
					</tr>
					
					<tr>
						<td colspan="2" align="center">
							[<a href="writeForm.jsp">새글쓰기</a>]
							[<a href="javaScript:list()">리스트</a>]
							[<a href="updateForm.jsp?page=<%= nowPage%>&num=<%= num%>">글수정</a>]
							[<a href="replyForm.jsp?page=<%= nowPage%>&num=<%= num%>">답글쓰기</a>]
							[<a href="delete.jsp?page=<%= nowPage%>&num=<%= num%> ">글삭제</a>]
						</td>
					</tr>
					
				</table>
			</td>
		</tr>
	</table>
	
	<%
	if(keyWord == null || keyWord.equals("")){
		//전체글
		%>
		<form method="post" name="listForm">
			<input type="hidden" name="num" value="<%= num%>">
			<input type="hidden" name="page" value="<%= nowPage%>">
		</form>
		<%
	}else{
		//검색글
		%>
		<form method="post" name="listForm">
			<input type="hidden" name="num" value="<%= num%>">
			<input type="hidden" name="page" value="<%= nowPage%>">
			<input type="hidden" name="keyWord" value="<%= keyWord%>">
			<input type="hidden" name="keyField" value="<%= keyField%>">
		</form>
		
		<%
	}//else-end
	%>

</body>
</html>