<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="boardre.*"
    import="java.util.*"
    %>
<%--list.jsp --%>
<%
request.setCharacterEncoding("utf-8");
%>

<%
int nowPage=0;//현재 페이지
int nowBlock=0;//현재 블럭

int totalRecord=0;//전체 글 갯수
int numPerPage=10;//페이지당 글 갯수

int totalPage=0;//전체 페이지 수
int totalBlock=0;//전체 블럭 수

int pagePerBlock=10;//블럭당 페이지 수
int beginPerPage=0;//시작 페이지

String keyField="";//키필드 name, subject, content
String keyWord="";//검색 단어
Vector <BoardDTO>vec=null;//클래스는 null초기화
%>

<%
String im_keyWord=request.getParameter("keyWord");

//검색어가 있는지 체크한다

if(request.getParameter("keyWord") != null){//검색어가 있으면
	keyWord=request.getParameter("keyWord");
	keyField=request.getParameter("keyField");
}

//전체글 리스트
if(request.getParameter("reload") != null){
	if(request.getParameter("reload").equals("true")){
		keyWord="";
		keyField="";
	}
}
%>

<%
boardre.BoardDAO dao=new boardre.BoardDAO();//객체생성
vec=dao.getBoardList(keyField, keyWord);//객체.메서드()
totalRecord=vec.size();//총 글개수

if(request.getParameter("page") != null){
	nowPage=Integer.parseInt(request.getParameter("page"));//현재 페이지
}//if-end

beginPerPage=nowPage*numPerPage;//시작 페이지 계산
//				  0 * 10 = 0   해당 페이지의 시작  (0 ~ 9)
//				  1 * 10 = 10		      (10~19)
//				  2 * 10 = 20			  (20~29)
//				  3 * 10 = 30			  (30~39)
//				  4 * 10 = 40			  (40~49)
//				  5 * 10 = 50			  (50~59)

//Math.ceil(5.1)=6
totalPage=(int)(Math.ceil((double)totalRecord/numPerPage));//총 페이지 수 계산
totalBlock=(int)(Math.ceil((double)totalPage/pagePerBlock));//총 블럭수 계산

if(request.getParameter("nowBlock") != null){
	nowBlock=Integer.parseInt(request.getParameter("nowBlock"));//현재 블럭을 얻는다
}
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>list.jsp</title>

<script type="text/javascript">
	function check(){
		if(document.searchForm.keyWord.value==''){
			alert("검색어를 입력하세요");
			document.searchForm.keyWord.focus();
			return false;
		}
		document.searchForm.submit();
	}//check()-end
	
	function list(){
		document.listForm.action="list.jsp";
		document.listForm.submit();
	}//list()-end
	
	//글내용보기
	function read(number){//number 글번호
		document.readForm.action="content.jsp";
		document.readForm.num.value=number;
		document.readForm.submit();//content.jsp
	}//read()-end
</script>
</head>


<body bgcolor="#D8BFD8">
<h2 align="center"><font color="red">( =_=)ノ(_ _ )a 실습 종료</font></h2>
	<table align="center" border="0" width="80%" height="22">
		<tr>
			<td align="left">
				Total : <%= totalRecord%>Articles&nbsp;
				(<font color="blue"><%= nowPage+1%> / <%= totalPage%></font>)
			</td>
			
			<td align="right">
				<a href="writeForm.jsp">새글쓰기</a>
			</td>
		</tr>
	</table>
	
	<table align="center" width="80%" border="1" cellpadding="3" cellspacing="0">
		<tr>
			<td align="center" colspan="2">
			<%
			if(vec.isEmpty()){
				out.println("등록된 글이 없습니다.");
			}else{//등록된 글이 있을 때
				%>
				<table border="1" width="100%" cellpadding="2" cellspacing="0">
					<tr bgColor="#D2691E" height="120%" align="center">
						<th>글번호</th>
						<th>글제목</th>
						<th>글쓴이</th>
						<th>날짜</th>
						<th>조회수</th>
					</tr>
					
					<%
					for(int i=beginPerPage; i<(beginPerPage+numPerPage); i++){
						if(i==totalRecord)break;//for 탈출
						
						BoardDTO dto=(BoardDTO)vec.get(i);
						String name=dto.getName();
						String subject=dto.getSubject();
						String regdate=dto.getRegdate();
						
						int depth=dto.getDepth();
						int num=dto.getNum();
						int count=dto.getCount();
						%>
						<tr>
							<%--글번호 역순으로 --%>
							<td align="center"><%= totalRecord-i%></td>
							
							<%--글제목을 클릭하면 글내용 보기로 가게 한다 --%>
							<td>
								<%
								if(depth>0){//답글이면
									for(int re=0; re<depth; re++){
										out.println("&nbsp;→");
									}//for-end
								}//if-end
								%>
								<a href="javaScript:read('<%= num%>')"><%= subject%></a>
							</td>
							
							<td><%= name%></td>
							<td><%= regdate%></td>
							<td><%= count%></td>
						</tr>
						<%
					}//for-end
					%>
				</table>
				
				<%
			}//else-end------------------------------------------------------
			%>
			</td>
		</tr>
		
		<tr>
			<td>
				<br>
			</td>
		</tr>
			
		<tr>
			<%--블럭처리,  페이지 처리 --%>
			<td align="left">Go to Page
			<%
			if(totalRecord != 0){//글이 존재하면
				if(nowBlock>0){//이전블럭
					%>
					<a href="list.jsp?nowBlock=<%= nowBlock-1%>&page=<%= ((nowBlock-1)*pagePerBlock+9)%>&keyField=<%= keyField%>&keyWord=<%= keyWord%>">[이전 블럭<%= pagePerBlock%>]</a>
					<%
				}//if 이전블럭-end
				
				//페이지 처리
				for(int i=0; i<pagePerBlock; i++){
					%>
					<a href="list.jsp?nowBlock=<%= nowBlock%>&page=<%= (nowBlock*pagePerBlock)+i%>">
					[<%= (nowBlock*pagePerBlock)+i+1%>]
					</a>
					<%
					if(((nowBlock*pagePerBlock)+i+1)==totalPage) break;//for 탈출
					
				}//for-end 페이지 처리 끝
				
				//다음 블럭
				if(totalBlock>nowBlock+1){
					%>
					<a href="list.jsp?nowBlock=<%= nowBlock+1%>&page=<%= (nowBlock+1)*pagePerBlock%>&keyField=<%= keyField%>&keyWord=<%= keyWord%>">
					[다음블럭<%= pagePerBlock %>]개
					</a>
					<%
				}//if-end 다음 블럭 끝
			}//if-end 글이 존재하면
			%>
			</td>
		</tr>
	</table>
	
	
	<%--searchForm 글검색 --%>
	<form name="searchForm" method="post" action="list.jsp">
		<table bgcolor="pink" width="80%" border="1" align="center" cellpadding="4" cellspacing="0">
			<tr>
				<td align="center" valign="bottom">
					<select name="keyField">
						<option value="subject">제목</option>
						<option value="name">이름</option>
						<option value="content">글내용</option>
					</select>
					
					<input type="text" name="keyWord" size="16">
					<input type="hidden" name="page" value="0">
					<input type="button" value="검색" onClick="check()">
				</td>
			</tr>
		</table>
	</form>
	
	<%--listForm --%>
	<form name="listForm" method="post">
		<input type="hidden" name="reload" value="true">
		<input type="hidden" name="page" value="0">
		<input type="hidden" name="nowBlock" value="0">	
	</form>
	
	<%--readForm --%>
	<form name="readForm" method="post">
		<input type="hidden" name="num" value=""><%--함수에서 num값 넣어줬음 --%>
		<input type="hidden" name="page" value="<%= nowPage%>">
		<input type="hidden" name="keyField" value="<%= keyField%>">
		<input type="hidden" name="keyWord" value="<%= keyWord%>">
	</form>
	
<%
//========================================================================
//내맘대로 베스트글
//========================================================================
%>
	<table align="center">
		<tr>
			<td><font color="red" size="5">★ 베스트 글 ★</font></td>
		</tr>
	</table>	
	<table border="1" style="border:dotted 4px red;" width="80%" cellpadding="2" cellspacing="0" align="center">
		<tr bgColor="#D2691E" height="120%" align="center">
			<th>글번호</th>
			<th>글제목</th>
			<th>글쓴이</th>
			<th>날짜</th>
			<th>조회수</th>
		</tr>
					
		<%
			int i=20;//<--글 번호 입력
			int j=totalRecord-i;
		
			BoardDTO dto=(BoardDTO)vec.get(j);
			String name=dto.getName();
			String subject=dto.getSubject();
			String regdate=dto.getRegdate();
			
			int depth=dto.getDepth();
			int num=dto.getNum();
			int count=dto.getCount();
		%>
		<tr>
			<td align="center"><%= i%></td>
			<td>
				<a href="javaScript:read('<%= num%>')"><%= subject%></a>
			</td>
							
			<td><%= name%></td>
			<td><%= regdate%></td>
			<td><%= count%></td>
		</tr>
	</table>
<%
//========================================================================
//========================================================================
%>

</body>
</html>