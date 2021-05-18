package controller;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import review.Pagination;
import review.ReviewDao;
import review.ReviewVO;

@Controller
public class MainController {
	
	@Autowired
	ReviewDao reviewDao;
	
	@Autowired
	Pagination pagination;
	
	@RequestMapping("/main/main")
	public String main(){
		return "main/main";
	}
	
	@RequestMapping("/main/map")
	public String map(){
		return "main/map";
	}
	
	@GetMapping("/main/DeluxeRoom")
	public String DeluxeRoom(HttpServletRequest request, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage){
		
		int total = 0;
		total = reviewDao.totalReview("Deluxe");
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "10";
		}
		
		pagination = new Pagination(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		
		// 호텔룸 평점
		double rating = reviewDao.reviewRating("Deluxe");
		
		// 댓글 리스트
		List<ReviewVO> results = reviewDao.pageLookup("Deluxe", pagination.getStart(), pagination.getEnd());
		model.addAttribute("reviewListAll", results);
		model.addAttribute("rating", rating);
		model.addAttribute("paging", pagination);
		return "main/DeluxeRoom";
	}
	
	@PostMapping("/main/DeluxeRoom")
	public String DeluxeRoom(HttpSession session, HttpServletRequest request, Model model){
		double rating = reviewDao.reviewRating(request.getParameter("Deluxe"));
		
		if(session.getAttribute("loginId") == null || session.getAttribute("loginId").equals("")) {
			return "redirect:/login/form";
		}
		
		// 입력생성자
		ReviewVO reviewVO = new ReviewVO(
				request.getParameter("Deluxe"),
				(String)session.getAttribute("loginId"), // 객체를 데이터타입으로 변경
				request.getParameter("reviewText"),
				new Timestamp(System.currentTimeMillis()),
				Integer.parseInt(request.getParameter("selectHeart")),
				"true" // 데이터를 다른 데이터타입으로 변경
				);

		reviewDao.reviewInsert(reviewVO);
		
		List<ReviewVO> results = reviewDao.reviewListAll("Deluxe");
		model.addAttribute("reviewListAll", results);
		model.addAttribute("rating", rating);
		return "redirect:/main/DeluxeRoom";
		
	}
	
	@RequestMapping("/main/dining")
	public String dining(){
		return "main/dining";
	}
	
	@GetMapping("/main/PrestigeRoom")
	public String PrestigeRoom(HttpServletRequest request, Model model, String room
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage){
		
		int total = reviewDao.totalReview("Prestigeroom");
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "10";
		}
		
		pagination = new Pagination(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		
		// 호텔룸 평점
//		double rating = reviewDao.reviewRating(request.getParameter("room"));
		double rating = reviewDao.reviewRating("Prestige");
		
		// 댓글 리스트
		List<ReviewVO> results = reviewDao.pageLookup("Prestige", pagination.getStart(), pagination.getEnd());
		model.addAttribute("reviewListAll", results);
		model.addAttribute("rating", rating);
		model.addAttribute("paging", pagination);
		return "main/PrestigeRoom";
	}
	
	@PostMapping("/main/PrestigeRoom")
	public String PrestigeRoom(HttpSession session, HttpServletRequest request, Model model){
		if(session.getAttribute("loginId") == null || session.getAttribute("loginId").equals("")) {
			return "redirect:/login/form";
		}
		

		double rating = reviewDao.reviewRating("Prestige");
		
		// 입력생성자
		ReviewVO reviewVO = new ReviewVO(
				request.getParameter("Prestige"),
				(String)session.getAttribute("loginId"), // 객체를 데이터타입으로 변경
				request.getParameter("reviewText"),
				new Timestamp(System.currentTimeMillis()),
				Integer.parseInt(request.getParameter("selectHeart")),
				"true" // 데이터를 다른 데이터타입으로 변경
				);

		reviewDao.reviewInsert(reviewVO);
		
		List<ReviewVO> results = reviewDao.reviewListAll("Prestige");
		model.addAttribute("reviewListAll", results);
		model.addAttribute("rating", rating);
		return "redirect:/main/PrestigeRoom";
	}
	
	@GetMapping("/main/SuiteRoom")
	public String SuiteRoom(HttpServletRequest request, Model model, String room
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage){

		int total = reviewDao.totalReview("Suite");
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "10";
		}
		
		pagination = new Pagination(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		
		// 호텔룸 평점
		double rating = reviewDao.reviewRating("Suite");
		
		// 댓글 리스트
		List<ReviewVO> results = reviewDao.pageLookup("Suite", pagination.getStart(), pagination.getEnd());
		model.addAttribute("reviewListAll", results);
		model.addAttribute("rating", rating);
		model.addAttribute("paging", pagination);
		return "main/SuiteRoom";
	}
	
	@PostMapping("/main/SuiteRoom")
	public String SuiteRoom(HttpSession session, HttpServletRequest request, Model model){
		double rating = reviewDao.reviewRating("Suite");
		
		if(session.getAttribute("loginId") == null || session.getAttribute("loginId").equals("")) {
			return "redirect:/login/form";
		}
		
		// 입력생성자
		ReviewVO reviewVO = new ReviewVO(
				request.getParameter("Suite"),
				(String)session.getAttribute("loginId"), // 객체를 데이터타입으로 변경
				request.getParameter("reviewText"),
				new Timestamp(System.currentTimeMillis()),
				Integer.parseInt(request.getParameter("selectHeart")),
				"true" // 데이터를 다른 데이터타입으로 변경
				);

		reviewDao.reviewInsert(reviewVO);
		
		List<ReviewVO> results = reviewDao.reviewListAll("Suite");
		model.addAttribute("reviewListAll", results);
		model.addAttribute("rating", rating);
		return "redirect:/main/SuiteRoom";
	}
	
	@GetMapping("/main/StandardRoom")
	public String StandardRoom(HttpServletRequest request, Model model, String room
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage){

		int total = reviewDao.totalReview("Standard");
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "10";
		}
		
		pagination = new Pagination(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		
		// 호텔룸 평점
		double rating = reviewDao.reviewRating("Standard");
		
		// 댓글 리스트
		List<ReviewVO> results = reviewDao.pageLookup("Standard", pagination.getStart(), pagination.getEnd());
		model.addAttribute("reviewListAll", results);
		model.addAttribute("rating", rating);
		model.addAttribute("paging", pagination);
		return "main/StandardRoom";
	}
	
	@PostMapping("/main/StandardRoom")
	public String StandardRoom(HttpSession session, HttpServletRequest request, Model model){
		double rating = reviewDao.reviewRating("Standard");
		
		if(session.getAttribute("loginId") == null || session.getAttribute("loginId").equals("")) {
			return "redirect:/login/form";
		}
		
		// 입력생성자
		ReviewVO reviewVO = new ReviewVO(
				request.getParameter("Standard"),
				(String)session.getAttribute("loginId"), // 객체를 데이터타입으로 변경
				request.getParameter("reviewText"),
				new Timestamp(System.currentTimeMillis()),
				Integer.parseInt(request.getParameter("selectHeart")),
				"true" // 데이터를 다른 데이터타입으로 변경
				);

		reviewDao.reviewInsert(reviewVO);
		
		List<ReviewVO> results = reviewDao.reviewListAll("Standard");
		model.addAttribute("reviewListAll", results);
		model.addAttribute("rating", rating);
		return "redirect:/main/StandardRoom";
	}
	
	@RequestMapping("/main/a")
	public String a(){
		return "main/a";
	}
	
	@RequestMapping("/main/facilities")
	public String facilities(){
		return "main/facilities";
	}
	
}
