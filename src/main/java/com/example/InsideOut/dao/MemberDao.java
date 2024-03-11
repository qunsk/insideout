package com.example.InsideOut.dao;

import org.apache.ibatis.annotations.Mapper;

import com.example.InsideOut.model.DeptBean;
import com.example.InsideOut.model.LoginRequestDto;
import com.example.InsideOut.model.MemberBean;
import com.example.InsideOut.model.NameBean;
import com.example.InsideOut.model.StaffBean;
import com.example.InsideOut.model.StudentBean;

@Mapper
public interface MemberDao {

	void stuInsert(StudentBean stu);

	void staInsert(StaffBean sta);

	void memInsert(MemberBean member);

	void deptInsert(DeptBean dept);

	void advisor(DeptBean dept);

	int usernameCheck(String username);

	String getUserRole(String username);
	
	int getName(NameBean name);

	String getId(String username);
	
	int updatePass(LoginRequestDto user);
}
