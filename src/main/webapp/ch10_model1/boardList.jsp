<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="java.sql.*"
    %>
<%!
String DRIVER="com.mysql.jdbc.Driver";
String URL="jdbc:mysql://localhost:3306/mydb2";
String USER="root";
String PWD="12345";
%>

<%
request.setCharacterEncoding("utf-8");
%>
<%--boardList.jsp --%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>boardList.jsp</title>
</head>
<body>
<%
Class.forName(DRIVER);//드라이버로딩
Connection con=DriverManager.getConnection(URL,USER,PWD);

Statement stmt=con.createStatement();

String sql="select * from board";

ResultSet rs=stmt.executeQuery(sql);//쿼리수행
%>
<table border="1">
	<tr>
		<td>글번호</td>
		<td>글쓴이</td>
		<td>글제목</td>
		<td>날짜</td>
		<td>IP</td>
	</tr>
	
	<%
	while(rs.next()){
		int num=rs.getInt("num");
		String writer=rs.getString("writer");
		String subject=rs.getString("subject");
		String wdate=rs.getString("wdate");////날짜는 방법이 다양한데 이번에는 String으로
		String ip=rs.getString("ip");
		%>
		<tr>
			<td><%= num%></td>
			<td><%= writer%></td>
			<td><%= subject%></td>
			<td><%= wdate%></td>
			<td><%= ip%></td>
		</tr>
		<%
	}//while-end
	
	rs.close();
	stmt.close();
	con.close();
	%>
</table>


</body>
</html>