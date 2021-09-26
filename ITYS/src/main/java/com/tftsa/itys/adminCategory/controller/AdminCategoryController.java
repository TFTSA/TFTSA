package com.tftsa.itys.adminCategory.controller;

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

import com.tftsa.itys.adminCategory.model.service.AdminCategoryService;
import com.tftsa.itys.mypage.model.vo.Subject;

@Controller
public class AdminCategoryController {
	private static final Logger logger = LoggerFactory.getLogger(AdminCategoryController.class);

//	@Autowired
	@Autowired // 자동 DI 처리됨
	private AdminCategoryService categoryService;
	// 뷰 페이지 이동 처리용 메소드 ----------------------------------------------
	@RequestMapping("adminCategory.do")
	public String categoryListViewMethod(Model model,@RequestParam(value="searched_txt", required=false) String searched_txt) {
		ArrayList<Subject> list = categoryService.selectCategoryAll(searched_txt);
		
		model.addAttribute("list", list);
		return "admin/adminCategory";
	}
	
	@RequestMapping(value = "deleteCategory.do", method = RequestMethod.POST)
	public String deleteCategoryMethod(@RequestParam(value="list") List<String> list ,HttpServletRequest req,  Model model) {
		
		for (int i=0; i<list.size();i++) {
			System.out.println(list.get(i));
			categoryService.deleteCategory(list.get(i));
			logger.info("삭제완료");
		}
		
		return "redirect:adminCategory.do";
	}
}