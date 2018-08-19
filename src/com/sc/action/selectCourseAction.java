package com.sc.action;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;

import com.cn.ExcelUtil.ExcelUtil;
import com.opensymphony.xwork2.ActionContext;
import com.sc.dao.courseDao;
import com.sc.dao.teacherDao;
import com.sc.model.course;
import com.sc.model.person;
import com.sc.model.sc;
import com.sc.model.student;

public class selectCourseAction {
	
	private String courseId;	//课程id
	private String courseName;	//课程名称
	private float courseCredit;		//学分
	private String courseTeacher;	//老师
	private String courseClass;    //班级
	private String courseTime;		//开课时间
	private String coursePlace;		//上课地点
	private int courseCount;		//总选课人数
	private int courseOverplus;		//余量
	
	private course courses;
	private courseDao dao;
	private teacherDao teacherdao;
	
	private ExcelUtil excelutil;
	
	private String chooseStudentId;
	
	private String chooseCourse;
	
	private String chooseCourseId;  //课程号
	private String chooseCourseClass; //班级
	
	public String getChooseStudentId() {
		return chooseStudentId;
	}
	public void setChooseStudentId(String chooseStudentId) {
		this.chooseStudentId = chooseStudentId;
	}
	public ExcelUtil getExcelutil() {
		return excelutil;
	}
	public void setExcelutil(ExcelUtil excelutil) {
		this.excelutil = excelutil;
	}
	public teacherDao getTeacherdao() {
		return teacherdao;
	}
	public void setTeacherdao(teacherDao teacherdao) {
		this.teacherdao = teacherdao;
	}
	public String getChooseCourseClass() {
		return chooseCourseClass;
	}
	public void setChooseCourseClass(String chooseCourseClass) {
		this.chooseCourseClass = chooseCourseClass;
	}
	public String getCourseTeacher() {
		return courseTeacher;
	}
	public String getCourseId() {
		return courseId;
	}
	public void setCourseId(String courseId) {
		this.courseId = courseId;
	}
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	public float getCourseCredit() {
		return courseCredit;
	}
	public void setCourseCredit(float courseCredit) {
		this.courseCredit = courseCredit;
	}
	public String getCpourseTeacher() {
		return courseTeacher;
	}
	public void setCourseTeacher(String courseTeacher) {
		this.courseTeacher = courseTeacher;
	}
	public String getCourseTime() {
		return courseTime;
	}
	public void setCourseTime(String courseTime) {
		this.courseTime = courseTime;
	}
	public String getCoursePlace() {
		return coursePlace;
	}
	public String getCourseClass() {
		return courseClass;
	}
	public void setCourseClass(String courseClass) {
		this.courseClass = courseClass;
	}
	public void setCoursePlace(String coursePlace) {
		this.coursePlace = coursePlace;
	}
	public int getCourseCount() {
		return courseCount;
	}
	public void setCourseCount(int courseCount) {
		this.courseCount = courseCount;
	}
	public int getCourseOverplus() {
		return courseOverplus;
	}
	public void setCourseOverplus(int courseOverplus) {
		this.courseOverplus = courseOverplus;
	}
	public course getCourses() {
		return courses;
	}
	public void setCourses(course courses) {
		this.courses = courses;
	}
	public courseDao getDao() {
		return dao;
	}
	public void setDao(courseDao dao) {
		this.dao = dao;
	}
	
	public String getChooseCourse() {
		return chooseCourse;
	}
	public void setChooseCourse(String chooseCourse) {
		this.chooseCourse = chooseCourse;
	}
	public String getChooseCourseId() {
		return chooseCourseId;
	}
	public void setChooseCourseId(String chooseCourseId) {
		this.chooseCourseId = chooseCourseId;
	}
	/**
	 * 查找所有可选课程
	 * @return
	 */
	public String publicCourse(){
		/**
		 * 判断用户的session是否到期，到期就退出页面
		 */
		String adminId=(String) ActionContext.getContext().getSession().get("studentID");
		System.out.println("adminId"+adminId);
		System.out.println(adminId==null);
		
		if(adminId==null)
			return "sessionIsNull";
		
		List<?> allCourse =dao.selectAllcourse();
		ActionContext.getContext().put("allCourse", allCourse);
		return "allCourse";
	}
	
	/**
	 * 根据被选中的课程名来查找信息
	 * @return
	 */
	public String selectcourseByValue(){
		String name=null;
		try {
			name = new String(getChooseCourse().getBytes("ISO-8859-1"),"utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("被选中的课程  "+name);
		
		//获取studentID
		String StudentID=(String) ActionContext.getContext().getSession().get("studentID");
		System.out.println("StudentID"+StudentID);
		if(StudentID!=null)
		{
			List<?>  allCourse=dao.selectAllByChoose(name);
			ActionContext.getContext().put("allCourse", allCourse);
			return "allCourse";
		}
		else
			return "sessionTimeout";
		
	}
	
	/**
	 * 选课
	 * @return
	 */
	public String selectedcourseBycheckbox(){
		String coursesClass=null;
		System.out.println("chooseID="+getChooseCourseId());
		
		try {
			coursesClass = new String(getChooseCourseClass().getBytes("ISO-8859-1"),"utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("chooseClass="+coursesClass);
		String chooseId=getChooseCourseId();
		String StudentID=(String) ActionContext.getContext().getSession().get("studentID");
		System.out.println("StudentID "+StudentID);
		if(StudentID==null)
			return "sessionTimeout";
		
		//判断是否已选过课程
		List<sc> listt=dao.allselectedcourseID(StudentID);
		System.out.println("listt="+listt.isEmpty());
		if(!listt.isEmpty()){
			    List<?> allCourse =dao.selectAllcourse();
			    ActionContext.getContext().put("allCourse", allCourse);
			    ActionContext.getContext().put("courseType", "SELECTED");
				System.out.println("已选过课程");
				return "allCourse";
		}
		
			/*Map semap=ActionContext.getContext().getSession();
			semap.put("courseType", "未选同类课程");*/
			/*for(int j=0;j<listt.size();j++){
				chooseId.equals("");
				System.out.println("年后="+chooseId.equals(listt.get(j).getCourseId()));
				if(chooseId.equals(yixuanId)){ 
					    List allCourse =dao.selectAllcourse();
					    ActionContext.getContext().put("allCourse", allCourse);
					    ActionContext.getContext().put("courseType", "SELECTED");
						System.out.println("已选同类课程");
						return "allCourse";
				}
			}*/
			
		// 根据已选课程类型计算人数是否已满
		int peopleAllNum=dao.getPresonNumber(chooseId,coursesClass);
		//int  peopleOverplusNum=dao.getPersonOverplus(chooseId,coursesClass);
		//剩余人数
		int  peopleOverplusNum=dao.getPersonOverplusadd(chooseId,coursesClass);
		System.out.println("peopleAllNum="+peopleAllNum+"peopleOverplusNum="+peopleOverplusNum);
		
		//人数判断，人数小于0则返回不可选，否则人数-1；
		if(peopleOverplusNum>0){
			peopleOverplusNum=peopleOverplusNum-1;
			dao.updatePeopleOverplus(chooseId,coursesClass,peopleOverplusNum);
		}else{
			ActionContext.getContext().put("AS", "PEOPLEOVER");
			List<?> allCourse =dao.selectAllcourse();
			ActionContext.getContext().put("allCourse", allCourse);
			return "allCourse";
		}
	
		HashMap<String, Object> hashmap=new HashMap<String, Object>();
		hashmap.put("StudentID", StudentID);
		hashmap.put("chooseId", chooseId);
		hashmap.put("coursesClass", coursesClass);
		dao.insertChoosecourse(hashmap);
		System.out.println("插入数据ok");
		List<?> allCourse =dao.selectAllcourse();
		ActionContext.getContext().put("allCourse", allCourse);
		ActionContext.getContext().put("selectOk", "selectOk");
		return "allCourse";
	}
	
	/**
	 * 获取学生已选课程
	 * @return
	 */
	public String selectedCourse(){
		String StudentID=(String) ActionContext.getContext().getSession().get("studentID");
		System.out.println("StudentID "+StudentID);
		if(StudentID==null)
			return "sessionTimeout";
		
		//查找课程号
		List<List<?>> listmap=new ArrayList<List<?>>();
		ArrayList<String> list=new ArrayList<String>();
		List<sc> courseIdbystuId=dao.findcourseId(StudentID);
		System.out.println("courseid="+courseIdbystuId);
		
		String courseID=null;
		String courseClassID=null;
		
		if(!courseIdbystuId.isEmpty()){
			 courseID=courseIdbystuId.get(0).getCourseId();
			 courseClassID=courseIdbystuId.get(0).getCourseClass();
		}
		
			/*System.out.println("ID"+i+"="+courseIdbystuId.get(i).toString().substring(10, 19));
			String courseID=courseIdbystuId.get(i).toString().substring(10, 19);*/
			
			HashMap<String, Object> hashmap=new HashMap<String, Object>();
			hashmap.put("courseID", courseID);
			hashmap.put("StudentID", StudentID);
			hashmap.put("courseClassID", courseClassID);
			
			List courseed=dao.selectedAllCoursebyId(hashmap);
			System.out.println("corseed="+courseed);
			/*listmap.add(courseed);
			System.out.println("listmap="+listmap);*/
		
		
		ActionContext.getContext().put("courseed", courseed);
		
		return "courses";
	}
	
	/**
	 * 退课，删除学生课程信息from SC_info
	 * @return
	 */
	public String deletecourseBycheckbox(){
		//获取学生ID
		String StudentID=(String) ActionContext.getContext().getSession().get("studentID");
		System.out.println("StudentID "+StudentID);
		if(StudentID==null)
			return "sessionTimeout";
		
		String coursesClass=null;
		try {
			coursesClass = new String(getChooseCourseClass().getBytes("ISO-8859-1"),"utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("删除课程id,班级"+getChooseCourseId()+","+coursesClass);
		String chooseId=getChooseCourseId();
		
		HashMap<String, Object> hashmap=new HashMap<String, Object>();
		hashmap.put("chooseId", chooseId);
		hashmap.put("StudentID", StudentID);
		hashmap.put("coursesClass", coursesClass);
		
		//退课后，在相应的课程中增加课程余量人数
		int  peopleOverplusNum=dao.getPersonOverplusAddper(hashmap);
		System.out.println("peopleOverplusNum1="+peopleOverplusNum);
		peopleOverplusNum+=1;
		System.out.println("peopleOverplusNum2="+peopleOverplusNum);
		dao.updatecourseOverplus(chooseId,coursesClass,peopleOverplusNum);
		
		dao.deletecourseAndstudent(hashmap);
		return "deletesuccess";
	}
	
	public  void chooseCourseTypeTojsp(){
		 HttpServletResponse response = ServletActionContext.getResponse();  
	        //防止乱码  
	        response.setCharacterEncoding("UTF-8");  
	
		PrintWriter printwriter = null;
    	try {
			printwriter = response.getWriter();
			List<?> listType=dao.getAllCourseType();
			JSONArray jsonArray2 = JSONArray.fromObject(listType);
			printwriter.print(jsonArray2);
			printwriter.flush();
			printwriter.close();
		} catch (Exception e) {
          e.printStackTrace();
		}
	}
	
	/**
	 * 根据课程号，班级获取选课学生名单
	 * @return
	 */
	public String lookSCStudents(){
		String couId=getChooseCourseId();
		String couClass=null;
		try {
			couClass=new String(getChooseCourseClass().getBytes("ISO-8859-1"),"utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(couId+","+couClass);
		HashMap<String,Object> hash=new HashMap<String, Object>();
		hash.put("couId", couId);
		hash.put("couClass", couClass);
		List<sc> listStudent=dao.findAllSCStudent(hash);
		System.out.println("listStudent="+listStudent);
		ArrayList addStu= new ArrayList();
		/*List listStu=null;*/
		for(int j=0;j<listStudent.size();j++){
			 System.out.println("hellos="+listStudent.get(j).getStudentId());
			
			 List stu=dao.getStudentSCByStuId(listStudent.get(j).getStudentId().toString());//根据学生ID获取学生信息
			 System.out.println("stu"+stu);
			 addStu.add(stu);
			/* addStu.put("", value);*/
		}
		 System.out.println("addStu"+addStu);	
		
		 ActionContext.getContext().put("addStu", addStu);
		return "SCStudent";
	}
	
	public String publicTeacherCourse(){
		/**
		 * 判断用户的session是否到期，到期就退出页面
		 */
		String teacherId=(String) ActionContext.getContext().getSession().get("studentID");
		System.out.println("teacherId"+teacherId);
		System.out.println(teacherId==null);
		
		if(teacherId==null)
			return "sessionIsNull";
		
		String teaName=teacherdao.getTeacherNameById(teacherId);
		
		
		List<?> allCourse =dao.selectAllcourse(teaName);
		System.out.println("allCourse666="+allCourse);
		ActionContext.getContext().put("allCourse", allCourse);
		return "allCourse";
		
	}
	
	/**
	 * 导出
	 */
	public void exportExcel(){
	
		
		String str=getChooseStudentId();
		System.out.println("str="+str);
		
		String choose[] = str.split(",");
		 List<person> dataset = new ArrayList<person>(); 
		
		for (int i = 0; i < choose.length; i++) {
		
			System.out.println("学号 "+choose[i]);
			person stu=(person) dao.exportStudentInfoByStudentId(choose[i]);
			System.out.println(stu);
			dataset.add(stu);
			
			
		}
	/*
		System.out.println("dataset"+dataset);
		*/
		try {
			
			//1、查找用户列表
			//userList = userService.findObjects();
			 /* List<student> dataset = new ArrayList<student>();  
	          dataset.add(new student( "张三", "123","123","123","123","123","qwe"));
	          dataset.add(new student( "李四", "123","123","123","123","123","qwe"));
	         */
	          
			//2、导出
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setContentType("application/x-execl");
			response.setHeader("Content-Disposition", " attachment;filename=" + new String("xuesheng.xls".getBytes(), "ISO-8859-1"));
			ServletOutputStream outputStream = response.getOutputStream();
			//userService.exportExcel(userList, outputStream);
			getExcelutil().exportUserExcel(dataset, outputStream);
			if(outputStream != null){
				outputStream.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
}
