package com.sc.client;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

import com.sc.dao.Imp.userDaoImp;

public class App {
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		 ApplicationContext ctx =new FileSystemXmlApplicationContext("src/applicationContext.xml");
	      userDaoImp u=(userDaoImp)ctx.getBean("userDao");
	      
	     /* User user=new User(0, null, null);
	      
	      user.setUserName("1");
	      user.setPassword("1");
	      
	      boolean is=u.isLogin(user);
	      System.out.println(is);*/
	      
	}
}
