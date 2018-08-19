package com.sc.dao.Imp;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.sc.dao.selectedStudentDao;
import com.sc.model.student;

public class selectedStudentDaoImp implements selectedStudentDao {

	private SqlMapClient client = null;

	public SqlMapClient getClient() {

		return client;

	}

	public void setClient(SqlMapClient client) {
		this.client = client;
	}
	
	@Override
	public List getSCStudentsInfo(HashMap hash) {
		// TODO Auto-generated method stub
		List list=null;
		try {
		 list=client.queryForList("selectedStudentMapper.getSCStudentsInfo",hash);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
		return list;
	}

	@Override
	public List findAllCourseNameBySCname(String SCname,String SCclass) {
		// TODO Auto-generated method stub
		List list=null;
		if(!SCname.equals("") && SCclass.equals("")){
			try {
				list=client.queryForList("selectedStudentMapper.findAllCourseNameBySCname", SCname);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(!SCname.equals("") && !SCclass.equals("")){
			HashMap hash =new HashMap();
			hash.put("SCname", SCname);
			hash.put("SCclass", SCclass);
			try {
				list=client.queryForList("selectedStudentMapper.findAllCourseNameBySCname2", hash);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		else if(SCname.equals("") && !SCclass.equals("")){
			try {
				list= client.queryForList("selectedStudentMapper.findAllCourseNameBySCname3", SCclass);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if( SCname.equals("") && SCclass.equals("")){
			try {
				list=	client.queryForList("selectedStudentMapper.getSCStudentsInfo");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;
	
		
	}

	@Override
	public List findCourseType() {
		// TODO Auto-generated method stub
		List list=null;
		try {
			list=client.queryForList("selectedStudentMapper.findCourseType");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List findAllRegisteredStudents(HashMap map) {
		// TODO Auto-generated method stub
		List listinfo=null;
		try {
			listinfo=client.queryForList("selectedStudentMapper.findAllRegisteredStudents",map);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listinfo;
	}

	@Override
	public void deleteStudentById(HashMap hash) {
		
		try {
			client.delete("selectedStudentMapper.deleteStudentById", hash);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public List findAllcouresClassNum(String courseName) {
		// TODO Auto-generated method stub
		List listNum=null;
		try {
			listNum=	client.queryForList("selectedStudentMapper.findAllcouresClassNum", courseName);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listNum;
	}

	@Override
	public int getCountSCStudentsInfo() {
		// TODO Auto-generated method stub
		int count=0;
		try {
			count=(Integer) client.queryForObject("selectedStudentMapper.getCountSCStudentsInfo");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}

	@Override
	public int getCountStudentsNumber() {
		// TODO Auto-generated method stub
		int count=0;
		try {
			count=(Integer) client.queryForObject("selectedStudentMapper.getCountStudentsNumber");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}

}
