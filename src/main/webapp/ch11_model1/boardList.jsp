<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*"
    %>
    
<%!
String DRIVER="com.mysql.jdbc.Driver";
String URL="jdbc:mysql://localhost:3306/mydb2";
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
Class.forName(DRIVER);
Connection con=DriverManager.getConnection(URL,"root","12345");
            //<--좋은 방법은 아니다, 변수 바꿀려면 하나하나 찾아가서 바꿔야 되니까네
Statement stmt=con.createStatement();
ResultSet rs=stmt.executeQuery("select * from board2");
%>

<table border="1">
	<tr>
		<td>글번호</td>
		<td>글쓴이</td>
		<td>글제목</td>
		<td>날짜</td>
	</tr>
	<%
	while(rs.next()){
		int num=rs.getInt("num");
		String name=rs.getString("name");
		String title=rs.getString("title");
		String regdate=rs.getString("regdate");
	%>
		<tr>
		<td><%= num%></td>
		<td><%= name%></td>
		<td><%= title%></td>
		<td><%= regdate%></td>
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