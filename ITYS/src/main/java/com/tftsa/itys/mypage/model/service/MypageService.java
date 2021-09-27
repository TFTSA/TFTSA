package com.tftsa.itys.mypage.model.service;

import java.util.ArrayList;
import java.util.List;

import javax.security.auth.Subject;

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

public interface MypageService {

	ArrayList<Likes> selectLikesList(int user_no);
	ArrayList<MyClass> selectMyclassList(int user_no);
	int insertTutor(Tutor tutor);
	int updateTutorPosition(int user_no);
	int insertStudent(Student student);
	int updateStudentPosition(int user_no);
	int insertSubData(SubData subdata);
	String selectSubName(int sub_no);
	int updateMember(Member member);
	int updateStudent(Student student);
	int updateTutor(Tutor tutor);
	Member selectUser(String user_id);
	Student selectStudent(int user_no);
	Tutor selectTutor(int user_no);
	ArrayList<Subject> selectSubjectList();
	String selectPosition(int user_no);
	int deleteSubData(int user_no);
	int deleteLikes(Likes likes);
	ArrayList<UserChattingroomTutor> selectChattingStudentList(int user_no);
	ArrayList<UserChattingroomStudent> selectChattingTutorList(int user_no);
	List<MyKeyword> selectKeywordList();
	int insertKeyData(MyKeyData keydata);
	String selectTypePer(int key_no);
	int deleteKeyData(int user_no);
	int deleteChattingRoom(int parseInt);

}
