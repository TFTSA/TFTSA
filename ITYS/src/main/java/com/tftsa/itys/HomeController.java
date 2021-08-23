package com.tftsa.itys;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping("main.do")
	public String mainViewForward() {
		return "common/main"; // 내보낼 뷰파일명 리턴
	}
	
	@RequestMapping("about.do")
	public String aboutViewForward() {
		return "common/about"; // 내보낼 뷰파일명 리턴
	}
	
	@RequestMapping("course.do")
	public String courseViewForward() {
		return "common/course"; // 내보낼 뷰파일명 리턴
	}
	
	@RequestMapping("contact.do")
	public String contactViewForward() {
		return "common/contact"; // 내보낼 뷰파일명 리턴
	}
	
	@RequestMapping("event.do")
	public String eventViewForward() {
		return "common/event"; // 내보낼 뷰파일명 리턴
	}
	
	@RequestMapping("login.do")
	public String loginViewForward() {
		return "common/login"; // 내보낼 뷰파일명 리턴
	}
	
	@RequestMapping("detail.do")
	public String detailViewForward() {
		return "common/detail"; // 내보낼 뷰파일명 리턴
	}
}


