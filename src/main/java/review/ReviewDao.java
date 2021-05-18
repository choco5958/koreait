package review;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import org.apache.tomcat.jdbc.pool.DataSource;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import QnABoard.QnABoardVO;

public class ReviewDao {
	
	private JdbcTemplate jdbcTemplate;

	public ReviewDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	// 리뷰등록
	public void reviewInsert(ReviewVO reviewVO) {

		String sql = "insert into review values (review_seq.nextval,?,?,?,?,?,?)";
		this.jdbcTemplate.update(sql,
				reviewVO.getRoom(),
				reviewVO.getUserId(),
				reviewVO.getText(),
				reviewVO.getRegDate(),
				reviewVO.getRating(),
				reviewVO.getReviewdel()
				);

	}
	
	// 등록된 리뷰 업데이트
	public void reviewUpdate(String text) {

		String sql = "update review set text=?";
		this.jdbcTemplate.update(sql, text);

	}
	
	// 등록된 리뷰 삭제 : 실제삭제아님
	public void reviewDelete(String userid, int no) {

		String sql = "update review set reviewdel=false where userid=? and no=?";
		this.jdbcTemplate.update(sql, userid, no);

	}
	
	// 룸 평점
	public double reviewRating(String room) {

		String sql = "select round(sum(rating)/count(*),1) from review where room=?";
		double rating = 0;
		try {
			rating = this.jdbcTemplate.queryForObject(sql, Double.class, room);
		} catch (Exception e) {
			rating = 0;
		}

		return rating;

	}
	
	// 댓글 리스트
	public List<ReviewVO> reviewListAll(String room) {
		String sql = "select * from review where room=? and reviewdel='true' order by regdate desc";
		List<ReviewVO> results = jdbcTemplate.query(sql,new RowMapper<ReviewVO>() {
			@Override
			public ReviewVO mapRow(ResultSet rs, int rowNum) throws SQLException {
				ReviewVO reviewVO = new ReviewVO(
						rs.getString("room"),
						rs.getString("userId"),
						rs.getString("text"),
						rs.getTimestamp("regDate"),
						rs.getInt("rating"),
						rs.getString("reviewdel"));
				reviewVO.setNo(rs.getInt("no"));
				return reviewVO;
			}
		}, room);
		return results;
	}
	
	// 댓글 전체갯수
	public int totalReview(String room) {
		String sql = "select count(*) from review where room=?";
		int result = jdbcTemplate.queryForObject(sql,Integer.class,room);
		return result;
	}
	
	// 특정 범위 댓글 조회
	public List<ReviewVO> pageLookup(String room, int start, int end) {
		String sql = "select * from "
				+ "(select no, room, userid, text, regdate, rating, reviewdel, row_number() over(order by no desc) as rnum from review where room=?) re "
				+ "where rnum between ? and ? order by regdate desc";
		List<ReviewVO> results = jdbcTemplate.query(sql,new RowMapper<ReviewVO>() {
			@Override
			public ReviewVO mapRow(ResultSet rs, int rowNum) throws SQLException {
				ReviewVO reviewVO = new ReviewVO(
						rs.getString("room"),
						rs.getString("userId"),
						rs.getString("text"),
						rs.getTimestamp("regDate"),
						rs.getInt("rating"),
						rs.getString("reviewdel"));
				reviewVO.setNo(rs.getInt("no"));
				return reviewVO;
			}
		}, room, start, end);
		return results;
	}
	
}
