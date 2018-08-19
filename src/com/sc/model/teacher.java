package com.sc.model;

public class teacher {
 
	private int id;
	private String  teacherId;
	private String teacherPassword;
	private String teacherName;
	private String  teacherSex;
	private String  teacherDegree;
	private String teachCourse;
	private String teacherPhone;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTeacherId() {
		return teacherId;
	}
	public void setTeacherId(String teacherId) {
		this.teacherId = teacherId;
	}
	public String getTeacherPassword() {
		return teacherPassword;
	}
	public void setTeacherPassword(String teacherPassword) {
		this.teacherPassword = teacherPassword;
	}
	public String getTeacherName() {
		return teacherName;
	}
	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}
	public String getTeacherSex() {
		return teacherSex;
	}
	public void setTeacherSex(String teacherSex) {
		this.teacherSex = teacherSex;
	}
	public String getTeacherDegree() {
		return teacherDegree;
	}
	public void setTeacherDegree(String teacherDegree) {
		this.teacherDegree = teacherDegree;
	}
	public String getTeachCourse() {
		return teachCourse;
	}
	public void setTeachCourse(String teachCourse) {
		this.teachCourse = teachCourse;
	}
	public String getTeacherPhone() {
		return teacherPhone;
	}
	public void setTeacherPhone(String teacherPhone) {
		this.teacherPhone = teacherPhone;
	}
	@Override
	public String toString() {
		return "teacher [id=" + id + ", teacherId=" + teacherId
				+ ", teacherPassword=" + teacherPassword + ", teacherName="
				+ teacherName + ", teacherSex=" + teacherSex
				+ ", teacherDegree=" + teacherDegree + ", teachCourse="
				+ teachCourse + ", teacherPhone=" + teacherPhone + "]";
	}
}
