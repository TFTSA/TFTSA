package com.tftsa.itys.member.model.service;

import javax.servlet.http.HttpServletResponse;

import com.tftsa.itys.member.model.vo.Member;
import com.tftsa.itys.mypage.model.vo.Student;
import com.tftsa.itys.mypage.model.vo.Tutor;

public interface MemberService {
	int insertUser(Member member);
	int deleteUser(int user_no);
	Member selectUser(String user_id);
	int selectIdCheck(String user_id);
	int selectEmailCheck(String user_email);
	String selectUserId(HttpServletResponse response, String user_email) throws Exception;
	void send_mail(Member member, String div) throws Exception;
	void findUserPwd(HttpServletResponse response, Member member) throws Exception;
	int updateUserPwd(Member member);
	Student selectStudent(int user_no);
	Tutor selectTutor(int user_no);
	Member selectEmail(String email);
	Member selectUserNo(int user_no);
}
