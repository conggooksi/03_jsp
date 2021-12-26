<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%--cart.jsp --%>
<%
request.setCharacterEncoding("utf-8");
%>

<html>
<body>
<%@ include file="menu.jsp" %>  <%--마치 menu 가 여기에 소스를 입력한 것과 같은 효과..
								그래서 menu.jsp에 보면 head부분이 다 읍지? 일부러 안 넣음 --%>

<%
String item=request.getParameter("item");//menu.jsp,,,remove.jsp <--양쪽에서 "item"이 온다
String step=request.getParameter("step");//menu.jsp,,,remove.jsp
//											add			remove  <--menu.jsp에서 오는 step은 add일 것이고 다른 거는 remove일 것이다 라는 뜻
Vector vec=null;//변수선언
%>

<%
if(item != null){
	
	
	//장바구니의 내용을 가져온다
	vec=(Vector)session.getAttribute("cart");
	
	if(vec==null){//처음 물건을 선택했을 때
		vec=new Vector();
		vec.add(item);//장바구니에 item 넣는다
		session.setAttribute("cart", vec);//*********
	}else{//이미 선택한 CD가 있는 경우
		if(step.equals("add")){
			vec.add(item);//장바구니에 넣기
		}else if(step.equals("remove")){
			vec.remove(item);//item제거
		}
		
	}//else-end
	
	out.println("장바구니에 담긴 물건(CD)<br>");
	for(int i=0; i<vec.size(); i++){
		out.println((i+1)+"."+(vec.get(i).toString())+"<br>");//장바구니 내용을 출력
	}//for-end
	%>
	현재 cart에 모두 <%= vec.size() %>개 담겨 있습니다 
	<%
	if(vec.size()>0){
		%>
		<jsp:include page="remove.jsp" flush="false"/>
		<%
	}
}//if-end
%>
</body>
</html>