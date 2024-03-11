package com.example.InsideOut.model;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("note")
public class NoteBean {
	    private int note_no;
	    private String message;
	    private Date snd_dt;
	    private Date rcv_dt;
	    private String recv_id;
	    private String send_id;
	    
	    private String user_note_no;
	    private String mem_no;
	    private String snd_rcv_cd;  // 발신수신구분 코드 
	    
	    private int startRow;
		private int endRow;
		
		private String recv_nm;
		private String send_nm;
		
		
}
