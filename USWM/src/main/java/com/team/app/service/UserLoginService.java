package com.team.app.service;

import java.util.List;

import com.team.app.domain.Role;
import com.team.app.domain.TblUserInfo;
import com.team.app.domain.UserDeviceMapping;

public interface UserLoginService {

	TblUserInfo getUserByUserAndPwd(String username, String password) throws Exception;

	List<TblUserInfo> getUserInfosCount() throws Exception;

	List<TblUserInfo> getUserInfos()throws Exception;

	TblUserInfo getUserByUnameAndEmail(String uname, String email)throws Exception;

	TblUserInfo getUserByEmailId(String email)throws Exception;

	Role getRoleByRoleId(String roleId)throws Exception;

	TblUserInfo saveUser(TblUserInfo user, UserDeviceMapping udm)throws Exception;

	

}
