package com.example.InsideOut.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.InsideOut.auth.PrincipalDetails;
import com.example.InsideOut.model.LoginRequestDto;
import com.example.InsideOut.model.MemberBean;
import com.example.InsideOut.model.NameBean;
import com.example.InsideOut.model.StaffBean;
import com.example.InsideOut.model.StudentBean;
import com.example.InsideOut.service.MemberServiceImpl;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class LoginController {

	private final BCryptPasswordEncoder bCryptPasswordEncoder;

	@Autowired
	private MemberServiceImpl memberService;

	// 로그인 후 권한 별 페이지 이동
	@GetMapping("/select/role")
	public String loginsuccess(Authentication authentication) {
		PrincipalDetails principalDetailis = (PrincipalDetails) authentication.getPrincipal();
		// username = 학번/교직원번호
		String username = principalDetailis.getUser().getUsername();

		String role = memberService.getUserRole(username);

		if (role.equals("ROLE_STUDENT")) {
			return "redirect:/api/v1/student/counselType";
		} else if (role.equals("ROLE_STAFF")) {
			return "redirect:/api/v1/staff/StaffList";
		} else if (role.equals("ROLE_ADMIN")) {
			return "redirect:/api/v1/admin/adminMain";
		} else {
			return "redirect:/logout";
		}
	}

	// 로그인 결과 창
	@GetMapping("/loginResult")
	public String loginResult(Model model) {

		model.addAttribute("result", 2);

		return "/member/loginResult";
	}

	// 비밀번호 재설정 - 선택
	@GetMapping("/lostSelect")
	public String lostSelect(Model model, String mem_type) {

		return "member/lostSelect";
	}

	// 비밀번호 재설정
	@GetMapping("/lostPassword")
	public String lostPassword(Model model, String mem_type) {

		model.addAttribute("mem_type", mem_type);
		return "member/lostPassword";
	}

	// 비밀번호 재설정- 학번으로 성함 일치
	@PostMapping("/lost")
	public String lost(String username, NameBean name, Model model) {

		int count = memberService.getName(name);

		if (count > 0) {
			model.addAttribute("username", username);
			return "/member/lostResult";
		} else {
			model.addAttribute("result", 1);
			return "/member/loginResult";
		}

	}

	// 비밀번호 재설정 결과
	@PostMapping("/reset")
	public String reset(LoginRequestDto user, Model model) {
		user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
		int result = memberService.updatePass(user);

		model.addAttribute("result", result);

		return "member/changePass";
	}
}
