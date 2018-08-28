package com.team.app.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team.app.config.MqttIntrf;
import com.team.app.domain.LoraFrame;
import com.team.app.domain.TblUserInfo;
import com.team.app.domain.UserDeviceMapping;
import com.team.app.logger.AtLogger;
import com.team.app.service.ConsumerInstrumentService;
import com.team.app.service.OrganisationService;
import com.team.app.service.UserLoginService;
import com.team.app.utils.JsonUtil;

@Controller
@SessionAttributes({"status"})
public class WaterConsumptionController {

	private static final AtLogger logger = AtLogger.getLogger(WaterConsumptionController.class);
	
	
	@Autowired
	private MqttIntrf mqttIntrf;
	
	@Autowired
	private UserLoginService userLoginService;
	
	@Autowired
	private ConsumerInstrumentService consumerInstrumentServiceImpl;
	
	@Autowired
	private OrganisationService organisationService;
	
	
	@RequestMapping(value= {"/waterConsumption"}, method=RequestMethod.GET)
    public String waterConsumptionHanlder(Map<String,Object> map) {
		
			return "WaterConsumption";
		 
	 }
	
	@RequestMapping(value= {"/waterConsumptionCal"}, method={ RequestMethod.GET, RequestMethod.POST })
    public String waterConsumptionCalHandler(HttpSession session,HttpServletRequest request,Map<String,Object> map) throws Exception {
		
		 Map<String,Object> orgMapped=organisationService.getLoraServerOrganisation();	   
			map.put("organisations", orgMapped);	
				return "AdminWaterConsumptionCal";
		 
	 }
	
	
	@RequestMapping(value= {"/endUserWaterConsumption"}, method={ RequestMethod.GET, RequestMethod.POST })
    public String endUserWaterConsumptionHanlder(HttpSession session,HttpServletRequest request,Map<String,Object> map) {
		try{		  
		     TblUserInfo user=(TblUserInfo) session.getAttribute("user");
			 List<UserDeviceMapping> udm=user.getUserDeviceMappings();
			 
			 if(udm!=null && !udm.isEmpty()){
				 map.put("udmList", udm);
			 }
			 
		     List<LoraFrame> frm=(List<LoraFrame>) request.getAttribute("frames");
		     
		     if(frm!=null && !frm.isEmpty()){
			   map.put("frames", frm);
		     }	
		
		}catch(Exception e){
			e.printStackTrace();
		}
		return "EndUserWaterConsumption";
	 }
	
	
	@RequestMapping(value= {"/waterConsumptionUnits"}, method=RequestMethod.POST)
    public String waterConsumptionUnitsHanlder(HttpServletRequest request, Map<String,Object> map,RedirectAttributes redirectAttributes) {
		String orgs=request.getParameter("orgid");
		//String name=request.getParameter("orgName");
		String apps=request.getParameter("appid");
		String dev=request.getParameter("devid");
		String fDate=request.getParameter("fromDate");		
		String tDate=request.getParameter("toDate");
		
		String[] orgArr=orgs.split(":");
		String orgid=orgArr[0];
		String name=orgArr[1];
		String[] devArr=dev.split(":");
		String devNode=devArr[0];
		String[] appArr=apps.split(":");
		String appId=appArr[0];
				
		
		
		logger.debug("orgid",orgid);
		logger.debug("appId",appId);
		logger.debug("devNode",devNode);
		logger.debug("fromDate",fDate);
		logger.debug("toDate",fDate);
		try{
		
			SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	         Date fromDate=DATE_FORMAT.parse(DATE_FORMAT.format(new Date(fDate)));
	        Date toDate=DATE_FORMAT.parse(DATE_FORMAT.format(new Date(tDate)));
	        
	        Map<String,Object> orgMapped=organisationService.getLoraServerOrganisation();	   
			map.put("organisations", orgMapped);	
	            
	        List<LoraFrame> frames=consumerInstrumentServiceImpl.getFramesByFrmToDateAndDevEUI(devNode,fromDate,toDate);
	       
	        if(frames!=null && !frames.isEmpty()){
	        	logger.debug("list size",frames.size());
	        	map.put("frames", frames);
	        	
	        	//redirectAttributes.addAttribute("frames",frames);
	        	//redirectAttributes.addAllAttributes(request.getParameterMap());
	        }
		}catch(Exception e){
			e.printStackTrace();
		}
			return "WaterConsumptionVal";
		 
	 }
	
	
	/* Ajax calling for /getGraphVal */	
	@SuppressWarnings("unchecked")
	@RequestMapping(value= {"/getGraphVal"}, method=RequestMethod.POST)
    public @ResponseBody String getGraphValHandler(HttpServletRequest request) {
		String orgs=request.getParameter("orgId");
		String[] orgArr=orgs.split(":");
		String orgid=orgArr[0];
		String apps=request.getParameter("appId");
		String[] appArr=apps.split(":");
		String appId=appArr[0];
		String devNode=request.getParameter("devId");
		String fDate=request.getParameter("fromDate");		
		String tDate=request.getParameter("toDate");
		String type=request.getParameter("type");
		logger.debug("orgid",orgid);
		logger.debug("appId",appId);
		logger.debug("devNode",devNode);
		logger.debug("fromDate",fDate);
		logger.debug("toDate",fDate);
		logger.debug("type",type);
		
		String returnVal="";
		try{
			
			JSONArray dateUnitArr=null;
				dateUnitArr=new JSONArray();
				
			JSONObject json=null;	
				json=new JSONObject();	
			
			
			
			SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	        Date fromDate=DATE_FORMAT.parse(DATE_FORMAT.format(new Date(fDate)));
	        Date toDate=DATE_FORMAT.parse(DATE_FORMAT.format(new Date(tDate)));
	        if (fDate.compareTo(tDate) > 0) {
	        	logger.debug("Greater");
	        	json.put("result",dateUnitArr);
				returnVal=JsonUtil.objToJson(json);
				   return returnVal;
	        }
	        
	        
	        
	        Object[] frames=consumerInstrumentServiceImpl.getFramesByFrmToDateAndDevEUIAndAppId(appId,devNode,fromDate,toDate,type);
	        logger.debug("resultant",frames[0]);
	      
	       if(String.valueOf(frames[0])!=null && !String.valueOf(frames[0]).isEmpty()){
				String[] result=String.valueOf(frames[0]).split(",");
				logger.debug("result length",result.length);				
				
							
					for(int i=0;i<result.length;i++){							
						String[] jsonVal=result[i].split("&");
						JSONObject js=null;
							js=new JSONObject();
							js.put("xaxis", jsonVal[0]);
							js.put("units", Integer.parseInt(jsonVal[1]));
							dateUnitArr.add(js);
																		
					}
												
					json.put("result",dateUnitArr);
					returnVal=JsonUtil.objToJson(json);
				
				    logger.debug("Resultant JSON String ",returnVal);
	       }	         
		}catch(Exception e){
			e.printStackTrace();
		}
			return returnVal;
		 
	 }
	
	
	@RequestMapping(value= {"/endUserWaterConsumptionUnits"}, method=RequestMethod.POST)
    public String endUserWaterConsumptionUnitsHandler(HttpServletRequest request, Map<String,Object> map,RedirectAttributes redirectAttributes) throws Exception{
		
		String devNode=request.getParameter("devid");
		String fDate=request.getParameter("fromDate");		
		String tDate=request.getParameter("toDate");
		
		logger.debug("devNode",devNode);
		logger.debug("fromDate",fDate);
		logger.debug("toDate",fDate);
		try{
		
			SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	         Date fromDate=DATE_FORMAT.parse(DATE_FORMAT.format(new Date(fDate)));
	        Date toDate=DATE_FORMAT.parse(DATE_FORMAT.format(new Date(tDate)));
	        
	        	            
	        List<LoraFrame> frames=consumerInstrumentServiceImpl.getFramesByFrmToDateAndDevEUI(devNode,fromDate,toDate);
	       
	        if(frames!=null && !frames.isEmpty()){
	        	logger.debug("list size",frames.size());
	            	request.setAttribute("frames",frames);
	        	      	//redirectAttributes.addAllAttributes(request.getParameterMap());
	        }
		}catch(Exception e){
			e.printStackTrace();
			redirectAttributes.addFlashAttribute("status",
					"<div class=\"failure\" >System Exception in business logic..Sorry to failed!</div>");
		}
			return "forward:/endUserWaterConsumption";
		 
	 }
	
	
}
