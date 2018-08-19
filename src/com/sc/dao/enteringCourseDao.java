package com.sc.dao;

import java.util.HashMap;
import java.util.List;

import com.sc.model.course;

public interface enteringCourseDao {
	
	public void insertNewCourse(course luruCourse);

	public List findAllEnteredCourse();
	public List findAllEnteredCourse(String teacherName);
	
	public void deleteCourseBycorseId(String courseId);
	public void deleteCourseBycorseId(HashMap hash);
	
}
