package com.team.app.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.app.dao.UserInfoDao;
import com.team.app.domain.TblUserInfo;
import com.team.app.service.UserLoginService;

@Service
public class UserLoginServiceImpl implements UserLoginService {

	@Autowired
	private UserInfoDao userInfoDao;
	
	
	public TblUserInfo getUserByUserAndPwd(String username, String password) throws Exception {
		return userInfoDao.getUserByUserAndPwd(username,password);
	}

}
