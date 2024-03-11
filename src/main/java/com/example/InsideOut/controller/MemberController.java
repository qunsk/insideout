package com.example.InsideOut.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.InsideOut.model.DeptBean;
import com.example.InsideOut.model.MemberBean;
import com.example.InsideOut.model.StaffBean;
import com.example.InsideOut.model.StudentBean;
import com.example.InsideOut.service.MemberServiceImpl;

import lombok.RequiredArgsConstructor;


@Controller
@RequiredArgsConstructor
public class MemberController {
	
	private final BCryptPasswordEncoder bCryptPasswordEncoder;
	private final MemberServiceImpl memberService;
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@GetMapping({"/",""})
	public String start() {
		return "member/loginForm";
	}
	
	@GetMapping("/loginForm")
	public String loginForm() {
		return "member/loginForm";
	}
	
	@GetMapping("/joinSelect")
	public String joinSelect() {
		return "member/joinSelect";
	}
	
	@GetMapping("/joinForm")
	public String joinForm(Model model, String mem_type) {
		model.addAttribute("mem_type", mem_type);
		
		return "member/joinForm";
	}
	
	@PostMapping("/join")
	public String join(MemberBean member, String mem_type, DeptBean dept, StudentBean stu, StaffBean sta) {
		System.out.println("join");
		member.setPassword(bCryptPasswordEncoder.encode(member.getPassword()));
		memberService.memInsert(member);
		
		System.out.println("학생 dept_name:"+stu.getDept_name());
		System.out.println("교직원 dept_name:"+sta.getDept_name());
		
		if(mem_type.equals("0100")) {		// 학생일 때 
			member.setRole("ROLE_STUDENT");
			memberService.stuInsert(stu);
			
		}else if(mem_type.equals("0200")){	// 교직원일 때
			member.setRole("ROLE_STAFF");
			memberService.staInsert(sta);
			
		}
		
		System.out.println("member: "+member);
		
		return "member/loginForm";
	}
	
	//SMS
	@GetMapping("/phoneChk")
	public @ResponseBody String phoneChk(String phone) {
		int randomNum = (int) ((Math.random() * (9999 - 1000 + 1)) + 1000);
		
		memberService.phoneNumber(phone, randomNum);
		return Integer.toString(randomNum);
	}
	
	// 학번 중복검사
	@PostMapping("joinUsername")
	public String joinUsername(@RequestParam("memid") String username, Model model) {
		
		int result = memberService.usernameCheck(username);
		model.addAttribute("result", result);
		
		return "member/idcheckResult";
	}

}
