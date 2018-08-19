package com.sc.action;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.sc.dao.selectedStudentDao;
import com.sc.dao.teacherDao;
import com.sc.model.student;
import com.sc.model.teacher;

public class selectedStudentAction {

	private student students;
	private selectedStudentDao selectedstudentdao;
	
	private teacher teachers;
	private teacherDao teacherdao;

	private String selectCourseName;
	private String selectCourseClass;
	
	 private String countPerpage3; //每页条数，外界可以设定
	 private String pageNum3;// 需要查询的页数
	 private int pageCount;//页数
		


	 
	 
	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	public String getCountPerpage3() {
		return countPerpage3;
	}

	public void setCountPerpage3(String countPerpage3) {
		this.countPerpage3 = countPerpage3;
	}

	public String getPageNum3() {
		return pageNum3;
	}

	public void setPageNum3(String pageNum3) {
		this.pageNum3 = pageNum3;
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
	public String getSelectCourseClass() {
		return selectCourseClass;
	}
	public void setSelectCourseClass(String selectCourseClass) {
		this.selectCourseClass = selectCourseClass;
	}
	public String getSelectCourseName() {
		return selectCourseName;
	}
	public void setSelectCourseName(String selectCourseName) {
		this.selectCourseName = selectCourseName;
	}
	public student getStudents() {
		return students;
	}
	public void setStudents(student students) {
		this.students = students;
	}
	public selectedStudentDao getSelectedstudentdao() {
		return selectedstudentdao;
	}
	public void setSelectedstudentdao(selectedStudentDao selectedstudentdao) {
		this.selectedstudentdao = selectedstudentdao;
	}
	
	/**
	 * 获取已选课的所有学生
	 * @return
	 */
	public String lookAllselectedStudent(){
		/**
		 * 判断用户的session是否到期，到期就退出页面
		 */
		String adminId=(String) ActionContext.getContext().getSession().get("studentID");
		if(adminId==null)
			return "sessionIsNull";
		
		/**
		 * 分页
		 */
		if(getPageNum3()==null){
			pageNum3 = "1";
		}
		if (countPerpage3==null) {
			countPerpage3="30";
		}
		//获取总条数
		int recordCount=getSelectedstudentdao().getCountSCStudentsInfo();
		System.out.println("总数recordCount"+recordCount);
		
		if(recordCount%Integer.parseInt(countPerpage3)!=0){
			pageCount = (recordCount/Integer.parseInt(countPerpage3))+1;
		}else {
			pageCount = (recordCount/Integer.parseInt(countPerpage3));
		}
 	
		HashMap<String,Object> hashMap = new HashMap<String, Object>();
		hashMap.put("start",(Integer.parseInt(pageNum3)-1)*Integer.parseInt(countPerpage3));
		hashMap.put("end", Integer.parseInt(pageNum3)*Integer.parseInt(countPerpage3));
		hashMap.put("countPerpage", Integer.parseInt(countPerpage3));
		
		
		List studentList=getSelectedstudentdao().getSCStudentsInfo(hashMap);
		ActionContext.getContext().put("studentList", studentList);
		ActionContext.getContext().put("pageCount",pageCount);
		ActionContext.getContext().put("pageNum3", pageNum3);
		ActionContext.getContext().put("recordCount", recordCount);
		ActionContext.getContext().put("countPerpage3", countPerpage3);
		return "studentListSUCCESS";
		
	}
	
	/**
	 * 根据选中的课程来显示信息
	 * @return
	 */
	public String selectedSCInfoByValue(){
		
		
		/**
		 * 判断用户的session是否到期，到期就退出页面
		 */
		String adminId=(String) ActionContext.getContext().getSession().get("studentID");
		if(adminId==null)
			return "sessionIsNull";
		
		String SCname=null;
		String SCclass=null;
		try {
			SCname=new String(getSelectCourseName().getBytes("iso-8859-1"),"UTF-8");
			SCclass=new String(getSelectCourseClass().getBytes("iso-8859-1"),"UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("SCname"+SCname+" SCclass="+SCclass);
		System.out.println("!SCclass"+!SCclass.equals(""));
		
		List scInfo =getSelectedstudentdao().findAllCourseNameBySCname(SCname,SCclass);
		System.out.println("list =scInfo "+scInfo);
		ActionContext.getContext().put("studentList", scInfo);
		return "studentListSUCCESS";
		
		}
	
	
	public void chooseCourseType(){
		System.out.println("hello");
		HttpServletResponse response = ServletActionContext.getResponse();
        response.setCharacterEncoding("utf-8"); 
       
    	PrintWriter printwriter = null;
    	try {
    		System.out.println("hello");
			printwriter = response.getWriter();
			List courseType=getSelectedstudentdao().findCourseType();
			System.out.println("courseType"+courseType);
    		
			printwriter.print(JSONArray.fromObject(courseType));
		System.out.println("json hello");
			printwriter.flush();
			printwriter.close();
		} catch (Exception e) {
          e.printStackTrace();
		}
		
	}
	
	public String lookAllRegisteredStudent(){
		/**
		 * 判断用户的session是否到期，到期就退出页面
		 */
		String adminId=(String) ActionContext.getContext().getSession().get("studentID");
		if(adminId==null)
			return "sessionIsNull";
		
		/**
		 * 分页
		 */
		if(getPageNum3()==null){
			pageNum3 = "1";
		}
		if (countPerpage3==null) {
			countPerpage3="30";
		}
		//获取总条数
		int recordCount=getSelectedstudentdao().getCountStudentsNumber();
		System.out.println("总数recordCount"+recordCount);
		
		if(recordCount%Integer.parseInt(countPerpage3)!=0){
			pageCount = (recordCount/Integer.parseInt(countPerpage3))+1;
		}else {
			pageCount = (recordCount/Integer.parseInt(countPerpage3));
		}
 	
		HashMap<String,Object> hashMap = new HashMap<String, Object>();
		hashMap.put("start",(Integer.parseInt(pageNum3)-1)*Integer.parseInt(countPerpage3));
		hashMap.put("end", Integer.parseInt(pageNum3)*Integer.parseInt(countPerpage3));
		hashMap.put("countPerpage", Integer.parseInt(countPerpage3));
		
		
		List registerlist=getSelectedstudentdao().findAllRegisteredStudents(hashMap);
		System.out.println("registerlist"+registerlist);
		ActionContext.getContext().put("registerstudent", registerlist);
		ActionContext.getContext().put("pageCount",pageCount);
		ActionContext.getContext().put("pageNum3", pageNum3);
		ActionContext.getContext().put("recordCount", recordCount);
		ActionContext.getContext().put("countPerpage3", countPerpage3);
		return "registerstudent";
		
	}
	
	
	public String deleteSelectedStudentByID(){
		/**
		 * 判断用户的session是否到期，到期就退出页面
		 */
		String adminId=(String) ActionContext.getContext().getSession().get("studentID");
		if(adminId==null)
			return "sessionIsNull";
		
		
		int id=getStudents().getId();
		String stuId=getStudents().getStudentId();
		System.out.println("id "+id+" stuId "+stuId);
		HashMap<String,Object> hash=new HashMap<String, Object>();
		hash.put("id", id);
		hash.put("stuId", stuId);
		getSelectedstudentdao().deleteStudentById(hash);
		
		/*List registerlist=getSelectedstudentdao().findAllRegisteredStudents();
		System.out.println("registerlist"+registerlist);
		ActionContext.getContext().put("registerstudent", registerlist);*/
		return "Toregisterstudent";
		
	}
	
	
	public void findChooseCourseClass(){
		 HttpServletResponse response = ServletActionContext.getResponse();  
	        //防止乱码  
	        response.setCharacterEncoding("UTF-8");  
		String courseName=null;
		try {
			courseName=new String(getSelectCourseName().getBytes("iso-8859-1"),"UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		//System.out.println("courseName"+courseName);
		PrintWriter printwriter = null;
    	try {
    		System.out.println("hello");
			printwriter = response.getWriter();
			List listClass=getSelectedstudentdao().findAllcouresClassNum(courseName);
			//System.out.println("courseType"+listClass);
			JSONArray jsonArray2 = JSONArray.fromObject(listClass);
			System.out.println("jsonArray2"+jsonArray2);
			printwriter.print(jsonArray2);
			printwriter.flush();
			printwriter.close();
		} catch (Exception e) {
          e.printStackTrace();
		}
	}
	
	
	public String skipforwardtoNewUser(){
		/**
		 * 判断用户的session是否到期，到期就退出页面
		 */
		String adminId=(String) ActionContext.getContext().getSession().get("studentID");
		if(adminId==null)
			return "sessionIsNull";
		
		return "skipToNewUser_jsp";
		
	}
	
	public String registerteacher(){
		/**
		 * 判断用户的session是否到期，到期就退出页面
		 */
		String adminId=(String) ActionContext.getContext().getSession().get("studentID");
		if(adminId==null)
			return "sessionIsNull";
		
		teacher teach=getTeachers();
		System.out.println("tea="+teach);
		getTeacherdao().insertNewTeacher(teach);
		ActionContext.getContext().put("isregister", "SUCCESS");
		return "skipToNewUser_jsp";
		
	}
	
}
