package com.th.spring;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.th.dao.produMapper;
import com.th.dao.typeeMapper;
import com.th.dao.uumapper;
import com.th.entity.produ;
import com.th.entity.user;

@Controller
@SessionAttributes("user")
public class FindUser {

	@ModelAttribute
	public user getUser() {
		return new user();
	}
	@Autowired
	private uumapper mapper;
	@Autowired
	private typeeMapper typee;
	@Autowired
	private produMapper produmapper;
	
	public void setProdumapper(produMapper produmapper) {
		this.produmapper = produmapper;
	}


	public void setTypee(typeeMapper typee) {
		this.typee = typee;
	}


	public void setMapper(uumapper mapper) {
		this.mapper = mapper;
	}


	@RequestMapping("findbyname")
	@ResponseBody
	public Map<String, Object> findByName(@RequestBody user uname) {
		Map<String, Object> modelMap = new HashMap<String, Object>();
		user user = mapper.findbysome(uname.getUname(), null);
		if(user==null) {
			modelMap.put("num","0");
		}else {
			modelMap.put("num","1");
		}
		return modelMap;
	}
	@RequestMapping("findbynameandps")
	@ResponseBody
	public Map<String, Object> findByNameandps(@RequestBody user  map ) {
		Map<String, Object> modelMap = new HashMap<String, Object>();
		user user = mapper.findbysome(map.getUname(), map.getUpassword());
		if(user==null) {
			modelMap.put("num","0");
		}else {
			modelMap.put("num","1");
		}
		return modelMap;
	}
	@RequestMapping("userlog")
	public ModelAndView userlog(user user,ModelAndView mod) {
		user userr = mapper.findbysome(user.getUname(), user.getUpassword());
		mod.setViewName("addpro");
		mod.addObject("user", userr);
		return mod;
	}
	@RequestMapping("adduser")
	public String adduser(user user) {
		mapper.adduser(user);
		return "index";
	}
	
	@RequestMapping("findtypee")
	@ResponseBody
	public Map<String, Object> findtypee(){
		Map<String, Object> modelMap = new HashMap<String, Object>();
		List<com.th.entity.typee> list = typee.findalltypee();
		modelMap.put("size", list.size());
		for(int i=0;i<list.size();i++){
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("t_id", list.get(i).getT_id());
			map.put("text", list.get(i).getText());
			modelMap.put(i+"", map);			
		}
		return modelMap;
	}
	@RequestMapping("findprice")
	public  String findprice(String  pro,Map map) {
		String[] proo=pro.split(";");
		Gson json = new Gson();
		List<List<produ>> pp=new ArrayList();
		for(int i=0;i<proo.length;i++) {
			pp.add((List<produ>) produmapper.findbykey(json.fromJson(proo[i], produ.class).getKey()));
			map.put("num"+i, json.fromJson(proo[i], produ.class));
		}
		map.put("alll", pro);
		map.put("list", pp);
		//System.out.println("这确实是个注意"+"    "+produ.getKey().split(",").length+"   "+produ.getKey().split(",")[1]);
		
		return "addprice";
	}
}
