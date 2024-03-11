package com.example.InsideOut.model;


import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("member")
public class MemberBean {

	private String mem_no; 
	private String username; 
	private String password;
	private String pw_lock;
	private String pw_reset;
	private String pw_redt;
	private int pw_errorcount;
	private Date recent_login;
	private String mem_type;
	private String mem_state;
	private String role;
	
	private String dept_name;
	
    public List<String> getRoleList() {
        if (this.role.length() > 0) {
            return Arrays.asList(this.role.split(","));
        }
        return new ArrayList<>();
    }
}
