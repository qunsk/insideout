// StudentDAO.java (DAO Interface)
package com.example.InsideOut.dao;

import org.apache.ibatis.annotations.Mapper;

import com.example.InsideOut.model.StudentBean;

@Mapper
public interface StudentDAO {

    StudentBean getStudentByMemNo(String mem_no);

    int updateStudent(StudentBean student);
}
