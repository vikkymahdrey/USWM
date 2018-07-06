package com.team.app.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.app.dao.FrameDao;
import com.team.app.domain.LoraFrame;
import com.team.app.logger.AtLogger;
import com.team.app.service.ConsumerInstrumentService;

/**
 * 
 * @author Vikky
 *
 */
@Service("consumerInstrumentServiceImpl")
public class ConsumerInstrumentServiceImpl implements ConsumerInstrumentService {

	private final AtLogger logger = AtLogger.getLogger(ConsumerInstrumentServiceImpl.class);
	
		
	@Autowired
	private FrameDao frameDao;		
		
	public void setUpdateNodeName(String nodeName,String devEUI) throws Exception {
		frameDao.setUpdateNodeName(nodeName,devEUI);
	}

	public void deleteDevEUI(String appId, String devEUI) throws Exception {
		frameDao.deleteDevEUI(appId,devEUI);
		
	}
	
	public List<LoraFrame> getDevEUIByAppId(String appId) throws Exception {
		return frameDao.getDevEUIByAppId(appId);
	}

	public List<LoraFrame> getDeviceIdByDevEUI(String devEUI) throws Exception {
		return frameDao.getDeviceIdByDevEUI(devEUI);
	}

	public List<LoraFrame> getFrames() throws Exception {
		return frameDao.getFrames();
	}





	

	
}