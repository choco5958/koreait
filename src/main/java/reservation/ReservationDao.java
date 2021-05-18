package reservation;


import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.apache.tomcat.jdbc.pool.DataSource;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

public class ReservationDao {
	
private JdbcTemplate jdbcTemplate;


	public ReservationDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
		
	//예약하기	
	public void reservationInsert(ReservationVO vo) {		
		if(duplicatedCheck(vo)==false) {
		String sql = "insert into RESERVATION values(reservation_seq.nextval,?,?,?,?,?,?,?,?,?)";
		this.jdbcTemplate.update(sql,
				vo.getRuserId(),
				vo.getRuserName(),
				vo.getRuserPhone(),
				vo.getRuserCount(),
				vo.getCheckIn(),
				vo.getCheckOut(),
				vo.getRoomType(),
				vo.getRuserPrice(),
				vo.getRoomGrade());
				
		}
	}
	
	/**
	 * 예약기간 중복 체크, query로 검색
	 */
	public boolean duplicatedCheck(ReservationVO vo) {
		String sql =
				"SELECT count(*) " +
				"FROM RESERVATION " +
				"WHERE CHECKIN <=  '" + vo.getCheckOut() + "' AND CHECKOUT >= '" + vo.getCheckIn() + "' AND ROOMGRADE = '" + vo.getRoomGrade() +"'";
		
		int count = this.jdbcTemplate.queryForObject(sql, Integer.class);
	
		return count > 0;
	}
	
	//예약조회
	public List<ReservationVO> reservationList(String loginId) {
		
		String sql = "SELECT RNO, RUSERID, RUSERNAME, RUSERPHONE, RUSERCOUNT, CHECKIN, CHECKOUT, ROOMTYPE, RUSERPRICE " +
				"FROM RESERVATION " +
				"WHERE RUSERID = ? AND CHECKIN > to_char(sysdate - 1, 'yyyy-mm-dd') ORDER BY RNO DESC";
		
		List<ReservationVO> reservationList = jdbcTemplate.query(sql, new RowMapper<ReservationVO>() {
			@Override
			public ReservationVO mapRow(ResultSet rs, int rowNum) throws SQLException{
				ReservationVO reservationVO = new ReservationVO();
				reservationVO.setrNo(rs.getInt("rNo"));
				reservationVO.setRuserId(rs.getString("ruserId"));
				reservationVO.setRuserName(rs.getString("ruserName"));
				reservationVO.setRuserPhone(rs.getString("ruserPhone"));
				reservationVO.setRuserCount(rs.getInt("ruserCount"));
				reservationVO.setCheckIn(rs.getDate("checkIn"));
				reservationVO.setCheckOut(rs.getDate("checkOut"));
				reservationVO.setRoomType(rs.getString("roomType"));
				reservationVO.setRuserPrice(rs.getInt("ruserPrice"));
				return reservationVO;
			}
		}
		,loginId
				);
		
		return reservationList;
	}
	
	//예약삭제
	public void reservationDelete(int rNo) {
		String sql = "DELETE FROM RESERVATION WHERE RNO = ?";
		this.jdbcTemplate.update(sql,
				rNo);
	}
	
	//관리자 예약관리
	public List<ReservationVO> reservationManager(Date checkIn, Date checkOut) {
			
		String sql = "SELECT RNO, RUSERID, RUSERNAME, RUSERPHONE, RUSERCOUNT, CHECKIN, CHECKOUT, ROOMTYPE, RUSERPRICE " +
				 "FROM RESERVATION WHERE CHECKIN > to_char(sysdate - 1, 'yyyy-mm-dd') AND ? <= CHECKIN AND ? >= CHECKIN ORDER BY RNO DESC";
			
		List<ReservationVO> reservationManager = jdbcTemplate.query(sql, new RowMapper<ReservationVO>() {
			@Override
			public ReservationVO mapRow(ResultSet rs, int rowNum) throws SQLException{
				ReservationVO reservationVO = new ReservationVO();
				reservationVO.setrNo(rs.getInt("rNo"));
				reservationVO.setRuserId(rs.getString("ruserId"));
				reservationVO.setRuserName(rs.getString("ruserName"));
				reservationVO.setRuserPhone(rs.getString("ruserPhone"));
				reservationVO.setRuserCount(rs.getInt("ruserCount"));
				reservationVO.setCheckIn(rs.getDate("checkIn"));
				reservationVO.setCheckOut(rs.getDate("checkOut"));
				reservationVO.setRoomType(rs.getString("roomType"));
				reservationVO.setRuserPrice(rs.getInt("ruserPrice"));
				return reservationVO;
				}
			},checkIn,checkOut);	
			return reservationManager;
		}
	
	//관리자예약삭제
	public void reservationMDelete(int rNo) {
		String sql = "DELETE FROM RESERVATION WHERE RNO = ?";
		this.jdbcTemplate.update(sql,
				rNo);
			}
	
	//로그인한 아이디의 등급을 가져옴
	public int getUserGrade(String id) {
		String sql = "select usergrade from REGISTER_USER where userid = ?";
		int result = jdbcTemplate.queryForObject(sql,Integer.class,id);
			
		return result;
	}

	
	
}