package com.example.InsideOut.service;

import com.example.InsideOut.model.DeptBean;
import com.example.InsideOut.model.LoginRequestDto;
import com.example.InsideOut.model.MemberBean;
import com.example.InsideOut.model.NameBean;
import com.example.InsideOut.model.StaffBean;
import com.example.InsideOut.model.StudentBean;

public interface MemberService {
	
	void stuInsert(StudentBean stu);
	
	void staInsert(StaffBean sta);
	
	void memInsert(MemberBean member);
	
	void deptInsert(DeptBean dept);

	void advisor(DeptBean dept);
	
	int usernameCheck(String username);
	
	void phoneNumber(String phone, int randomNum);
	
	int getName(NameBean name);
	
	int updatePass(LoginRequestDto user);
}
