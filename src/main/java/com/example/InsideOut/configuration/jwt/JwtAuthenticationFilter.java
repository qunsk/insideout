package com.example.InsideOut.configuration.jwt;

import java.io.IOException;
import java.util.Date;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.SetFactoryBean;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.example.InsideOut.auth.PrincipalDetails;
import com.example.InsideOut.dao.MemberDao;
import com.example.InsideOut.model.LoginRequestDto;
import com.example.InsideOut.service.MemberServiceImpl;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
public class JwtAuthenticationFilter extends UsernamePasswordAuthenticationFilter {

	private final AuthenticationManager authenticationManager;
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private PasswordEncoder passwordEncoder;

	@Override
	public Authentication attemptAuthentication(HttpServletRequest request, HttpServletResponse response)
			throws AuthenticationException {
		logger.info("JwtAuthenticationFilter : 로그인시도");

		LoginRequestDto loginRequestDto = new LoginRequestDto();
		loginRequestDto.setUsername(request.getParameter("username"));
		loginRequestDto.setPassword(request.getParameter("password"));
		
		UsernamePasswordAuthenticationToken authenticationToken = new UsernamePasswordAuthenticationToken(
				loginRequestDto.getUsername(), loginRequestDto.getPassword());

		// 인증에 관련된 객체 생성
		Authentication authentication = authenticationManager.authenticate(authenticationToken);

		// principal에 username을 담고, password는 보안상 비워둠
		PrincipalDetails principalDetailis = (PrincipalDetails) authentication.getPrincipal();

		return authentication;

	}

	@Override
	protected void successfulAuthentication(HttpServletRequest request, HttpServletResponse response, FilterChain chain,
			Authentication authResult) throws IOException, ServletException {
		logger.info("successfulAuthentication 실행: 인증 완료");
		
		PrincipalDetails principalDetailis = (PrincipalDetails) authResult.getPrincipal();

		String jwtToken = JWT.create().withSubject(principalDetailis.getUsername())
				.withExpiresAt(new Date(System.currentTimeMillis() + JwtProperties.EXPIRATION_TIME))
				.withClaim("id", principalDetailis.getUser().getMem_no())
				.withClaim("username", principalDetailis.getUser().getUsername())
				.sign(Algorithm.HMAC512(JwtProperties.SECRET));

		Cookie cookie = new Cookie(JwtProperties.HEADER_STRING, jwtToken);
		cookie.setMaxAge(JwtProperties.EXPIRATION_TIME);
		cookie.setPath("/");

		response.addCookie(cookie);
		response.sendRedirect("/select/role");

	}
	
	@Override
	protected void unsuccessfulAuthentication(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException failed) throws IOException, ServletException {
		logger.info("JwtAuthenticationFilter : 인증 실패");

		// 응답 초기화 시켜 이동
		response.reset();

		response.sendRedirect("/loginResult");
	}

}
