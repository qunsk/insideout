package com.example.InsideOut.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.InsideOut.dao.AdminDao;
import com.example.InsideOut.model.MemberBean;

@Service
public class AdminService {
	
	@Autowired
  private AdminDao dao;

	public List<MemberBean> getAllMembers(int pageNum) {
		// TODO Auto-generated method stub
		return dao.getAllMembers(pageNum);
	}
	
	public List<MemberBean> getSearchMembers(String keyword) {
		return dao.getSearchMembers(keyword);
	}
	
	public void deleteMembers(int mem_no) {
		// TODO Auto-generated method stub
		dao.deleteMembers(mem_no);
	}
	
	public int getTotal() {
		// TODO Auto-generated method stub
		return dao.getTotal();
	}

	public int getSearchTotal(String keyword) {
		return dao.getSearchTotal(keyword);
	}

	

	 
}
