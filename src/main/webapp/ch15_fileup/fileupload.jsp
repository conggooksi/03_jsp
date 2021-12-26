<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="upload.*"
    %>
<%--fileupload.jsp --%>

<%--jsp:useBean은 객체 생성이다 --%>
<jsp:useBean id="bb" class="upload.FileUploadBean" scope="request"/>

<%= bb.upload(request)%>