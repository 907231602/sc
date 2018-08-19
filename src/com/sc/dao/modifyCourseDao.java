package com.sc.dao;

import java.util.HashMap;
import java.util.List;

import com.sc.model.course;

public interface modifyCourseDao {
	
	/**
	 * 根据id获取课程信息
	 * @param selectCourseId
	 * @return
	 */
		public List<course> selectCoursesById(String selectCourseId);
		public List<course> selectCoursesById(HashMap hash);
		/**
		 * 根据课程id更新课程
		 * @param Courses
		 */
		public void updateOldCourse(course cour);
		
		public List<course> getCourselistByid(int cid);
}
