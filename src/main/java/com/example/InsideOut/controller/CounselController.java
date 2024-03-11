package com.example.InsideOut.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.InsideOut.auth.PrincipalDetails;
import com.example.InsideOut.model.BoardBean;
import com.example.InsideOut.model.CounselBookingBean;
import com.example.InsideOut.model.CounselRecordBean;
import com.example.InsideOut.model.CounselTypeBean;
import com.example.InsideOut.model.StaffBean;
import com.example.InsideOut.model.SurveyBean;
import com.example.InsideOut.service.BoardService;
import com.example.InsideOut.service.CounselService;
import com.example.InsideOut.service.MemberServiceImpl;
import com.example.InsideOut.service.StaffService;
import com.example.InsideOut.service.SurveyService;

@RequestMapping("api/v1")
@Controller
public class CounselController {

	@Autowired
	private CounselService counselService;
	@Autowired
	private StaffService staffService;
	@Autowired
	private SurveyService surveyService;
	@Autowired
	private BoardService boardService;
	@Autowired
	private MemberServiceImpl memberService;

	// 상담 종류 선택
	@RequestMapping("student/counselType")
	public String counselType(Authentication authentication, Model model) throws Exception {

		PrincipalDetails principalDetailis = (PrincipalDetails) authentication.getPrincipal();
		String student_no = principalDetailis.getUser().getUsername();

		String username = principalDetailis.getUser().getUsername();
		String role = memberService.getUserRole(username);
		
		List<BoardBean> noticelist = new ArrayList<BoardBean>();
		List<BoardBean> joblist = new ArrayList<BoardBean>();
		int page = 1;
		int limit = 10; // 출력할 게시글 개수

		// 데이터 갯수
		int joblistcount = boardService.getJobCount();
		int noticelistcount = boardService.getNoticeCount();

		int start = (page - 1) * 10; // 시작 번호 1로 설정

		joblist = boardService.getJobList(start);
		noticelist = boardService.getNoticeList(start);

		// 총 페이지
		int maxpage = joblistcount / limit + ((joblistcount % limit == 0) ? 0 : 1);

		int startpage = ((page - 1) / 10) * limit + 1;
		int endpage = startpage + 10 - 1;

		if (endpage > maxpage)
		    endpage = maxpage;

		model.addAttribute("role", role);
		model.addAttribute("page", page);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);
		model.addAttribute("maxpage", maxpage);
		model.addAttribute("joblistcount", joblistcount);
		model.addAttribute("student_no", student_no);
		model.addAttribute("noticelist", noticelist);
		model.addAttribute("joblist", joblist);
		
		System.out.println("counselType");

		return "counsel/counselType";
	}

	// 상담사 및 일정 선택
	@RequestMapping("student/counselBooking")
	public String counselBooking(@RequestParam("counsel_typeno") String counsel_typeno, Authentication authentication,
			CounselBookingBean cBookingBean, StaffBean staff, Model model) throws Exception {

		System.out.println("counselBooking");
		System.out.println("counsel_typeno: " + counsel_typeno);

		PrincipalDetails principalDetailis = (PrincipalDetails) authentication.getPrincipal();
		String student_no = principalDetailis.getUser().getUsername();

		model.addAttribute("student_no", student_no);

		// 상담 타입 가져오기
		CounselTypeBean counselTypeBean = counselService.getCounselType(counsel_typeno);
		model.addAttribute("counselType", counselTypeBean);
		System.out.println("counselType: " + counselTypeBean);

		// 상담사 리스트 가져오기
		model.addAttribute("staffList", staffService.getStaffList(staff));
		System.out.println("staff: " + staffService.getStaffList(staff));

		return "counsel/counselBooking";
	}

	// 상담 내용 작성 폼
	@RequestMapping("student/counselContent")
	public String counselContent(@RequestParam("counsel_typeno") String counsel_typeno, Authentication authentication,
			@RequestParam("booking_dt") String booking_dt, @RequestParam("booking_time") String booking_time,
			@RequestParam("staff_no") String staff_no, Model model) throws Exception {
//								  StaffBean staff, Model model) throws Exception {

		System.out.println("booking_time: " + booking_time);
		System.out.println("counsel_Content");
		System.out.println("booking_dt: " + booking_dt);

		PrincipalDetails principalDetailis = (PrincipalDetails) authentication.getPrincipal();
		String student_no = principalDetailis.getUser().getUsername();

		StaffBean staff = staffService.getStaff(staff_no);
		System.out.println("staff: " + staff);

		String cd_nm = counselService.getBooking(booking_time);
		System.out.println("cd_nm: " + cd_nm);

		CounselTypeBean counselTypeBean = counselService.getCounselType(counsel_typeno);
		model.addAttribute("counselType", counselTypeBean); // 상담 타입
		model.addAttribute("student_no", student_no);
		model.addAttribute("booking_dt", booking_dt); // 예약 날짜
		model.addAttribute("booking_time", booking_time); // 예약 시간
		model.addAttribute("staff_no", staff_no); // 상담사
		model.addAttribute("staff", staff); // 상담사
		model.addAttribute("cd_nm", cd_nm); // 공통코드 시간

		return "counsel/counselContent";
	}

	// 상담 내용 작성 저장
	@RequestMapping("student/counselContentOk")
	public String counselContentOk(@ModelAttribute CounselBookingBean counselBookingBean, Authentication authentication,
			Model model) throws Exception {

		int result = counselService.insertCounsel(counselBookingBean);
		if (result == 1)
			System.out.println("입력성공");
		model.addAttribute("result", result);

		PrincipalDetails principalDetailis = (PrincipalDetails) authentication.getPrincipal();
		String student_no = principalDetailis.getUser().getUsername();

		model.addAttribute("student_no", student_no);

		return "counsel/counselContentOk";
	}

	// 확정 시간 처리
	@ResponseBody
	@RequestMapping("student/getDt")
	public List<CounselBookingBean> getDt(String booking_dt, String staff_no, Authentication authentication,
			Model model) throws Exception {

		PrincipalDetails principalDetailis = (PrincipalDetails) authentication.getPrincipal();
		String student_no = principalDetailis.getUser().getUsername();

		model.addAttribute("student_no", student_no);

		return counselService.getDt(staff_no, booking_dt);
	}

	// 상담기록 작성
	@RequestMapping("staff/counselRecord")
	public String counselRecord(@ModelAttribute CounselBookingBean counselBookingBean, Authentication authentication,
			Model model) throws Exception {

		PrincipalDetails principalDetailis = (PrincipalDetails) authentication.getPrincipal();
		String staff_no = principalDetailis.getUser().getUsername();

		model.addAttribute("counselBookingBean", counselBookingBean);
		model.addAttribute("staff_no", staff_no);

		return "counsel/counselRecord";
	}

	// 상담기록 저장
	@RequestMapping("staff/counselRecordOk")
	public String counselRecordOk(@ModelAttribute CounselRecordBean counselRecordBean,
			@ModelAttribute SurveyBean surveyBean, Authentication authentication, HttpServletRequest request,
			Model model) throws Exception {

		PrincipalDetails principalDetailis = (PrincipalDetails) authentication.getPrincipal();
		String staff_no = principalDetailis.getUser().getUsername();

		// 만족도조사 생성
		String student_no = request.getParameter("student_no");
		String booking_no = request.getParameter("booking_no");
		surveyService.insertSurvey(student_no, booking_no);

		int result = counselService.insertRecord(counselRecordBean);
		if (result == 1)
			System.out.println("입력성공");
		model.addAttribute("result", result);
		model.addAttribute("staff_no", staff_no);

		return "redirect:counselRecordList";
	}

	// 상담기록 리스트
	@RequestMapping("staff/counselRecordList")
	public String counselRecordList(HttpServletRequest request, Authentication authentication, Model model)
			throws Exception {
//		public String counselRecordList(HttpServletRequest request, Authentication authentication, Model model) throws Exception {

		PrincipalDetails principalDetailis = (PrincipalDetails) authentication.getPrincipal();
		String staff_no = principalDetailis.getUser().getUsername();
		System.out.println("staff_no: " + staff_no);

		List<CounselRecordBean> recordList = new ArrayList<CounselRecordBean>();

		int page = 1;
		int limit = 10; // 한 화면에 출력할 레코드수

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		// 게시물 갯수
		int listcount = counselService.getListCount();
		System.out.println("listcount:" + listcount);

		int start = (page - 1) * 10; // limit로 추출하기 위한 시작번호 : 0, 10, 20...

		recordList = counselService.getRecordList(staff_no);
		System.out.println("recordList:" + recordList);

		// 총 페이지
		int maxpage = listcount / limit + ((listcount % limit == 0) ? 0 : 1);

		int startpage = ((page - 1) / 10) * limit + 1; // 1, 11, 21..
		int endpage = startpage + 10 - 1; // 10, 20, 30..

		if (endpage > maxpage)
			endpage = maxpage;

		model.addAttribute("page", page);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);
		model.addAttribute("maxpage", maxpage);
		model.addAttribute("listcount", listcount);
		model.addAttribute("recordList", recordList);
		model.addAttribute("staff_no", staff_no);

		return "counsel/counselRecordList";
	}

	// 상담기록 상세페이지
	@RequestMapping("staff/counselRecordDetail")
	public String counselRecordDetail(String booking_no, @RequestParam("page") int page, Authentication authentication,
			Model model) throws Exception {

		PrincipalDetails principalDetailis = (PrincipalDetails) authentication.getPrincipal();
		String staff_no = principalDetailis.getUser().getUsername();
		System.out.println("staff_no: " + staff_no);

		CounselRecordBean cRecordBean = counselService.getDetail(booking_no);
		model.addAttribute("record", cRecordBean);
		model.addAttribute("page", page);
		model.addAttribute("staff_no", staff_no);

		return "counsel/counselRecordDetail";
	}

	// 상담기록 수정 폼
	@RequestMapping("staff/counselRecordUpdate")
	public String counselRecordUpdate(String booking_no, @RequestParam("page") int page, Authentication authentication,
			Model model) throws Exception {

		PrincipalDetails principalDetailis = (PrincipalDetails) authentication.getPrincipal();
		String staff_no = principalDetailis.getUser().getUsername();
		System.out.println("staff_no: " + staff_no);

		CounselRecordBean cRecordBean = counselService.getDetail(booking_no);
		model.addAttribute("record", cRecordBean);
		model.addAttribute("page", page);
		model.addAttribute("staff_no", staff_no);

		return "counsel/counselRecordUpdate";
	}

	// 상담기록 수정 저장
	@RequestMapping("staff/counselRecordUpdateOk")
	public String counselRecordUpdateOk(@ModelAttribute CounselRecordBean counselRecordBean,
			Authentication authentication, @RequestParam("page") int page,
			@RequestParam("booking_no") String booking_no, Model model) throws Exception {

		System.out.println("counselRecordUpdateOk");

		PrincipalDetails principalDetailis = (PrincipalDetails) authentication.getPrincipal();
		String staff_no = principalDetailis.getUser().getUsername();
		System.out.println("staff_no: " + staff_no);

		int result = counselService.updateRecord(counselRecordBean);
		if (result == 1)
			System.out.println("입력성공");
		model.addAttribute("result", result);
		model.addAttribute("page", page);
		model.addAttribute("staff_no", staff_no);

		return "counsel/counselRecordUpdateOk";
	}

	// 상담기록 삭제
	@RequestMapping("staff/counselRecordDelete")
	public String counselRecordDelete(String booking_no, @RequestParam("page") int page, Authentication authentication,
			Model model) throws Exception {

		PrincipalDetails principalDetailis = (PrincipalDetails) authentication.getPrincipal();
		String staff_no = principalDetailis.getUser().getUsername();
		System.out.println("staff_no: " + staff_no);

		int result = counselService.recordDelete(booking_no);
		model.addAttribute("result", result);
		model.addAttribute("page", page);

		return "redirect:counselRecordList?page=" + page;
	}
}