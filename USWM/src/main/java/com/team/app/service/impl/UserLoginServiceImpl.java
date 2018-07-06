package com.team.app.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.app.dao.UserInfoDao;
import com.team.app.domain.TblUserInfo;
import com.team.app.logger.AtLogger;
import com.team.app.service.UserLoginService;

@Service
public class UserLoginServiceImpl implements UserLoginService {
	
	private static final AtLogger logger = AtLogger.getLogger(UserLoginServiceImpl.class);

	@Autowired
	private UserInfoDao userInfoDao;
	
	
	public TblUserInfo getUserByUserAndPwd(String username, String password) throws Exception {
		return userInfoDao.getUserByUserAndPwd(username,password);
	}


	
	public List<TblUserInfo> getUserInfosCount() throws Exception {
		return userInfoDao.getUserInfosCount();
	}



	public List<TblUserInfo> getUserInfos() {
		return userInfoDao.getUserInfos();
	}

}
