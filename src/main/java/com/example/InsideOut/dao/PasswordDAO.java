package com.example.InsideOut.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import com.example.InsideOut.model.MemberBean;


@Mapper
public interface PasswordDAO {
	
	 int updatePassword(MemberBean member);
	
}
