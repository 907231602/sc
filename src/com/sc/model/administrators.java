package com.sc.model;

public class administrators {

	private int id;
	private String manageName;
	private String manageId;
	private String password;
	private String manageSex;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getManageName() {
		return manageName;
	}
	public void setManageName(String manageName) {
		this.manageName = manageName;
	}
	public String getManageId() {
		return manageId;
	}
	public void setManageId(String manageId) {
		this.manageId = manageId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getManageSex() {
		return manageSex;
	}
	public void setManageSex(String manageSex) {
		this.manageSex = manageSex;
	}
	@Override
	public String toString() {
		return "manage [id=" + id + ", manageName=" + manageName
				+ ", manageId=" + manageId + ", password=" + password
				+ ", manageSex=" + manageSex + "]";
	}
}
