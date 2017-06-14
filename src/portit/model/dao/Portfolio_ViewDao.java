package portit.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import portit.model.db.DBConnectionMgr;
import portit.model.dto.Media;
import portit.model.dto.Portfolio;
import portit.model.dto.Profile;
import portit.model.dto.Tag;

public class Portfolio_ViewDao {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DBConnectionMgr pool;

	public Portfolio_ViewDao(){
		try{
			pool = DBConnectionMgr.getInstance();
		}
		catch(Exception err){
			System.out.println("SearchDao 오류 : " + err);
		}
	}
	
	//연습용
	public List getEx(){
		ArrayList list = new ArrayList();
		String sql = "select * from Portfolio";
	
		try{
			con = pool.getConnection();		
	 		pstmt = con.prepareStatement(sql);	 
	 		rs = pstmt.executeQuery();
	 		
	 		while(rs.next()){				
				Portfolio portfolio = new Portfolio();				
			
				portfolio.setPf_id(rs.getInt("pf_id"));		
				portfolio.setPf_title(rs.getString("pf_title"));
				portfolio.setPf_intro(rs.getString("pf_intro"));
				portfolio.setPf_regdate(rs.getDate("pf_regdate"));
				portfolio.setPf_like(rs.getInt("pf_like"));
		
				list.add(portfolio);
			}	 					
		}
		
		catch(Exception err){
			System.out.println("getEx에서 오류");
			err.printStackTrace();
		}
		
		finally{
			pool.freeConnection(con, pstmt, rs);
		}
		return list;
	}
	
	//연습용
	public List getEx2(){
		ArrayList list = new ArrayList();
		String sql = "select * from MEDIA_LIBRARY";
		
		try{
			con = pool.getConnection();		
			pstmt = con.prepareStatement(sql);	 
			rs = pstmt.executeQuery();
			
			while(rs.next()){				
				Media media = new Media();				
				
				media.setMl_path(rs.getString("ml_path"));		
				
				list.add(media);
			}	 					
		}
		
		catch(Exception err){
			System.out.println("getEx2에서 오류");
			err.printStackTrace();
		}
		
		finally{
			pool.freeConnection(con, pstmt, rs);
		}
		return list;
	}
}
