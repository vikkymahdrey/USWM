package com.team.app.service;

import com.team.app.domain.TblUserInfo;

public interface UserLoginService {

	TblUserInfo getUserByUserAndPwd(String username, String password) throws Exception;

}
