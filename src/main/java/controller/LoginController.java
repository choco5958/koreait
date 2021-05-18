package controller;

import java.io.IOException;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import QnABoard.QnABoardDao;
import login.LoginDAO;
import login.LoginVO;
import register.RegisterDao;
import register.RegisterVO;

@Controller
@RequestMapping("/login")
public class LoginController {
	
	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	private LoginDAO loginDAO;
	
	@Autowired
	private RegisterDao registerDao;
	
	@Autowired
	private QnABoardDao qnABoardDao;

	LoginVO vo = new LoginVO();

	// 로그아웃 세션끊기
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "main/main";
	}
	
	@GetMapping("/findPassword")
	public String forgotGetPW() {
		return "login/forgotPassword";
	}
	
	// 비밀번호 찾기
	@PostMapping("/findPassword")
	public String forgotPW(HttpServletRequest request, Model model) throws AddressException, MessagingException{
		
		// 입력값 받아오기
		String f_id = request.getParameter("f_id");
		String f_email = request.getParameter("f_email");
		String f_name = request.getParameter("f_name");
		
		// 들어오는 값 확인
		System.out.println(f_id);
		System.out.println(f_email);
		System.out.println(f_name);
		
		// LoginDAO의 selectUser 쿼리문 results 값 불러옴
		RegisterVO results = loginDAO.selectUser(f_id);
		
		// 쿼리문에서 도출된 회원과 입력값의 일치여부 확인
		if(!(results!=null && f_email.equals(results.getUserEmail()) && f_name.equals(results.getUserName()))) {
			System.out.println("일치하는 회원정보가 없습니다.");
			return "login/forgotPassword";
			
		} else {
			System.out.println("일치하는 회원정보를 찾았습니다.");
			
			// 임시 비밀번호 생성
			StringBuilder sb = new StringBuilder();
			Random rnd = new Random();
			for(int i=0; i<4; i++) {
				sb.append((char)(rnd.nextInt(26)+'A')+""); // 대문자
				sb.append((char)(rnd.nextInt(26)+'a')+""); // 소문자
				sb.append((char)(rnd.nextInt(10)+'0')+""); // 숫자
			}
			final String RePassword = sb.toString();
			
			// 임시 비밀번호로 DB 업데이트 ------ test 완료
			registerDao.pwUpdate(RePassword, results.getUserId());
			
			// viewPassword 페이지로 이름값 넘기기
			model.addAttribute("f_name", f_name);
			model.addAttribute("f_email", f_email);
			
			// 메일 발송 ------ test 완료
			String subject = "임시 비밀번호를 알려드립니다."; // 메일 제목
	        String content = "반갑습니다. " // 메일 내용
	        				 + f_name + "님 \n" + "임시 비밀번호는 "+ RePassword +"입니다. \n "
	        				 + "로그인 후 반드시 비밀번호를 변경해주세요.";
	        String from = "The_White_Hotel <cocu7710@gmail.com>"; // 관리자 이름, 관리자 이메일
	        String to = f_email; // 받는 사람 이메일
	        
	        try {
	        	MimeMessage mail = mailSender.createMimeMessage();
	        	MimeMessageHelper mailHelper = new MimeMessageHelper(mail,"UTF-8"); // 텍스트만 전송
	        	
	        	mailHelper.setFrom(from);
	        	mailHelper.setTo(to);
	        	mailHelper.setSubject(subject);
	        	mailHelper.setText(content);
	        	
	        	mailSender.send(mail);
	        	
	        } catch(Exception e) {
	        	e.printStackTrace();
	        }
			
		}
		return "login/bootLogin";
	}

	// 로그인폼 이동
	@GetMapping("/form")
	public String test() {
		return "login/bootLogin";
	}

	@PostMapping("/submit")
	public String submit(HttpSession session, HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("1234");

		// 로그인한 아이디와 비밀번호 정보를 가져온다.
		String id = request.getParameter("id");
		String pw = request.getParameter("password");

		System.out.println(id);
		System.out.println(pw);

		// LoginDAO의 selectUser 쿼리문 results 값 불러옴
		RegisterVO results = loginDAO.selectUser(id);

		// 체크박스
		boolean checkbox = false;
		checkbox = Boolean.parseBoolean(request.getParameter("checkbox"));
		System.out.println(checkbox);

		// 유저 유무확인
		if (results == null) {
			System.out.println("no id");
			return "login/bootLogin";

		} else {
			if (!pw.equals(results.getUserPassword())) { // 비밀번호 일치 여부확인
				System.out.println(results.getUserPassword());
				return "login/bootLogin";

			} else if (checkbox) { // 체크박스에 체크가 되어있다면

				Cookie reCookie = new Cookie("rememberID", id);
				reCookie.setPath("/");
				reCookie.setMaxAge(60 * 60 * 24 * 30);
				System.out.println("login success plus cookie");

				// 쿠키값 저장
				response.addCookie(reCookie);
				System.out.println(reCookie);

			} else { // 체크박스에 체크가 해제되어있다면

				Cookie reCookie = new Cookie("rememberID", id);
				reCookie.setPath("/");
				reCookie.setMaxAge(0);
				System.out.println("cookie delete");

				// 쿠키값 저장
				response.addCookie(reCookie);
				System.out.println(reCookie);

			}
			// 로그인 성공

			int userGrade = qnABoardDao.getUserGrade(id);
			
			
			session.setAttribute("userGrade", userGrade);
			session.setAttribute("loginId", id);
			return "/main/main";
			
		}

	}

	// 1 컨틀롤러 메서드 하나 더 구현
	// 2 메서드는 아이디 패스워드가 맞는지 확인하여 데이터를 받아옴
	// if문 사용하서 받아온 값이 treu이면 로그인(세션에 데이터를 입력 시키고 loginId) 메인 홈페이지로 이동
	// false면 경고창 내서 틀렷다고 하고 현재페이지를 다시 보여줌

	// login 파라미터로 id pw를 받아와서 id에 해당하는 데이터가 db에 있는지 확인하고
	// 그 db에 있는 아이디에대한 pw를 가져와서 입력한 패스워드랑 비교후 맞으면 true 틀리면 false 리턴

}