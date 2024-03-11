package com.example.InsideOut.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.InsideOut.model.StaffBean;
import com.example.InsideOut.service.StaffService;

@Controller
public class StaffController {
	
	@Autowired
	private StaffService staffService;
	
	// 상담 리스트
	@RequestMapping("staffList")
	public String list(StaffBean staff, Model model) {

		// 상담사 리스트 가져오기
	    model.addAttribute("staffList", staffService.getStaffList(staff));
	    return "staff/staffList";
	}

}
