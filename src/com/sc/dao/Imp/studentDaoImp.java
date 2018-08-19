package com.sc.dao.Imp;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.sc.dao.studentDao;
import com.sc.model.student;

public class studentDaoImp implements studentDao {

	private SqlMapClient client = null;

	public SqlMapClient getClient() {

		return client;

	}

	public void setClient(SqlMapClient client) {
		this.client = client;
	}

	@Override
	public boolean islogined(student students) throws SQLException {
		System.out.println("client====" + client);
		// TODO Auto-generated method stub
		System.out.println("studentid="+students.getStudentId());
		String studentId=students.getStudentId();
		String passwd=(String)client.queryForObject("studentMappper.getpasswdbyid",studentId);
		if(passwd.equals(students.getPassword())){
			System.out.println("passwd"+passwd);
			return true;
		}
		else
		   return false;
	}

	@Override
	public boolean isregister(student students) {
		// TODO Auto-generated method stub
		System.out.println("client====" + client);
		try {
			int i=0;
			System.out.println("sql students"+students);
			i=(Integer)client.insert("studentMappper.registertoStudent",students);
			System.out.println("i="+i);
			if(i!=0){
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	  }

	@Override
	public List lookmyselfInfoByStuId(String StudentID) {
		// TODO Auto-generated method stub
		List<student> list=null;
		try {
			list=client.queryForList("studentMappper.lookmyselfInfoByStuId", StudentID);
			System.out.println("listStu="+list);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public boolean changeMypasswordById(HashMap hashmap) {
		// TODO Auto-generated method stub
		boolean isChange=false;
		try {
			int i=client.update("studentMappper.changeMypasswordById", hashmap);
			System.out.println("i="+i);
			if(i==1){
				isChange=true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("isChange="+isChange);
		return isChange;
	}

	@Override
	public boolean checkIsRegistered(String stuId) {
		// TODO Auto-generated method stub
		List listinfo=null;
		try {
			listinfo=client.queryForList("studentMappper.checkIsRegistered",stuId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(listinfo.size()>0){
			return false;
		}else
		return true;
	}

	@Override
	public String getStudentNameById(String Id) {
		// TODO Auto-generated method stub
		String name=null;
		try {
			name=(String) client.queryForObject("studentMappper.getStudentNameById",Id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return name;
	}

	@Override
	public List getAllCollege() {
		List listcol=null;
		try {
			listcol=client.queryForList("studentMappper.getAllCollege");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listcol;
	}

	@Override
	public List getAllMajoyClassBySelectCollege(String SAcademy) {
	  List listClass=null;
	  try {
		listClass= client.queryForList("studentMappper.getAllMajoyClassBySelectCollege", SAcademy);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
		return listClass;
	}

}
