package portit.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import portit.model.db.DBConnectionMgr;
import portit.model.dto.Project;
import portit.model.dto.Tag;

/**
 * 프로젝트 모집 구성 화면
 */
public class Proj_viewDao {

	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DBConnectionMgr pool;
	//쿼리문에  trunc(project.proj_regenddate - sysdate) as "D-Day" 빠짐
	private String sql = "select distinct project.proj_id, tag.tag_name, project.proj_title,"
					+ " tag.tag_name, project.proj_to "
					+ "from tag join tag_use "
					+ "on tag.tag_id = tag_use.tag_id "
					+ "join project "
					+ "on tag_use.tag_use_type_id = project.proj_id";
			
	/**
	 * DB연결 생성자
	 */
	public Proj_viewDao() {
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
	 * 사용된 태그명 + 모집분야(2개 태그까지 허용) 를 불러오는 메서드
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
	 * 프로젝트명,프로젝트 인원(TO),마감일까지 D-day를 불러오는 메서드
	 */
	public List proj_load() {
		ArrayList list = new ArrayList();
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				Project project = new Project(); 
				project.setProj_title(rs.getString("proj_title"));
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