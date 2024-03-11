// StudentServiceImpl.java (Service Implementation)
package com.example.InsideOut.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.InsideOut.dao.StudentDAO;
import com.example.InsideOut.model.StudentBean;

@Service
public class StudentServiceImpl implements  StudentService {

    @Autowired
    private StudentDAO studentDAO;

	@Override
	public int updateStudent(StudentBean student) {
		// TODO Auto-generated method stub
		return studentDAO.updateStudent(student);
	}

	@Override
	public StudentBean getStudentByMemNo(String username) {
		// TODO Auto-generated method stub
		 return studentDAO.getStudentByMemNo(username);
	
	}

  
}
