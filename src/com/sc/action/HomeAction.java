package com.sc.action;

import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.sc.dao.homeDao;

public class HomeAction {
	
	private homeDao homedao;

	public homeDao getHomedao() {
		return homedao;
	}

	public void setHomedao(homeDao homedao) {
		this.homedao = homedao;
	}

	public String getAllFile(){
		/**
		 * 判断用户的session是否到期，到期就退出页面
		 */
		String adminId=(String) ActionContext.getContext().getSession().get("studentID");
		if(adminId==null)
			return "sessionIsNull";
		
		List listfile=getHomedao().getAllFileName();
		ActionContext.getContext().put("listfile", listfile);
		return "listfile";
		
	}
}
