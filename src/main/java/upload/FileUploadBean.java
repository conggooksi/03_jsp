package upload;

import java.io.*;
import javax.servlet.http.*;

import com.oreilly.servlet.*;
import com.oreilly.servlet.multipart.*;

public class FileUploadBean {

	//사용자 정의 메서드
	public String upload(HttpServletRequest request){
		String reply="";//변수
		try{//<--io 니깐 트라이 캐취!
			String savePath="c:\\_aa\\upload\\";//업로드 될 위치
			int size=5*1024*1024;//업로드 될 파일 size : 5MB
			MultipartRequest mul=new MultipartRequest(request,savePath,size,"utf-8",new DefaultFileRenamePolicy());
			
			reply="파일 업로드 성공";
			
		}catch(Exception ex){
			reply="파일 업로드 실패:"+ex;
		}
		
		
		return reply;//리턴형이 없으면 Http~~~여기에 빨간줄 나온다
	}
}//class-end
