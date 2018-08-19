package com.sc.action;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.sc.dao.homeDao;
import com.sc.dao.studentDao;
import com.sc.model.student;

public class registerscAction {
	private String studentName;   //姓名
    private String studentId;	//学号
    private String password;	//密码
    private String studentSex;	//性别
    private String academy;		//学院
    private String majoyClass;	//专业班级
    private String email;  		//邮箱
    
    private  student students;
    private  studentDao dao;
    private  homeDao homedao;
    private String selectAcademy;//被选中的学院
    
	public String getSelectAcademy() {
		return selectAcademy;
	}
	public void setSelectAcademy(String selectAcademy) {
		this.selectAcademy = selectAcademy;
	}
	public homeDao getHomedao() {
		return homedao;
	}
	public void setHomedao(homeDao homedao) {
		this.homedao = homedao;
	}
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public String getStudentId() {
		return studentId;
	}
	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getStudentSex() {
		return studentSex;
	}
	public void setStudentSex(String studentSex) {
		this.studentSex = studentSex;
	}
	public String getAcademy() {
		return academy;
	}
	public void setAcademy(String academy) {
		this.academy = academy;
	}
	public String getMajoyClass() {
		return majoyClass;
	}
	public void setMajoyClass(String majoyClass) {
		this.majoyClass = majoyClass;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public student getStudents() {
		return students;
	}
	public void setStudents(student students) {
		this.students = students;
	}
	public studentDao getDao() {
		return dao;
	}
	public void setDao(studentDao dao) {
		this.dao = dao;
	}
	
	public String zhuce(){
		System.out.println("students="+getStudents()); 
		String stuId=getStudents().getStudentId();
		
		/**
		 * 检查该学号是否注册过
		 */
		boolean  checkOut=dao.checkIsRegistered(stuId);  
		if(checkOut==true){
			
			//注册
			boolean isregisters= dao.isregister(getStudents());
			System.out.println("isregisters"+isregisters);
			if(isregisters==true)
			{
				ActionContext.getContext().put("listfile", getHomedao().getAllFileName());
				return "success";
			}
			else 
				return "error";//注册失败
		}
		else
			ActionContext.getContext().put("ERRORINFO", "REGISTERED");
			return "error";//已注册，返回error
    		
	}
	
	public void getAllCollege(){
		 HttpServletResponse response = ServletActionContext.getResponse(); 
	        //防止乱码  
	        response.setCharacterEncoding("UTF-8");  
	        PrintWriter printwriter = null;
	        
	        try {
	    		System.out.println("hello");
				printwriter = response.getWriter();
			/*	List listcar=getFindcardao().searchCarsInfo(good);*/
				List listcollege=dao.getAllCollege();
				
				System.out.println("listgoods"+listcollege);
				JSONArray jsonArray2 = JSONArray.fromObject(listcollege);
				System.out.println("jsonArray2"+jsonArray2);
				printwriter.print(jsonArray2);
				printwriter.flush();
				
				printwriter.close();
			} catch (Exception e) {
	          e.printStackTrace();
			}finally {
	            if (printwriter != null) {
	            	printwriter.close();
	            }
			}
	}
	
	public void getMajoyClassByCollege(){
		 HttpServletResponse response = ServletActionContext.getResponse(); 
	        //防止乱码  
	        response.setCharacterEncoding("UTF-8");  
	        PrintWriter printwriter = null;
	        
		
		String SAcademy=getSelectAcademy();
		System.out.println("SAcademy"+SAcademy);
	
		
		 try {
	    		System.out.println("hello");
				printwriter = response.getWriter();
			
				List listClass=dao.getAllMajoyClassBySelectCollege(SAcademy);
				
				System.out.println("listgoods"+listClass);
				JSONArray jsonArray2 = JSONArray.fromObject(listClass);
				System.out.println("jsonArray2"+jsonArray2);
				printwriter.print(jsonArray2);
				printwriter.flush();
				
				printwriter.close();
			} catch (Exception e) {
	          e.printStackTrace();
			}finally {
	            if (printwriter != null) {
	            	printwriter.close();
	            }
			}
		
	}
	
}
