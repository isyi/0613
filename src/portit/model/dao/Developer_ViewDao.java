package portit.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import portit.model.db.DBConnectionMgr;
import portit.model.dto.Profile;
import portit.model.dto.Tag;

/**
 * 개발자 구성 화면
 */
public class Developer_ViewDao {

	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DBConnectionMgr pool;
	private String sql = "select profile.prof_img, profile.prof_name, tag.tag_name, profile.prof_follower "
			+ "from profile join tag_use "
			+ "on tag_use.tag_use_type_id = profile.prof_id "
			+ "join tag "
			+ "on tag.tag_id = tag_use.tag_id"; 
			
	/**
	 * DB연결 생성자
	 */
	public Developer_ViewDao() {
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
	 * 사용된 태그명을 불러오는 메서드
	 *
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
	 * 포트폴리오 등록자의 이름을 불러오는 메서드
	 * 
	 */
	public List prof_load() {
		ArrayList list = new ArrayList();
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Profile profile = new Profile(); 
				profile.setProf_img(rs.getString("prof_img"));
				profile.setProf_name(rs.getString("prof_name"));
				profile.setProf_follower(rs.getInt("prof_follower"));
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