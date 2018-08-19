package com.sc.action;

import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.sc.dao.administratorsDao;
import com.sc.model.administrators;

public class administratorAction {
	private administrators administrator;
    private administratorsDao administratorsdao;
    private String password;
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public administrators getAdministrator() {
		return administrator;
	}
	public void setAdministrator(administrators administrator) {
		this.administrator = administrator;
	}
	public administratorsDao getAdministratorsdao() {
		return administratorsdao;
	}
	public void setAdministratorsdao(administratorsDao administratorsdao) {
		this.administratorsdao = administratorsdao;
	}
	
	public String lookAdministratorInfo(){
		
		
		//studentID获取的是administrator的id
		String adminId=(String) ActionContext.getContext().getSession().get("studentID");
		if(adminId==null)
			return "sessionIsNull";
		List listadmin=getAdministratorsdao().findAdminInfoById(adminId);
		ActionContext.getContext().put("listadmin", listadmin);
		return "listadmin";
		
	}

	public String changeAdminPasswd(){
		
		String adminId=(String) ActionContext.getContext().getSession().get("studentID");
		String adminPs=getPassword();
		if(adminId==null)
			return "sessionIsNull";
		getAdministratorsdao().changeAdminPassword(adminId,adminPs);
		
		String adminsId=(String) ActionContext.getContext().getSession().get("studentID");
		List listadmin=getAdministratorsdao().findAdminInfoById(adminsId);
		ActionContext.getContext().put("listadmin", listadmin);
		ActionContext.getContext().put("isOK", "OK");
		return "listadmin";
		
	
		
	}
	
}
