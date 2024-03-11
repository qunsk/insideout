package com.example.InsideOut.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.InsideOut.model.StudentMypageModel;

@Mapper
public interface StudentMypageDao {

	public List<StudentMypageModel> studentBookingList(String student_no);

}
