package com.sc.model;

public class student {
    private int id;
    private String studentName;   //姓名
    private String studentId;	//学号
    private String password;	//密码
    private String studentSex;	//性别
    private String academy;		//学院
    private String majoyClass;	//专业班级
    private String email;  		//邮箱
    private String phone;		//电话
    
    
    public student() {  
        super();  
    }  
  
    public student( String studentName,String studentId, String studentSex,String academy,String majoyClass,String email,String phone) {  
        super();  
        
        this.studentName = studentName;  
        this.studentId = studentId;
        this.studentSex = studentSex; 
        this.academy = academy; 
        this.majoyClass = majoyClass; 
        this.email = email; 
        this.phone = phone; 
      
    }  
    
    
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public String getStudentId() {
		return studentId;
	}
	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getStudentSex() {
		return studentSex;
	}
	public void setStudentSex(String studentSex) {
		this.studentSex = studentSex;
	}
	public String getAcademy() {
		return academy;
	}
	public void setAcademy(String academy) {
		this.academy = academy;
	}
	public String getMajoyClass() {
		return majoyClass;
	}
	public void setMajoyClass(String majoyClass) {
		this.majoyClass = majoyClass;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	@Override
	public String toString() {
		return "student [id=" + id + ", studentName=" + studentName
				+ ", studentId=" + studentId + ", password=" + password
				+ ", studentSex=" + studentSex + ", academy=" + academy
				+ ", majoyClass=" + majoyClass + ", email=" + email
				+ ", phone=" + phone + "]";
	}
	
    
    
}
