package login;

import org.springframework.beans.factory.annotation.Autowired;

public class LoginVO {
	
	private String userId;			//유저아이디
	private String userPassword;	//유저비밀번호
	
	public void setLoginVO(String userId, String userPassword) {
		this.userId = userId;
		this.userPassword = userPassword;
	}
	
	@Autowired
	public LoginVO() {
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

}
