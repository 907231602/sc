package com.sc.dao;

import java.util.HashMap;
import java.util.List;

public interface selectedStudentDao {
		
	public List getSCStudentsInfo(HashMap hash);
	
	public List findAllCourseNameBySCname(String SCname,String SCclass);
	
	public List findCourseType();
	
	public List findAllRegisteredStudents(HashMap hashmap);
	
	public void deleteStudentById(HashMap hash);
	
	public List findAllcouresClassNum(String courseName);
	
	public int getCountSCStudentsInfo();
	
	public int getCountStudentsNumber();
}
