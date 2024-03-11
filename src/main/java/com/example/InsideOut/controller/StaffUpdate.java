package com.example.InsideOut.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.InsideOut.auth.PrincipalDetails;
import com.example.InsideOut.model.StaffBean;
import com.example.InsideOut.service.StaffUpdateService;

@Controller
@RequestMapping("/api/v1/staff")
public class StaffUpdate {
	
	 @Autowired
	 private StaffUpdateService staffUpdateService;
	 
	 
	 
	// 학생 정보 수정 폼
	    @GetMapping("/staffUpdateForm")
	    public String staffUpdateForm(Authentication authentication, Model model) {
	    	PrincipalDetails principalDetails = (PrincipalDetails) authentication.getPrincipal();
	    	System.out.println("수정폼 진입");
	    	System.out.println("user:"+ principalDetails.getUser());
	    	System.out.println("username:"+ principalDetails.getUser().getUsername());
	    	
	    	
	    	 // 해당 사용자의 학생 정보를 조회합니다.
	    	StaffBean staff = staffUpdateService.getStaffByMemNo(principalDetails.getUser().getUsername());
	    	if(staff != null) System.out.println("교직원정보 조회 성공:" + staff);
	    	
	    	model.addAttribute("staff", staff);
	    	
	    	return "member/staffupdateForm";
	    }


	    
	    @PostMapping("/updateStaff")
	    public String updateStaff(Authentication authentication, @ModelAttribute("staff") StaffBean staff, Model model) {
	        PrincipalDetails principalDetails = (PrincipalDetails) authentication.getPrincipal();


	        String staff1 = principalDetails.getUser().getUsername();
	        
	        int result = staffUpdateService.updateStaff(staff);
	        
	        model.addAttribute("staff", staff);
	 
	            // 학생 정보 업데이트
	        
	        int result1 = staffUpdateService.updateStaff(staff);
	        if (result1 == 1) {
	        	System.out.println("교직원 업데이트 성공");
	        }
	        
	        return "member/loginForm";
	    }

	}
	    
	 
	 
	 


