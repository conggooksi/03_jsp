<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--template.jsp --%>
<%
String pageFile=request.getParameter("page");//page가 객체면서 키워드라 String page는 몬함
%>

<%
if(pageFile==null){
	pageFile="newItem";//newItem.jsp를 실행하게 하려고
}
%>

<html>
	<body bgColor="orange">
		<table width="90%" height="99%" border="1" align="center" bgColor="#cccccc">
			<tr>
				<td colspan="2" align="right" height="43">
					<jsp:include page="top.jsp" flush="false"/>
				</td>
			</tr>		
			<tr>
				<td width="15%" align="right" valign="top">
					<jsp:include page="left.jsp" flush="false"/>
				</td>
				
				<td align="center">
					<jsp:include page='<%= pageFile+".jsp"%>' flush="false"/>
				</td>
			</tr>
			
			<tr>
				<td width="100%" height="40" colspan="2">
					<jsp:include page="bottom.jsp" flush="false"/>
				</td>
			</tr>		
		</table>
	</body>
</html>