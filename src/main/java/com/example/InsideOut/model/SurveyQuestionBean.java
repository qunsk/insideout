package com.example.InsideOut.model;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("surveyquestion")
public class SurveyQuestionBean {
	private int question_no;
	private int question_typeno;
	private String question_name;
	private int question_ord;
}
