package com.tftsa.itys.adminMember.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tftsa.itys.adminMember.model.service.MemberService;
import com.tftsa.itys.adminMember.model.vo.Member;

@Controller
public class AdminMemberController {
	private static final Logger logger = LoggerFactory.getLogger(AdminMemberController.class);

//	@Autowired
//	private MemberService memberService;
	@Autowired // 자동 DI 처리됨
	private MemberService memberService;
	// 뷰 페이지 이동 처리용 메소드 ----------------------------------------------
	@RequestMapping("adminMember.do")
	public String memberListViewMethod(Model model) {
		ArrayList<Member> list = memberService.selectAllList();
		
		model.addAttribute("list", list);
		return "admin/adminMember";
		
	}
}