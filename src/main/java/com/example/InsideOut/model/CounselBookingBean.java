package com.example.InsideOut.model;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("booking") // DTO클래스 Alias 설정
public class CounselBookingBean {
	
	private String student_no; // 학생번호
	private int booking_no; // 예약번호
	private String counsel_typeno; // 상담종류번호 
	private String counsel_request_content; // 상담요청내용
	private String booking_dt; // 예약일자
	private String booking_time; // 예약시간
	private String confirm_dt; // 확정일자
	private String confirm_time; // 확정시간
	private String staff_no; // 교직원번호

}
