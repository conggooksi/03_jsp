package board2;
import java.sql.*;
import java.util.*;

public class BoardDAO {
	//전역변수
	String DRIVER="com.mysql.jdbc.Driver";
	String URL="jdbc:mysql://localhost:3306/mydb2";
	String USER="root";
	String PWD="12345";
	
	Statement stmt=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	String sql="";
	
	//생성자
	public BoardDAO(){
		try{
			Class.forName(DRIVER);
			System.out.println("드라이버 로딩 성공");
		}catch(ClassNotFoundException cnf){
			System.out.println("드라이버 로딩 실패 :"+cnf);
		}
	}//cons-end
	
	//사용자 정의 메서드
	private Connection getCon(){
		Connection con=null;
		try{
			con=DriverManager.getConnection(URL,USER,PWD);//DB연결
			System.out.println("DB연결 성공");
			
		}catch(Exception ex){
			System.out.println("DB연결 실패:"+ex);
		}
		return con;
	}//getCon()-end
	public static void main(String[] args) {
		new BoardDAO().getCon();
	}
	//--------------------------
	// insert, DB에 글쓰기
	//--------------------------
	 public void insertBoard(BoardDTO dto){
		 Connection con=null;
		 try{
			 con=getCon();//Connection 얻기
			 sql="insert into board2(num,name,title,content,regdate) values(0,?,?,?,NOW())";
			 pstmt=con.prepareStatement(sql);//생성시 인자 들어간다
			 
			 //?값 채우기
			 pstmt.setString(1,dto.getName());
			 pstmt.setString(2,dto.getTitle());
			 pstmt.setString(3,dto.getContent());
			 
			 
			 //쿼리 수행
			 pstmt.executeUpdate();

		 }catch(Exception ex){
			 System.out.println("insertBoard()에러:"+ex);
		 }finally{//앞에 리턴문이 있어도 수행된다, 예외 발생과 상관없이 수행된다
			 try{
				 if(pstmt != null){pstmt.close();}
				 if(con !=null){con.close();}
			 }catch(Exception ex2){}
		 }//finally-end
	 }
	
	//--------------------------
	// select 리스트
	//--------------------------
	public Vector getBoardList(){
		Vector<BoardDTO> vec=new Vector<BoardDTO>();
		Connection con=null;
		
		try{
			
			con=getCon();//커넥션 얻기
			stmt=con.createStatement();//Statement 생성
			rs=stmt.executeQuery("select * from board2");
			
			while(rs.next()){
				BoardDTO dto=new BoardDTO();
				
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate"));
				
				vec.add(dto);//vec에 넣기
			}//while-end
			
		}catch(Exception ex){
			System.out.println("getBoardList() 예외:"+ex);
		}finally{
			try{
				if(rs != null){rs.close();}
				if(stmt != null){stmt.close();}
				if(con != null){con.close();}
			}catch(Exception ex){}
		}//finally-end
		
		return vec;//클라이언트로 던져준다
	}//getBoardList()-end
	
	
}//class-end
