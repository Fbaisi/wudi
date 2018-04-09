package com.th.spring;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.databind.util.JSONPObject;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.th.dao.produMapper;
import com.th.dao.typeeMapper;
import com.th.entity.produ;
import com.th.entity.user;

import net.sf.json.JSONObject;

@Controller
public class addProdu {
	@RequestMapping("sureprice")
	public String sureprice(String str,Map map) {
		map.put("all", str);
		System.out.println(str);
		return "issure";
	}
	@Autowired
	private produMapper produmapper;
	
	public void setProdumapper(produMapper produmapper) {
		this.produmapper = produmapper;
	}
	@Autowired
	private typeeMapper typemapper;
	
	public void setTypemapper(typeeMapper typemapper) {
		this.typemapper = typemapper;
	}

	@RequestMapping("isok")
	public String isok(String str,Map map,HttpSession session) {
		System.out.println(str);
		String[] proo=str.split(";");
		Gson json = new Gson();
		String ss=proo[proo.length-1];
		JSONObject price = new JSONObject().fromObject(ss);
		List list = new ArrayList();
		user user=(com.th.entity.user) session.getAttribute("user");
		for(int i=0;i<proo.length-1;i++) {
			produ pro = new produ();
			pro=json.fromJson(proo[i], produ.class);
			String tt=proo[i];
			JSONObject ttt = new JSONObject().fromObject(tt);
			pro.setTypee(typemapper.findbyid(Integer.parseInt((String) ttt.get("typee.t_id"))));
			switch (i) {
			case 0:
				pro.setPrice(Double.parseDouble((String) price.get("price0")));
				break;
			case 1:
				pro.setPrice(Double.parseDouble((String) price.get("price1")));
				break;
			case 2:
				pro.setPrice(Double.parseDouble((String) price.get("price2")));
				break;
			default:
				break;
			}
			pro.setUid(user);
			list.add(pro);
		}
		produmapper.addprodu(list);
		return "succ";
	}
}
