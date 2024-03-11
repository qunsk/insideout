package com.example.InsideOut.model;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("codeBean")
public class CodeBean {
	
	private String cate;
	private String cd;
	private String cd_nm;
	private String description;
	private String use_yn;
	private int ord;
}
