package QnABoard;


import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;

public class QnABoardVO {
	
	private int no;				//게시글 번호
	private String id;			//유저
	private String title;		//제목
	private String board;		//본문
	private int ref;			//본문순서
	private int step;			//자식글(답글)
	private int AnswerNum;		//자식글 갯수
	private int ParontNum;		//부모글 갯수
	private Date r_date;	//글 작성 시간
	private String qna_delecte;	//글 삭제 여부

	//전체 데이터를 받아서 저장
	public void setQnABoardVO(int no,String id, String title, String board, int ref, int step, int answerNum,
			int parontNum, Date r_date , String qna_delecte ) {
		this.no     = no;
		this.id     = id;
		this.title  = title;
		this.board  = board;
		this.ref    = ref;
		this.step   = step;
		AnswerNum   = answerNum;
		ParontNum   = parontNum;
		this.r_date = r_date;
		this.qna_delecte = qna_delecte;
	}
	
	//기본 생성자
	@Autowired
	public QnABoardVO() {
	}
	
	public void setQnABoardVO( String title, String board) {
		this.title = title;
		this.board = board;
	}
	
	

	public int getNo() {
		return no;
	}

	public String getId() {
		return id;
	}


	public String getTitle() {
		return title;
	}


	public String getBoard() {
		return board;
	}


	public int getRef() {
		return ref;
	}


	public int getStep() {
		return step;
	}


	public int getAnswerNum() {
		return AnswerNum;
	}


	public int getParontNum() {
		return ParontNum;
	}


	public Date getR_date() {
		return r_date;
	}

	public void setR_date(Date r_date) {
		this.r_date = r_date;
	}

	public String getQna_delecte() {
		return qna_delecte;
	}

	
	
}
