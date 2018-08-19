package com.sc.model;

public class sc {
		private int id;
		private String studentId;  //学号
		private String courseId;	//课程号
		private String courseClass; //班级
		private  String status;       //状态 
		//private float courseScore; 	//成绩
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		public String getStudentId() {
			return studentId;
		}
		public void setStudentId(String studentId) {
			this.studentId = studentId;
		}
		public String getCourseId() {
			return courseId;
		}
		public void setCourseId(String courseId) {
			this.courseId = courseId;
		}
		public String getCourseClass() {
			return courseClass;
		}
		public void setCourseClass(String courseClass) {
			this.courseClass = courseClass;
		}
		public String getStatus() {
			return status;
		}
		public void setStatus(String status) {
			this.status = status;
		}
		/*public float getCourseScore() {
			return courseScore;
		}
		public void setCourseScore(float courseScore) {
			this.courseScore = courseScore;
		}*/
		@Override
		public String toString() {
			return "sc [id=" + id + ", studentId=" + studentId + ", courseId="
					+ courseId + ", courseClass=" + courseClass + ", status="
					+ status + "]";
		}
		
		
		
}
