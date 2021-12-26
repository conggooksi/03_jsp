package jsp1board;
import java.sql.*;
import java.util.*;

public class BoardDAO {
	String DRIVER="com.mysql.jdbc.Driver";
	String URL="jdbc:mysql://localhost:3306/testDB";
	String USER="root";
	String PWD="12345";
	
	String sql=""; 
	PreparedStatement pstmt=null;
	Statement stmt=null;
	ResultSet rs=null;
	
	public BoardDAO(){
		try{
			Class.forName(DRIVER);
			System.out.println("드라이버 로딩 성공");
		}catch(ClassNotFoundException cnf){
			System.out.println("드라이버 로딩 실패 :"+cnf);
		}
	}//cons-end
	
	private Connection getCon(){
		Connection con=null;
		try{
			con=DriverManager.getConnection(URL,USER,PWD);
			System.out.println("DB연결 성공");
		}catch(Exception ex){
			System.out.println("DB연결 실패 :"+ex);
		}
		return con;
	}//getCon()-end
	
	
	public void insertBoard(BoardDTO dto){
		Connection con=null;
		try{
			con=getCon();
			sql="insert into board(num,name,title,content,regdate) values(0,?,?,?,now())";
			
			pstmt=con.prepareStatement(sql);
			
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			
			pstmt.executeUpdate();
		}catch(Exception ex){
			System.out.println("insertBoard() 에러:"+ex);
		}finally{
			try{
				if(pstmt != null){pstmt.close();}
				if(con != null){con.close();}
			}catch(Exception ex2){}
		}
	}
	
	public Vector getBoardList(){
		Vector<BoardDTO> vec=new Vector<BoardDTO>();
		Connection con=null;
		
		try{
			con=getCon();
			stmt=con.createStatement();
			rs=stmt.executeQuery("select * from board");
			
			while(rs.next()){
				BoardDTO dto=new BoardDTO();
				
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate"));
				
				vec.add(dto);
			}
			
		}catch(Exception ex){
			System.out.println("getBoardList() 에러:"+ex);
		}finally{
			try{
				if(rs != null){rs.close();}
				if(stmt != null){stmt.close();}
				if(con != null){con.close();}
			}catch(Exception ex){}
		}
		return vec;
		
	}
	
	
}//class-end
