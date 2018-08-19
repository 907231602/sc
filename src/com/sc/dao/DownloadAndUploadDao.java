package com.sc.dao;

import java.util.List;

public interface DownloadAndUploadDao {
	public void insertNewFileName(String fileFileName,String root,String username);
	
	public List getAllFileInfo();
	
	public String getfileNameByid(int id);
	
	public void deletefileById(String id);
}
