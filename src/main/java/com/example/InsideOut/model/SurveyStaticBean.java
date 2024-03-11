package com.example.InsideOut.model;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("surveystatic")
public class SurveyStaticBean {
	private String year;
	private String student_no;
	private String booking_no;
	private int total;
	private String answer_subj;
}
