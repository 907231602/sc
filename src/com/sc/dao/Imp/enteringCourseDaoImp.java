package com.sc.dao.Imp;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.sc.dao.enteringCourseDao;
import com.sc.model.course;

public class enteringCourseDaoImp implements enteringCourseDao {

	private SqlMapClient client = null;

	public SqlMapClient getClient() {

		return client;

	}

	public void setClient(SqlMapClient client) {
		this.client = client;
	}
	
	@Override
	public void  insertNewCourse(course luruCourse) {
		// TODO Auto-generated method stub
		try {
			Object op= client.insert("enteringCourse.insertNewCourse", luruCourse);
		System.out.println("op="+op);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public List findAllEnteredCourse() {
		// TODO Auto-generated method stub
		List allcourse=null;
		try {
			allcourse=client.queryForList("enteringCourse.findAllEnteredCourse");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return allcourse;
	}

	@Override
	public List findAllEnteredCourse(String name) {
		// TODO Auto-generated method stub
		List allcourse=null;
		try {
			allcourse=client.queryForList("enteringCourse.findAllEnteredCourseByteacherName",name);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return allcourse;
	}

	
	@Override
	public void deleteCourseBycorseId(String courseId) {
		// TODO 删除录入时的课程
		try {
			client.delete("enteringCourse.deleteCourseBycorseId", courseId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	@Override
	public void deleteCourseBycorseId(HashMap hash) {
		// TODO 删除录入时的课程
		try {
			client.delete("enteringCourse.deleteCourseBycorseIdAddHash", hash);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
