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

import com.team.app.domain.LoraFrame;
import com.team.app.domain.TblDownlinkHoulyConfig;
import com.team.app.domain.TblDownlinkPacketConfig;
import com.team.app.domain.TblKeywordType;
import com.team.app.domain.TblRetryConfig;
import com.team.app.domain.TblRetryIntervalMap;
import com.team.app.logger.AtLogger;
import com.team.app.service.ConsumerInstrumentService;
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
	

	@Autowired
	private ConsumerInstrumentService  consumerInstrumentService;
	
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
					returnVal+="<option value="+p.getPacket()+">"+ p.getPacket() + "</option>";
				}
		}
		
			 return returnVal;
	}
	
	
	
	@RequestMapping(value= {"/retryConfig"}, method=RequestMethod.GET)
	public String uplinkRetryConfigHandler(HttpSession session,HttpServletRequest request,Map<String,Object> map) throws Exception{
		logger.debug("Inside /retryConfig");		
		Map<String,Object> orgMapped=organisationService.getLoraServerOrganisation();	   
			map.put("organisations", orgMapped);
		List<TblKeywordType> keyTypes= keywordService.getKeywordTypes(); 
			map.put("keyTypes",keyTypes);
		List<TblRetryConfig> retryConfig=downlinkService.getDownlinkForRetryConfig();
			map.put("retryConfig",retryConfig);		
			 return "retryConfig";
	}
	
	
	@RequestMapping(value= {"/getIntervalOfRetry"}, method=RequestMethod.POST)
	public @ResponseBody String getIntervalOfRetryHandler(HttpSession session,HttpServletRequest request,Map<String,Object> map) throws Exception{
		logger.debug("Inside /getIntervalOfRetry");
		String retryId=request.getParameter("retryId").trim();
		String returnVal="";
		
		TblRetryConfig retry=downlinkService.getRetryConfigById(retryId);
		if(retry!=null){
			List<TblRetryIntervalMap> retryIntervals=retry.getTblRetryIntervalMaps();
			if(retryIntervals!=null && !retryIntervals.isEmpty()){
				for(TblRetryIntervalMap r : retryIntervals){
						returnVal+="<option value="+r.getInterval()+">"+ r.getInterval() + "</option>";
					}
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
		String appName=appArr[1];
		String devId=request.getParameter("devId").trim();
		String pktId=request.getParameter("hourly").trim();
		String packetlength=request.getParameter("packet").trim();
		
		logger.debug("orgID as ",orgId);
		logger.debug("appId as ",appId);
		logger.debug("appName as ",appName);
		logger.debug("devId as ",devId);
		logger.debug("pktId as ",pktId);
		logger.debug("packetlength as ",packetlength);	
		String returnVal="";
						
		try{			
			LoraFrame frm=consumerInstrumentService.getLoraFrameByDevEUIAndAppID(devId,appId);
			if(frm!=null){				
					returnVal=downlinkService.doDownlinkForMPDU(frm.getDevEUI(), frm.getApplicationID(), frm.getfPort(),pktId,packetlength);
			}else{
				logger.debug("No Data Found!");
				returnVal="No Data Found!";
			}	
				
		}catch(Exception e){
			returnVal="Failed!";
		}
		
		
		return returnVal;
	}
	
	
	
	@RequestMapping(value= {"/retrySetting"}, method=RequestMethod.POST)
	public @ResponseBody String retrySettingHandler(HttpSession session,HttpServletRequest request,Map<String,Object> map) throws Exception{
		logger.debug("Inside /downlinkSetting");
		String orgs=request.getParameter("orgId").trim();
		String[] orgArr=orgs.split(":");
		String orgId=orgArr[0];
		String apps=request.getParameter("appId").trim();
		String[] appArr=apps.split(":");
		String appId=appArr[0];
		String appName=appArr[1];
		String devId=request.getParameter("devId").trim();
		String retry=request.getParameter("retry").trim();
		String interval=request.getParameter("interval").trim();
		
		logger.debug("orgID as ",orgId);
		logger.debug("appId as ",appId);
		logger.debug("appName as ",appName);
		logger.debug("devId as ",devId);
		logger.debug("retry as ",retry);
		logger.debug("interval as ",interval);	
		String returnVal="";
						
		try{			
			LoraFrame frm=consumerInstrumentService.getLoraFrameByDevEUIAndAppID(devId,appId);
			if(frm!=null){	
				TblRetryConfig retryVal=downlinkService.getRetryConfigById(retry);
				if(retryVal!=null){
					returnVal=downlinkService.doDownlinkForRetry(frm.getDevEUI(), frm.getApplicationID(), frm.getfPort(),retryVal.getRetryVol(),interval);
				}else{
					returnVal="No Retry Found!";
				}
			}else{
				logger.debug("No Data Found!");
				returnVal="No Data Found!";
			}	
				
		}catch(Exception e){
			returnVal="Failed!";
		}
		
		
		return returnVal;
	}
	
	
	
	
	
	
	/*@RequestMapping(value= {"/dateConfig"}, method=RequestMethod.GET)
	public String dateConfigHandler(HttpSession session,HttpServletRequest request,Map<String,Object> map) throws Exception{
		logger.debug("Inside /dateConfig");	
		
		Map<String,Object> orgMapped=organisationService.getLoraServerOrganisation();	   
			map.put("organisations", orgMapped);
		List<TblKeywordType> keyTypes= keywordService.getKeywordTypes(); 
			map.put("keyTypes",keyTypes);
			 return "dateConfig";
	}
	
	
	
	@RequestMapping(value= {"/dateSetting"}, method=RequestMethod.POST)
	public @ResponseBody String dateSettingHandler(HttpSession session,HttpServletRequest request,Map<String,Object> map) throws Exception{
		logger.debug("Inside /downlinkSetting");
		String orgs=request.getParameter("orgId").trim();
		String[] orgArr=orgs.split(":");
		String orgId=orgArr[0];
		String apps=request.getParameter("appId").trim();
		String[] appArr=apps.split(":");
		String appId=appArr[0];
		String appName=appArr[1];
		String devId=request.getParameter("devId").trim();
		String fromDate=request.getParameter("fromDate").trim();
		
		
		logger.debug("orgID as ",orgId);
		logger.debug("appId as ",appId);
		logger.debug("appName as ",appName);
		logger.debug("devId as ",devId);
		logger.debug("fromDate as ",fromDate);

		String returnVal="";
						
		try{			
			LoraFrame frm=consumerInstrumentService.getLoraFrameByDevEUIAndAppID(devId,appId);
			if(frm!=null){				
					byte[] byteArr = new byte[4];
					
					 SimpleDateFormat formatDay = new SimpleDateFormat("dd");
					 SimpleDateFormat formatMonth = new SimpleDateFormat("MM");
					 SimpleDateFormat formatYear = new SimpleDateFormat("YY");

					   String currentDay = formatDay.format(new Date(fromDate));
					    String currentMonth = formatMonth.format(new Date(fromDate));
					    String currentYear = formatYear.format(new Date(fromDate));
					
					
				
					byteArr[0]=Byte.valueOf(AppConstants.date);
					byteArr[1]=Byte.valueOf(currentYear);
					byteArr[2]=Byte.valueOf(currentMonth);
					byteArr[3]=Byte.valueOf(currentDay);
									
					
					logger.debug("/byteArr[0] ",byteArr[0]);				
					logger.debug("/byteArr[1] ",byteArr[1]);
					logger.debug("/byteArr[2] ",byteArr[2]);
					logger.debug("/byteArr[2] ",byteArr[3]);
					
					int fPort=0;
					try{
						fPort=Integer.parseInt(frm.getFPort());
					}catch(Exception e){
						;
					}
					
					 logger.debug("/fPort printing int ",fPort);			 
					 logger.debug("Base64 resultant",Base64.encodeBase64String(byteArr));
					 
					 JSONObject jsonObj=null;
		 				jsonObj=new JSONObject();
		 				jsonObj.put("confirmed",true);
		 				jsonObj.put("data",Base64.encodeBase64String(byteArr));
		 				jsonObj.put("devEUI",devId);
		 				jsonObj.put("fPort",fPort);
		 				jsonObj.put("reference","DateSetting");
	 	
					
	 				String jsonData=jsonObj.toString(); 			
							
	 				String url=AppConstants.domain+"/api/nodes/"+devId+"/queue";
		    				logger.debug("URLConn",url);	    				
		    				URL obj1 = new URL(url);
		    				HttpURLConnection con = (HttpURLConnection) obj1.openConnection();
		    				con.setDoOutput(true);
		    				con.setRequestMethod("POST");
		    				con.setRequestProperty("accept", "application/json");
		    				con.setRequestProperty("Content-Type", "application/json");
		    				con.setRequestProperty("Grpc-Metadata-Authorization",AppConstants.jwtToken);
		    				
		    				OutputStream os = con.getOutputStream();
		    		        os.write(jsonData.getBytes());
		    		        os.flush();
		    		        os.close();
		    		        
		    				int responseCode = con.getResponseCode();
		    					logger.debug("POST Response Code :: " + responseCode);
		    						logger.debug("POST Response message :: " + con.getResponseMessage());
		    				
		    				if(responseCode == HttpURLConnection.HTTP_OK) {
		    					returnVal="success";	
		    				}else{
		    					returnVal="failed";
		    				}							
						
				
				
			}else{
				logger.debug("No Data Found!");
				returnVal="No Data Found!";
			}	
				
		}catch(Exception e){
			logger.error(e);
		}
		
		
		return returnVal;
	}*/

}
