package com.example.InsideOut.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.InsideOut.dao.SurveyDao;
import com.example.InsideOut.model.SurveyAnswerBean;
import com.example.InsideOut.model.SurveyBean;
import com.example.InsideOut.model.SurveyQuestionBean;
import com.example.InsideOut.model.SurveyResultBean;
import com.example.InsideOut.model.SurveyStaticBean;

@Service
public class SurveyService {
	
	@Autowired
	private SurveyDao dao;
	
	public List<SurveyQuestionBean> getQuestionList() {
		return dao.getQuestionList();
	}
	
	public void insertMulti(SurveyAnswerBean sab) {
		dao.insertMulti(sab);
	}
	
	public void insertMultiResult(SurveyResultBean srb) {
		dao.insertMultiResult(srb);
	}
	
	public void insertSubj() {
		dao.insertSubj();
	}
	
	public void insertSubjResult(SurveyResultBean srb) {
		dao.insertSubjResult(srb);
	}
	
	public void updateSurvey(String booking_no) {
		dao.updateSurvey(booking_no);
	}
	
	public void insertStatic(SurveyStaticBean ssb) {
		dao.insertStatic(ssb);
	}
	
	public List<SurveyBean> getSurveyList(String student_no, int page) {
		return dao.getSurveyList(student_no, page);
	}
	
	public int getSurveyCount(String student_no) {
		return dao.getSurveyCount(student_no);
	}
	
	public List<SurveyStaticBean> getStaticList(String staff_no, int page) {
		return dao.getStaticList(staff_no, page);
	}
	
	public int getStaticCount(String staff_no) {
		return dao.getStaticCount(staff_no);
	}
	
	public void insertSurvey(String student_no, String booking_no) {
		dao.insertSurvey(student_no, booking_no);
	}
}
