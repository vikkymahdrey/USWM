package com.team.app.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team.app.config.MqttIntrf;
import com.team.app.constant.AppConstants;
import com.team.app.domain.LoraFrame;
import com.team.app.domain.TblUserInfo;
import com.team.app.domain.UserDeviceMapping;
import com.team.app.logger.AtLogger;
import com.team.app.service.ConsumerInstrumentService;
import com.team.app.service.UserLoginService;

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
	
	
	@RequestMapping(value= {"/waterConsumption"}, method=RequestMethod.GET)
    public String waterConsumptionHanlder(Map<String,Object> map) {
		
			return "WaterConsumption";
		 
	 }
	
	@RequestMapping(value= {"/waterConsumptionCal"}, method={ RequestMethod.GET, RequestMethod.POST })
    public String waterConsumptionCalHandler(HttpSession session,HttpServletRequest request,Map<String,Object> map) {
		
		  String orgName="";
		   String id="";
		  
		/* Map<String, String[]> map1=request.getParameterMap();
		   for(Map.Entry<String, String[]> entry : map1.entrySet()){
			   logger.debug("Key",entry.getKey());
			   if(entry.getKey().equals("frames")){
				   List<LoraFrame> list= new ArrayList<LoraFrame>();
			   }
			   String[] val=entry.getValue();
			   logger.debug("value",val[0]);
		   }*/
				   
		 try {
			 
		   	String url=AppConstants.org_url;
			logger.debug("URLConn",url);
			URL obj1 = new URL(url);
			HttpURLConnection con = (HttpURLConnection) obj1.openConnection();
			con.setDoOutput(true);
			con.setRequestMethod("GET");
			con.setRequestProperty("accept", "application/json");
			con.setRequestProperty("Content-Type", "application/json");
			con.setRequestProperty("Grpc-Metadata-Authorization",AppConstants.jwtToken);
			
			    
			int responseCode = con.getResponseCode();
				logger.debug("POST Response Code :: " + responseCode);
					    				
			if(responseCode == HttpURLConnection.HTTP_OK) {
				logger.debug("Token valid,POST Response with 200");
				
				BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
				String inputLine;
				StringBuffer response = new StringBuffer();

				while ((inputLine = in.readLine()) != null) {
					response.append(inputLine);
				}
				
				in.close();
				
				JSONObject json=null;
					json=new JSONObject();
				json=(JSONObject)new JSONParser().parse(response.toString());
			
				JSONArray arr=(JSONArray) json.get("result");    					
				
				if(arr!=null && arr.size()>0){
					 for (int i = 0; i < arr.size(); i++) {
						 JSONObject jsonObj = (JSONObject) arr.get(i);
						
						if(jsonObj.get("name").toString().equalsIgnoreCase(AppConstants.Organisation)){
							logger.debug("Name matching ..");
							logger.debug("Organisation name ..",jsonObj.get("name").toString());
							logger.debug("Organisation id ..",jsonObj.get("id").toString());
							orgName=jsonObj.get("name").toString();
							id=jsonObj.get("id").toString();
							
							
						}
					 }
		        }
			}
			
	   }catch(Exception e){
			e.printStackTrace();
	   }
	   
	   	map.put("id", id.trim());
		map.put("name",orgName.trim());
		
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
		String orgid=request.getParameter("orgid");
		String name=request.getParameter("orgName");
		String appId=request.getParameter("appid");
		String devNode=request.getParameter("devid");
		String fDate=request.getParameter("fromDate");		
		String tDate=request.getParameter("toDate");
		logger.debug("orgid",orgid);
		logger.debug("appId",appId);
		logger.debug("devNode",devNode);
		logger.debug("fromDate",fDate);
		logger.debug("toDate",fDate);
		try{
		
			SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	         Date fromDate=DATE_FORMAT.parse(DATE_FORMAT.format(new Date(fDate)));
	        Date toDate=DATE_FORMAT.parse(DATE_FORMAT.format(new Date(tDate)));
	        
	        map.put("id", orgid);
        	map.put("name", name);
	            
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
	@RequestMapping(value= {"/getGraphVal"}, method=RequestMethod.POST)
    public @ResponseBody String getGraphValHandler(HttpServletRequest request) {
		String orgid=request.getParameter("orgId");
		String appId=request.getParameter("appId");
		String devNode=request.getParameter("devId");
		String fDate=request.getParameter("fromDate");		
		String tDate=request.getParameter("toDate");
		logger.debug("orgid",orgid);
		logger.debug("appId",appId);
		logger.debug("devNode",devNode);
		logger.debug("fromDate",fDate);
		logger.debug("toDate",fDate);
		
		String returnVal="";
		try{
		
			SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	         Date fromDate=DATE_FORMAT.parse(DATE_FORMAT.format(new Date(fDate)));
	        Date toDate=DATE_FORMAT.parse(DATE_FORMAT.format(new Date(tDate)));
	                   
	        List<LoraFrame> frames=consumerInstrumentServiceImpl.getFramesByFrmToDateAndDevEUI(devNode,fromDate,toDate);
	      
	       int sum=0;
	        if(frames!=null && !frames.isEmpty()){
	        	logger.debug("Size List",frames.size());
	        	for(LoraFrame f: frames){
	        		sum=sum+Integer.parseInt(f.getWaterltr());
	        	}
	        }
	        JSONObject json=null;
	        		json=new JSONObject();
	        	json.put("value", sum);
	        	
	         returnVal=json.toString();
	         logger.debug("Resultant JSON String ",returnVal);
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
