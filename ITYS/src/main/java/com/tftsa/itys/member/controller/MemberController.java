package com.tftsa.itys.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.tftsa.itys.member.model.service.MemberService;
import com.tftsa.itys.member.model.vo.Member;
import com.tftsa.itys.member.model.vo.NaverLoginBO;
import com.tftsa.itys.mypage.model.vo.Student;
import com.tftsa.itys.mypage.model.vo.Tutor;

@Controller
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	private MemberService memberService;

	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;

	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	
	@Autowired
    private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
        this.naverLoginBO = naverLoginBO;
    }
  
  //네이버 로그인 성공시 callback호출 메소드
    @RequestMapping(value = "callback.do", method = { RequestMethod.GET, RequestMethod.POST })
    public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session, HttpServletResponse response, SessionStatus status)
            throws IOException, ParseException {
        System.out.println("===== callback.do =====");
        OAuth2AccessToken oauthToken;
        logger.info("session : "+session);
        logger.info("code : "+code);
        logger.info("state : "+state);
        oauthToken = naverLoginBO.getAccessToken(session, code, state);
        logger.info("oauthToken : "+oauthToken);
        //로그인 사용자 정보를 읽어온다.
        apiResult = naverLoginBO.getUserProfile(oauthToken);
//        logger.info(apiResult.toString());
        model.addAttribute("result", apiResult);
//        logger.info("result : "+apiResult);
        
        JSONParser parser = new JSONParser();
        Object obj = parser.parse(apiResult);
        JSONObject jsonObj = (JSONObject) obj;

        //Top레벨 단계 _response 파싱
        JSONObject response_obj = (JSONObject)jsonObj.get("response");
        //response의 값 파싱
        String id = (String)response_obj.get("id");
        String name = (String)response_obj.get("name");
        String email = (String)response_obj.get("email");
        String gender = (String)response_obj.get("gender");
        String birthday = (String)response_obj.get("birthday");
        String birthyear = (String)response_obj.get("birthyear");
        String mobile = (String)response_obj.get("mobile");

//        System.out.println(id);
        session.setAttribute("sessionId",id); //세션 생성        

        Member loginMember = memberService.selectEmail(email);
        logger.info("callback.do loginMember : "+loginMember);
        if(loginMember != null && loginMember.getLogin_ok().equals("Y")) {
        	//회원가입이 되어있음
        	session.setAttribute("loginMember", loginMember);
			status.setComplete(); // 요청 성공. 200 전송보냄
			return "redirect:main.do";
        }else if(loginMember == null){
        	//회원가입 안되어있음
	        Member member = new Member();
	        
	        member.setUser_name(name);
	        member.setUser_email(email);
	        member.setUser_phone(mobile);
	        member.setUser_position("U");
	        String ssn = "";
	        String ran = "";
	        Random rand = new Random();
	        for(int i=0;i<6;i++) {
	            //0~9 까지 난수 생성
	            ran += Integer.toString(rand.nextInt(10));
	        }
	        ssn += birthyear.substring(2, 4) + birthday.substring(0,2) + birthday.substring(3, 5) + "-" + (gender.equals("M")? "1" : "2" + ran);
	        //System.out.println("ssn : "+ssn);
	        member.setUser_ssn(ssn);
	        
	        if (memberService.insertUser(member) > 0) {
			//Member loginMember = memberService.selectUser(member.getUser_id());
	        member = memberService.selectEmail(email);
	        System.out.println("member : "+member.toString());
	        session.setAttribute("loginMember", member);
			status.setComplete(); // 요청 성공. 200 전송보냄
//			PrintWriter out = response.getWriter();
//			String str = "";
//			str = "<script language='javascript'>";
//			str += "opener.window.location.reload();"; // 오프너 새로고침
//			str += "window.close();"; // 창닫기
//			str += "</script>";
//			out.print(str);
	        
	        return "redirect:main.do";        
	        }else {
	        	model.addAttribute("message", "회원가입 및 로그인 실패..");
	        	return "common/error";
	        }
        }else {
			model.addAttribute("message", "로그인 실패...");
			return "common/error";
		}
//        return "common/main";
    }
    
	// 회원가입페이지로 이동
	@RequestMapping("enrollPage.do")
	public String moveEnrollPage() {
		return "member/enrollPage";
	}

	// 회원가입하기
	@RequestMapping(value = "enroll.do", method = RequestMethod.POST)
	public String insertUserMethod(Member member, Model model) {
		logger.info("enroll.do : " + member);

		// 패스워드 암호화 처리
		member.setUser_pwd(bcryptPasswordEncoder.encode(member.getUser_pwd()));

		if (memberService.insertUser(member) > 0) {
			return "member/loginPage";
		} else {
			model.addAttribute("message", "회원 가입 실패...");
			return "common/error";
		}
	}

	// 로그인페이지로 이동
	@RequestMapping(value = "loginPage.do", method = { RequestMethod.GET, RequestMethod.POST})
	public String moveLoginPage(Model model, HttpSession session) {
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
        String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
        
        //https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=O1DNpjOo6U7RT1EEQ0Cw
        //&redirect_uri=http%3A%2F%2Flocalhost%3A8087%2Fitys%2Fcallback.do&state=024d2a87-a3d2-4c22-91e0-17828c920786
        System.out.println("네이버 : \n" + naverAuthUrl);
        
        //네이버 
        model.addAttribute("url", naverAuthUrl);

        /* 생성한 인증 URL을 View로 전달 */
        return "member/loginPage";
	}

	// 로그인하기
	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public String loginMethod(Member member, HttpSession session, SessionStatus status, Model model) {

		// userid 가 일치하는 회원정보 조회해 옴
		Member loginMember = memberService.selectUser(member.getUser_id());
		// 조회해 온 회원정보의 암호화된 패스워드와 클라이언트가 보낸 암호 비교
		// matches(일반글자 암호, 암호화된 패스워드)
		
		logger.info("login.do : " + loginMember);

		if (loginMember != null && bcryptPasswordEncoder.matches(member.getUser_pwd(), loginMember.getUser_pwd())
				&& loginMember.getLogin_ok().equals("Y")) {
			// 세션 객체 생성 > 세션 안에 회원정보 저장
			session.setAttribute("loginMember", loginMember);
			status.setComplete(); // 요청 성공. 200 전송보냄
			return "redirect:main.do";
		} else {
			model.addAttribute("message", "로그인 실패!");
			return "common/error";
		}

	}

	// 로그아웃하기
	@RequestMapping("logout.do")
	public String logoutMethod(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession(false); // 새로 생성되면 안되니까
		if (session != null) {
			session.invalidate();
			return "common/main";
		} else {
			model.addAttribute("message", "로그인 세션이 존재하지 않습니다.");
		}
		return "main";
	}

	// 마이페이지로 이동
	@RequestMapping(value = "myPage.do")
	public ModelAndView myPageMethod(@RequestParam("user_no") int user_no, ModelAndView mv) {
		Member member = memberService.selectUserNo(user_no);
		if (member != null) {
			mv.addObject("member", member);
			if(member.getUser_position().equals("S")) {
				Student student = memberService.selectStudent(member.getUser_no());
				mv.addObject("student", student);
			}else if(member.getUser_position().equals("T")) {
				Tutor tutor = memberService.selectTutor(member.getUser_no());
				mv.addObject("tutor", tutor);
			}
			mv.setViewName("mypage/myPage");
		} else {
			mv.addObject("message", user_no + " 회원 조회 실패!");
			mv.setViewName("common/error");
		}
		return mv;
	}

	// 회원탈퇴
	@RequestMapping("deleteUser.do")
	public String deleteUserMethod(@RequestParam("user_no") int user_no, Model model) {
		logger.info("user_no : " + user_no);
		if (memberService.deleteUser(user_no) > 0) {
			return "redirect:logout.do";
		} else {
			model.addAttribute("message", user_no + " 회원 삭제 실패");
			return "common/error";
		}
	}

	// 아이디 찾기 페이지로 이동
	@RequestMapping("findIdPage.do")
	public String moveSearchId() {
		return "member/searchId";
	}

	// 아이디 찾기
	@RequestMapping(value = "findId.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String find_id(HttpServletResponse response,
			@RequestParam(value = "user_email", required = false) String user_email, Model md) throws Exception {
		md.addAttribute("user_id", memberService.selectUserId(response, user_email));
		return "/member/findId";
	}

	// 비밀번호 찾기 페이지로 이동
	@RequestMapping("findPwdPage.do")
	public String moveSearchPwd() {
		return "member/searchPwd";
	}

	// 비밀번호 찾기
	@RequestMapping(value = "findPwd.do", method = RequestMethod.POST)
	public void find_pw(@ModelAttribute Member member, HttpServletResponse response,
			@RequestParam(value = "user_id", required = true) String user_id,
			@RequestParam(value = "user_email", required = true) String user_email) throws Exception {
		member.setUser_id(user_id);
		member.setUser_email(user_email);
		memberService.findUserPwd(response, member);

		member.setUser_pwd(bcryptPasswordEncoder.encode(member.getUser_pwd()));
		// logger.info("member: "+member);
		memberService.updateUserPwd(member);
	}

	// id 중복확인
	@RequestMapping(value = "idCheck.do", method = RequestMethod.POST)
	@ResponseBody
	public int idCheck(@RequestParam("id") String user_id) {
		int cnt = memberService.selectIdCheck(user_id);
		//logger.info("id : "+user_id);
		return cnt;
	}

	// email 중복확인
	@RequestMapping(value = "emailCheck.do", method = RequestMethod.POST)
	@ResponseBody
	public int emailCheck(@RequestParam("email") String user_email) {
		int cnt = memberService.selectEmailCheck(user_email);
		//logger.info("email : "+user_email);
		return cnt;
	}

}
