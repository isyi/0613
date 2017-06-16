package portit.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import portit.model.db.DBConnectionMgr;
import portit.model.dto.Media;
import portit.model.dto.Message;
import portit.model.dto.Portfolio;
import portit.model.dto.Profile;
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
	private String keyword = "";
	private String sql = "select distinct MEDIA_LIBRARY.ML_PATH, TAG.TAG_NAME, portfolio.PF_TITLE ,Profile.PROF_NAME, portfolio.PF_LIKE "
			+ "from MEDIA_LIBRARY, TAG, Profile, portfolio, prof_pf, TAG_USE "
			+ "where portfolio.PF_TITLE like '%" + keyword + "%'"
			+ "and prof_pf.PROF_ID = Profile.PROF_ID  "
			+ "and prof_pf.PF_ID = portfolio.PF_ID and TAG_USE.TAG_ID = TAG.TAG_ID "
			+ "and TAG_USE.TAG_USE_TYPE_ID= prof_pf.PF_ID "
			+ "and MEDIA_LIBRARY.ML_TYPE_ID = portfolio.PF_ID";
	
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
	 * 미디어 패스를 불러오는 메서드	  
	 */
	public List media_load() {
		ArrayList list = new ArrayList();
		try {

			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Media media = new Media();
				media.setMl_path(rs.getString("ml_path"));

				list.add(media);
			}
		}

		catch (Exception err) {
			System.out.println("TotalSearch() 에서 오류");
			err.printStackTrace();
		}

		finally {
			freeConnection();
		}
		return list;
	}

	/**
	 * 사용된 태그명을 불러오는 메서드
	 * 
	 * @return
	 */
	public List tag_load() {
		ArrayList list = new ArrayList();
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Tag tag = new Tag(); 
				tag.setTag_name(rs.getString("tag_name"));

				list.add(tag);
			}
		}

		catch (Exception err) {
			System.out.println("tag_load() 에서 오류");
			err.printStackTrace();
		}

		finally {
			freeConnection();
		}
		return list;
	}

	/**
	 * 포트폴리오 제목, 좋아요 수를 불러오는 메서드
	 * 
	 * @return
	 */
	public List pf_load() {
		ArrayList list = new ArrayList();
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Portfolio portfolio = new Portfolio(); 
				portfolio.setPf_title(rs.getString("pf_title"));
				portfolio.setPf_like(rs.getInt("pf_like"));
				
				list.add(portfolio);
			}
		}

		catch (Exception err) {
			System.out.println("pf_load() 에서 오류");
			err.printStackTrace();
		}

		finally {
			freeConnection();
		}
		return list;
	}

	/**
	 * 포트폴리오 등록자의 이름을 불러오는 메서드
	 * 
	 * @return
	 */
	public List prof_load() {
		ArrayList list = new ArrayList();
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Profile profile = new Profile(); 
				profile.setProf_name(rs.getString("prof_name"));
				list.add(profile);
			}
		}

		catch (Exception err) {
			System.out.println("prof_load() 에서 오류");
			err.printStackTrace();
		}

		finally {
			freeConnection();
		}
		return list;
	}

}