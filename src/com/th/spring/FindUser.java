package com.th.spring;

import java.util.HashMap;
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

import com.th.dao.uumapper;
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
	
	
	public void setMapper(uumapper mapper) {
		this.mapper = mapper;
	}


	@RequestMapping("findbyname")
	@ResponseBody
	public Map<String, Object> findByName(@RequestBody String uname) {
		System.out.println("确实来到这里了");
		Map<String, Object> modelMap = new HashMap<String, Object>();
		user user = mapper.findbysome(uname, null);
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
		System.out.println("确实来到这里了1123");
		System.out.println(map);
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
}
