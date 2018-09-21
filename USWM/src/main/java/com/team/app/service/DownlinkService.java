package com.team.app.service;

import java.util.List;

import com.team.app.domain.TblDownlinkHoulyConfig;
import com.team.app.domain.TblDownlinkPacketConfig;

public interface DownlinkService {
	
	List<TblDownlinkHoulyConfig> getDownlinkHourlyConfig() throws Exception;

	List<TblDownlinkPacketConfig> getDownlinkPacketByHourlyID(String hourly)throws Exception;

}
