package com.team.app.service;

import java.util.List;

import com.team.app.domain.LoraFrame;
import com.team.app.domain.TblUserInfo;

/**
 * 
 * @author Vikky
 *
 */
public interface ConsumerInstrumentService {
		
	public void setUpdateNodeName(String nodeName, String devEUI)throws Exception;	
	public void deleteDevEUI(String appId, String devEUI)throws Exception;
	public List<LoraFrame> getDevEUIByAppId(String appId)throws Exception;
	public List<LoraFrame> getDeviceIdByDevEUI(String devEUI)throws Exception;
	public List<LoraFrame> getFrames()throws Exception;
	public String getUserAccountMessage(TblUserInfo u)throws Exception;
	
}
