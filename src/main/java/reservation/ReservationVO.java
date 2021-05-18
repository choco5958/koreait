package reservation;

import java.util.Date;

public class ReservationVO {
	private int rNo;
	private String ruserId;
	private String ruserName;
	private String ruserPhone;
	private int ruserCount;
	private Date checkIn;
	private Date checkOut;	
	private String roomType;
	private int ruserPrice;
	private int roomGrade;
	
	public ReservationVO(String ruserId, String ruserName, String ruserPhone, int ruserCount, Date checkIn, 
			Date checkOut, String roomType, int ruserPrice, int roomGrade) {
		this.ruserId = ruserId;
		this.ruserName = ruserName;
		this.ruserPhone = ruserPhone;
		this.ruserCount = ruserCount;
		this.checkIn = checkIn;
		this.checkOut = checkOut;
		this.roomType = roomType;
		this.ruserPrice = ruserPrice;
		this.roomGrade = roomGrade;
	}
	
	public ReservationVO() {
	}
	
	public int getrNo() {
		return rNo;
	}

	public void setrNo(int rNo) {
		this.rNo = rNo;
	}

	public String getRuserId() {
		return ruserId;
	}

	public void setRuserId(String ruserId) {
		this.ruserId = ruserId;
	}

	public String getRuserName() {
		return ruserName;
	}

	public void setRuserName(String ruserName) {
		this.ruserName = ruserName;
	}

	public String getRuserPhone() {
		return ruserPhone;
	}

	public void setRuserPhone(String ruserPhone) {
		this.ruserPhone = ruserPhone;
	}

	public int getRuserCount() {
		return ruserCount;
	}

	public void setRuserCount(int ruserCount) {
		this.ruserCount = ruserCount;
	}

	public Date getCheckIn() {
		return checkIn;
	}

	public void setCheckIn(Date checkIn) {
		this.checkIn = checkIn;
	}

	public Date getCheckOut() {
		return checkOut;
	}

	public void setCheckOut(Date checkOut) {
		this.checkOut = checkOut;
	}

	public String getRoomType() {
		return roomType;
	}

	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}

	public int getRuserPrice() {
		return ruserPrice;
	}

	public void setRuserPrice(int ruserPrice) {
		this.ruserPrice = ruserPrice;
	}

	public int getRoomGrade() {
		return roomGrade;
	}

	public void setRoomGrade(int roomGrade) {
		this.roomGrade = roomGrade;
	}
	
}
 