package register;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.tomcat.jdbc.pool.DataSource;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

public class RegisterDao {
	
private JdbcTemplate jdbcTemplate;
	
	public RegisterDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	//회원가입
	public void userInsert(RegisterVO vo) {
		String sql = "insert into REGISTER_USER values(register_user_seq.nextval,?,?,?,?,?,?,?,?,?)";						
		this.jdbcTemplate.update(sql, 
				vo.getUserId(),			//1 
				vo.getUserPassword(),	//2
				vo.getUserName(),		//3
				vo.getUserBirth(),		//4
				vo.getUserPhone(),		//5
				vo.getUserEmail(),		//6
				vo.getUserAddress(),	//7
				vo.getUserRegdate(),	//8
				vo.getUserGrade());		//9
	}
	
	/**
	 * 중복 사용자 체크, query로 검색
	 */
	public boolean duplicatedCheck(RegisterVO vo) {
		String sql = "SELECT count(*) FROM REGISTER_USER WHERE USERID = '" + vo.getUserId() + "'";
		int count = this.jdbcTemplate.queryForObject(sql, Integer.class);
		
		return count > 0;
	}
	
	public RegisterVO loginUserData(String userid) {
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
	
	//비밀번호 변경
	public void pwUpdate(String RePassword,String loginId) {
		String sql = "update REGISTER_USER set userPassword = ? where userId = ?";
		
		this.jdbcTemplate.update(sql,RePassword,loginId);
	}

	//유저정보 변경
	public void userUpdate(HttpServletRequest request,String userId) {
		String sql = "update REGISTER_USER set "
				+ "userBirth = ?, "
				+ "userPhone = ?, "
				+ "userEmail = ?, "
				+ "userAddress = ? "
				+ "where userId = ?";
		System.out.println(request.getParameter("userBirth"));
		System.out.println(request.getParameter("userPhone"));
		System.out.println(request.getParameter("userEmail"));
		System.out.println(request.getParameter("userAddress"));
		
		this.jdbcTemplate.update(sql,request.getParameter("userBirth")
									,request.getParameter("userPhone")
									,request.getParameter("userEmail")
									,request.getParameter("userAddress")
									,userId);
	}
	//로그인한 아이디의 등급을 가져옴
		public int getUserGrade(String id) {
			String sql = "select usergrade from REGISTER_USER where userid = ?";
			int result = jdbcTemplate.queryForObject(sql,Integer.class,id);
				
			return result;
		}
		
	//회원조회
		public List<RegisterVO> userList(String userId) {
			
			String sql = "SELECT USERCODE, USERID, USERNAME, USERPHONE, USERADDRESS, USERREGDATE, USERGRADE " +
						 "FROM REGISTER_USER " +
						 "WHERE USERID = ?";
			
			List<RegisterVO> userList = jdbcTemplate.query(sql, new RowMapper<RegisterVO>() {
				@Override
				public RegisterVO mapRow(ResultSet rs, int rowNum) throws SQLException{
					RegisterVO registerVO = new RegisterVO();
					registerVO.setUserCode(rs.getInt("userCode"));
					registerVO.setUserId(rs.getString("userId"));
					registerVO.setUserName(rs.getString("userName"));
					registerVO.setUserPhone(rs.getString("userPhone"));
					registerVO.setUserAddress(rs.getString("userAddress"));
					registerVO.setUserRegdate(rs.getTimestamp("userRegdate"));
					registerVO.setUserGrade(rs.getInt("userGrade"));
					return registerVO;
				}
			},userId);
			
			return userList;
		}
		
		//회원삭제
		public void userDelete(int userCode) {
			String sql = "DELETE FROM RESERVATION WHERE USERCODE = ?";
			this.jdbcTemplate.update(sql,
					userCode);
		}
	
}
