package com.sc.dao.Imp;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.sc.dao.homeDao;

public class homeDaoImp implements homeDao {

	private SqlMapClient client;
	
	public SqlMapClient getClient() {
		return client;
	}

	public void setClient(SqlMapClient client) {
		this.client = client;
	}

	@Override
	public List getAllFileName() {
		// TODO Auto-generated method stub
		List list=null;
		try {
			list=client.queryForList("homeMapper.getAllFileName");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

}
