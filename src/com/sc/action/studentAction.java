package com.sc.action;

import java.util.HashMap;
import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.sc.dao.studentDao;
import com.sc.model.student;

public class studentAction {
	 private String studentName;
	private student students;
	public student getStudents() {
		return students;
	}
	public void setStudents(student students) {
		this.students = students;
	}
	
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	private studentDao studao;
	
	
	
	public studentDao getStudao() {
		return studao;
	}
	public void setStudao(studentDao studao) {
		this.studao = studao;
	}
	
	
	public String lookMyselfInfo(){
		//获取studentID
		String StudentID=(String) ActionContext.getContext().getSession().get("studentID");
		System.out.println("StudentID"+StudentID);
		if(StudentID==null)
			return "sessionTimeout";
		List list=(List) studao.lookmyselfInfoByStuId(StudentID);
		System.out.println();
		ActionContext.getContext().put("personInfo", list);
		//ActionContext.getContext().getSession().put("isOK", "");
		return "personInfo";
	}
	
	public String changeMyPasswd(){
		String Changepasswd=students.getPassword();
		System.out.println("Changepasswd="+Changepasswd);
		String StudentID=(String) ActionContext.getContext().getSession().get("studentID");
		if(StudentID==null)
			return "sessionTimeout";
		
		HashMap hashmap=new HashMap();
		hashmap.put("Changepasswd", Changepasswd);
		hashmap.put("StudentID", StudentID);
		boolean isChange= studao.changeMypasswordById(hashmap);
		
		List list=(List) studao.lookmyselfInfoByStuId(StudentID);
		ActionContext.getContext().put("personInfo", list);
		
		if(isChange==true){
			ActionContext.getContext().put("isOK", "OK");
			return "personInfo";
		}
		else{
			ActionContext.getContext().put("isOK", "ERROR");
			return "personInfo";
		}
		
		
	}
}
