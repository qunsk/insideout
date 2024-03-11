package com.example.InsideOut.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.InsideOut.dao.PasswordDAO;
import com.example.InsideOut.model.MemberBean;



@Service
public class PasswordServiceImpl implements PasswordService {


    @Autowired
    private PasswordDAO passwordDAO;

    @Override
    public int updatePassword(MemberBean member) {
        // DAO 메서드를 호출하여 비밀번호를 업데이트합니다.
       return passwordDAO.updatePassword(member);
    }

	
	

}
