<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="boardre.*"
    %>
<%--updatePro.jsp --%>
<%
request.setCharacterEncoding("utf-8");


%>

<jsp:useBean id="dto" class="boardre.BoardDTO">
	<jsp:setProperty name="dto" property="*"/>
</jsp:useBean>

<%
//updateForm.jsp에서 넘어온 데이터 중 num, nowPage <--는 Integer.parseInt 해줘야 한다
int num=Integer.parseInt(request.getParameter("num"));
int nowPage=Integer.parseInt(request.getParameter("page"));

BoardDAO dao=new BoardDAO();//객체 생성

//암호처리
BoardDTO dto2=dao.getBoard(num);
String dbpw=dto2.getPw();
String inpw=request.getParameter("pw");

if(dbpw.equals(inpw)){
	//수정
	dao.updateBoard(dto);//dao메서드 호출, 수정 작업
	response.sendRedirect("list.jsp?page="+nowPage);
	
}else{
	%>
	<script>
	alert("암호가 일치하지 않습니다");
	history.back();
	</script>
	<%
}
%>