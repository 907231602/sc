package com.sc.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import com.sc.model.student;

public interface studentDao {
	boolean islogined(student  getStudents) throws SQLException;
	
	boolean isregister(student getStudents);
	
	boolean checkIsRegistered(String stuId);

    public List lookmyselfInfoByStuId(String  StudentID);
   
    public boolean changeMypasswordById(HashMap hashmap);
    
    public String getStudentNameById(String Id);
    
    public List getAllCollege();
    
    public List getAllMajoyClassBySelectCollege(String SAcademy);
}
