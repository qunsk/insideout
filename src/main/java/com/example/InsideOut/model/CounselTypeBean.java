package com.example.InsideOut.model;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("counselType")
public class CounselTypeBean {
	
	private String counsel_typeno; // 종류번호
	private String counsel_typename; // 상담종류명
	private String counsel_typedetail; // 설명

}
