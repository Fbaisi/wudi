package com.th.entity;

import java.util.List;

public class user {
	private Integer uid;
	private String uname;
	private String factoryname;
	private String factorynum;
	private String upassword;
	private List<produ> produ;
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getFactoryname() {
		return factoryname;
	}
	public void setFactoryname(String factoryname) {
		this.factoryname = factoryname;
	}
	public String getFactorynum() {
		return factorynum;
	}
	public void setFactorynum(String factorynum) {
		this.factorynum = factorynum;
	}
	public String getUpassword() {
		return upassword;
	}
	public void setUpassword(String upassword) {
		this.upassword = upassword;
	}
	
	public List<produ> getProdu() {
		return produ;
	}
	public void setProdu(List<produ> produ) {
		this.produ = produ;
	}
	@Override
	public String toString() {
		return "user [uid=" + uid + ", uname=" + uname + ", factoryname=" + factoryname + ", factorynum=" + factorynum
				+ ", upassword=" + upassword + ", produ=" + produ + "]";
	}

	
	
}
