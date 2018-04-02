package com.th.dao;

import com.th.entity.user;

public interface uumapper {
	user findbysome(String uname,String upassword);
	void adduser(user user);
}
