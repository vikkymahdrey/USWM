package com.team.app.dao;

import java.io.Serializable;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.team.app.domain.TblDeviceBattreyInfo;

public interface DeviceBattreyInfoDao extends JpaRepository<TblDeviceBattreyInfo, Serializable> {

	@Query("Select b from TblDeviceBattreyInfo b where b.devEUI=:devEUI")
	TblDeviceBattreyInfo getDeviceBattreyInfoByDevEUI(@Param("devEUI") String devEUI);

}
