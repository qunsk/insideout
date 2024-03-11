package com.example.InsideOut.model;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("staff")
public class StaffBean {
	private String staff_no; 
	private String staff_name; 
	private String staff_tel; 
	private String staff_email; 
	private String dept_cd; 
	
	private String username; 
	private String dept_name; 

}
