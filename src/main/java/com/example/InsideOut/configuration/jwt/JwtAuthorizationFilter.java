package com.example.InsideOut.configuration.jwt;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.www.BasicAuthenticationFilter;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.example.InsideOut.auth.PrincipalDetails;
import com.example.InsideOut.dao.UserRepository;
import com.example.InsideOut.model.MemberBean;

public class JwtAuthorizationFilter extends BasicAuthenticationFilter {

	private UserRepository userRepository;

	public JwtAuthorizationFilter(AuthenticationManager authenticationManager, UserRepository userRepository) {
		super(authenticationManager);
		this.userRepository = userRepository;
	}

	@Override
	protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		Cookie[] cookies = request.getCookies();

		if (cookies == null) {
			chain.doFilter(request, response);
			return;
		}

		String token = null;

		for (Cookie cookie : cookies) {
			if (cookie.getName().equals(JwtProperties.HEADER_STRING)) {
				token = cookie.getValue();
				break;
			}
		}

		if (token == null) {
			chain.doFilter(request, response);
			return;
		}

		String username = JWT.require(Algorithm.HMAC512(JwtProperties.SECRET)).build().verify(token)
				.getClaim("username").asString();

		if (username != null) {
			MemberBean member = userRepository.findByUsername(username);

			PrincipalDetails principalDetails = new PrincipalDetails(member);

			Authentication authentication = new UsernamePasswordAuthenticationToken(principalDetails, null,
					principalDetails.getAuthorities());

			SecurityContextHolder.getContext().setAuthentication(authentication);
		}

		chain.doFilter(request, response);
	}
}
