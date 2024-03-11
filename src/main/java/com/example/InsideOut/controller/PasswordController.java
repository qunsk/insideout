package com.example.InsideOut.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.InsideOut.auth.PrincipalDetails;
import com.example.InsideOut.model.MemberBean;
import com.example.InsideOut.service.PasswordService;

@Controller
@RequestMapping("api/v1/user")
public class PasswordController {


    @Autowired
    PasswordService PasswordService;
    
    @Autowired
    BCryptPasswordEncoder bCryptPasswordEncoder;
    
    @GetMapping("PasswordUpdateForm")
    public String PasswordUpdateForm() {
    	 
    	return "member/PasswordUpdateForm";
    }

    // 학생 회원정보 수정 (비밀번호)
    @PostMapping("/PasswordUpdate")
    public String studentUpdateForm(Authentication authentication, Model model,
            @RequestParam(value = "newPassword", required = false) String newPassword) throws Exception {

    	System.out.println("Controller studentUpdateForm in");
    	
        PrincipalDetails principalDetails = (PrincipalDetails) authentication.getPrincipal();

        String oldPassword = principalDetails.getPassword();
        System.out.println("oldPassword: " + oldPassword);
        
        MemberBean member = new MemberBean();        

		 if (newPassword != null) { 
            // 비밀번호 수정 로직을 추가하여 새로운 비밀번호(newPassword)를 업데이트합니다.
        //	bCryptPasswordEncoder.encode(member.getPassword());
//        	bCryptPasswordEncoder.encode(newPassword);   // newPassword 암호화
        	
        	member.setUsername(principalDetails.getUsername());
            member.setPassword(bCryptPasswordEncoder.encode(newPassword));
        	
            int result = PasswordService.updatePassword(member);
            if(result == 1) System.out.println("password 수정성공");
        }
        
//        model.addAttribute("oldPassword", oldPassword);

        return "member/loginForm";
    }
}
