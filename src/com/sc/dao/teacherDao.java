package com.sc.dao;

import java.util.List;

import com.sc.model.teacher;

public  interface teacherDao {
	public  void insertNewTeacher(teacher teach);
	
	public boolean teacherIslogined(String userId,String userPasswd);
	
	public List findteacherInfoById(String teacherId);
	public void changeTeacherPs(String teacherPs,String teacherId);
	
	public String getNameById(String userId);
	
	public String getTeacherNameById(String teacherId);
}
