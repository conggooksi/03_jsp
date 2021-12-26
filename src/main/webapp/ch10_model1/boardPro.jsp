<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*"
    %>
<%--boardPro.jsp --%>
<%!
//선언부, 전역변수, 메서드 정의
String DRIVER="com.mysql.jdbc.Driver";
String URL="jdbc:mysql://localhost:3306/mydb2";
String USER="root";
String PWD="12345";
%>
<%
request.setCharacterEncoding("utf-8");
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>boardPro.jsp</title>
</head>
<body>
<%
try{
	Class.forName(DRIVER);//드라이버로딩
	Connection con=DriverManager.getConnection(URL,USER,PWD);//DB연결
	
	//클라이언트가 보내준 데이터 받기
	String writer=request.getParameter("writer");
	String subject=request.getParameter("subject");
	String content=request.getParameter("content");
	//날짜
	String ip=request.getRemoteAddr();//ip구하기
	
	String sql="insert into board(num,writer,subject,content,wdate,ip) values(0,?,?,?,NOW(),?)";
	PreparedStatement pstmt=con.prepareStatement(sql);
	
	//?값 채우기
	pstmt.setString(1,writer);
	pstmt.setString(2,subject);
	pstmt.setString(3,content);
	//날짜 NOW()로 넣어 줌
	pstmt.setString(4,ip);
	
	pstmt.executeUpdate();//쿼리 수행, insert
	
	pstmt.close();
	con.close();
	
	response.sendRedirect("boardList.jsp");
}catch(Exception se){
	out.println("<script>");
	out.println("alert('SQL예외"+se+"')");
	out.println("history.back()");
	out.println("</script>");
}

%>

</body>
</html>