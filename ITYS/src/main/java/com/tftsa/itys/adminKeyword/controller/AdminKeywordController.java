package com.tftsa.itys.adminKeyword.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.tftsa.itys.adminKeyword.model.service.AdminKeywordService;
import com.tftsa.itys.adminKeyword.model.vo.AdminKeyword;

@Controller
public class AdminKeywordController {
	private static final Logger logger = LoggerFactory.getLogger(AdminKeywordController.class);

//	@Autowired
//	private KeywordService keywordService;
	@Autowired // 자동 DI 처리됨
	private AdminKeywordService keywordService;
	// 뷰 페이지 이동 처리용 메소드 ----------------------------------------------
	@RequestMapping("adminKeyword.do")
	public String keywordListViewMethod(Model model,@RequestParam(value="searched_txt", required=false) String searched_txt) {
		ArrayList<AdminKeyword> list = keywordService.selectAllKeywords(searched_txt);
		
		model.addAttribute("list", list);
		return "admin/adminKeyword";
	}
	
	@RequestMapping(value = "deleteKeyword.do", method = RequestMethod.POST)
	public String deleteKeywordMethod(@RequestParam(value="list") List<String> list ,HttpServletRequest req,  Model model) {
		
		for (int i=0; i<list.size();i++) {
			System.out.println(list.get(i));
			keywordService.deleteKeyword(list.get(i));
			logger.info("삭제완료");
		}
		
		return "redirect:adminKeyword.do";
	}
}
