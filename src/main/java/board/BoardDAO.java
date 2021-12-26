package board;
import java.sql.*;
import java.util.*;//List, ArrayList, Vector

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
			System.out.println("드라이버로딩 에러:"+cnf);
		}
		
		
	}//cons-end
	
	private Connection getCon(){
		Connection con=null;
		try{
			con=DriverManager.getConnection(URL,USER,PWD);
			System.out.println("DB연결 성공");
		}catch(SQLException se){
			System.out.println("DB연결 실패:"+se);
		}
		
		return con;
	}//getCon()-end
	//-------------------------------------------------
	//DB글쓰기, insert
	//-------------------------------------------------
	public void insertBoard(BoardDTO dto){
		Connection con=null;
		
		try{
			con=getCon();//커넥션 얻기
			sql="insert into board(num,writer,subject,content,wdate,ip)"+
			"values(0,?,?,?,NOW(),?)";
			
			pstmt=con.prepareStatement(sql);//생성시 인자 들어간다

			//?값 채우기
			pstmt.setString(1,dto.getWriter());
			pstmt.setString(2,dto.getSubject());
			pstmt.setString(3,dto.getContent());
			//날짜
			pstmt.setString(4,dto.getIp());
			
			pstmt.executeUpdate();//insert, 쿼리수행
			
		}catch(SQLException ex1){
			System.out.println("insertBoard() 예외:"+ex1);
		}finally{
			try{
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(Exception ex2){}
		}//finally-end
	}//insertBoard()-end
	//-------------------------------------------------
	//리스트
	//-------------------------------------------------
	public Vector getBoardList(){
		Vector<BoardDTO> vec=new Vector<BoardDTO>();
		Connection con=null;
		try{
			con=getCon();
			stmt=con.createStatement();//Statement 생성
			rs=stmt.executeQuery("select * from board");
			
			while(rs.next()){
				BoardDTO dto=new BoardDTO();//<--1차적으로 DTO에 담고
				
				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setSubject(rs.getString("subject"));
				
				dto.setContent(rs.getString("content"));
				dto.setWdate(rs.getString("wdate"));
				dto.setIp(rs.getString("ip"));
				
				vec.add(dto);//vector나 arraylist는 객체를 담아서 사용
				
			}//while-end
		}catch(Exception ex){
			System.out.println("getBoardList() 예외:"+ex);
		}finally{
			try{
				if(rs!=null){
					rs.close();
				}
				if(stmt!=null){
					stmt.close();
				}
				if(con!=null){
					con.close();
				}
			}catch(Exception ex3){}
		}//finally-end
		
		return vec;//클라이언트로 던져 준다
		
		
	}//getBoardList()-end
}//class-end
