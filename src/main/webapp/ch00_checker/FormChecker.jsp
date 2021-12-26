<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FormChecker.jsp</title>
</head>
<body>
<%
 request.setCharacterEncoding("UTF-8");
 
 //클라이언트가 보내준 데이터 받기
	String name=request.getParameter("name");
	String id=request.getParameter("id");
	String email=request.getParameter("email");
	String card=request.getParameter("card");
	String ssn1=request.getParameter("ssn1");
	String ssn2=request.getParameter("ssn2");
	String pwd=request.getParameter("p1");
	
	StringBuffer sb=new StringBuffer(ssn1);
	sb.append("-");
	sb.append(ssn2);
	sb.replace(0,6,"######");//주민 번호 
	sb.replace(8,13,"#####");
	
	StringBuffer p=new StringBuffer(pwd);//암호
	p.replace(0,5,"#####");
	%>
	
<table border=1 width="50%">
	<tr>
	  <td>Name</td>
	  <td><%=name %></td>
	</tr>
	
	<tr>
	  <td>ID</td>
	  <td><%=id %></td>
	</tr>
	
	<tr>
	  <td>Email</td>
	  <td><%=email %></td>
	</tr>
	
	<tr>
	  <td>card Number</td>
	  <td><%=card %></td>
	</tr>
	
	
	<tr>
	  <td>주민번호</td>
	  <td><%= sb%></td>
	</tr>
	
	<tr>
	  <td>주민번호</td>
	  <td><%= p%></td>
	</tr>
	</table>
</body>
</html>