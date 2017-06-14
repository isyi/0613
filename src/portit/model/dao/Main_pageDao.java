package portit.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import portit.model.db.DBConnectionMgr;

public class Main_pageDao {
	
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DBConnectionMgr pool;

	public Main_pageDao(){
		try{
			pool = DBConnectionMgr.getInstance();
		}
		catch(Exception err){
			System.out.println("Main_pageDao 오류 : " + err);
		}
	}
	
	//메인페이지 
	public List getBoardList(){
		ArrayList list = new ArrayList();
		String sql = "select MEDIA_LIBRARY.ML_PATH from MEDIA_LIBRARY";
		
		try{		
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
	
			while(rs.next()){
			/*	Board board = new Board();
				//번호 제목 이름 날짜 조회수	
				board.setB_num(rs.getInt("b_num"));
				board.setB_subject(rs.getString("b_subject"));
				board.setB_name(rs.getString("b_name"));
				board.setB_regdate(rs.getString("b_regdate"));
				board.setB_count(rs.getInt("b_count"));
				board.setB_depth(rs.getInt("b_depth"));
				
				list.add(board);
			*/
			}
		}
		catch(Exception err){
			System.out.println("getBoardList에서 오류");
			err.printStackTrace();
		}
		finally{
			pool.freeConnection(con,pstmt,rs);
		}
		return list;
	}
}
