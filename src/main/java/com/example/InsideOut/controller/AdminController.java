package com.example.InsideOut.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.InsideOut.model.MemberBean;
import com.example.InsideOut.service.AdminService;

@RequestMapping("api/v1/admin")
@Controller
public class AdminController {

	@Autowired
	private AdminService service;

	@RequestMapping("/adminMain")
	public String adminPage() {
		return "admin/adminMain";
	}

	// 회원 목록 조회
	@GetMapping("/adminMember")
	public String getAllMembers(HttpServletRequest request, Model model) {
		List<MemberBean> memberlist = new ArrayList<MemberBean>();

		int pageNum = 1;
		int limit = 10;
		int listcount = 0;
		String keyword = null;

		if (request.getParameter("pageNum") != null) {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		}

		if (request.getParameter("keyword") != null) {
			keyword = request.getParameter("keyword");
		}

		if (keyword == null) {
			listcount = service.getTotal();
			memberlist = service.getAllMembers(pageNum);
		} else {
			listcount = service.getSearchTotal(keyword);
			memberlist = service.getSearchMembers(keyword);
		}

		// 총 페이지
		int maxpage = listcount / limit + ((listcount % limit == 0) ? 0 : 1);

		int startpage = ((pageNum - 1) / 10) * 10 + 1; // 1, 11, 21..
		int endpage = startpage + 10 - 1; // 10, 20, 30..

		if (endpage > maxpage)
			endpage = maxpage;

		model.addAttribute("pageNum", pageNum);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);
		model.addAttribute("maxpage", maxpage);
		model.addAttribute("listcount", listcount);
		model.addAttribute("memberlist", memberlist);
		model.addAttribute("keyword", keyword);

		return "admin/adminMember";
	}

	// 삭제
	@RequestMapping("/deleteMember")
	public String userdelete(int mem_no) {
		System.out.println("mem_no:" + mem_no);

		service.deleteMembers(mem_no);

		return "redirect:adminMember";
	}

}
