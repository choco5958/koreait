package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import QnABoard.QnABoardDao;
import register.RegisterDao;
import register.RegisterVO;

@Controller
@RequestMapping("/register")
public class RegisterController {

	private RegisterDao registerDao;
	
	@Autowired
	private QnABoardDao qnABoardDao;

	// Dao 메서드를 사용
	public RegisterController(RegisterDao registerDao) {
		this.registerDao = registerDao;
	}

	// 약관동의
	@RequestMapping("/registerAgree")
	public String registerAgree() {
		return "register/registerAgree";
	}

	// 개인회원 or 사업자회원 선택
	@RequestMapping("/registerSelect")
	public String registerSelect() {
		return "register/registerSelect";
	}

	// 개인회원가입 페이지
	@RequestMapping("/register")
	public String register() {
		return "register/register";
	}

	// 사업자회원가입 페이지
	@RequestMapping("/registerBusiness")
	public String registerBusiness() {
		return "register/registerBusiness";
	}

	// 풋터페이지
	@RequestMapping("/footer")
	public String footer() {
		return "register/footer";
	}

	/**
	 * 
	 * @author CHOCO
	 * @param request : 회원 가입 페이지로부터 받아온 정보
	 * @return
	 */
	@RequestMapping("/test")
	public String test(HttpServletRequest request, HttpServletResponse response) {
		String userId = request.getParameter("userId");
		String userPassword = request.getParameter("userPassword");
		String userName = request.getParameter("userName");
		String userBirth = request.getParameter("userBirth");
		String userPhone = request.getParameter("userPhone");
		String userEmail = request.getParameter("userEmail");
		String userAddress = request.getParameter("userAddress");
		Timestamp userRegdate = new Timestamp(System.currentTimeMillis());

		int userGrade = Integer.parseInt(request.getParameter("userGrade"));
		RegisterVO vo = new RegisterVO(userId, userPassword, userName, userBirth, userPhone, userEmail, userAddress,
				userRegdate, userGrade);

		// 아이디 중복체크
		if (registerDao.duplicatedCheck(vo)) {
			response.setContentType("text/html; charset=utf-8");
			try {
				PrintWriter out = response.getWriter();
				out.println("<script>alert('아이디를 이미 사용중입니다.'); history.go(-1);</script>");
				out.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		registerDao.userInsert(vo);
		return "main/main";

	}

	// 회원 정보 수정페이지 이동
	@RequestMapping("/information")
	public String information(HttpSession session,Model model) {
		
		// 로그인이 안되어 있으면 로그인 페이지로
		if (session.getAttribute("loginId") == null || session.getAttribute("loginId").equals("")) {
			return "redirect:/login/form";
		}
		
		//로그인한 아이디에 대한 유저 정보를 가져옴
		RegisterVO updateUser = registerDao.loginUserData((String)session.getAttribute("loginId"));
		
		if(updateUser != null) {
			model.addAttribute("loginUser", updateUser);
			return "register/information";
		}else {
			return "redirect:main/main";
			
		}

	}
	
	//회원정보 수정
	@PostMapping("/userUpdate")
	public String userUpdate(HttpServletRequest request, Model model,HttpSession session) {
	
		// 로그인이 안되어 있으면 로그인 페이지로
		if (session.getAttribute("loginId") == null || session.getAttribute("loginId").equals("")) {
			return "redirect:/login/form";
		}
		
		String DBpassword = null;
		
		//아이디에 대한 비밀번호를 가져옴
		try {
			DBpassword = qnABoardDao.DBpassword((String)session.getAttribute("loginId"));
		} catch (Exception e) {
			return "redirect:/login/form";
		}
		
		if(DBpassword.equals(request.getParameter("userPassword"))) {
			registerDao.userUpdate(request,(String)session.getAttribute("loginId"));
			model.addAttribute("updateResert",true);
			return "register/userResult";
		}
		
		model.addAttribute("updateResert",false);
		return "register/userResult";
	}

	@GetMapping("/pwChangeForm")
	public String pwChangeForm(HttpServletRequest request, Model model,HttpSession session) {
		
		// 로그인이 안되어 있으면 로그인 페이지로
		if (session.getAttribute("loginId") == null || session.getAttribute("loginId").equals("")) {
			return "redirect:/login/form";
		}
		
		return "register/pwChange";
	}
	
	@PostMapping("/pwChange")
	public String pwChange(HttpServletRequest request, Model model,HttpSession session) {
		
		String DBpassword = null;
		// 로그인이 안되어 있으면 로그인 페이지로
		if (session.getAttribute("loginId") == null || session.getAttribute("loginId").equals("")) {
			return "redirect:/login/form";
		}
		
		try {
			//아이디를에 대한 비밀번호를 가져옴
			DBpassword = qnABoardDao.DBpassword((String)session.getAttribute("loginId"));
		} catch (Exception e) {
			System.out.println("가져올 비밀번호가 없습니다.");
			return "redirect:/login/form";
		}
		//입력한 비밀번호와 db에 저장된 비밇번호 확인
		if(request.getParameter("userPassword").equals(DBpassword)) {
			//바꿀 비밀번호를 같게 입력했다면 변경
			if(request.getParameter("ChangePw").equals(request.getParameter("RePassword"))) {
				//비밀번호 변경
				registerDao.pwUpdate(request.getParameter("RePassword"), (String)session.getAttribute("loginId"));
				model.addAttribute("updateResert",true);
				return "register/pwResult";
			}else {
				model.addAttribute("updateResert",false);
				return "register/pwResult";
			}
		}else {
			model.addAttribute("updateResert",false);
			return "register/pwResult";
		}
	}
	
	
	 //전체회원조회
	  @RequestMapping("/userList")
		public String userList(HttpSession session, HttpServletResponse response, HttpServletRequest request, Model model, String userId) {
		  String loginId = (String) session.getAttribute("loginId");
		  
		  
		  // 로그인이 안되어 있으면 로그인 페이지로
		  if (session.getAttribute("loginId") == null || session.getAttribute("loginId").equals("")) {
			  return "redirect:/login/form";
			  } else {			  
				  int userGrade = registerDao.getUserGrade(loginId);
				  
				  if (userGrade >= 3) {
					  List<RegisterVO> userList = registerDao.userList(userId);
					  model.addAttribute("userList",userList);
					  return "register/userList";
					  } else {
						  response.setContentType("text/html; charset=utf-8");
						  try {
							  PrintWriter out = response.getWriter();
							  out.println("<script>alert('관리자만 접근 가능합니다.');</script>");
							  out.flush();
							  }catch (IOException e) {
								  e.printStackTrace();
								  }
						  return "main/main";
						  }
				  }
		  }
  		
  //회원삭제
  @RequestMapping("/userDelete")
  public String userDelete(HttpServletRequest request, HttpServletResponse response, Model model) {
	  int userCode = Integer.parseInt(request.getParameter("userCode"));
	  		
	  registerDao.userDelete(userCode);
      return "redirect:/register/userList";
  }
}
