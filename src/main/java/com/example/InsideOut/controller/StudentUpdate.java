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
import com.example.InsideOut.model.StudentBean;
import com.example.InsideOut.service.StudentService;

@Controller
@RequestMapping("/api/v1/student")
public class StudentUpdate {

    @Autowired
    private StudentService studentService;

    // 학생 정보 수정 폼
	@GetMapping("/studentUpdateForm")
    public String studentUpdateForm(Authentication authentication, Model model) {
    	PrincipalDetails principalDetails = (PrincipalDetails) authentication.getPrincipal();
    	System.out.println("수정폼 진입");
    	System.out.println("user:"+ principalDetails.getUser());
    	System.out.println("username:"+ principalDetails.getUser().getUsername());
    	
    	
    	 // 해당 사용자의 학생 정보를 조회합니다.
        StudentBean student = studentService.getStudentByMemNo(principalDetails.getUser().getUsername());
    	if(student != null) System.out.println("학생정보 조회 성공:" + student);
        
        model.addAttribute("student", student);
        
        return "member/studentupdateForm";
    }


    
    @PostMapping("/updateStudent")
    public String updateStudent(Authentication authentication, @ModelAttribute("student") StudentBean student, Model model) {
        PrincipalDetails principalDetails = (PrincipalDetails) authentication.getPrincipal();

     //  String student1 = principalDetails.getUsername();
        String student1 = principalDetails.getUser().getUsername();
		/*
		 * int result = studentService.updateStudent(student1);
		 * 
		 * student.setStudent_name(student.getStudent_name());
		 * student.setStudent_email(student.getStudent_email());
		 * student.setStudent_tel(student.getStudent_tel());
		 * 
		 * model.addAttribute("student", student1);
		 */
        
        int result = studentService.updateStudent(student);

        model.addAttribute("student", student);
        
            // 학생 정보 업데이트
     //   int result1 = studentService.updateStudent(student1);
        int result1 = studentService.updateStudent(student);

            if (result1 == 1) {
                System.out.println("학생 업데이트 성공");
            }
   //     }

        return "member/loginForm";
    }

}
    
