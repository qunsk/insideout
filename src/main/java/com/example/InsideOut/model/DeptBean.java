package com.example.InsideOut.model;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("dept")
public class DeptBean {
	private String dept_no;
	private String dept_type;
	private String dept_name;
	
	private String username;
}
