
package controller;
  
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import reservation.ReservationDao;
import reservation.ReservationVO;
  
@Controller
@RequestMapping("/reservation") 
public class ReservationController {
	private ReservationDao reservationDao;
  
  //Dao 메서드를 사용
  public ReservationController(ReservationDao reservationDao) {
	  this.reservationDao = reservationDao;
	}
  
  @RequestMapping("/reserve")
  public String reserve() {
	  return "reservation/reserve";
  }
  
  
  //스탠다드예약홈페이지  
  @RequestMapping("/reservationStandard") 
  public String reservationStandard(HttpSession session, Model model) {
	  
	// 로그인이 안되어 있으면 로그인 페이지로
	if (session.getAttribute("loginId") == null || session.getAttribute("loginId").equals("")) {
		return "redirect:/login/form";
	}	  
	  
	  String loginId = (String)session.getAttribute("loginId");
	  model.addAttribute("loginId", loginId);
	  
	  return "reservation/reservationStandard"; 
  }
  
  //디럭스예약홈페이지  
  @RequestMapping("/reservationDeluxe") 
  public String reservationDeluxe(HttpSession session, Model model) {
	  // 로그인이 안되어 있으면 로그인 페이지로
	  if (session.getAttribute("loginId") == null || session.getAttribute("loginId").equals("")) {
		  return "redirect:/login/form";
	  }	  
	  String loginId = (String)session.getAttribute("loginId");
	  model.addAttribute("loginId", loginId);
	  
	  return "reservation/reservationDeluxe"; 
  }
  
  //스위트예약홈페이지  
  @RequestMapping("/reservationSuite") 
  public String reservationSuite(HttpSession session, Model model) {
	  // 로그인이 안되어 있으면 로그인 페이지로
	  if (session.getAttribute("loginId") == null || session.getAttribute("loginId").equals("")) {
		  return "redirect:/login/form";
	  }	  
	  String loginId = (String)session.getAttribute("loginId");
	  model.addAttribute("loginId", loginId);
	  
	  return "reservation/reservationSuite"; 
  }
  
  //프레스티지예약홈페이지  
  @RequestMapping("/reservationPrestige") 
  public String reservationPrestige(HttpSession session, Model model) {
	  if (session.getAttribute("loginId") == null || session.getAttribute("loginId").equals("")) {
		  return "redirect:/login/form";
	  }	  
	  String loginId = (String)session.getAttribute("loginId");
	  model.addAttribute("loginId", loginId);
	  
	  return "reservation/reservationPrestige"; 
  } 
  
  //데이터삽입
  @RequestMapping("/test")
	public String test(HttpServletRequest request, HttpServletResponse response){
	  	
	  	String ruserId = request.getParameter("ruserId");
	  	
		String ruserName = request.getParameter("ruserName");
		
		String ruserPhone = request.getParameter("ruserPhone");
		
		int ruserCount = Integer.parseInt(request.getParameter("ruserCount"));
		
		Date checkIn = Date.valueOf(request.getParameter("checkIn"));
		Date checkOut = Date.valueOf(request.getParameter("checkOut"));
		
		String  roomType = request.getParameter("roomType"); 
		
		int ruserPrice = Integer.parseInt(request.getParameter("ruserPrice"));
		
		int roomGrade = Integer.parseInt(request.getParameter("roomGrade"));
		
		ReservationVO vo = new ReservationVO(ruserId, ruserName, ruserPhone, ruserCount, checkIn, checkOut, roomType, ruserPrice, roomGrade);
		
		//예약기간 중복체크
		if(reservationDao.duplicatedCheck(vo)) {
			response.setContentType("text/html; charset=utf-8");
			try {
			PrintWriter out = response.getWriter();
			out.println("<script>alert('이미 예약이 된 기간입니다.'); history.go(-1);</script>");
			out.flush();
			}catch (IOException e) {
				e.printStackTrace();
			}
		}
		 
		reservationDao.reservationInsert(vo);
		return "main/main";
		
	}
  
  //관리자 예약관리
  @RequestMapping("/reservationManager")
	public String reservationManager(HttpSession session, HttpServletResponse response, HttpServletRequest request, Model model, Date checkIn, Date checkOut) {
	  String loginId = (String) session.getAttribute("loginId");
	  
	  
	  // 로그인이 안되어 있으면 로그인 페이지로
	  if (session.getAttribute("loginId") == null || session.getAttribute("loginId").equals("")) {
		  return "redirect:/login/form";
		  } else {			  
			  int userGrade = reservationDao.getUserGrade(loginId);
			  
			  if (userGrade >= 3) {
				  
				  List<ReservationVO> reservationManager = reservationDao.reservationManager(checkIn, checkOut);
				  model.addAttribute("reservationManager",reservationManager);
				  return "reservation/reservationManager";
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
  
  	//예약조회
  	@RequestMapping("/reservationList")
	public String reservationList(HttpSession session, Model model) {
	  // 로그인이 안되어 있으면 로그인 페이지로
	  if (session.getAttribute("loginId") == null || session.getAttribute("loginId").equals("")) {
		  return "redirect:/login/form";
	  }	  
	  	String loginId = (String)session.getAttribute("loginId");	
	  	List<ReservationVO> reservationList = reservationDao.reservationList(loginId);
	  	model.addAttribute("reservationList",reservationList);
	  	
		return "reservation/reservationList";
	}
  		
  //회원예약삭제
  @RequestMapping("/reservationDelete")
  public String reservationDelete(HttpServletRequest request, HttpServletResponse response, Model model) {
	  int rNo = Integer.parseInt(request.getParameter("rNo"));
	  		
	  reservationDao.reservationDelete(rNo);
      return "redirect:/reservation/reservationList";
  }
  
  //관리자예약삭제
  @RequestMapping("/reservationMDelete")
  public String reservationMDelete(HttpServletRequest request, HttpServletResponse response, Model model) {
	  int rNo = Integer.parseInt(request.getParameter("rNo"));
	  		
	  reservationDao.reservationMDelete(rNo);
      return "redirect:/reservation/reservationManager";
  }
  
}
 