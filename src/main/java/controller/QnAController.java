package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import QnABoard.BoaredCheck;
import QnABoard.QnABoardDao;
import QnABoard.QnABoardVO;
import login.LoginDAO;

@Controller
@RequestMapping("/QnABoard")
public class QnAController {

	private QnABoardDao qnaBoardDao;

	// 생성자
	public QnAController(QnABoardDao qnaBoardDao) {
		this.qnaBoardDao = qnaBoardDao;
	}

	// 게시판 메인 이동
	@RequestMapping("/mainList")
	public String allList(Model model, HttpSession session) {

		List<QnABoardVO> managerList = qnaBoardDao.managerList(); // 게시판 공지사항 최신 5개 가져오기
//		List<QnABoardVO> managerList = null;
		List<QnABoardVO> allList = qnaBoardDao.AllList(); // 게시판 전체 리스트 가져오기

		
		model.addAttribute("managerList",managerList);
		model.addAttribute("allList",allList);
		return "QnABoard/mainList";
	}

	// 게시글 작성 페이지 이동
	@GetMapping("/write")
	public String writeGet(HttpSession session) {
		// 로그인한 아이디가 없다면 로그인 페이지
		String loginId = (String) session.getAttribute("loginId");
		if (loginId == null || loginId.equals("")) {
			return "redirect:/login/form";
			
		} else {
			return "QnABoard/write";
		}
	}

	// 답글 작성 페이지 이동
	@GetMapping("/rewrite")
	public String writePost(HttpSession session, Model model, HttpServletRequest request) {

		String loginId = (String) session.getAttribute("loginId");
		// 로그인한 아이디가 없다면 로그인 페이지
		if (loginId == null || loginId.equals("")) {
			return "login/loginView";
		} else {
			model.addAttribute("no", request.getParameter("no"));
			return "QnABoard/reWrite";
		}
	}

	// 본문 게시글 작성후 메인페이지로 이동
	@PostMapping("/refWrite")
	public String writePost(BoaredCheck boaredCheck, HttpServletRequest request, HttpSession session) {
		String id = (String) session.getAttribute("loginId"); // 세션 id 값을 가져옴
		String title = request.getParameter("title");
		String board = request.getParameter("board");

		boolean check = boaredCheck.check(title, board); // 게시판에 아무것도 작성하지 않았으면 false 리턴
		// 세션 id가 존재하고 check가 true라면 게시판에 글 등록
		if (id == null || id.equals("")) {
			return "redirect:mainList";// 로그인 페이지이동(미구현)
		} else if (check) {
			// 게시글 작성
			qnaBoardDao.qnaInsert(id, title, board);
			return "redirect:mainList";
		} else {
			JOptionPane.showMessageDialog(null, "제목 및 내용 형식에 맞게 입력하세요");
			return "QnABoard/write";
		}

	}

	// 답글 게시글 작성후 메인페이지로 이동
	@PostMapping("/stepWrite")
	public String stepWrite(BoaredCheck boaredCheck, HttpServletRequest request, HttpSession session) {

		// 로그인이 안되어 있으면 로그인 페이지로
		if (session.getAttribute("loginId") == null || session.getAttribute("loginId").equals("")) {
			return "redirect:/login/form";
		}

		String id = (String) session.getAttribute("loginId"); // 세션 id 값을 가져옴
		int no = Integer.parseInt(request.getParameter("no"));
		String title = "&nbsp;&nbsp;&nbsp;[답글]" + request.getParameter("title");
		String board = request.getParameter("board");

		boolean check = boaredCheck.check(title, board); // 게시판에 아무것도 작성하지 않았으면 false 리턴
		// 세션 id가 존재하고 check가 true라면 게시판에 글 등록
		if (id == null || id.equals("")) {
			return "login/loginView";// 로그인 페이지이동
		} else if (check) {
			// 게시글 작성
			qnaBoardDao.qnaStepInsert(id, title, board, no);
			return "redirect:mainList";
		} else {
			JOptionPane.showMessageDialog(null, "제목 및 내용 형식에 맞게 입력하세요");
			return "QnABoard/write";
		}

	}

	// 게시글 확인 전 비밀번호 입력 페이지 이동
	@GetMapping("/pwCheck")
	public String pwCheck(HttpSession session, HttpServletRequest request, String no, Model model) {
		int DBno = Integer.parseInt(no);
		String loginId = (String) session.getAttribute("loginId"); // 로그인 한 세션 아이디값 가져오기

		// 로그인한 아이디가 없다면 로그인 페이지로 이동
		if (loginId == null || loginId.equals("")) {
			return "redirect:/login/form";
		} else {
			int userGrade = qnaBoardDao.getUserGrade(loginId); // 해당 로그인한 아이디의 등급값을 가져옴
			String noId = qnaBoardDao.idCheck(DBno); // 게시글을 작성한 id가져옴

			// 매니저 이상 등급이면 비밀번호 없이 확인 가능
			if (userGrade >= 3) {
				List<QnABoardVO> qnaBoardVO = qnaBoardDao.qnaRead(DBno); // 게시글에 해당하는 내용을 가져옴
				model.addAttribute("qnaBoardVO", qnaBoardVO);
				model.addAttribute("grade", userGrade);
				return "QnABoard/readForm";
			} else if (loginId.equals(noId)) { // 로그인한 아이디와 작성자의 아이디가 일치하면
				model.addAttribute("checkId", noId);
				model.addAttribute("no", DBno);
				return "QnABoard/pwCheck";
			} else {
				JOptionPane.showMessageDialog(null, "본인 게시글만 확인 가능합니다.");
				return "redirect:mainList";
			}
		}

	}

	// 본인이 작성한 글 확인하려면 패스워드 입력
	@PostMapping("/pwCheck")
	public String pwCheckPost(HttpSession session, HttpServletRequest request, Model model) throws Exception {

		// 로그인이 안되어 있으면 로그인 페이지로
		if (session.getAttribute("loginId") == null || session.getAttribute("loginId").equals("")) {
			return "redirect:/login/form";
		}

		// 아이디가 회원정보에 존재하면 비밀번호를 가져옴
		String DBPassword = qnaBoardDao.DBpassword(request.getParameter("checkId"));

		// 입력 비밀번호와 db에 저장된 비밀번호가 같은 지 확인
		if (DBPassword.equals(request.getParameter("pw"))) {

			List<QnABoardVO> qnaBoardVO = qnaBoardDao.qnaRead(Integer.parseInt(request.getParameter("no"))); // 게시글 가져오기
			model.addAttribute("qnaBoardVO", qnaBoardVO);
			return "QnABoard/readForm";
		} else {
			return "QnABoard/pwCheck";
		}

	}

	// 공지 게시글 보기
	@GetMapping("/notice")
	public String pwCheck(Model model, String no) {

		int DBno = Integer.parseInt(no);

		List<QnABoardVO> qnaBoardVO = qnaBoardDao.qnaRead(DBno); // 게시글에 해당하는 내용을 가져옴
		model.addAttribute("qnaBoardVO", qnaBoardVO);
		model.addAttribute("notice", "1");
		return "QnABoard/readForm";

	}

	// 게시글 작성페이지 이동
	@PostMapping("/readForm")
	public String qna(HttpServletRequest request, HttpSession session, Model model) throws Exception {

		String loginId = (String) session.getAttribute("loginId"); // 로그인 한 세션 아이디값 가져오기

		// 로그인한 아이디가 없다면 로그인 페이지로 이동
		if (loginId == null || loginId.equals("")) {
			return "redirect:mainList";
		} else {
			// 해당 로그인한 아이디의 등급값을 가져옴
			int userGrade = qnaBoardDao.getUserGrade(loginId);

			// 해당 아이디의 등급이 (매니저)등급 이상이면 비밀번호 확인 없이 게시글 확인 가능
			if (userGrade >= 3) {
				return "QnABoard/readForm";
			}

			// 세션 id를 넣고 해당 db에 저장된 비밀번호 가져옴
			String dbPs = qnaBoardDao.DBpassword(request.getParameter("id"));

			// 비밀번호가 같은지 확인
			if (request.getParameter("pw").equals(dbPs)) {
				return "QnABoard/readForm";
			} else {
				model.addAttribute("pwCheck");
				return "redirect:/pwCheck";
			}
		}
	}

	// 게시판 수정창으로 이동
	@GetMapping("/writeUpdate")
	public String writerUpdate(HttpSession session, Model model, String no) {

		// 로그인이 안되어 있으면 로그인 페이지로
		if (session.getAttribute("loginId") == null || session.getAttribute("loginId").equals("")) {
			return "redirect:/login/form";
		}

		List<QnABoardVO> qnaBoardVO = qnaBoardDao.qnaRead(Integer.parseInt(no)); // 게시글에 해당하는 내용을 가져옴

		model.addAttribute("qnaBoardVO", qnaBoardVO);

		return "QnABoard/writeUpdate";

	}

	// 게시판 수정 진행
	@PostMapping("/writerUpdate")
	public String writerUpdatePost(HttpSession session, String no, String title, String board) {

		// 로그인이 안되어 있으면 로그인 페이지로
		if (session.getAttribute("loginId") == null || session.getAttribute("loginId").equals("")) {
			return "redirect:/login/form";
		}

		qnaBoardDao.qnaUpdate(Integer.parseInt(no), title, board);
		return "redirect:mainList";

	}
	
	// 게시글 삭제
	@RequestMapping("/deleteUpdate")
	public String deleteUpdate(HttpSession session, String no, String title, String board) {
		
		// 로그인이 안되어 있으면 로그인 페이지로
		if (session.getAttribute("loginId") == null || session.getAttribute("loginId").equals("")) {
			return "redirect:/login/form";
		}
		
		// 삭제 진행
		qnaBoardDao.deleteUpdate(Integer.parseInt(no), (String)session.getAttribute("loginId"));
		return "redirect:mainList";
		
	}

}
