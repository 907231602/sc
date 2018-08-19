package com.sc.dao.Imp;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.sc.dao.DownloadAndUploadDao;

public  class DownloadAndUploadDaoImp implements DownloadAndUploadDao {

	private SqlMapClient client = null;

	public SqlMapClient getClient() {

		return client;

	}

	public void setClient(SqlMapClient client) {
		this.client = client;
	}
	
	/**
	 * 添加文件名到数据库
	 */
	@Override
	public void insertNewFileName(String fileFileName,String root,String username) {
		// TODO Auto-generated method stub
		HashMap hash=new HashMap();
		hash.put("fileFileName", fileFileName);
		hash.put("root", root);
		hash.put("username", username);
		try {
			client.insert("DownloadAndUploadMapper.insertNewFileName", hash);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public List getAllFileInfo() {
		// TODO Auto-generated method stub
		List list=null;
		try {
			list=client.queryForList("DownloadAndUploadMapper.getAllFileInfo");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public String getfileNameByid(int id) {
		// TODO Auto-generated method stub
		String name=null;
		try {
			name=(String) client.queryForObject("DownloadAndUploadMapper.getfileNameByid", id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return name;
	}

	@Override
	public void deletefileById(String id) {
		// TODO Auto-generated method stub
		try {
			client.delete("DownloadAndUploadMapper.deletefileById", id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
	

}
