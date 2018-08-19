package com.sc.action;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.sc.dao.enteringCourseDao;
import com.sc.dao.teacherDao;
import com.sc.model.course;

public class enteringCourseAction {
	
	private course courses;
	private enteringCourseDao enteringcoursedao;
	private String selectCourseId;
	private teacherDao teacherdao;
	private String selectClass;
	
	public String getSelectClass() {
		return selectClass;
	}
	public void setSelectClass(String selectClass) {
		this.selectClass = selectClass;
	}
	public teacherDao getTeacherdao() {
		return teacherdao;
	}
	public void setTeacherdao(teacherDao teacherdao) {
		this.teacherdao = teacherdao;
	}
	public String getSelectCourseId() {
		return selectCourseId;
	}
	public void setSelectCourseId(String selectCourseId) {
		this.selectCourseId = selectCourseId;
	}
	public course getCourses() {
		return courses;
	}
	public void setCourses(course courses) {
		this.courses = courses;
	}
	public enteringCourseDao getEnteringcoursedao() {
		return enteringcoursedao;
	}
	public void setEnteringcoursedao(enteringCourseDao enteringcoursedao) {
		this.enteringcoursedao = enteringcoursedao;
	}

	
	/**
	 * 录入新的课程
	 * @return
	 */
	public String enteringNewCourse(){
		/**
		 * 判断用户的session是否到期，到期就退出页面
		 */
		String adminId=(String) ActionContext.getContext().getSession().get("studentID");
		if(adminId==null)
			return "sessionIsNull";
		
		course luruCourse= getCourses();
		System.out.println("luruCourse"+luruCourse);
		System.out.println("luruCoursename"+luruCourse.getCourseName());
		getEnteringcoursedao().insertNewCourse(luruCourse);
		return "successEnteringCourse";
	}
	
	/**
	 * 查看已录入课程
	 * @return
	 */
	public String lookEnteredCourse(){
		
		/**
		 * 判断用户的session是否到期，到期就退出页面
		 */
		String adminId=(String) ActionContext.getContext().getSession().get("studentID");
		if(adminId==null)
			return "sessionIsNull";
		
		
		List allcourse=getEnteringcoursedao().findAllEnteredCourse();
		ActionContext.getContext().put("allcourse", allcourse);
		return "allcourse";
		
		
	}
	
	public String lookTeacherEnteredCourse(){
		/**
		 * 判断用户的session是否到期，到期就退出页面
		 */
		String adminId=(String) ActionContext.getContext().getSession().get("studentID");
		if(adminId==null)
			return "sessionIsNull";
		System.out.println("adminId77="+adminId);
		
		String teaName=teacherdao.getTeacherNameById(adminId);
		List allcourse=getEnteringcoursedao().findAllEnteredCourse(teaName);
		ActionContext.getContext().put("allcourse", allcourse);
		return "allcourse";
		
	}
	
	public String deleteCourseBycourseId(){
		
		/**
		 * 判断用户的session是否到期，到期就退出页面
		 */
		String adminId=(String) ActionContext.getContext().getSession().get("studentID");
		if(adminId==null)
			return "sessionIsNull";
		
		String selectClassIds=null;
		try {
			selectClassIds = new String(getSelectClass().getBytes("ISO-8859-1"),"utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String courseId=getSelectCourseId();
		System.out.println("courseId"+courseId);
		
		HashMap<String, Object> hash=new HashMap<String, Object>();
		hash.put("selectClassIds", selectClassIds);
		hash.put("courseId", courseId);
		
		getEnteringcoursedao().deleteCourseBycorseId(hash);
		/*getEnteringcoursedao().deleteCourseBycorseId(courseId);*/
		
		/**
		 * 获取已录入课程
		 */
		return "getAllCoourse";
		/*List allcourse=getEnteringcoursedao().findAllEnteredCourse();
		ActionContext.getContext().put("allcourse", allcourse);
		return "allcourse";*/
	}
	
	public String skipforwordjsp(){
		/**
		 * 判断用户的session是否到期，到期就退出页面
		 */
		String adminId=(String) ActionContext.getContext().getSession().get("studentID");
		if(adminId==null)
			return "sessionIsNull";
		
		
		return "skipToform_showcase";
		
	}
	
}
