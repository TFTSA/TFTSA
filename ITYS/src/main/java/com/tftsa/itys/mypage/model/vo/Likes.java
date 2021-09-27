package com.tftsa.itys.mypage.model.vo;

public class Likes implements java.io.Serializable{
	private static final long serialVersionUID = 114L;
	
	private int like_no;
	private int student_no;
	private int tutor_no;
	
	public Likes() {}

	public Likes(int like_no, int student_no, int tutor_no) {
		super();
		this.like_no = like_no;
		this.student_no = student_no;
		this.tutor_no = tutor_no;
	}

	public int getLike_no() {
		return like_no;
	}

	public void setLike_no(int like_no) {
		this.like_no = like_no;
	}

	public int getStudent_no() {
		return student_no;
	}

	public void setStudent_no(int student_no) {
		this.student_no = student_no;
	}

	public int getTutor_no() {
		return tutor_no;
	}

	public void setTutor_no(int tutor_no) {
		this.tutor_no = tutor_no;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Likes [like_no=" + like_no + ", student_no=" + student_no + ", tutor_no=" + tutor_no + "]";
	}
	
	

}
