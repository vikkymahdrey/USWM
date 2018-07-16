package com.team.app.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
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
import com.team.app.domain.Landmark;
import com.team.app.domain.LoraFrame;
import com.team.app.domain.Role;
import com.team.app.domain.TblUserInfo;
import com.team.app.domain.UserDeviceMapping;
import com.team.app.dto.ApplicationDto;
import com.team.app.dto.UserDeviceDto;
import com.team.app.logger.AtLogger;
import com.team.app.service.APLService;
import com.team.app.service.ConsumerInstrumentService;
import com.team.app.service.UserLoginService;

@Controller
@SessionAttributes({"status"})
public class UserInfoController {
	
	private static final AtLogger logger = AtLogger.getLogger(UserInfoController.class);
	
			
	@Autowired
	private MqttIntrf mqttIntrf;
	
	@Autowired
	private UserLoginService userLoginService;
	
	@Autowired
	private APLService aplService;
	
	@Autowired
	private ConsumerInstrumentService  consumerInstrumentServiceImpl;
	
	@RequestMapping(value= {"/userInfoHistory"}, method=RequestMethod.GET)
    public String userInfoHistoryHandler(Map<String,Object> map) {
		
			
			try{

					UserDeviceDto dto=null;
					List<TblUserInfo> userInfos=userLoginService.getUserInfos();
					
					if(userInfos!=null && userInfos.isEmpty()){
						for(TblUserInfo u: userInfos){
							dto.setUname(u.getUname());				
							
						}
					}
						map.put("userInfos", userInfos);
			}catch(Exception e){
				logger.error("/userInfoHistory Error ",e);
			}
					return "userInfo";
		 
	 }
	
	
	
	@RequestMapping(value= {"/frameInfos"}, method=RequestMethod.GET)
    public String framesInfoHandler(Map<String,Object> map) {
		
			logger.debug("/inside framesInfo");
			List<LoraFrame> frames=null;
			try{
				frames=consumerInstrumentServiceImpl.getFrames();
				
				if(frames!=null && !frames.isEmpty()){
					logger.debug("size is ",frames.size());
					map.put("frames", frames);
				}
			
			}catch(Exception e){
				logger.error("/frameInfos controller ",e);
				e.printStackTrace();
			}
					return "frames";
		 
	 }
	
	
	@RequestMapping(value= {"/userFrameInfos"}, method=RequestMethod.GET)
    public String userFrameInfosHandler(HttpSession session,Map<String,Object> map) {
			logger.debug("/inside framesInfo");
			
			TblUserInfo user=(TblUserInfo) session.getAttribute("user");
			List<LoraFrame> frames=null;
			try{
				frames=consumerInstrumentServiceImpl.getDeviceIdByDevEUI(user.getUserDeviceMappings().get(0).getDevEUI());
				
				if(frames!=null && !frames.isEmpty()){
					logger.debug("size is ",frames.size());
					map.put("frames", frames);
				}
			
			}catch(Exception e){
				logger.error("/frameInfos controller ",e);
				e.printStackTrace();
			}
					return "userFrames";
		 
	 }
	@RequestMapping(value= {"/userMgmt"}, method=RequestMethod.GET)
    public String userMgmtHandler(HttpServletRequest request,Map<String,Object> map,RedirectAttributes redirectAttributes) {
		   logger.debug(" IN /userMgmt ");
		  		   
		   String orgName="";
		   String id="";
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
		
	   return "UserMgmt";
	}
	
	
	@RequestMapping(value= {"/sync"}, method=RequestMethod.GET)
    public String autoSyncHandler(HttpServletRequest request,HttpSession session,Map<String,Object> map,RedirectAttributes redirectAttributes) {
		   logger.debug("/inside sync");
		  		   
		   String orgName="";
		   String id="";
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
					logger.debug("Inside Array not null");
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
		
	   return "AutoSync";
	}
	
	
	/* Ajax calling for /getApplications */	
	@RequestMapping(value= {"/getApplications"}, method=RequestMethod.GET)
	public @ResponseBody String getApplicationsHandler(HttpServletRequest request,Map<String,Object> map) throws Exception  {
		//logger.debug("/*Ajax getting getApplications */");
		
		String orgId = request.getParameter("orgId");
		logger.debug("Organisation Id as ",orgId);
		String returnVal="";
		
		
		try{
						
			   String url=AppConstants.app_url;
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
					
					List<ApplicationDto> dtos=null;	
					
					if(arr!=null && arr.size()>0){
						logger.debug("Inside Array not null");
							dtos=new ArrayList<ApplicationDto>();
						 for (int i = 0; i < arr.size(); i++) {
							 JSONObject jsonObj = (JSONObject) arr.get(i);
							 ApplicationDto dto=null;
							 		dto=new ApplicationDto();
							
							if(jsonObj.get("organizationID").toString().equalsIgnoreCase(orgId)){
								logger.debug("organizationID matching ..");
								logger.debug("Application name ..",jsonObj.get("name").toString());
								logger.debug("Application id ..",jsonObj.get("id").toString());
								
								dto.setAppId(jsonObj.get("id").toString());
								dto.setAppName(jsonObj.get("name").toString());
								dtos.add(dto);							
							}
						 }
			        }
					
					if(dtos!=null && !dtos.isEmpty()){
						for(ApplicationDto a : dtos){
							returnVal+="<option value="+a.getAppId()+ ">"+ a.getAppName() + "</option>";
						}
					}
				}
			
				
			
		}catch(Exception e){
			logger.error("Error in Ajax/getApplications",e);
			e.printStackTrace();
		}
			
			
		return returnVal;

	}
	
	
/* Ajax calling for /getDevEUI */
	
	@RequestMapping(value= {"/getDevEUI"}, method=RequestMethod.GET)
	public @ResponseBody String getDevEUIHandler(HttpServletRequest request,Map<String,Object> map) throws Exception  {
		logger.debug("/*Ajax getting getDevEUI */");
		
		String appId = request.getParameter("appId").trim();
		logger.debug("Application Id as ",appId);
		String returnVal="";
		
		
		try{
			
			
			   String url=AppConstants.domain+"/api/applications/"+appId+"/nodes?limit=100";
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
					
					List<ApplicationDto> dtos=null;	
					
					if(arr!=null && arr.size()>0){
						logger.debug("Inside Array not null");
							dtos=new ArrayList<ApplicationDto>();
						 for (int i = 0; i < arr.size(); i++) {
							 JSONObject jsonObj = (JSONObject) arr.get(i);
							 ApplicationDto dto=null;
							 		dto=new ApplicationDto();						
							
								logger.debug("DevEUI name ..",jsonObj.get("devEUI").toString());
													
								dto.setDevEUI(jsonObj.get("devEUI").toString());
								dto.setDevName(jsonObj.get("name").toString());
								dtos.add(dto);							
							
						  }
			         }
					
					if(dtos!=null && !dtos.isEmpty()){
						for(ApplicationDto a : dtos){
							logger.debug("DevEUI DevEUI..",a.getDevEUI());
							List<LoraFrame> frms=consumerInstrumentServiceImpl.getDeviceIdByDevEUI(a.getDevEUI());
							if(frms!=null && !frms.isEmpty()){
								logger.debug("Size Size..",frms.size());
								returnVal+="<option value="+a.getDevEUI()+">"+a.getDevName()+"-"+ a.getDevEUI() + "</option>";
							}	
						}
					}
				}
			
				
			
		}catch(Exception e){
			logger.error("Error in Ajax/getApplications",e);
			e.printStackTrace();
		}
			
			
		return returnVal;

	}
	
	@RequestMapping(value= {"/getDevEUISync"}, method=RequestMethod.GET)
	public @ResponseBody String getDevEUISyncHandler(HttpServletRequest request,Map<String,Object> map) throws Exception  {
		logger.debug("/*Ajax getting getDevEUISync */");
		
		String appId = request.getParameter("appId").trim();
		logger.debug("Application Id as ",appId);
		String returnVal="";
		
		
		try{
			
			
			   String url=AppConstants.domain+"/api/applications/"+appId+"/nodes?limit=100";
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
					
					List<ApplicationDto> dtos=null;	
					
					if(arr!=null && arr.size()>0){
						logger.debug("Inside Array not null");
							dtos=new ArrayList<ApplicationDto>();
						 for (int i = 0; i < arr.size(); i++) {
							 JSONObject jsonObj = (JSONObject) arr.get(i);
							 ApplicationDto dto=null;
							 		dto=new ApplicationDto();						
							
								logger.debug("DevEUI name ..",jsonObj.get("devEUI").toString());
													
								dto.setDevEUI(jsonObj.get("devEUI").toString());
								dto.setDevName(jsonObj.get("name").toString());
								dtos.add(dto);							
							
						  }
			         }
					
					if(dtos!=null && !dtos.isEmpty()){
						for(ApplicationDto a : dtos){
							 returnVal+="<option value="+a.getDevEUI()+">"+a.getDevName()+"-"+ a.getDevEUI() + "</option>";
								
						}
					}
				}
			
				
			
		}catch(Exception e){
			logger.error("Error in Ajax/getApplications",e);
			e.printStackTrace();
		}
			
			
		return returnVal;

	}
	
	@RequestMapping(value= {"/getDevEUIDel"}, method=RequestMethod.GET)
	public @ResponseBody String getDevEUIDelHandler(HttpServletRequest request,Map<String,Object> map) throws Exception  {
		logger.debug("/*Ajax getting getDevEUIDel */");
		
		String appId = request.getParameter("appId").trim();
		logger.debug("Application Id as ",appId);
		String returnVal="";
		
		
		try{
						
			List<LoraFrame> frms=consumerInstrumentServiceImpl.getDevEUIByAppId(appId);
			
			if(frms!=null && !frms.isEmpty()){
				for(LoraFrame a : frms){
					 returnVal+="<option value="+a.getDevEUI()+">"+a.getNodeName()+"-"+ a.getDevEUI() + "</option>";
						
				}
			}
			
				
			
		}catch(Exception e){
			logger.error("Error in Ajax/getApplications",e);
			e.printStackTrace();
		}
			
			
		return returnVal;
	}
	
	
	
	
	@RequestMapping(value= {"/deleteDevEUI"}, method=RequestMethod.POST)
    public @ResponseBody String deleteDevEUIHandler(HttpServletRequest request,Map<String,Object> map) {
		logger.debug("/inside deleteDevEUI");
		String orgId=request.getParameter("orgId").trim();
		String appId=request.getParameter("appId").trim();
		String devId=request.getParameter("devId").trim();
				
		logger.debug("OrgId....",orgId);
		logger.debug("appId....",appId);
		logger.debug("devId....",devId);
		String returnVal="";
		
		
		try{
			consumerInstrumentServiceImpl.deleteDevEUI(appId.trim(), devId.trim());
			returnVal="DeviceEUI '"+devId+"'"+" has deleted successfully! Thanks ";
			
		}catch(Exception e){
			logger.error("Error in Ajax/deleteDev",e);
			e.printStackTrace();
			returnVal="DeviceEUI '"+devId+"'"+" deletion has failed! Thanks ";
		}
			
			
		return returnVal;
		 
	 }
	
	
	
	@RequestMapping(value= {"/syncDev"}, method=RequestMethod.POST)
    public @ResponseBody String syncDevHandler(HttpServletRequest request, HttpSession session, Map<String,Object> map,RedirectAttributes redirectAttributes) {
		logger.debug("/inside syncDev");
		String orgId=request.getParameter("orgId").trim();
		String appId=request.getParameter("appId").trim();
		String devId=request.getParameter("devId").trim();
		
		String returnVal="";
		
		logger.debug("OrgId....",orgId);
		logger.debug("appId....",appId);
		logger.debug("devId....",devId);
		try{
		
			mqttIntrf.doDemo(appId,devId);	
			returnVal="Lora Node Syncing has completed! Thank you";
				
		}catch(Exception e){
			logger.error("Error in Ajax/syncDev",e);
			e.printStackTrace();
			returnVal="Lora Node Syncing has failed! Thank you";
		}
			
		return returnVal;
		 
	 }
	
	
	
	
	@RequestMapping(value= {"/deleteNode"}, method=RequestMethod.GET)
    public String deleteNodeHandler(HttpServletRequest request,HttpSession session,Map<String,Object> map,RedirectAttributes redirectAttributes) {
		   logger.debug("/inside deleteNode");
		  		   
		   String orgName="";
		   String id="";
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
					logger.debug("Inside Array not null");
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
		
	   return "deleteNode";
	}
	
	
	@RequestMapping(value= {"/delDevEUI"}, method=RequestMethod.GET)
    public String delDevEUIHandler(HttpServletRequest request,HttpSession session,Map<String,Object> map,RedirectAttributes redirectAttributes) {
		   logger.debug("/inside delDevEUI");
		  		   
		   String orgName="";
		   String id="";
		   
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
					logger.debug("Inside Array not null");
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
		
	   return "deleteAllNode";
	}
	
	
	
	@RequestMapping(value= {"/userSubscription"}, method=RequestMethod.POST)
    public String userSubscriptionHandler(HttpServletRequest request, Map<String,Object> map,RedirectAttributes redirectAttributes) {
		logger.debug("/inside userSubscription");
		String orgId=request.getParameter("orgid").trim();
		String appId=request.getParameter("appid").trim();
		String devId=request.getParameter("devid").trim();
		String uname=request.getParameter("uname").trim();
		String email=request.getParameter("email").trim();
		String contact=request.getParameter("contact").trim();
		String roleId=request.getParameter("usertype").trim();
		String landMarkID=request.getParameter("landMarkID").trim();
		
		
		
		logger.debug("OrgId....",orgId);
		logger.debug("appId....",appId);
		logger.debug("devId....",devId);
		logger.debug("uname....",uname);
		logger.debug("email....",email);
		logger.debug("contact....",contact);
		logger.debug("usertype....",roleId);		
		logger.debug("landMarkID....",landMarkID);
		
		try{
			TblUserInfo user=userLoginService.getUserByEmailId(email);
			UserDeviceMapping udm=null;
			 	udm=new UserDeviceMapping();			 	
			 	udm.setDevEUI(devId);
				udm.setOrgId(orgId);
			
			if(user!=null){
				/*TblUserInfo usr=userLoginService.saveUser(user,udm);
				if(usr!=null){
					
				}else{
					redirectAttributes.addFlashAttribute("status",
							"<div class=\"failure\" > Email alrady exist!</div>");
				}*/
				
				redirectAttributes.addFlashAttribute("status",
						"<div class=\"failure\" > Email alrady exist!</div>");
				
			}else{
				TblUserInfo newUser=null;
					newUser=new TblUserInfo();					
					
					Role r=userLoginService.getRoleByRoleId(roleId);
					Landmark l=aplService.getLandMarkById(landMarkID);
					
					newUser.setUname(uname);
					newUser.setEmailId(email);
					newUser.setContactnumber(contact);
					newUser.setRoleBean(r);
					newUser.setLandmark(l);
					newUser.setCreateddt(new Date(System.currentTimeMillis()));
					newUser.setUpdateddt(new Date(System.currentTimeMillis()));
					newUser.setStatus(AppConstants.status);				
					
					TblUserInfo u=userLoginService.saveUser(newUser,udm);
						if(u!=null){
												
								 redirectAttributes.addFlashAttribute("status",
										"<div class=\"success\" > User registered Successfully !</div>");
						}else{
								 redirectAttributes.addFlashAttribute("status",
											"<div class=\"failure\" > user registration failed !</div>");
						}
						
						
			  }
				
										
		}catch(Exception e){
			logger.error("Error in userSubscription",e.getMessage());
			if(e.getMessage().equals("Device already exist")){
				redirectAttributes.addFlashAttribute("status",
						"<div class=\"failure\" >Device already exist!</div>");
			}else{
				 redirectAttributes.addFlashAttribute("status",
							"<div class=\"failure\" > System Exception..Registratoin failed !</div>");
			}
			
		}
			
		return "redirect:/userReport";
		 
	 }
	
	
	@RequestMapping(value= {"/userReport"}, method=RequestMethod.GET)
    public String userReportHandler(HttpServletRequest request, Map<String,Object> map,RedirectAttributes redirectAttributes) {
		logger.debug("/inside userReport");
		try{
			List<TblUserInfo> userList=userLoginService.getUserInfos();
			if(userList!=null && !userList.isEmpty()){
				logger.debug("inside userlist :");
				map.put("subscribedUsers", userList);
			}else{
				logger.debug("inside userlist :");
				map.put("subscribedUsers", "");	
			}
		}catch(Exception e){
			logger.error("Error in userSubscription",e.getMessage());		
				redirectAttributes.addFlashAttribute("status",
						"<div class=\"failure\" >Systemc Exception while fetching users!</div>");	
			
		}
			
		return "userReport";
		 
	 }
	

}


