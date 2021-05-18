package review;

import java.sql.Timestamp;

public class ReviewVO {
	
	private int no;
	private String room;
	private String userId;
	private String text;
	private Timestamp regDate;
	private int rating;
	private String reviewdel;
	
	public ReviewVO(String room, String userId, String text, Timestamp regDate, int rating, String reviewdel) {
		this.room = room;
		this.userId = userId;
		this.text = text;
		this.regDate = regDate;
		this.rating = rating;
		this.reviewdel = reviewdel;
	}
	
	public ReviewVO() {};
	
	public int getNo() {
		return no;
	}
	
	public void setNo(int no) {
		this.no = no;
	}
	
	public String getRoom() {
		return room;
	}
	public void setRoom(String room) {
		this.room = room;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	public String getReviewdel() {
		return reviewdel;
	}
	public void setReviewdel(String reviewdel) {
		this.reviewdel = reviewdel;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}

}
