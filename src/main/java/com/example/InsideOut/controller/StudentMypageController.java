package com.example.InsideOut.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.InsideOut.auth.PrincipalDetails;
import com.example.InsideOut.model.StudentMypageModel;
import com.example.InsideOut.service.StudentMypageService;

@Controller
@RequestMapping("api/v1/student")
public class StudentMypageController {
	@Autowired
	private StudentMypageService StudentMS;

	@RequestMapping("/StudentList")
	public String showMypage(Authentication authentication, Model model) {
		// System.out.println("controller in");
		PrincipalDetails principalDetailis = (PrincipalDetails) authentication.getPrincipal();

		String student_no = principalDetailis.getUser().getUsername();

		List<StudentMypageModel> bookings = StudentMS.studentBookingList(student_no);
		// System.out.println("bookings: " + bookings);

		model.addAttribute("bookings", bookings); // 모델에 속성 추가
		model.addAttribute("student_no", student_no);

		return "Mypage/StudentList";
	}

}
