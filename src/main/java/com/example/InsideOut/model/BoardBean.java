package com.example.InsideOut.model;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

//@Getter
//@Setter
@Data
@Alias("board")
public class BoardBean {
	private int board_no;	// 게시판 번호= 게시판 섹션 공통코드번호
	private int post_no;	// 게시글 번호
	private String writer_id; // 작성자 id
	private String post_title; // 게시글제목
	private String post_content; // 게시글내용
	private String htmlPost_content; // html게시글내용
	private int up_post_no;	// 상위게시글 번호
	private int board_re_ref; // 답변글 번호
	
	private Timestamp post_dt; // 작성일자
	private int post_readcount; // 조회수
	private int file_no; //첨부파일
	private String real_file_nm; //첨부파일
	private String save_file_nm; //첨부파일
	private String file_path; //첨부파일
	private int file_size; //첨부파일
	
	private String section; // 게시판 섹션 공통코드번호
	private String readonly; // 게시판 섹션 공통코드번호
	
	

}
