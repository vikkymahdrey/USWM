package com.team.app.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.team.app.domain.TblDownlinkHoulyConfig;
import com.team.app.domain.TblDownlinkPacketConfig;
import com.team.app.domain.TblKeywordType;
import com.team.app.dto.ApplicationDto;
import com.team.app.logger.AtLogger;
import com.team.app.service.DownlinkService;
import com.team.app.service.KeywordService;
import com.team.app.service.OrganisationService;

@Controller
@SessionAttributes({"status"})
public class DownlinkController {
	
	private static final AtLogger logger = AtLogger.getLogger(DownlinkController.class);
	
	@Autowired
	private OrganisationService organisationService;
	
	@Autowired
	private KeywordService keywordService;
	
	@Autowired
	private DownlinkService downlinkService;
	
	@RequestMapping(value= {"/downlinkConfig"}, method=RequestMethod.GET)
	public String downlinkConfigHandler(HttpSession session,HttpServletRequest request,Map<String,Object> map) throws Exception{
		logger.debug("Inside /downlinkConfig");		
		Map<String,Object> orgMapped=organisationService.getLoraServerOrganisation();	   
			map.put("organisations", orgMapped);
		List<TblKeywordType> keyTypes= keywordService.getKeywordTypes(); 
			map.put("keyTypes",keyTypes);
		List<TblDownlinkHoulyConfig> configs=downlinkService.getDownlinkHourlyConfig();
			map.put("configs",configs);		
			 return "downlinkConfig";
	}
	
	@RequestMapping(value= {"/getPacketByHourly"}, method=RequestMethod.POST)
	public @ResponseBody String getPacketByHourlyHandler(HttpSession session,HttpServletRequest request,Map<String,Object> map) throws Exception{
		logger.debug("Inside /getPacketByHourly");
		String hourly=request.getParameter("hourly").trim();
		String returnVal="";
		
		List<TblDownlinkPacketConfig> packets=downlinkService.getDownlinkPacketByHourlyID(hourly);
		if(packets!=null && !packets.isEmpty()){
			for(TblDownlinkPacketConfig p : packets){
					returnVal+="<option value="+p.getId()+">"+ p.getPacket() + "</option>";
				}
		}
		
			 return returnVal;
	}
	
	
	@RequestMapping(value= {"/downlinkSetting"}, method=RequestMethod.POST)
	public @ResponseBody String downlinkSettingHandler(HttpSession session,HttpServletRequest request,Map<String,Object> map) throws Exception{
		logger.debug("Inside /downlinkSetting");
		String orgs=request.getParameter("orgId").trim();
		String[] orgArr=orgs.split(":");
		String orgId=orgArr[0];
		String apps=request.getParameter("appId").trim();
		String[] appArr=apps.split(":");
		String appId=appArr[0];
		String devId=request.getParameter("devId").trim();
		String hourly=request.getParameter("hourly").trim();
		String packet=request.getParameter("packet").trim();
		
		
		String returnVal="success";
			 return returnVal;
	}

}
