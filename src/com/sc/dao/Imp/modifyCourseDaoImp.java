package com.sc.dao.Imp;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.sc.dao.modifyCourseDao;
import com.sc.model.course;

public class modifyCourseDaoImp implements modifyCourseDao {

	private SqlMapClient client = null;

	public SqlMapClient getClient() {

		return client;

	}

	public void setClient(SqlMapClient client) {
		this.client = client;
	}
	
	@Override
	public List<course> selectCoursesById(String selectCourseId) {
		// TODO Auto-generated method stub
		List<course> list=null;
		try {
			list =client.queryForList("modifyCourse.selectModifyCourseById", selectCourseId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<course> selectCoursesById(HashMap hash) {
		// TODO Auto-generated method stub
		List<course> list=null;
		try {
			list =client.queryForList("modifyCourse.selectModifyCourseByIdAddHash", hash);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	
	@Override
	public void updateOldCourse(course cour) {
		// TODO Auto-generated method stub
				try {
					client.update("modifyCourse.updateOldCourse", cour);
					System.out.println("更新成功");
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	}


	@Override
	public List<course> getCourselistByid(int cid) {
		// TODO Auto-generated method stub
		List<course> list=null;
		try {
			list= client.queryForList("modifyCourse.getCourselistByid", cid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

}
