package com.tftsa.itys.mypage.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.security.auth.Subject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.tftsa.itys.member.model.vo.Member;
import com.tftsa.itys.mypage.model.service.MypageService;
import com.tftsa.itys.mypage.model.vo.Likes;
import com.tftsa.itys.mypage.model.vo.MyClass;
import com.tftsa.itys.mypage.model.vo.MyKeyData;
import com.tftsa.itys.mypage.model.vo.MyKeyword;
import com.tftsa.itys.mypage.model.vo.Student;
import com.tftsa.itys.mypage.model.vo.SubData;
import com.tftsa.itys.mypage.model.vo.Tutor;
import com.tftsa.itys.mypage.model.vo.UserChattingroomStudent;
import com.tftsa.itys.mypage.model.vo.UserChattingroomTutor;

@Controller
public class MypageController {
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);

	@Autowired
	private MypageService mypageService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;

	// 학생 프로필 추가 페이지로 이동
	@RequestMapping(value = "upSPage.do")
	public ModelAndView moveStudentPage(@RequestParam("user_no") int user_no, ModelAndView mv) {
		logger.info("upSPage.do : "+user_no);
		mv.addObject("user_no", user_no);
		mv.setViewName("mypage/studentProfile");
		return mv;
	}

	// 학생 프로필 추가
	@RequestMapping(value = "upsprofile.do", method = RequestMethod.POST)
	public String insertStudentProfile( Model model, Student student,
			HttpServletRequest request, HttpServletResponse response, @RequestParam(name="upfile", required = false) MultipartFile mfile,
			@RequestParam(name="stime") String stime, @RequestParam(name="etime") String etime) throws Exception {
		
		// 업로드된 파일 저장 폴더 지정
		String savePath = request.getSession().getServletContext().getRealPath("resources/images/mypage/studentImg");
		if(!mfile.isEmpty()) {
			String originFileName = mfile.getOriginalFilename();
			if(originFileName!= null && originFileName.length()>0) {
//				logger.info(savePath);
//				logger.info("upsprofile.do : "+originFileName);
//				logger.info("getSize() : "+mfile.getSize());
//				logger.info("getInputStream() : "+mfile.getInputStream());
				try {
					mfile.transferTo(new File(savePath+"\\"+originFileName));
					
					String renameFileName = (Integer.toString(student.getUser_no()));
					renameFileName += "."+originFileName.substring(originFileName.lastIndexOf(".")+1);
					
					File originFile = new File(savePath + "\\" + originFileName);
					File renameFile = new File(savePath + "\\" + renameFileName);
					
					if(!originFile.renameTo(renameFile)) {
						FileInputStream fin = new FileInputStream(originFile);
						FileOutputStream fout = new FileOutputStream(renameFile);
						
						int data = -1;
						byte[] buffer = new byte[1024];

						while ((data = fin.read(buffer, 0, buffer.length)) != -1) {
							fout.write(buffer, 0, buffer.length);
						}

						fin.close();
						fout.close();
						originFile.delete();
					}
					student.setPic(renameFileName);
					
				}catch(Exception e) {
					e.printStackTrace();
					model.addAttribute("message", "전송파일 저장 실패");
					return "common/error";
				}
			}// 업로드된 파일 있음
			//student.setOriginal_filename(originFileName);
		}// 첨부 파일 있음
		
		student.setTime(stime+", "+etime);
		logger.info("upsprofile.do : "+student);
		
		if((mypageService.insertStudent(student) & mypageService.updateStudentPosition(student.getUser_no()))>0) {
			PrintWriter out = response.getWriter();
			String str = "";
			str = "<script language='javascript'>";
			str += "opener.window.location.reload();"; // 오프너 새로고침
			str += "self.close();"; // 창닫기
			str += "</script>";
			out.print(str);
			return null;
		}else {
			model.addAttribute("message", "학생 프로필 추가 실패...");
			return "common/error";
		}
	}

	// 선생님 프로필 추가 페이지로 이동
	@RequestMapping(value = "upTPage.do")
	public ModelAndView moveTutorPage(@RequestParam("user_no") int user_no, ModelAndView mv) {
		List<MyKeyword> keyList = mypageService.selectKeywordList();
		logger.info("upTPage.do");
		
		mv.addObject("keyList", keyList);
		mv.addObject("user_no", user_no);
		
		mv.setViewName("mypage/tutorProfile");
		return mv;
	}

	// 선생님 프로필 추가
	@RequestMapping(value = "uptprofile.do", method = RequestMethod.POST)
	public String insertTutorProfile(Tutor tutor, SubData subdata, MyKeyData keydata, Model model, HttpServletRequest request, HttpServletResponse response, 
			@RequestParam(name="upfile") MultipartFile mfile, @RequestParam("sub_no") String arr_sub_no, 
			@RequestParam(name="stime") String stime, @RequestParam(name="etime") String etime, 
			@RequestParam(name="city") String city, @RequestParam(name="country") String country, @RequestParam(name="key_no") String arr_key_no) throws IOException {
//		logger.info("stime : "+stime);
//		logger.info("etime : "+etime);
//		logger.info("city : "+city);
//		logger.info("country : "+country);
//		logger.info("sub_no : "+arr_sub_no);
		
		tutor.setTime(stime+", "+etime);
		tutor.setArea(city+" "+country);
		
		String[] array = arr_sub_no.split(",");
	    int cnt=0;
	    String sub_name ="";
		
	    // 과목번호 subdata에 저장, tutor 테이블 subname 
		for(int i=0;i<array.length;i++) {
			//logger.info("array["+i+"] : "+array[i]);
			int sub_no = Integer.parseInt(array[i]);
			subdata.setSub_no(sub_no);
			if(mypageService.insertSubData(subdata)>0) {
				if(i == 0) {
					sub_name += mypageService.selectSubName(sub_no);
				}else {
					sub_name += (", "+ mypageService.selectSubName(sub_no));
				}
			}
		}  
		
		String[] array2 = arr_key_no.split(",");
		String key_name="";
		// 선생님 성격 key_data 에 저장, tutor 테이블 key_name 
		for(int i=0;i<array2.length;i++) {
			//logger.info("array["+i+"] : "+array2[i]);
			int key_no = Integer.parseInt(array2[i]);
			keydata.setKey_no(key_no);
			if(mypageService.insertKeyData(keydata)>0) {
				if(i == 0) {
					key_name += mypageService.selectTypePer(key_no);
				}else {
					key_name += (", "+ mypageService.selectTypePer(key_no));
				}
			}
		}
		//logger.info("insertSub_data cnt : " + cnt);
		tutor.setSub_name(sub_name);
		tutor.setKey_name(key_name);
		tutor.setTime(stime + ", " + etime);

		String savePath = request.getSession().getServletContext().getRealPath("resources/images/mypage/tutorImg");
		if (!mfile.isEmpty()) {
			String originFileName = mfile.getOriginalFilename();
			if (originFileName != null && originFileName.length() > 0) {
//				logger.info(savePath);
//				logger.info("upsprofile.do : " + originFileName);
//				logger.info("getSize() : " + mfile.getSize());
//				logger.info("getInputStream() : " + mfile.getInputStream());
				try {
					mfile.transferTo(new File(savePath + "\\" + originFileName));

					String renameFileName = (Integer.toString(tutor.getUser_no()));
					renameFileName += "." + originFileName.substring(originFileName.lastIndexOf(".") + 1);

					File originFile = new File(savePath + "\\" + originFileName);
					File renameFile = new File(savePath + "\\" + renameFileName);

					if (!originFile.renameTo(renameFile)) {
						FileInputStream fin = new FileInputStream(originFile);
						FileOutputStream fout = new FileOutputStream(renameFile);

						int data = -1;
						byte[] buffer = new byte[1024];

						while ((data = fin.read(buffer, 0, buffer.length)) != -1) {
							fout.write(buffer, 0, buffer.length);
						}

						fin.close();
						fout.close();
						originFile.delete();
					}
					tutor.setPic(renameFileName);

				} catch (Exception e) {
					e.printStackTrace();
					model.addAttribute("message", "전송파일 저장 실패");
					return "common/error";
				}
			} // 업로드된 파일 있음
				// tutor.setOriginal_filename(originFileName);
		} // 첨부 파일 있음

		logger.info("upsprofile.do : " + tutor);

		if((mypageService.insertTutor(tutor) & mypageService.updateTutorPosition(tutor.getUser_no()))>0) {
			PrintWriter out = response.getWriter();
			String str = "";
			str = "<script language='javascript'>";
			str += "opener.window.location.reload();"; // 오프너 새로고침
			str += "self.close();"; // 창닫기
			str += "</script>";
			out.print(str);
			return null;
		}else {
			model.addAttribute("message", "학생 프로필 추가 실패...");
			return "common/error";
		}
	}

	// 찜목록 조회
	@RequestMapping("wishl.do")
	public String moveWishList(@RequestParam("user_no") int user_no, Model model) {
		logger.info("wishl.do user_no : "+user_no);
		ArrayList<Likes> list = mypageService.selectLikesList(user_no);
		if(mypageService.selectPosition(user_no).equals("T")) {
			Tutor tutor = mypageService.selectTutor(user_no);
			model.addAttribute("tutor", tutor);
		}else if(mypageService.selectPosition(user_no).equals("S")) {
			Student student = mypageService.selectStudent(user_no);
			model.addAttribute("student", student);
		}
		if (list.size() > 0) {
			logger.info("wishList : " + list.toString());
			model.addAttribute("list", list);
		}else {
			model.addAttribute("message", "등록된 찜이 없습니다");
		}
		return "mypage/wishList";
	}
	
	// 찜 목록 삭제 
	@RequestMapping("delwlist.do")
	public String deleteWishList(@RequestParam("chk") String checkedList, Likes likes) {
		//logger.info("delwlist.do : "+checkedList);
		logger.info("delwlist.do likes : "+likes.toString());
		
		String[] array = checkedList.split(",");
	    for(int i=0 ;i<array.length; i++) {
	    	//logger.info(array[i]);
	    	likes.setTutor_no(Integer.parseInt(array[i]));
	    	if(mypageService.deleteLikes(likes)>0) {
	    		//logger.info("delwlist.do delete["+i+"] : "+array[i]);
	    	}
	    }
		
		return "redirect:wishl.do?user_no="+likes.getStudent_no();
	}

	// 채팅 목록 조회
	@RequestMapping("clist.do")
	public String moveChattingList(@RequestParam("user_no") int user_no, ModelAndView mv) {
		logger.info("clist.do");
		return "redirect:selectChattingList.do?user_no=" + user_no;
	}
	
	// 채팅 목록 삭제
	@RequestMapping(value="delclist.do", method=RequestMethod.POST)
	public String deleteChattingList(@RequestParam("chk") String checkedList, @RequestParam("user_no") int user_no) {
		//logger.info("delclist.do : "+checkedList);
		//logger.info("user_no : "+user_no);
		
		String[] array = checkedList.split(",");
	    for(int i=0 ;i<array.length; i++) {
	    	//logger.info(array[i]);
	    	
	    	if(mypageService.deleteChattingRoom(Integer.parseInt(array[i]))>0) {
	    		//logger.info("delclist.do delete["+i+"] : "+array[i]);
	    	}
	    }
		
		return "redirect:clist.do?user_no="+user_no;
	}
	
	// 내 수업 목록 조회
	@RequestMapping("mclass.do")
	public String moveMyClass(@RequestParam("user_no") int user_no, Model model) {
		logger.info("mclass.do");
		ArrayList<MyClass> list = mypageService.selectMyclassList(user_no);
		if(mypageService.selectPosition(user_no).equals("T")) {
			Tutor tutor = mypageService.selectTutor(user_no);
			model.addAttribute("tutor", tutor);
		}else if(mypageService.selectPosition(user_no).equals("S")) {
			Student student = mypageService.selectStudent(user_no);
			model.addAttribute("student", student);
		}		
		String position = mypageService.selectPosition(user_no);
		model.addAttribute("position", position);
		
		if(list.size()>0) {
			//logger.info("myclassList : "+list.toString());
			model.addAttribute("list", list);
		}else {
			model.addAttribute("message", "등록된 수업목록이 없습니다");
		}
		return "mypage/myClass";
	}
	
	// 수정페이지로 이동
	@RequestMapping("upUserPage.do")
	public ModelAndView moveUpdateUserView(@RequestParam("user_id") String user_id, ModelAndView mv) {
		logger.info("upUserPage.do");
		Member member = mypageService.selectUser(user_id);
		Student student = mypageService.selectStudent(member.getUser_no());
		Tutor tutor = mypageService.selectTutor(member.getUser_no());
				
		List<Subject> subjectList = mypageService.selectSubjectList();
		List<MyKeyword> keyList = mypageService.selectKeywordList();
		//logger.info(subjectList.toString());
		
		
		if(member != null && (student != null || tutor != null)) {
			mv.addObject("member", member);
			mv.addObject("subjectList", subjectList);
			mv.addObject("keyList", keyList);
			if(member.getUser_position().equals("S")) {
				mv.addObject("student", student);
			}else if(member.getUser_position().equals("T")) {
				String str = tutor.getTime();
				String[] array = str.split(",");
				String stime = array[0];
				String etime = array[1];
				//logger.info("upUserPage.do : stime, etime "+stime+", "+etime);
				mv.addObject("stime", stime);
				mv.addObject("etime", etime);
				mv.addObject("tutor", tutor);
			}
			mv.setViewName("mypage/updateProfile");
		}else if(member != null && (student == null && tutor == null)){
			mv.addObject("member", member);
			mv.setViewName("mypage/updateProfile");
		}else {
			mv.addObject("message", member.getUser_id() + "님 회원 정보 수정페이지로 이동 실패..");
			mv.setViewName("common/error");
		}
		return mv;
	}
	
	// 수정하기
	@RequestMapping(value = "upUser.do", method = RequestMethod.POST)
	public String updateUser(Member member, Student student, Tutor tutor, SubData subdata, MyKeyData keydata, Model model,
			@RequestParam("origin_userpwd") String originUserpwd, @RequestParam("stime") String stime, @RequestParam("etime") String etime,
			@RequestParam("city") String city, @RequestParam("country") String country,
			@RequestParam("sub_no") String arr_sub_no, @RequestParam("key_no")String arr_key_no) throws IOException {
//		logger.info("upUser.do - member : " + member);
//		logger.info("upUser.do - student : " + student);
//		logger.info("upUser.do - tutor : " + tutor);
//		logger.info("opwd : " + originUserpwd);
//		logger.info("stime : "+stime);
//		logger.info("etime : "+etime);
//		logger.info("city : "+city);
//		logger.info("country : "+country);
//		logger.info("sub_no : "+arr_sub_no);
		
		tutor.setTime(stime+", "+etime);
		tutor.setArea(city+" "+country);
		
		String []array = arr_sub_no.split(",");
		String sub_name="";
		// 과목번호 subdata에 저장, tutor 테이블 subname 
		if (mypageService.deleteSubData(member.getUser_no()) > 0) {
			//logger.info("upUser.do : deleteSubData");
		}
		for (int i = 0; i < array.length; i++) {
			//logger.info("array[" + i + "] : " + array[i]);
			int sub_no = Integer.parseInt(array[i]);
			subdata.setSub_no(sub_no);
			if (mypageService.insertSubData(subdata) > 0) {
				if (i == 0) {
					sub_name += mypageService.selectSubName(sub_no);
				} else {
					sub_name += (", " + mypageService.selectSubName(sub_no));
				}
			}
		}
		String[] array2 = arr_key_no.split(",");
		String key_name="";
		if(mypageService.deleteKeyData(member.getUser_no())>0) {
			//logger.info(key_name);
		}
		// 선생님 성격 key_data 에 저장, tutor 테이블 key_name 
		for(int i=0;i<array2.length;i++) {
			//logger.info("array["+i+"] : "+array2[i]);
			int key_no = Integer.parseInt(array2[i]);
			keydata.setKey_no(key_no);
			if(mypageService.insertKeyData(keydata)>0) {
				if(i == 0) {
					key_name += mypageService.selectTypePer(key_no);
				}else {
					key_name += (", "+ mypageService.selectTypePer(key_no));
				}
			}
		}
		
		tutor.setSub_name(sub_name);
		tutor.setKey_name(key_name);
		//logger.info("uptprofile.do : "+tutor);

		// 새로운 암호가 전송이 왔다면
		String user_pwd = member.getUser_pwd().trim();
		if (user_pwd != null && user_pwd.length() > 0) {
			// 기존 암호와 다른 값이면 암호화 처리를 해라
			if (!bcryptPasswordEncoder.matches(user_pwd, originUserpwd)) {
				member.setUser_pwd(bcryptPasswordEncoder.encode(user_pwd));
			}
		} else {
			// 새로운 암호값이 전송오지 않았다면 원래 암호를 기록
			member.setUser_pwd(originUserpwd);
		}
		
		member.setUser_position(mypageService.selectPosition(member.getUser_no()));
		logger.info("after : " + member);
		
		if(member.getUser_position().equals("U") && mypageService.updateMember(member)>0) {
			logger.info("upUser.do : updateUser \nmember : "+member);
			return "redirect:myPage.do?user_id=" + member.getUser_id();
		}else if(member.getUser_position().equals("S") && mypageService.updateStudent(student)>0) {
			logger.info("upUser.do : updateStudent \nstudent : "+student);
			return "redirect:myPage.do?user_id=" + member.getUser_id();
		}else if(member.getUser_position().equals("T") && mypageService.updateTutor(tutor)>0) {
			logger.info("upUser.do : updateTutor \ntutor : "+tutor);
			return "redirect:myPage.do?user_id=" + member.getUser_id();
		} else {
			model.addAttribute("message", member.getUser_id() + "회원정보 수정 실패..");
			return "common/error";
		}
	}

	// 채팅 목록 조회 컨트롤러
	@RequestMapping("selectChattingList.do")
	public String selectChattingList(Model model, @RequestParam("user_no") int user_no) {

		ArrayList<UserChattingroomTutor> userchattingroomtutor = mypageService.selectChattingStudentList(user_no);
       	 	ArrayList<UserChattingroomStudent> userchattingroomstudent = mypageService.selectChattingTutorList(user_no);
		logger.info("selectChattingList.do");
		
		if(mypageService.selectPosition(user_no).equals("T")) {
			Tutor tutor = mypageService.selectTutor(user_no);
			model.addAttribute("tutor", tutor);
		}else if(mypageService.selectPosition(user_no).equals("S")) {
			Student student = mypageService.selectStudent(user_no);
			model.addAttribute("student", student);
		}	
		String position = mypageService.selectPosition(user_no);
		model.addAttribute("position", position);

		
		if (userchattingroomtutor.size() > 0) {
			model.addAttribute("userchattingroomtutor", userchattingroomtutor);
			return "mypage/chattingList";
		} else if(userchattingroomstudent.size() > 0) {
			model.addAttribute("userchattingroomstudent", userchattingroomstudent);
			return "mypage/chattingList";
		} else {
			model.addAttribute("message", "등록된 채팅목록 정보가 없습니다.");
			return "mypage/chattingList";
		}
	}
}
