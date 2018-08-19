package com.sc.dao.Imp;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.sc.dao.courseDao;
import com.sc.model.course;
import com.sc.model.person;
import com.sc.model.sc;
import com.sc.model.student;

public class courseDaoImp implements courseDao {

	private SqlMapClient client = null;

	public SqlMapClient getClient() {

		return client;

	}

	public void setClient(SqlMapClient client) {
		this.client = client;
	}
	
	@Override
	public List selectAllcourse(){
		// TODO Auto-generated method stub
		List list = null;
		try {
		list=	(List)client.queryForList("courseMapper.selectAllcourse");
		System.out.println("listcourse="+list);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public List selectAllcourse(String name){
		// TODO Auto-generated method stub
		List list = null;
		try {
		list=	(List)client.queryForList("courseMapper.selectAllcourseByTeacherName",name);
		System.out.println("listcourse="+list);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List selectAllByChoose(String ChooseCourse) {
		// TODO Auto-generated method stub
		List list = null;
		try {
		list=	(List)client.queryForList("courseMapper.selectAllByChoose",ChooseCourse);
		System.out.println("listChoosecourse="+list);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void insertChoosecourse(HashMap hashmap) {
		
		// TODO Auto-generated method stub
		try {
			client.insert("courseMapper.insertChoosecourse", hashmap);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public List selectedAllCoursebyId(HashMap hashmap) {
		// TODO Auto-generated method stub
		List listed=null;
		try {
			listed=client.queryForList("courseMapper.selectedAllCoursebyId", hashmap);
			System.out.println("listed"+listed);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listed;
	}

	@Override
	public List<sc> findcourseId(String StudentID) {
		// TODO Auto-generated method stub
		System.out.println("StudentID "+StudentID);
		//List list1=null;
		List<sc> list=null;
			try {
			 list =client.queryForList("courseMapper.findCourseID", StudentID);
			 
			/* for(int i=0;i<list.size();i++){
					HashMap m=(HashMap) list.get(i);
					System.out.println("m="+m.get(StudentID));
			}*/
			System.out.println("courseid="+list);
			//System.out.println("courseid 0="+list.get(1).toString().substring(10, 19));
			
		  } catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return list;
	}

	@Override
	public void deletecourseAndstudent(HashMap hashmap) {
		// TODO Auto-generated method stub
		try {
			client.delete("courseMapper.deletecourseAndstudent", hashmap);
			System.out.println("删除学生"+hashmap);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public int getPresonNumber(String choosecourseId,String coursesClass) {
		// TODO Auto-generated method stub
		int i=0;
		HashMap<String, Object> hash=new HashMap<String, Object>();
		hash.put("choosecourseId", choosecourseId);
		hash.put("coursesClass", coursesClass);
		try {
			i=(Integer)client.queryForObject("courseMapper.getallPresonNumber",hash);
		System.out.println("该课程总人数="+i);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}

	@Override
	public int getPersonOverplus(String chooseId) {
		// TODO Auto-generated method stub
		int j=0;
		try {
			j=(Integer)client.queryForObject("courseMapper.getPersonOverplus", chooseId);
		System.out.println("剩余人数="+j);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return j;
	}

	@Override
	public int getPersonOverplusAddper(HashMap<String, Object> hash) {
		// TODO Auto-generated method stub
		int j=0;
		try {
			j=(Integer)client.queryForObject("courseMapper.getPersonOverplusAddper", hash);
		System.out.println("剩余人数="+j);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return j;
	}
	
	
		@Override
		public int getPersonOverplusadd(String chooseId,String coursesClass) {
			int j=0;
			HashMap<String,Object> hashm=new HashMap<String, Object>();
			hashm.put("chooseId", chooseId);
			hashm.put("coursesClass", coursesClass);
			try {
				System.out.println(hashm);
			//	j=(Integer) client.queryForObject("courseMapper.getPersonOverplusadd",hash);
				@SuppressWarnings("unchecked")
				List<course> list= (List<course>) client.queryForList("courseMapper.getPersonOverplusadd", hashm);
			j=list.get(0).getCourseOverplus();
				System.out.println("剩余人数aa="+ list.get(0).getCourseOverplus());
				/*System.out.println("剩余人数aa="+ Integer.parseInt(k.toString()));*/
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return j;
		}

	
	@Override
	public void updatePeopleOverplus(String choosecourseID, String coursesClass,int peopleOverplusNum) {
		// TODO Auto-generated method stub
		HashMap hashmap=new HashMap();
		hashmap.put("choosecourseID", choosecourseID);
		hashmap.put("peopleOverplusNum", peopleOverplusNum);
		hashmap.put("coursesClass", coursesClass);
		try {
			client.insert("courseMapper.updatePeopleOverplus", hashmap);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public void updatecourseOverplus(String chooseId,String coursesClass, int peopleOverplusNum) {
		// TODO Auto-generated method stub
		HashMap hashmap=new HashMap();
		hashmap.put("chooseId", chooseId);
		hashmap.put("peopleOverplusNum", peopleOverplusNum);
		hashmap.put("coursesClass", coursesClass);
		
		try {
			client.update("courseMapper.updatecourseOverplus", hashmap);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<sc> allselectedcourseID(String StudentID) {
		// TODO Auto-generated method stub
		List<sc>  lista=null;
	
		try {
			lista=client.queryForList("courseMapper.allselectedcourseID", StudentID);
			System.out.println("lista="+lista);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return lista;
	}

	@Override
	public List getAllCourseType() {
		// TODO Auto-generated method stub
		List typel=null;
		try {
			typel=client.queryForList("courseMapper.getAllCourseType");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return typel;
	}

	@Override
	public List<sc> findAllSCStudent(HashMap hash) {
		List<sc> listSC=null;
		try {
			listSC=client.queryForList("courseMapper.findAllSCStudent", hash);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listSC;
	}

	@Override
	public List getStudentSCByStuId(String id) {
		List stu=null;
		try {
			stu=client.queryForList("courseMapper.getStudentSCByStuId", id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return stu;
	}

	@Override
	public person exportStudentInfoByStudentId(String choose) {
		// TODO Auto-generated method stub
		person list=null;
		try {
			list=(person) client.queryForObject("courseMapper.exportStudentInfoByStudentId",choose);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	

	

}
