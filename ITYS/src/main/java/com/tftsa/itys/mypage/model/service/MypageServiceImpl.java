package com.tftsa.itys.mypage.model.service;

import java.util.ArrayList;
import java.util.List;

import javax.security.auth.Subject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tftsa.itys.member.model.vo.Member;
import com.tftsa.itys.mypage.model.dao.MypageDao;
import com.tftsa.itys.mypage.model.vo.Likes;
import com.tftsa.itys.mypage.model.vo.MyClass;
import com.tftsa.itys.mypage.model.vo.MyKeyData;
import com.tftsa.itys.mypage.model.vo.MyKeyword;
import com.tftsa.itys.mypage.model.vo.Student;
import com.tftsa.itys.mypage.model.vo.SubData;
import com.tftsa.itys.mypage.model.vo.Tutor;
import com.tftsa.itys.mypage.model.vo.UserChattingroomStudent;
import com.tftsa.itys.mypage.model.vo.UserChattingroomTutor;

@Service("mypageService")
public class MypageServiceImpl implements MypageService{
	
	@Autowired
	private MypageDao mypageDao;

	@Override
	public ArrayList<Likes> selectLikesList(int user_no) {
		return mypageDao.selectLikesList(user_no);
	}

	@Override
	public ArrayList<MyClass> selectMyclassList(int user_no) {
		return mypageDao.selectMyclassList(user_no);
	}
	
	@Override
	public int insertTutor(Tutor tutor) {
		return mypageDao.insertTutor(tutor);
	}

	@Override
	public int updateTutorPosition(int user_no) {
		return mypageDao.updateTutorPosition(user_no);
	}

	@Override
	public int insertStudent(Student student) {
		return mypageDao.insertStudent(student);
	}

	@Override
	public int updateStudentPosition(int user_no) {
		return mypageDao.updateStudentPosition(user_no);
	}

	@Override
	public int insertSubData(SubData subdata) {
		return mypageDao.insertSubData(subdata);	
	}

	@Override
	public String selectSubName(int sub_no) {
		return mypageDao.selectSubName(sub_no);
	}

	@Override
	public int updateMember(Member member) {
		return mypageDao.updateMember(member);
	}

	@Override
	public int updateStudent(Student student) {
		return mypageDao.updateStudent(student);
	}

	@Override
	public int updateTutor(Tutor tutor) {
		return mypageDao.updateTutor(tutor);
	}

	@Override
	public Member selectUser(String user_id) {
		return mypageDao.selectUser(user_id);
	}

	@Override
	public Student selectStudent(int user_no) {
		return mypageDao.selectStudent(user_no);
	}

	@Override
	public Tutor selectTutor(int user_no) {
		return mypageDao.selectTutor(user_no);
	}

	@Override
	public ArrayList<Subject> selectSubjectList() {
		return mypageDao.selectSubjectList();
	}

	@Override
	public String selectPosition(int user_no) {
		return mypageDao.selectPosition(user_no);
	}

	@Override
	public int deleteSubData(int user_no) {
		return mypageDao.deleteSubData(user_no);
	}

	@Override
	public int deleteLikes(Likes likes) {
		return mypageDao.deleteLikes(likes);
	}

	@Override
	public ArrayList<UserChattingroomTutor> selectChattingStudentList(int user_no) {
		return mypageDao.selectChattingStudentList(user_no);
	}
	
	@Override
	public ArrayList<UserChattingroomStudent> selectChattingTutorList(int user_no) {
		return mypageDao.selectChattingTutorList(user_no);
	}

	@Override
	public List<MyKeyword> selectKeywordList() {
		return mypageDao.selectKeywordList();
	}

	@Override
	public int insertKeyData(MyKeyData keydata) {
		return mypageDao.insertKeyData(keydata);
	}

	@Override
	public String selectTypePer(int key_no) {
		return mypageDao.selectTypePer(key_no);
	}

	@Override
	public int deleteKeyData(int user_no) {
		return mypageDao.deleteKeyData(user_no);
	}

	@Override
	public int deleteChattingRoom(int chat_room_no) {
		return mypageDao.deleteChattingRoom(chat_room_no);
	}
	
}
