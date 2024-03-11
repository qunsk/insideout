package com.example.InsideOut.configuration.jwt;

public interface JwtProperties {
	String SECRET = "success"; // 우리 서버만 알고 있는 비밀값(시크릿키)
	int EXPIRATION_TIME = 60000*20; // 20분
	String HEADER_STRING = "Authorization";
}