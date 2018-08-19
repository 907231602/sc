package com.sc.action;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.sc.dao.enteringCourseDao;
import com.sc.dao.modifyCourseDao;
import com.sc.model.course;

public class modifyCourseAction {
	
	private String selectCourseId;  //被选中的课程ID
	private String selectClass;
	private modifyCourseDao modifycoursedao;
	private course courses;
	private enteringCourseDao enteringcoursedao;
	
	
	public String getSelectClass() {
		return selectClass;
	}

	public void setSelectClass(String selectClass) {
		this.selectClass = selectClass;
	}

	public enteringCourseDao getEnteringcoursedao() {
		return enteringcoursedao;
	}

	public void setEnteringcoursedao(enteringCourseDao enteringcoursedao) {
		this.enteringcoursedao = enteringcoursedao;
	}

	public modifyCourseDao getModifycoursedao() {
		return modifycoursedao;
	}

	public void setModifycoursedao(modifyCourseDao modifycoursedao) {
		this.modifycoursedao = modifycoursedao;
	}

	public course getCourses() {
		return courses;
	}

	public void setCourses(course courses) {
		this.courses = courses;
	}

	public String getSelectCourseId() {
		return selectCourseId;
	}

	public void setSelectCourseId(String selectCourseId) {
		this.selectCourseId = selectCourseId;
	}



	public String selectCourseByCourseId(){
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
		System.out.println("courseId="+selectCourseId+" courseClass="+selectClassIds);
		
		HashMap<String,Object> hash =new HashMap<String, Object>();
		hash.put("selectCourseId", selectCourseId);
		hash.put("selectClassIds", selectClassIds);
		List<course> listcourse= modifycoursedao.selectCoursesById(hash);
	/*	List<course> listcourse= modifycoursedao.selectCoursesById(selectCourseId);*/
		System.out.println("listcourse"+listcourse);
		ActionContext.getContext().put("listcourse", listcourse);
		return "listModifycourse";
	}
	
	public String modifyOldCourse(){
		
		/**
		 * 判断用户的session是否到期，到期就退出页面
		 */
		String adminId=(String) ActionContext.getContext().getSession().get("studentID");
		if(adminId==null)
			return "sessionIsNull";
		
		
		System.out.println("课程名id="+getCourses().getId());
		int cid=getCourses().getId();
		getModifycoursedao().updateOldCourse(getCourses());
		
		/**
		 * 获取已修改好的课程
		 */
		List<course> courselist=getModifycoursedao().getCourselistByid(cid);
		
		ActionContext.getContext().put("updateOk","success");
		ActionContext.getContext().put("listcourse", courselist);
		return "updateOk";
	}
	
}
