package portit.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import portit.model.db.DBConnectionMgr;
import portit.model.dto.Developer;
import portit.model.dto.Media;
import portit.model.dto.Message;
import portit.model.dto.Portfolio;
import portit.model.dto.Profile;
import portit.model.dto.Project;
import portit.model.dto.Tag;

/**
 * 
 * 통합 검색시, DB에서 자료 가지고 오기.
 *
 */
public class SearchDao {

	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DBConnectionMgr pool;

	
	/**
	 * DB연결 생성자
	 */
	public SearchDao() {
		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
		} catch (Exception err) {
			System.out.println("DB접속 오류 : " + err);
		}
	}

	/**
	 * DB 접속 해제
	 */
	private void freeConnection() {
		try {
			pool.freeConnection(con, pstmt, rs);
			if (con != null) {
				System.out.println("DB 접속 해제");
			}
		} catch (Exception e) {
			System.out.println("DB 접속해제 오류 - freeConnection()");
			e.printStackTrace();
		}
	}

	/**
	 * 포트폴리오 검색결과  
	 */
	public List searchAll_port(String keyword) {
		String sql = "select distinct MEDIA_LIBRARY.ML_PATH, TAG.TAG_NAME, portfolio.PF_TITLE ,Profile.PROF_NAME, portfolio.PF_LIKE "
				+ "from MEDIA_LIBRARY, TAG, Profile, portfolio, prof_pf, TAG_USE "
				+ "where tag.tag_name like '%"+keyword+"%'"
				+ "and prof_pf.PROF_ID = Profile.PROF_ID  "
				+ "and prof_pf.PF_ID = portfolio.PF_ID and TAG_USE.TAG_ID = TAG.TAG_ID "
				+ "and TAG_USE.TAG_USE_TYPE_ID= prof_pf.PF_ID "
				+ "and MEDIA_LIBRARY.ML_TYPE_ID = portfolio.PF_ID";
		
		
		ArrayList list = new ArrayList();
		try {

			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Portfolio portfolio = new Portfolio(); 
				
				portfolio.setMl_path(rs.getString("ml_path"));
				portfolio.setTag_name(rs.getString("tag_name"));
				portfolio.setPf_title(rs.getString("pf_title"));
				portfolio.setPf_like(rs.getInt("pf_like"));
				portfolio.setProf_name(rs.getString("prof_name"));

				list.add(portfolio);
			}
		}

		catch (Exception err) {
			System.out.println("searchAll() 에서 오류");
			err.printStackTrace();
		}

		finally {
			freeConnection();
		}
		return list;
	}
	
	public List searchAll_developer(String keyword) {
		ArrayList list = new ArrayList();
		String sql = "select profile.prof_img, profile.prof_name, tag.tag_name, profile.prof_follower "
				+ "from profile join tag_use "
				+ "on tag_use.tag_use_type_id = profile.prof_id "
				+ "join tag "
				+ "on tag.tag_id = tag_use.tag_id "
				+ "where tag.tag_name like '%"+keyword+"%'";
				
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Developer developer = new Developer(); 
				developer.setTag_name(rs.getString("tag_name"));
				developer.setProf_img(rs.getString("prof_img"));
				developer.setProf_name(rs.getString("prof_name"));
				developer.setProf_follower(rs.getInt("prof_follower"));

				list.add(developer);
			}
		}

		catch (Exception err) {
			System.out.println("developer_info() 에서 오류");
			err.printStackTrace();
		}

		finally {
			freeConnection();
		}
		return list;
	}

	public List searchAll_proj(String keyword) {
		ArrayList list = new ArrayList();
		String sql = "select distinct project.proj_id, tag.tag_name, project.proj_title,"
						+ " tag.tag_name, project.proj_to, trunc(project.proj_regenddate - sysdate) "
						+ "from tag join tag_use "
						+ "on tag.tag_id = tag_use.tag_id "
						+ "join project "
						+ "on tag_use.tag_use_type_id = project.proj_id "
						+ "where tag.tag_name like '%"+keyword+"%'";
						
				
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				Project project = new Project(); 
				project.setTag_name(rs.getString("tag_name"));
				project.setProj_title(rs.getString("proj_title"));
				project.setProj_intro(rs.getString("proj_intro"));
				project.setProj_to(rs.getInt("proj_to"));
				
				//project.setProj_regenddate(rs.getDate("proj_regenddate")); date형식 받는데 오류
				
				list.add(project);
			}
		}
		
		catch (Exception err) {
			System.out.println("proj_load() 에서 오류");
			err.printStackTrace();
		}
		
		finally {
			freeConnection();
		}
		return list;
	}
}