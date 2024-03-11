package com.example.InsideOut.model;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("surveyresult")
public class SurveyResultBean {
	private String student_no;
	private String booking_no;
	private int question_no;
	private int answer_no;
	private String answer_subj;
}
