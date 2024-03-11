package com.example.InsideOut.model;

import org.apache.ibatis.type.Alias;

import lombok.Data;

//토큰 생성을 위해 사용하는 dto(관심사 분리)
@Data
@Alias("loginRequestDto")
public class LoginRequestDto {
	private String username;
	private String password;
}

