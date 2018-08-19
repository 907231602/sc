package com.sc.dao;

import java.util.List;

public interface administratorsDao {
	public boolean administratorIslodined(String userId,String userPasswd);

	public List findAdminInfoById(String adminId);
	
	public void changeAdminPassword(String adminId,String adminPs);
	
	public String getAdminNameById(String userId);
}
