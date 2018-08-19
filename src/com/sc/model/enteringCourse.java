package com.sc.model;

public class enteringCourse {
	private int id;
	private String courseEnterId;	    //课程id
	private String courseEnterName;	    //课程名称
	private float courseEnterCredit;		//学分
	private String courseEnterTeacher;	//老师
	private String courseEnterClass;		//班级
	private String courseEnterTime;		//开课时间
	private String courseEnterPlace;		//上课地点
	private int courseEnterCount;		//总选课人数
	public String courseEnterRemark;	  //备注
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCourseEnterId() {
		return courseEnterId;
	}
	public void setCourseEnterId(String courseEnterId) {
		this.courseEnterId = courseEnterId;
	}
	public String getCourseEnterName() {
		return courseEnterName;
	}
	public void setCourseEnterName(String courseEnterName) {
		this.courseEnterName = courseEnterName;
	}
	public float getCourseEnterCredit() {
		return courseEnterCredit;
	}
	public void setCourseEnterCredit(float courseEnterCredit) {
		this.courseEnterCredit = courseEnterCredit;
	}
	public String getCourseEnterTeacher() {
		return courseEnterTeacher;
	}
	public void setCourseEnterTeacher(String courseEnterTeacher) {
		this.courseEnterTeacher = courseEnterTeacher;
	}
	public String getCourseEnterClass() {
		return courseEnterClass;
	}
	public void setCourseEnterClass(String courseEnterClass) {
		this.courseEnterClass = courseEnterClass;
	}
	public String getCourseEnterTime() {
		return courseEnterTime;
	}
	public void setCourseEnterTime(String courseEnterTime) {
		this.courseEnterTime = courseEnterTime;
	}
	public String getCourseEnterPlace() {
		return courseEnterPlace;
	}
	public void setCourseEnterPlace(String courseEnterPlace) {
		this.courseEnterPlace = courseEnterPlace;
	}
	public int getCourseEnterCount() {
		return courseEnterCount;
	}
	public void setCourseEnterCount(int courseEnterCount) {
		this.courseEnterCount = courseEnterCount;
	}
	public String getCourseEnterRemark() {
		return courseEnterRemark;
	}
	public void setCourseEnterRemark(String courseEnterRemark) {
		this.courseEnterRemark = courseEnterRemark;
	}
	@Override
	public String toString() {
		return "enteringCourse [id=" + id + ", courseEnterId=" + courseEnterId
				+ ", courseEnterName=" + courseEnterName
				+ ", courseEnterCredit=" + courseEnterCredit
				+ ", courseEnterTeacher=" + courseEnterTeacher
				+ ", courseEnterClass=" + courseEnterClass
				+ ", courseEnterTime=" + courseEnterTime
				+ ", courseEnterPlace=" + courseEnterPlace
				+ ", courseEnterCount=" + courseEnterCount
				+ ", courseEnterRemark=" + courseEnterRemark + "]";
	}
}
