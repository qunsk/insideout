// StudentService.java (Service Interface)
package com.example.InsideOut.service;

import com.example.InsideOut.model.StudentBean;

public interface StudentService {

    int updateStudent(StudentBean student);

	StudentBean getStudentByMemNo(String username);
	
}
