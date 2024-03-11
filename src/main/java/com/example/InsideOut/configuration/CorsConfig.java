package com.example.InsideOut.configuration;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import org.springframework.web.filter.CorsFilter;

@Configuration
public class CorsConfig {

   @Bean
   public CorsFilter corsFilter() {
      UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
      CorsConfiguration config = new CorsConfiguration();
      config.setAllowCredentials(true);
      config.addAllowedOrigin("*"); 	//모든 ip허용
      config.addAllowedHeader("*"); 	//모든 header에 응답 허용
      config.addAllowedMethod("*"); 	//모든 post, get, put, delete, patch 요청을 허용
      source.registerCorsConfiguration("/api/**", config);	//cors 권한
      
      return new CorsFilter(source);
   }
}