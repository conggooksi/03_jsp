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
//지역변수, 자바구문
request.setCharacterEncoding("utf-8");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>boardPro.jsp</title>
</head>
<body>
<%
Class.forName(DRIVER);//드라이버 로딩
Connection con=DriverManager.getConnection(URL,USER,PWD);//DB연결

//클라이언트가 보내준 데이터 받기
String name=request.getParameter("name");
String title=request.getParameter("title");
String content=request.getParameter("content");

String sql="insert into board2(num,name,title,content,regdate) values(0,?,?,?,NOW())";

PreparedStatement pstmt=con.prepareStatement(sql);//생성시 인자 들어감

//?값 채우기
pstmt.setString(1,name);
pstmt.setString(2,title);
pstmt.setString(3,content);

pstmt.executeUpdate();//insert, 쿼리수행

pstmt.close();
con.close();

response.sendRedirect("boardList.jsp");
%>



</body>
</html>