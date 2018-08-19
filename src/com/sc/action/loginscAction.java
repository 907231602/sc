package com.sc.action;

import java.sql.SQLException;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.sc.dao.DownloadAndUploadDao;
import com.sc.dao.administratorsDao;
import com.sc.dao.courseDao;
import com.sc.dao.homeDao;
import com.sc.dao.studentDao;
import com.sc.dao.teacherDao;
import com.sc.model.student;

public class loginscAction {
			private String studentId;
			private String password;
			private String yanzhengCode;
			private String cbox;
			
			private studentDao dao;
			private student students;
			
			private courseDao coursedao;
			private DownloadAndUploadDao downloadAnduploaddao;
			private homeDao homedao;
			private teacherDao teacherdao;
			private administratorsDao administratorsdao;
			
			
			public courseDao getCoursedao() {
				return coursedao;
			}
			public void setCoursedao(courseDao coursedao) {
				this.coursedao = coursedao;
			}
			public teacherDao getTeacherdao() {
				return teacherdao;
			}
			public void setTeacherdao(teacherDao teacherdao) {
				this.teacherdao = teacherdao;
			}
			public administratorsDao getAdministratorsdao() {
				return administratorsdao;
			}
			public void setAdministratorsdao(administratorsDao administratorsdao) {
				this.administratorsdao = administratorsdao;
			}
			public String getCbox() {
				return cbox;
			}
			public void setCbox(String cbox) {
				this.cbox = cbox;
			}
			public homeDao getHomedao() {
				return homedao;
			}
			public void setHomedao(homeDao homedao) {
				this.homedao = homedao;
			}
			public DownloadAndUploadDao getDownloadAnduploaddao() {
				return downloadAnduploaddao;
			}
			public void setDownloadAnduploaddao(DownloadAndUploadDao downloadAnduploaddao) {
				this.downloadAnduploaddao = downloadAnduploaddao;
			}
			public String getYanzhengCode() {
				return yanzhengCode;
			}
			public void setYanzhengCode(String yanzhengCode) {
				this.yanzhengCode = yanzhengCode;
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
			public studentDao getDao() {
				return dao;
			}
			public void setDao(studentDao dao) {
				this.dao = dao;
			}
			public student getStudents() {
				return students;
			}
			public void setStudents(student students) {
				this.students = students;
			}
			
			
			
			/**
			 * 登录
			 * @return
			 * @throws SQLException
			 */
			public String studentdenglu() throws SQLException{
			Map sessions=	ActionContext.getContext().getSession();
			String code=(String)sessions.get("code");
		    String boxValue= getCbox();
			System.out.println("boxValue ="+boxValue);
			String userId=getStudents().getStudentId();//获取用户账号及密码
			String userPasswd=getStudents().getPassword();
			System.out.println("userId="+userId+" userPasswd="+userPasswd);
			boolean islogin = false;
				if(getYanzhengCode().equals(code)){
					System.out.println("真假="+boxValue.equals("1"));
					if(boxValue.equals("1")){
						islogin=teacherdao.teacherIslogined(userId,userPasswd);
						System.out.println("teacher sure="+islogin);
						ActionContext.getContext().getSession().put("studentID", userId);
						ActionContext.getContext().getSession().put("userName", teacherdao.getNameById(userId));
					}
					else if(boxValue.equals("2")){
						//学生登录判断
						islogin = dao.islogined(getStudents());
						ActionContext.getContext().getSession().put("studentID", getStudents().getStudentId());
						ActionContext.getContext().getSession().put("userName", dao.getStudentNameById(getStudents().getStudentId()));
					}
					else if(boxValue.equals("3")){
						islogin=getAdministratorsdao().administratorIslodined(userId,userPasswd);
						System.out.println("Administrators sure="+islogin);
						ActionContext.getContext().getSession().put("studentID", userId);
						ActionContext.getContext().getSession().put("userName", getAdministratorsdao().getAdminNameById(userId));
					}
						
						System.out.println("islogin "+islogin);
						if(islogin){
							ActionContext.getContext().getSession().put("identity", boxValue);
							ActionContext.getContext().getSession().put("courseType",getCoursedao().getAllCourseType());
							ActionContext.getContext().put("listfile", getHomedao().getAllFileName() );
							return"success";
						}
						else{
							ActionContext.getContext().put("ERRORINFO", "ERROR");
							return "error";
						}
				}
				
				
				else
				{
					ActionContext.getContext().put("ERRORINFO", "ERROR");
					return "error";
				}
				
			}
			
			
			public String quit(){
			Map session=	ActionContext.getContext().getSession();
				//session.invalidate(); 
				session.clear();
				return "toindex_jsp";
				
			}
			
}
