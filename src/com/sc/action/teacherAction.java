package com.sc.action;

import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.sc.dao.teacherDao;
import com.sc.model.teacher;

public class teacherAction {
    private teacher teachers;
    private teacherDao teacherdao;
	private String password;
	

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public teacher getTeachers() {
		return teachers;
	}

	public void setTeachers(teacher teachers) {
		this.teachers = teachers;
	}

	public teacherDao getTeacherdao() {
		return teacherdao;
	}

	public void setTeacherdao(teacherDao teacherdao) {
		this.teacherdao = teacherdao;
	}
	
	
      public String lookteacherInfo(){
    	  //studentID在这里是对应登陆的老师Id
    	String teacherId=  (String) ActionContext.getContext().getSession().get("studentID");
		if(teacherId==null)
			return "sessionIsNull";
    	List teacherListinfo=teacherdao.findteacherInfoById(teacherId);
		ActionContext.getContext().put("teacherListinfo", teacherListinfo);
		     return "teacherListinfo";
		
	    }
      
      public String changeTeacherPasswd(){
    	String teacherId=  (String) ActionContext.getContext().getSession().get("studentID");
    	if(teacherId==null)
			return "sessionIsNull";
    	
    	String teacherPs=  getPassword();
    	teacherdao.changeTeacherPs(teacherPs,teacherId);
    	//ActionContext.getContext().put("isOK","OK");
		return "toTeacherJsp";
		
    	  
      }
	
}
