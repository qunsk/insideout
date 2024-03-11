package com.example.InsideOut.model;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("survey")
public class SurveyBean {
	private String student_no;
	private String booking_no;
	private String survey_state;
	private Date survey_dt;
}
