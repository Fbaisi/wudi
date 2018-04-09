package com.th.entity;

public class typee {
	private Integer t_id;
	private String text;
	public Integer getT_id() {
		return t_id;
	}
	public void setT_id(Integer t_id) {
		this.t_id = t_id;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	@Override
	public String toString() {
		return "typee [t_id=" + t_id + ", text=" + text + "]";
	}
	
}
