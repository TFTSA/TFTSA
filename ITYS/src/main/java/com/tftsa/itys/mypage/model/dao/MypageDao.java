package com.tftsa.itys.mypage.model.dao;

import java.util.ArrayList;
import java.util.List;

import javax.security.auth.Subject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tftsa.itys.member.model.vo.Member;
import com.tftsa.itys.mypage.model.vo.Likes;
import com.tftsa.itys.mypage.model.vo.MyClass;
import com.tftsa.itys.mypage.model.vo.MyKeyData;
import com.tftsa.itys.mypage.model.vo.MyKeyword;
import com.tftsa.itys.mypage.model.vo.Student;
import com.tftsa.itys.mypage.model.vo.SubData;
import com.tftsa.itys.mypage.model.vo.Tutor;
import com.tftsa.itys.mypage.model.vo.UserChattingroomStudent;
import com.tftsa.itys.mypage.model.vo.UserChattingroomTutor;

@Repository("mypageDao")
public class MypageDao {
	@Autowired
	private SqlSessionTemplate session;

	public ArrayList<Likes> selectLikesList(int user_no) {
		List<Likes> list = session.selectList("mypageMapper.selectLikesList", user_no);
		return (ArrayList<Likes>)list;
	}
	
	public ArrayList<MyClass> selectMyclassList(int user_no){
		List<MyClass> list = session.selectList("mypageMapper.selectMyClassList", user_no);
		return (ArrayList<MyClass>)list;
	}

	public int insertTutor(Tutor tutor) {
		return session.insert("mypageMapper.insertTutor", tutor);
	}
	public int updateTutorPosition(int user_no) {
		return session.update("mypageMapper.updateTutorPosition", user_no);
	}

	public int insertStudent(Student student) {
		return session.insert("mypageMapper.insertStudent", student);
	}
	public int updateStudentPosition(int user_no) {
		return session.update("mypageMapper.updateStudentPosition", user_no);
	}

	public int insertSubData(SubData subdata) {
		return session.insert("mypageMapper.insertSubData", subdata);
	}

	public String selectSubName(int sub_no) {
		return session.selectOne("mypageMapper.selectSubName", sub_no);
	}

	public int updateMember(Member member) {
		return session.update("memberMapper.updateMember", member);
	}

	public int updateStudent(Student student) {
		return session.update("mypageMapper.updateStudent", student);
	}

	public int updateTutor(Tutor tutor) {
		return session.update("mypageMapper.updateTutor", tutor);
	}

	public Member selectUser(String user_id) {
		return session.selectOne("memberMapper.selectUser", user_id);
	}

	public Student selectStudent(int user_no) {
		return session.selectOne("mypageMapper.selectStudent", user_no);
	}

	public Tutor selectTutor(int user_no) {
		return session.selectOne("mypageMapper.selectTutor", user_no);
	}

	public ArrayList<Subject> selectSubjectList() {
		List<Subject> list = session.selectList("mypageMapper.selectSubjectList");
		return (ArrayList<Subject>)list;
	}

	public String selectPosition(int user_no) {
		return session.selectOne("memberMapper.selectPosition", user_no);
	}

	public int deleteSubData(int user_no) {
		return session.delete("mypageMapper.deleteSubData", user_no);
	}

	public int deleteLikes(Likes likes) {
		return session.delete("mypageMapper.deleteLikes", likes);
	}
	
	public ArrayList<UserChattingroomTutor> selectChattingStudentList(int user_no) {
		List<UserChattingroomTutor> list = session.selectList("mypageMapper.selectChattingStudentList", user_no);
		return (ArrayList<UserChattingroomTutor>)list;
	}
	
	public ArrayList<UserChattingroomStudent> selectChattingTutorList(int user_no) {
		List<UserChattingroomStudent> list = session.selectList("mypageMapper.selectChattingTutorList", user_no);
		return (ArrayList<UserChattingroomStudent>)list;
	}

	public List<MyKeyword> selectKeywordList() {
		List<MyKeyword> list = session.selectList("mypageMapper.selectKeywordList");
		return (ArrayList<MyKeyword>)list;
	}

	public int insertKeyData(MyKeyData keydata){
		return session.insert("mypageMapper.insertKeyData", keydata);
	}

	public String selectTypePer(int key_no) {
		return session.selectOne("mypageMapper.selectTypePer", key_no);
	}

	public int deleteKeyData(int user_no) {
		return session.delete("mypageMapper.deleteKeyData", user_no);
	}

	public int deleteChattingRoom(int chat_room_no) {
		return session.delete("mypageMapper.deleteChattingRoom", chat_room_no);
	}
}
