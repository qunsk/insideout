package com.example.InsideOut.dao;

import org.apache.ibatis.annotations.Mapper;

import com.example.InsideOut.model.MemberBean;

@Mapper
public interface UserRepository {
	// 로그인 정보 찾기
	MemberBean findByUsername(String username);

}
