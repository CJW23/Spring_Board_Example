package org.zerock.domain;

import java.util.Date;

public class UserVO {
	private int id;
	private String uid;
	private String upw;
	private String uname;
	private String email;
	private Date loginupdate;
	private Date registerupdate;
	
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getUpw() {
		return upw;
	}
	public void setUpw(String upw) {
		this.upw = upw;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getLoginupdate() {
		return loginupdate;
	}
	public void setLoginupdate(Date loginupdate) {
		this.loginupdate = loginupdate;
	}
	public Date getRegisterupdate() {
		return registerupdate;
	}
	public void setRegisterupdate(Date registerupdate) {
		this.registerupdate = registerupdate;
	}
	@Override
	public String toString() {
		return Integer.toString(id);
	}
}
