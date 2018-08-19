package com.sc.model;

public class course {
		private int id;
		private String courseId;	    //课程id
		private String courseName;	    //课程名称
		private float courseCredit;		//学分
		private String courseTeacher;	//老师
		private String courseClass;		//班级
		private String courseTime;		//开课时间
		private String coursePlace;		//上课地点
		private int courseCount;		//总选课人数
		private int courseOverplus;		//余量
		public String courseRemark;		//备注
		public String getCourseRemark() {
			return courseRemark;
		}
		public void setCourseRemark(String courseRemark) {
			this.courseRemark = courseRemark;
		}
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		public String getCourseId() {
			return courseId;
		}
		public void setCourseId(String courseId) {
			this.courseId = courseId;
		}
		public String getCourseName() {
			return courseName;
		}
		public void setCourseName(String courseName) {
			this.courseName = courseName;
		}
		public float getCourseCredit() {
			return courseCredit;
		}
		public void setCourseCredit(float courseCredit) {
			this.courseCredit = courseCredit;
		}
		public String getCourseTeacher() {
			return courseTeacher;
		}
		public void setCourseTeacher(String courseTeacher) {
			this.courseTeacher = courseTeacher;
		}
		public String getCourseTime() {
			return courseTime;
		}
		public void setCourseTime(String courseTime) {
			this.courseTime = courseTime;
		}
		public String getCoursePlace() {
			return coursePlace;
		}
		public void setCoursePlace(String coursePlace) {
			this.coursePlace = coursePlace;
		}
		public int getCourseCount() {
			return courseCount;
		}
		public void setCourseCount(int courseCount) {
			this.courseCount = courseCount;
		}
		public int getCourseOverplus() {
			return courseOverplus;
		}
		public void setCourseOverplus(int courseOverplus) {
			this.courseOverplus = courseOverplus;
		}
		public String getCourseClass() {
			return courseClass;
		}
		public void setCourseClass(String courseClass) {
			this.courseClass = courseClass;
		}
		@Override
		public String toString() {
			return "course [id=" + id + ", courseId=" + courseId
					+ ", courseName=" + courseName + ", courseCredit="
					+ courseCredit + ", courseTeacher=" + courseTeacher
					+ ", courseClass=" + courseClass + ", courseTime="
					+ courseTime + ", coursePlace=" + coursePlace
					+ ", courseCount=" + courseCount + ", courseOverplus="
					+ courseOverplus + ", courseRemark=" + courseRemark + "]";
		}
		
		
		
}
