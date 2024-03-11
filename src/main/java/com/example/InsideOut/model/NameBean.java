package com.example.InsideOut.model;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("name")
public class NameBean {
	private String student_name;
	private String staff_name;
	private String mem_type;
	
}
