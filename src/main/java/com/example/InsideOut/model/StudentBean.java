package com.example.InsideOut.model;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("student")
public class StudentBean {
	private String student_no; 
	private String student_name; 
	private String student_tel; 
	private String student_email; 
	private String dept_no; 
	private String staff_no; 
	
	//sql문에서 사용
	private String username; 
	private String dept_name; 
}

