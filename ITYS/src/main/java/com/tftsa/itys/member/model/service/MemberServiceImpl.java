package com.tftsa.itys.member.model.service;

import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tftsa.itys.member.model.dao.MemberDao;
import com.tftsa.itys.member.model.vo.Member;
import com.tftsa.itys.mypage.model.vo.Student;
import com.tftsa.itys.mypage.model.vo.Tutor;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao memberDao;

	@Override
	public int insertUser(Member member) {
		return memberDao.insertUser(member);
	}

	@Override
	public int deleteUser(int user_no) {
		return memberDao.deleteUser(user_no);
	}

	@Override
	public Member selectUser(String user_id) {
		return memberDao.selectUser(user_id);
	}

	@Override
	public int selectIdCheck(String user_id) {
		return memberDao.selectIdCheck(user_id);
	}

	@Override
	public int selectEmailCheck(String user_email) {
		return memberDao.selectEmailCheck(user_email);
	}
	@Override
	public String selectUserId(HttpServletResponse response, String user_email) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String id = memberDao.selectUserId(user_email);

		if (id == null) {
			out.println("<script>");
			out.println("alert('가입된 아이디가 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		} else {
			return id;
		}
	}

	// 이메일 발송
	@Override
	public void send_mail(Member member, String div) throws Exception {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com";
		String hostSMTPid = "jooo9898@naver.com";
		String hostSMTPpwd = "XQR6EHLYW6H8";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "jooo9898@naver.com";
		String fromName = "난 선생이고, 넌 학생이야";
		String subject = "itys 임시 비밀번호 발송";
		String msg = "";

		// 메일 내용
		msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
		msg += "<h3 style='color: blue;'>";
		msg += member.getUser_id() + "님 임시 비밀번호입니다. <br>비밀번호를 변경하여 사용하세요.</h3>";
		msg += "<p>임시 비밀번호 : ";
		msg += member.getUser_pwd() + "</p><br></div>";

		// 받는 사람 E-Mail 주소
		String mail = member.getUser_email();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(587);

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, member.getUser_name());
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}

	@Override
	public void findUserPwd(HttpServletResponse response, Member member) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		// 아이디가 없으면
		if(memberDao.selectIdCheck(member.getUser_id()) == 0) {
			out.print("아이디가 없습니다.");
			out.close();
		}
		// 가입에 사용한 이메일이 아니면
		else if(!member.getUser_email().equals(memberDao.selectUser(member.getUser_id()).getUser_email())) {
			out.print("잘못된 이메일 입니다.");
			out.close();
		}else {
			// 임시 비밀번호 생성
			String pw = "";
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}
			member.setUser_pwd(pw);
			// 비밀번호 변경
			memberDao.updateUserPwd(member);
			// 비밀번호 변경 메일 발송
			send_mail(member, "find_pw");
			
			out.print("이메일로 임시 비밀번호를 발송하였습니다.");
			out.close();
		}

	}

	@Override
	public int updateUserPwd(Member member) {
		return memberDao.updateUserPwd(member);
	}

	@Override
	public Student selectStudent(int user_no) {
		return memberDao.selectStudent(user_no);
	}

	@Override
	public Tutor selectTutor(int user_no) {
		return memberDao.selectTutor(user_no);
	}

	@Override
	public Member selectEmail(String email) {
		return memberDao.selectEmail(email);
	}

	@Override
	public Member selectUserNo(int user_no) {
		return memberDao.selectUserNo(user_no);
	}


}
