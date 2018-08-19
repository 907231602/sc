package com.sc.dao.Imp;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.sc.dao.teacherDao;
import com.sc.model.teacher;

public class teacherDaoImp implements teacherDao {
	private SqlMapClient client = null;

	public SqlMapClient getClient() {

		return client;

	}

	public void setClient(SqlMapClient client) {
		this.client = client;
	}

	@Override
	public void insertNewTeacher(teacher teach) {
		// TODO Auto-generated method stub
		try {
			client.insert("teacherMapper.insertNewTeacher", teach);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public boolean teacherIslogined(String userId, String userPasswd) {
		// TODO Auto-generated method stub
		String ps=null;
		try {
			ps=(String) client.queryForObject("teacherMapper.teacherIslogined", userId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(userPasswd.equals(ps)){
			System.out.println("判断为true");
			return true;}
		else{
			System.out.println("判断为错");
			return false;
		}
	
	}

	@Override
	public List findteacherInfoById(String teacherId) {
		// TODO Auto-generated method stub
		List listinfo=null;
		try {
			listinfo=client.queryForList("teacherMapper.findteacherInfoById", teacherId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listinfo;
	}

	@Override
	public void changeTeacherPs(String teacherPs,String teacherId) {
		// TODO Auto-generated method stub
		HashMap map=new HashMap();
		map.put("teacherPs", teacherPs);
		map.put("teacherId", teacherId);
		try {
			client.update("teacherMapper.changeTeacherPs", map);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public String getNameById(String userId) {
		// TODO Auto-generated method stub
		String name=null;
		try {
			name=(String) client.queryForObject("teacherMapper.getNameById", userId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return name;
	}

	@Override
	public String getTeacherNameById(String teacherId) {
		String teaName=null;
		try {
			teaName=(String) client.queryForObject("teacherMapper.getTeacherNameById", teacherId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return teaName;
	}
}
