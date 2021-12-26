<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="com.oreilly.servlet.*"
    import="com.oreilly.servlet.multipart.*"
    
    import="java.util.*"
    import="java.io.*"
    %>
<%--fileupload.jsp --%>
<%
request.setCharacterEncoding("utf-8");

String savePath="c:\\_aa\\upload\\";
int size=5*1024*1024;//5MB

try{
	MultipartRequest mm=new MultipartRequest(request,savePath,
	size,"utf-8", new DefaultFileRenamePolicy());
	//파일 업로드 끝
	
	//만약 파일 업로드가 여러개 일때 Enumeration으로 처리하면 된다
	Enumeration en=mm.getFileNames();//form안의 전송된 파일 정보를 가져온다
	
	String formName=(String)en.nextElement();
	
	String fileName=mm.getFilesystemName(formName);//서버에 저장된 파일 이름 얻기
	
	if(fileName == null){//파일 업로드가 되지 않은 경우
		out.println("파일 업로드 되지 않았음");
	
	}else{//파일 업로드가 된 경우 ★★★★★★★★★★★★
		
		//일반 데이터 처리
		out.println("이름 : "+mm.getParameter("name")+"<br>");
		out.println("ID : "+mm.getParameter("name")+"<br>");
		
		//서버에 저장된 파일 이름
		out.println("서버에 저장된 파일 이름 : "+mm.getFilesystemName("f1"));
		
		//원본 파일 이름
		out.println("원본 파일 이름 :"+mm.getOriginalFileName("f1"));
		
		//전송된 file의 contentType
		String type=mm.getContentType("f1");
		out.println("파일 contentType :"+type);
		
		//input 항목 이름에 해당하는
		//파일 정보를 File형으로 리턴
		File file=mm.getFile("f1");
		
		
		
		if(file != null){
			out.println("파일 size :"+file.length()+"<br>");
		}
	}//else-end
	
	
}catch(Exception ex){
	out.println("파일 업로드 예외:"+ex);
}
%>
