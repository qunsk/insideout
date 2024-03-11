package com.example.InsideOut.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.InsideOut.dao.StudentMypageDao;
import com.example.InsideOut.model.StudentMypageModel;

@Service
public class StudentMypageService {

	@Autowired
	private StudentMypageDao studentMypageDao;

//	public StaffMypageService(StaffMypageDao staffMypageDao) {
//		this.staffMypageDao = staffMypageDao;
//	}

	public List<StudentMypageModel> studentBookingList(String student_no) {

		List<StudentMypageModel> list = studentMypageDao.studentBookingList(student_no);
		System.out.println("service list:" + list);

		return list;
//		return staffMypageDao.getBookingList();
	}

	

}
