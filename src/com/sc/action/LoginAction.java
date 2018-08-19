package com.sc.action;

import com.sc.dao.userDao;
import com.sc.model.User;

public class LoginAction {
	private String username;
	private String password;

    private User user;
    private userDao dao;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public userDao getDao() {
		return dao;
	}
	public void setDao(userDao dao) {
		this.dao = dao;
	}
	
	public String denglu(){
		System.out.println("用户名及密码"+getUser());
		boolean islogin = dao.isLogin(getUser());
	 
		 System.out.println("登录");
		  if(islogin==true)
		  {
			  System.out.println("成功");
			  return "success";
		  }else {
			  System.out.println("失败");
			  return "error";
		}
	}
}
