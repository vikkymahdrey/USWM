package com.team.app.dao;

import java.io.Serializable;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.team.app.domain.TblDownlinkHoulyConfig;

public interface DownlinkHourlyConfigDao  extends JpaRepository<TblDownlinkHoulyConfig, Serializable> {

	@Query("From TblDownlinkHoulyConfig")
	List<TblDownlinkHoulyConfig> getDownlinkHourlyConfig();


}
