package mailupload;
import java.io.*;

import javax.servlet.http.*;

import com.oreilly.servlet.*;
import com.oreilly.servlet.multipart.*;

public class MailUpload {

	//사용자 정의 메서드
	public String upload(HttpServletRequest request){
		String reply="";//변수
		
		try{
			MultipartRequest mul=new MultipartRequest(request,"c:\\_aa\\upload\\",5*1024*1024,"utf-8", new DefaultFileRenamePolicy());
			//파일 업로드 끝
			
			//메일 보내기 작업
			String from=mul.getParameter("from");
			String to=mul.getParameter("to");
			
			String subject=mul.getParameter("subject");
			String content=mul.getParameter("content");
			//---------------------------------------------
			subject=new String(subject.getBytes("utf-8"),"8859_1");
			content=new String(subject.getBytes("utf-8"),"8859_1");
			//8859_1 : 영문 문자셋(ascii 코드값으로 처리)
			//euc-kr : 한글 문자셋
			//KSC5601: 한글 문자셋
			//utf-8 : 우리나라에서 한글 문자셋
			//---------------------------------------------
			
			MailMessage msg=new MailMessage("smtp.nate.com");//host
			
			msg.from(from);
			msg.to(to);
			msg.setSubject(subject);
			
			PrintStream out=msg.getPrintStream();//MailMessage에서 출력용 스트림 생성
			
			out.println(content);
			
			msg.sendAndClose();//출력용 스트림의 내용을 보내고 종료
			
			reply="메일보내기 파일업로드 성공";
			
		}catch(Exception ex){
			reply="메일 보내기 파일 업로드 실패 : "+ex;
		}
		
		return reply;
	}//upload()-end
}//class-end
