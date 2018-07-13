package com.team.app.dao;

import java.io.Serializable;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.team.app.domain.UserDeviceMapping;

public interface UserDeviceMappingDao extends JpaRepository<UserDeviceMapping, Serializable> {

	@Query("from UserDeviceMapping udm where udm.devEUI=:devEUI")
	UserDeviceMapping getDeviceByEUI(@Param("devEUI") String devEUI);
	
	@Query("from UserDeviceMapping udm where udm.devEUI=:devEUI and udm.orgId=:orgId")
	UserDeviceMapping getDeviceByEUIAndOrgId(@Param("devEUI") String devEUI, @Param("orgId") String orgId);

}
