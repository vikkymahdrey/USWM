package com.team.app.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.app.dao.DownlinkHourlyConfigDao;
import com.team.app.dao.DownlinkPacketConfigDao;
import com.team.app.domain.TblDownlinkHoulyConfig;
import com.team.app.domain.TblDownlinkPacketConfig;
import com.team.app.logger.AtLogger;
import com.team.app.service.DownlinkService;

@Service
public class DownlinkServiceImpl implements DownlinkService {
	
	private static final AtLogger logger = AtLogger.getLogger(DownlinkServiceImpl.class);
	
	@Autowired
	private DownlinkPacketConfigDao downlinkPacketConfigDao;
	
	@Autowired
	private DownlinkHourlyConfigDao downlinkHourlyConfigDao;	

	public List<TblDownlinkHoulyConfig> getDownlinkHourlyConfig() throws Exception {
		return downlinkHourlyConfigDao.getDownlinkHourlyConfig();
	}

	
	public List<TblDownlinkPacketConfig> getDownlinkPacketByHourlyID(String hourly) throws Exception {
		
		return downlinkPacketConfigDao.getDownlinkPacketByHourlyID(hourly);
	}

	
}
