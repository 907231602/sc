package com.sc.dao.Imp;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.sc.dao.administratorsDao;

public class administratorsDaoImp implements administratorsDao {
	private SqlMapClient client = null;

	public SqlMapClient getClient() {

		return client;

	}

	public void setClient(SqlMapClient client) {
		this.client = client;
	}

	@Override
	public boolean administratorIslodined(String userId, String userPasswd) {
		// TODO Auto-generated method stub
		String ps=null;
		try {
			 ps=(String) client.queryForObject("administratorsMapper.administratorIslodined", userId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(userPasswd.equals(ps))
			return true;
		else
		return false;
	}

	@Override
	public List findAdminInfoById(String adminId) {
		// TODO Auto-generated method stub
		List listAdmin=null;
		try {
			listAdmin=client.queryForList("administratorsMapper.findAdminInfoById", adminId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listAdmin;
	}

	@Override
	public void changeAdminPassword(String adminId,String adminPs) {
		// TODO Auto-generated method stub
		HashMap map=new HashMap();
		map.put("adminId", adminId);
		map.put("adminPs", adminPs);
		try {
			client.update("administratorsMapper.changeAdminPassword", map);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public String getAdminNameById(String userId) {
		// TODO Auto-generated method stub
		String name=null;
		try {
			name=(String) client.queryForObject("administratorsMapper.getAdminNameById", userId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return name;
	}
}
