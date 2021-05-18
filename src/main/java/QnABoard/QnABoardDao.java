package QnABoard;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import org.apache.tomcat.jdbc.pool.DataSource;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

public class QnABoardDao {
	
	private JdbcTemplate jdbcTemplate;
	
	public QnABoardDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	//게시판 유저글 전체 목록 가져오기(미완성 계층형으로 구현해야함 order by)
	public List<QnABoardVO> AllList(){
		String sql = "SELECT a.* FROM QNABOARD a , REGISTER_USER u WHERE a.id = u.userid AND u.USERGRADE < 4 and qna_delete ='true' ORDER BY REF DESC , STEP ASC ";

		List<QnABoardVO> result = jdbcTemplate.query(sql,new RowMapper<QnABoardVO>() {
			@Override
			public QnABoardVO mapRow(ResultSet rs,int rowNum) throws SQLException {
				QnABoardVO qnaBoardVO = new QnABoardVO();
				qnaBoardVO.setQnABoardVO(	
						rs.getInt("no"), 
						rs.getString("id"), 
						rs.getString("title"), 
						rs.getString("board"), 
						rs.getInt("ref"), 
						rs.getInt("step"), 
						rs.getInt("answerNum"), 
						rs.getInt("parontNum"), 
						rs.getDate("r_date"),
						rs.getString("qna_delete"));
				return qnaBoardVO;
			}
		});
		return result;
	}
	
	//게시판 관리자글(공지사항) 최근 5개 목록 가져오기
	public List<QnABoardVO> managerList(){
		String sql = "SELECT a.* FROM QNABOARD a , REGISTER_USER u WHERE a.id = u.userid AND u.USERGRADE > 3 AND rownum <= 5 and qna_delete ='true' ORDER BY R_DATE DESC";
		
		List<QnABoardVO> result = jdbcTemplate.query(sql,new RowMapper<QnABoardVO>() {
			@Override
			public QnABoardVO mapRow(ResultSet rs,int rowNum) throws SQLException {
				QnABoardVO qnaBoardVO = new QnABoardVO();
				qnaBoardVO.setQnABoardVO(
						rs.getInt("no"), 
						rs.getString("id"), 
						rs.getString("title"), 
						rs.getString("board"), 
						rs.getInt("ref"), 
						rs.getInt("step"), 
						rs.getInt("answerNum"), 
						rs.getInt("parontNum"), 
						rs.getDate("r_date"),
						rs.getString("qna_delete"));
				return qnaBoardVO;
			}
		});
		
		return result;
	}
	
	//게시판 매니저글(공지사항) 전체 목록 가져오기
	public List<QnABoardVO> managerAllList(){
		String sql = "SELECT a.* FROM QNABOARD a , REGISTER_USER u WHERE a.id = u.userid AND u.USERGRADE > 3 and qna_delete ='true' ORDER BY R_DATE DESC";
		
		List<QnABoardVO> result = jdbcTemplate.query(sql,new RowMapper<QnABoardVO>() {
			@Override
			public QnABoardVO mapRow(ResultSet rs,int rowNum) throws SQLException {
				QnABoardVO qnaBoardVO = new QnABoardVO();
				qnaBoardVO.setQnABoardVO(
						rs.getInt("no"), 
						rs.getString("id"), 
						rs.getString("title"), 
						rs.getString("board"), 
						rs.getInt("ref"), 
						rs.getInt("step"), 
						rs.getInt("answerNum"), 
						rs.getInt("parontNum"), 
						rs.getDate("r_date"),
						rs.getString("qna_delecte"));
				return qnaBoardVO;
			}
		});
		
		return result;
	}
	
	//아이디를 받아서 비밀번호를 가져옴 
	public String DBpassword(String id) throws Exception{
		//join을 통해 REGISTER_USER 테이블에서 비밀번호 값 받아오기
		String sql = "SELECT userPassword FROM REGISTER_USER WHERE USERID = ?";
		
		String result = jdbcTemplate.queryForObject(sql,String.class,id);
		
		return result;
		
	}
	
	
	//게시판에 글 등록
	public void qnaInsert(String id,String title,String board) {
		String sql = "insert into qnaboard values(seq_qna.nextval,?,?,?,?,?,?,?,?,?)";
		Date date = new Date();
		System.out.println(date);
		
		this.jdbcTemplate.update(sql, 
				id, 			//로그인한 아이디
				title,			//제목
				board,			//입력값
				userGrade(),	//ref max+1 값(본문 글 갯수)
				0,				//step (답글 여부)
				0,				//AnswerNum (본문글의 자식글 갯수)
				0,				//ParontNum	(본문글 갯수)
				date,			//등록한 시간
				"true"			//게시글 삭제 여부
				);
	}
	
	//게시판에 답글 등록
	public void qnaStepInsert(String id,String title,String board,int no) {
		String sql = "insert into qnaboard values(seq_qna.nextval,?,?,?,?,?,?,?,?,?)";
		Timestamp time = new Timestamp(System.currentTimeMillis());
		this.jdbcTemplate.update(sql, 
				id, 			//로그인한 아이디
				title,			//제목
				board,			//입력값
				selectRef(no),	//답글달 ref값
				maxStep(no),	//step (답글 여부)
				maxStep(no),				//AnswerNum (본문글의 자식글 갯수)
				0,				//ParontNum	(본문글 갯수)
				time,			//등록한 시간
				"true"			//게시글 삭제 여부
				);
	}

	//게시판에 글 수정
	public void qnaUpdate(int no,String title,String board) {
		String sql = "update QNABOARD set title=? , board=? where no = ?";
		
		this.jdbcTemplate.update(sql, title, board, no);
	}
	
	//게시판 글 삭제
	public void deleteUpdate(int no,String id) {
		
		String idCheck = idCheck(no);
		
		//로그인 아이디와 글 작성자의 아이디가 같으면 삭제
		if(idCheck.equals(id)) {
			System.out.println(idCheck + "    "+ no + "   " + id);
			String sql = "update QNABOARD set QNA_DELETE = 'false' where ref = ?";
			this.jdbcTemplate.update(sql, selectRef(no));
		}
	}
	
	//선택한 게시판글 보기
	public List<QnABoardVO> qnaRead(int no) {
		String sql = "select * from QNABOARD where no = ? and qna_delete ='true'";
		
		List<QnABoardVO> result = jdbcTemplate.query(sql,new RowMapper<QnABoardVO>() {
			@Override
			public QnABoardVO mapRow(ResultSet rs,int rowNum) throws SQLException {
				QnABoardVO qnaBoardVO = new QnABoardVO();
				qnaBoardVO.setQnABoardVO(
						rs.getInt("no"), 
						rs.getString("id"), 
						rs.getString("title"), 
						rs.getString("board"), 
						rs.getInt("ref"), 
						rs.getInt("step"), 
						rs.getInt("answerNum"), 
						rs.getInt("parontNum"), 
						rs.getDate("r_date"),
						rs.getString("qna_delete"));
				return qnaBoardVO;
			}
		},no);
		return result;
	}

	//게시글 no값 받아서 해당 아이디를 가져옴
	public String idCheck(int no){
		
		String sql = "SELECT id FROM QNABOARD where no = ?";
		String result = jdbcTemplate.queryForObject(sql,String.class,no);
		
		return result;
	}
	
	// 게시판 ref max+1 값 가져오기
	public int userGrade() {
		String sql = "select max(ref+1) from qnaboard";
		int result = jdbcTemplate.queryForObject(sql,Integer.class);
		
		return result;
	}
	
	//게시판현재글 ref값 가져오기 (게시판 부모글 작성시 사용)
	public int selectRef(int no) {
		String sql = "select ref from qnaboard where no = ?";
		int result = jdbcTemplate.queryForObject(sql,Integer.class,no);
		 
		return result;
	}
	
	//게시판현재 ref(부모 게시글) max +1 값 가져오기 (게시판 부모글 작성시 사용)
	public int maxRef() {
		String sql = "select max(ref+1) from qnaboard";
		int result = jdbcTemplate.queryForObject(sql,Integer.class);
		
		return result;
	}

	//게시판현재 step(자식 게시글) max +1 값 가져오기(답글 들여쓰기 용도)
	public int maxStep(int no) {
		int ref = selectRef(no);
		String sql = "select max(step+1) from qnaboard where ref = ? ";
		int result = jdbcTemplate.queryForObject(sql,Integer.class,ref);
		
		return result;
	}
	
	//로그인한 아이디의 등급을 가져옴
	public int getUserGrade(String id) {
		String sql = "select usergrade from REGISTER_USER where userid = ?";
		int result = jdbcTemplate.queryForObject(sql,Integer.class,id);
		
		return result;
	}

}
