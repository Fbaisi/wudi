package com.th.entity;

import java.util.List;

public class produ {
	private Integer pid;
	private typee typee;
	private String key;
	private String p_title;
	private String p_url;
	private String p_text;
	private Double price;
	private user uid;
	private List pricelist;
	

	
	public List getPricelist() {
		return pricelist;
	}
	public void setPricelist(List pricelist) {
		this.pricelist = pricelist;
	}
	public user getUid() {
		return uid;
	}
	public void setUid(user uid) {
		this.uid = uid;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public Integer getPid() {
		return pid;
	}
	public void setPid(Integer pid) {
		this.pid = pid;
	}
	public typee getTypee() {
		return typee;
	}
	public void setTypee(typee typee) {
		this.typee = typee;
	}
	public String getP_title() {
		return p_title;
	}
	public void setP_title(String p_title) {
		this.p_title = p_title;
	}
	public String getP_url() {
		return p_url;
	}
	public void setP_url(String p_url) {
		this.p_url = p_url;
	}
	public String getP_text() {
		return p_text;
	}
	public void setP_text(String p_text) {
		this.p_text = p_text;
	}
	@Override
	public String toString() {
		return "produ [pid=" + pid + ", typee=" + typee + ", key=" + key + ", p_title=" + p_title + ", p_url=" + p_url
				+ ", p_text=" + p_text + ", price=" + price + ", uid=" + uid + ", pricelist=" + pricelist + "]";
	}
	

	

	

	
	
}
