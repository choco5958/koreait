package login;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import register.RegisterVO;

public class LoginDAO {
	
	private JdbcTemplate jdbcTemplate;

	public LoginDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	public RegisterVO selectUser(String userid) {
		List<RegisterVO> results = jdbcTemplate.query(
				"select * from register_user where USERID = ?",
				new RowMapper<RegisterVO>() {
					@Override
					public RegisterVO mapRow(ResultSet rs, int rowNum) throws SQLException {
						RegisterVO registerVO = new RegisterVO(
								rs.getString("userid"),
								rs.getString("userpassword"),
								rs.getString("username"),
								rs.getString("userbirth"),
								rs.getString("userphone"),
								rs.getString("useremail"),
								rs.getString("useraddress"),
								rs.getTimestamp("userregdate"),
								rs.getInt("usergrade"));
						registerVO.setUserId(rs.getString("userid"));
						return registerVO;
					}
				}, userid);

		return results.isEmpty() ? null : results.get(0);
	}

//	private Connection con;
//	private PreparedStatement pstmt;
//	private DataSource ds;
//
//	public boolean isExisted(LoginVO vo) {
//		boolean result = false;
//		String userid = vo.getUserId();
//		String userpassword = vo.getUserPassword();
//
//		try {
//			// db - servlet 연결
//			con = ds.getConnection();
//
//			// 조회하는 ID가 있으면 'true', 없으면 'false' (as result는 레코드 이름)
//			String sql = "SELECT userpassword FROM REGISTER_USER WHERE USERID = ?";
//
//			// SQL문을 PrepareStatement에 등록하고 각각의 자리(?)를 채운다.
//			pstmt = con.prepareStatement(sql);
//			pstmt.setString(1, userid);
//
//			// DB에 쿼리를 전송하고, 결과 값을 받는다.
//			ResultSet rs = pstmt.executeQuery();
//
//			if(rs.next()) {// 커서를 첫 번째 레코드에 위치한다.
//				String dbpassword = rs.getString("userpassword");
//				if(userpassword.equals(dbpassword)) {
//					 result = true;
//				}
//			}
//
//			// 'result'라는 레코드의 값을 boolean으로 변환
////			result = Boolean.parseBoolean(rs.getString("result"));
//
//			System.out.println("result : " + result);
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return result;
//	}

}
