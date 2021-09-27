package com.tftsa.itys.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tftsa.itys.member.model.vo.Member;
import com.tftsa.itys.mypage.model.vo.Student;
import com.tftsa.itys.mypage.model.vo.Tutor;

@Repository("memberDao")
public class MemberDao {
	@Autowired
	private SqlSessionTemplate session;
	
	public int insertUser(Member member) {
		return session.insert("memberMapper.insertUser", member);
	}
	
	public int deleteUser(int user_no) {
		return session.delete("memberMapper.deleteUser", user_no);
	}
	
	public Member selectUser(String user_id) {
		return session.selectOne("memberMapper.selectUser", user_id);
	}

	public int selectIdCheck(String user_id) {
		return session.selectOne("memberMapper.selectIdCheck", user_id);
	}

	public String selectUserId(String user_email) throws Exception {
		return session.selectOne("memberMapper.selectUserId", user_email);
	}

	public int updateUserPwd(Member member) {
		return session.update("memberMapper.updateUserPwd", member);
	}

	public int selectEmailCheck(String user_email) {
		return session.selectOne("memberMapper.selectEmailCheck", user_email);
	}

	public Student selectStudent(int user_no) {
		return session.selectOne("mypageMapper.selectStudent", user_no);
	}

	public Tutor selectTutor(int user_no) {
		return session.selectOne("mypageMapper.selectTutor", user_no);
	}

	public Member selectEmail(String email) {
		return session.selectOne("memberMapper.selectEmail", email);
	}

	public Member selectUserNo(int user_no) {
		return session.selectOne("memberMapper.selectUserNo", user_no);
	}

}
