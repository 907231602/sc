package com.sc.dao;

import java.util.HashMap;
import java.util.List;

import com.sc.model.person;
import com.sc.model.sc;
import com.sc.model.student;

public interface courseDao {
	public 	List  selectAllcourse();
	public 	List  selectAllcourse(String teacherName);
	public List selectAllByChoose(String  ChooseCourse);
	
	public  void insertChoosecourse(HashMap hashmap);
	
	public List findcourseId(String StudentID);
	
	public List selectedAllCoursebyId(HashMap hashmap);
	
	public void deletecourseAndstudent(HashMap hashmap);
	
	public int getPresonNumber(String choosecourseId,String coursesClass);
	
	public int getPersonOverplus(String chooseId);
	public int getPersonOverplusAddper(HashMap<String,Object> hash);
	public int getPersonOverplusadd(String chooseId,String coursesClass);
	
	public void updatePeopleOverplus(String chooseId,String coursesClass,int peopleOverplusNum);
	
	public void updatecourseOverplus(String chooseId,String coursesClass,int peopleOverplusNum);
	
	public List<sc> allselectedcourseID(String StudentID);
	
	public List getAllCourseType();
	public List<sc> findAllSCStudent(HashMap hash);
	
	public List getStudentSCByStuId(String id);
	
	public person exportStudentInfoByStudentId(String choose);
}
