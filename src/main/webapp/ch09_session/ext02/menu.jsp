<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--menu.jsp --%>
<h2>구매할 CD를 고르세요</h2>
<form method="post">
	<select name="item">
		<option value="백아연CD" selected>백아연CD</option>
		<option value="허각CD">허각CD</option>
		<option value="안치환CD">안치환CD</option>
		<option value="아이유CD">아이유CD</option>
		<option value="로이킴CD">로이킴CD</option>
		<option value="임재범CD">임재범CD</option>
	</select>
	
	<!-- 장바구니에 추가 -->
	<input type="hidden" name="step" value="add"><%--hidden은 값을 안보이게 숨겨서 보내는거 --%>
	<input type="submit" value="전송">
</form>