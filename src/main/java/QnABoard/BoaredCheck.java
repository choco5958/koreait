package QnABoard;

public class BoaredCheck {

	private String title;
	private String board;
	
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getBoard() {
		return board;
	}
	public void setBoard(String board) {
		this.board = board;
	}
	
	//들어온 모든 데이터가 있으면 true 없으면 false
	public Boolean check(String title, String board) {
		boolean check = false;
		
		//제목이 2글자 미만이면 false
		if(title.length() <= 2) {
			return check;
		}else if(board.length() <= 1) {
			return check;
		}else {
			//셋팅 값이 있으면  true
			check = true;
			return check; 
		}
		
	}
	
	//전체 데이터를 객체로 가져옴
//	public BoaredCheck getBoaredCheck(BoaredCheck boaredCheck) {
//		
//		return BoaredCheck;
//	}
}
