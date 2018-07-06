package com.team.app.service;

import java.util.List;

import com.team.app.domain.TblUserInfo;

public interface UserLoginService {

	TblUserInfo getUserByUserAndPwd(String username, String password) throws Exception;

	List<TblUserInfo> getUserInfosCount() throws Exception;

	List<TblUserInfo> getUserInfos();

}
