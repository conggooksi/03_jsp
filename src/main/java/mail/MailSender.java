package mail;
import java.io.*;
import com.oreilly.servlet.*;

public class MailSender {
	//전역변수=필드=property=속성
	private String from;//보내는 사람 이메일 주소
	private String to;//받는 사람 이메일 주소
	private String subject;//편지제목
	private String content;//편지 내용
	
	//생성자:객체 초기화, 리턴형 없다
	public MailSender(){
		from="";
		to="";
		subject="";
		content="";
	}
	
	//setter 메서드 만
	public void setFrom(String from) {
		this.from = from;
	}

	public void setTo(String to) {
		this.to = to;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	//기타 메서드
	//사용자 정의 메서드
	public String send(){
		String reply="";
		
		try{
			MailMessage msg=new MailMessage("smtp.nate.com");
			msg.from(from);//보내는 사람 이메일 주소
			msg.to(to);//받는 사람 이메일 주소
			msg.setSubject(subject);//편지 제목
			
			//MailMessage에서 출력용 스트림을 생성
			PrintStream out=msg.getPrintStream();//out 객체 생성 <--jsp는 out객체가 있지만 자바는 읍따
			out.println(content);
			
			msg.sendAndClose();//출력용 스트림의 내용을 보내고 종료
			
			reply="메일 전송 성공";
			
		}catch(Exception ex){
			reply="메일 전송 실패 :"+ex;
		}
		
		
		return reply;
	}//send()-end
}//class-end
