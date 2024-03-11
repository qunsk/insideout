package com.example.InsideOut.model;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("surveyanswer")
public class SurveyAnswerBean {
	private int question_no;
	private int answer_no;
	private int answer_rating;
	private String answer_cate;
	private int answer_ord;
}
