package com.sc.dao.Imp;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.sc.dao.userDao;
import com.sc.model.User;

public class userDaoImp implements userDao {

	private SqlMapClient client = null;

	public SqlMapClient getClient() {

		return client;

	}

	public void setClient(SqlMapClient client) {
		this.client = client;
	}

	public boolean isLogin(User user) {
		try {
			System.out.println("client====" + client);
			User u = (User) client.queryForObject("User.checkUser", user);
			if (u != null) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

}
