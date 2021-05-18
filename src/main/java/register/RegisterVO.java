package register;

import java.sql.Timestamp;

public class RegisterVO {
	private int userCode;			//유저코드
	private String userId;			//유저아이디
	private String userPassword;	//유저비밀번호
	private String userName;		//유저이름
	private String userBirth;		//유저생일
	private String userPhone;		//유저핸드폰번호
	private String userEmail;		//유저이메일 
	private String userAddress;		//유저주소
	private Timestamp userRegdate;	//유저가입일시
	private int userGrade; 			//유저등급
	
	public RegisterVO(String userId, String userPassword, String userName, String userBirth, 
			String userPhone, String userEmail, String userAddress, Timestamp userRegdate, int userGrade) {
		this.userId = userId;
		this.userPassword = userPassword;
		this.userName = userName;
		this.userBirth = userBirth;
		this.userPhone = userPhone;
		this.userEmail = userEmail;
		this.userAddress = userAddress;
		this.userRegdate = userRegdate;
		this.userGrade = userGrade;
	}

	public RegisterVO() {
		// TODO Auto-generated constructor stub
	}

	public int getUserCode() {
		return userCode;
	}

	public void setUserCode(int userCode) {
		this.userCode = userCode;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserBirth() {
		return userBirth;
	}

	public void setUserBirth(String userBirth) {
		this.userBirth = userBirth;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public Timestamp getUserRegdate() {
		return userRegdate;
	}

	public void setUserRegdate(Timestamp userRegdate) {
		this.userRegdate = userRegdate;
	}

	public int getUserGrade() {
		return userGrade;
	}

	public void setUserGrade(int userGrade) {
		this.userGrade = userGrade;
	}

}
