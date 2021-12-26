package boardre;
import java.sql.*;//Connection, Statement, PreparedStatement, ResultSet
import java.util.*;//Vector, ArrayList

//back-end
public class BoardDAO {
	//전역변수
	String DRIVER="com.mysql.jdbc.Driver";
	String URL="jdbc:mysql://localhost:3306/mydb5";
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
	
	//커넥션 얻기 메서드
	private Connection getCon(){
		Connection con=null;
		
		try{
			con=DriverManager.getConnection(URL,USER,PWD);//DB연결
			System.out.println("DB연결 성공");
		}catch(Exception ex){
			System.out.println("DB연결 실패 "+ex);
		}
		return con;
	}//getCon()-end
	
	//pos증가 : 글 순서
	public void upPos(){
		Connection con=null;
		try{
			con=getCon();//커넥션 얻기
			stmt=con.createStatement();//Statement 생성
			sql="update board set pos=pos+1";//글쓰기, 답글쓰기(글 순서)
			stmt.executeUpdate(sql);//쿼리 수행
			
		}catch(Exception ex){
			System.out.println("upPos() 에러"+ex);
		}finally{
			try{
				if(stmt != null){stmt.close();}
				if(con != null){con.close();}
			}catch(Exception ex2){}
		}//finally-end
	}//upPos()-end

	//--------------------------
	//insert 글 쓰기
	//--------------------------
	public void insertBoard(BoardDTO dto){
		upPos();//메서드 호출
		Connection con=null;
		
		try{
			con=getCon();//커넥션 얻기
			sql="insert into board(num,name,subject,content,pos,depth,regdate,ip,pw)"+
			"values(0,?,?,?,?,?,NOW(),?,?)";
			pstmt=con.prepareStatement(sql);//생성시 인자 들어간다
			
			//?값 채우기
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getContent());
			
			pstmt.setInt(4, dto.getPos());
			pstmt.setInt(5, dto.getDepth());
			
			pstmt.setString(6, dto.getIp());
			pstmt.setString(7, dto.getPw());
			
			pstmt.executeUpdate();//insert, 글쓰기, 쿼리 수행
			
		}catch(Exception ex){
			System.out.println("insertBoard() 에러"+ex);
		}finally{
			try{
				if(pstmt != null){pstmt.close();}
				if(con != null){con.close();}
			}catch(Exception ex2){}
		}//finally-end
	}//insertBoard()-end
	
	//--------------------------
	//리스트, 검색
	//--------------------------
	public Vector getBoardList(String keyField, String keyWord){
		Vector<BoardDTO> vec=new Vector<BoardDTO>();
		Connection con=null;
		try{
			con=getCon();//커넥션 얻기
			stmt=con.createStatement();//Statement 생성
			
			if(keyWord.equals(null) || keyWord.equals("")){
				//전체글 리스트
				sql="select * from board order by pos asc";
				
			}else{
				//검색글 리스트
				//keyField : 글쓴이, 글내용, 글제목
				sql="select * from board where "+keyField+" like '%"+keyWord+"%'order by pos asc";
				
			}//else-end
			
			rs=stmt.executeQuery(sql);//쿼리 수행 
			
			
			//rs내용을 dto에 담고, dto를 vec에 넣는다, 그리고 vec 리턴한다
			while(rs.next()){
				BoardDTO dto=new BoardDTO();
				
				dto.setNum(rs.getInt("num"));
				
				dto.setName(rs.getString("name"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				
				dto.setPos(rs.getInt("pos"));
				dto.setDepth(rs.getInt("depth"));
				
				dto.setRegdate(rs.getString("regdate"));
				dto.setIp(rs.getString("ip"));
				dto.setPw(rs.getString("pw"));
				dto.setCount(rs.getInt("count"));
				
				vec.add(dto);//vec에 dto 넣기
			}//while-end
			
		}catch(Exception ex){
			System.out.println("getBoardList() 에러"+ex);
		}finally{
			try{
				if(rs != null){rs.close();}
				if(stmt != null){stmt.close();}
				if(con != null){con.close();}
			}catch(Exception ex2){}
		}//finally-end
		
		return vec;//결과를 클라이언트로 리턴한다
	}//getBoardList()-end
	
	//-------------------------------------------
	// 조회수 증가
	//-------------------------------------------
	public void upCount(int num){
		Connection con=null;
		try{
			con=getCon();//커넥션 얻기
			sql="update board set count=count+1 where num="+num;
			pstmt=con.prepareStatement(sql);//생성시 인자 들어간다
			pstmt.executeUpdate();//쿼리 수행
			
		}catch(Exception ex1){
			System.out.println("upCount() 예외"+ex1);
		}finally{
			try{
				if(pstmt != null){pstmt.close();}
				if(con != null){con.close();}
			}catch(Exception ex2){}
		}//finally-end
	}//upCount()-end

	//-------------------------------------------
	// 글 내용 보기, 글 수정 폼
	//-------------------------------------------
	public BoardDTO getBoard(int num){
		BoardDTO dto=new BoardDTO();
		Connection con=null;
		try{
			con=getCon();//커넥션 얻기
			sql="select * from board where num="+num;
			pstmt=con.prepareStatement(sql);//생성시 인자 들어간다
			rs=pstmt.executeQuery();//쿼리수행
			
			while(rs.next()){
				//rs내용을 dto에 저장
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				
				dto.setPos(rs.getInt("pos"));
				dto.setDepth(rs.getInt("depth"));
				
				dto.setRegdate(rs.getString("regdate"));
				dto.setPw(rs.getString("pw"));
				dto.setCount(rs.getInt("count"));
				dto.setIp(rs.getString("ip"));
			}//while-end
			
		}catch(Exception ex1){
			System.out.println("getBoard() 예외 :"+ex1);
		}finally{
			try{
				if(rs != null){rs.close();}
				if(pstmt != null){pstmt.close();}
				if(con != null){con.close();}
			}catch(Exception ex2){}
		}//finally-end
		
		return dto;//클라이언트로 리턴해 준다
	}//getBoard()-end
	//-------------------------------------------
	// DB 글 수정하기
	//-------------------------------------------
	public void updateBoard(BoardDTO dto){
		Connection con=null;
		try{
			con=getCon();//커넥션 얻기
			sql="update board set name=?,subject=?,content=? where num=?";
			
			pstmt=con.prepareStatement(sql);//생성시 인자 들어간다

			//?값 채우기
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getContent());
			
			pstmt.setInt(4, dto.getNum());
			
			pstmt.executeUpdate();//쿼리 수행
			
		}catch(Exception ex1){
			System.out.println("updateBoard() 예외 :"+ex1);
		}finally{
			try{
				if(pstmt != null){pstmt.close();}
				if(con != null){con.close();}
			}catch(Exception ex2){}
		}//finally-end
	}//updateBoard()-end
	
	//-------------------------------------------
	// DB 글 삭제
	//-------------------------------------------
	public void deleteBoard(int num){
		Connection con=null;
		try{
			con=getCon();//커넥션 얻기
			sql="delete from board where num=?";
			pstmt=con.prepareStatement(sql);//생성시 인자 들어간다
			
			//?값 채우기
			pstmt.setInt(1, num);
			
			pstmt.executeUpdate();//쿼리 수행
			
		}catch(Exception ex1){
			System.out.println("deleteBoard() 예외 :"+ex1);
		}finally{
			try{
				if(pstmt != null){pstmt.close();}
				if(con != null){con.close();}
			}catch(Exception ex2){}
		}//finally-end
	}//deleteBoard()-end
	
	//-------------------------------------------
	// 답글 위치 확보
	//-------------------------------------------
	public void replyPos(BoardDTO dto){
		Connection con=null;
		try{
			con=getCon();
			sql="update board set pos=pos+1 where pos>?";
			pstmt=con.prepareStatement(sql);//생성시 인자 들어간다 <-- 객체 생성과 같은 말
			
			pstmt.setInt(1, dto.getPos());
			pstmt.executeUpdate();//쿼리 수행
			
		}catch(Exception ex1){
			System.out.println("replyPos() 예외 :"+ex1);
		}finally{
			try{
				if(pstmt != null){pstmt.close();}
				if(con != null){con.close();}
			}catch(Exception ex2){}
		}//finally-end
	}//replyPos()-end
	
	//-------------------------------------------
	// 답글쓰기
	//-------------------------------------------
	public void replyBoard(BoardDTO dto){
		Connection con=null;
		try{
			con=getCon();
			int depth=dto.getDepth()+1;//들여쓰기
			int pos=dto.getPos()+1;//현재 위치 + 1 (답글 끼워넣는 위치)
			
			sql="insert into board(name,subject,content,pos,depth,regdate,pw,count,ip) "+
			"values(?,?,?,?,?,NOW(),?,?,?)";
			
			pstmt=con.prepareStatement(sql);//생성시 인자 들어간다
			
			//?값 채우기
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getContent());
			
			pstmt.setInt(4, pos);
			pstmt.setInt(5, depth);
			
			pstmt.setString(6, dto.getPw());
			pstmt.setInt(7, dto.getCount());
			pstmt.setString(8, dto.getIp());
			
			pstmt.executeUpdate();//쿼리 수행
			
		}catch(Exception ex1){
			System.out.println("replyBoard() 에러 :"+ex1);
		}finally{
			try{
				if(pstmt != null){pstmt.close();}
				if(con != null){con.close();}
			}catch(Exception ex2){}
		}//finally-end
	}//replyBoard()-end
}//class-end
