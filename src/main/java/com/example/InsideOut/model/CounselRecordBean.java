package com.example.InsideOut.model;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("record")
public class CounselRecordBean {
	
	private String student_no;
	private String booking_no;
	private String counsel_content;
	private Date counsel_record_dt;
	private String staff_no;
	private String student_name;
}
