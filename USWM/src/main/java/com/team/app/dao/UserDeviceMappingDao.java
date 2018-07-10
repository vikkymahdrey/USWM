package com.team.app.dao;

import java.io.Serializable;

import org.springframework.data.jpa.repository.JpaRepository;

import com.team.app.domain.UserDeviceMapping;

public interface UserDeviceMappingDao extends JpaRepository<UserDeviceMapping, Serializable> {

}
