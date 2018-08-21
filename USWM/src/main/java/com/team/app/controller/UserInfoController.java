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
import com.team.app.constant.PasswordGenerator;
import com.team.app.domain.Landmark;
import com.team.app.domain.LoraFrame;
import com.team.app.domain.Role;
import com.team.app.domain.TblUserInfo;
import com.team.app.domain.UserDeviceMapping;
import com.team.app.dto.ApplicationDto;
import com.team.app.dto.UserDeviceDto;
import com.team.app.dto.UserDto;
import com.team.app.logger.AtLogger;
import com.team.app.service.APLService;
import com.team.app.service.ConsumerInstrumentService;
import com.team.app.service.OrganisationService;
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
	
	@Autowired
	private OrganisationService organisationService;
	
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
    public String userMgmtHandler(HttpServletRequest request,Map<String,Object> map,RedirectAttributes redirectAttributes) throws Exception {
		   logger.debug(" IN /userMgmt ");		  		   
			   Map<String,Object> orgMapped=organisationService.getLoraServerOrganisation();	   
					map.put("organisations", orgMapped);	
			   List<Role> roles=userLoginService.getRoles();
					map.put("roles", roles);
						return "UserMgmt";
	}
	
	@RequestMapping(value= {"/orgUserMgmt"}, method=RequestMethod.GET)
    public String orgUserMgmtHanlder(HttpServletRequest request,Map<String,Object> map,RedirectAttributes redirectAttributes) throws Exception {
		   logger.debug(" IN /orgUserMgmt ");		  		   
			   Map<String,Object> orgMapped=organisationService.getLoraServerOrganisation();	   
					map.put("organisations", orgMapped);	
			List<Role> roles=userLoginService.getRoles();
					map.put("roles", roles);
						return "OrganisationUser";
	}
	
	
	
	@RequestMapping(value= {"/sync"}, method=RequestMethod.GET)
    public String autoSyncHandler(Map<String,Object> map) throws Exception {
		   logger.debug("/inside sync");
		   Map<String,Object> orgMapped=organisationService.getLoraServerOrganisation();	   
				map.put("organisations", orgMapped);
		   return "AutoSync";
	}
	
	
	
	
	/* Ajax calling for /getApplications */	
	@RequestMapping(value= {"/getApplications"}, method=RequestMethod.GET)
	public @ResponseBody String getApplicationsHandler(HttpServletRequest request,Map<String,Object> map) throws Exception  {
		logger.debug("/*Ajax getting getApplications */");
		
		String orgs = request.getParameter("orgId");
		String[] orgIdName=orgs.split(":");
		String orgId=orgIdName[0];
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
							returnVal+="<option value="+a.getAppId()+":"+a.getAppName()+">"+ a.getAppName() + "</option>";
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
		
		String apps = request.getParameter("appId").trim();
		String[] appIdName=apps.split(":");
		String appId=appIdName[0];
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
	
	
	@RequestMapping(value= {"/getDevEUIByAppId"}, method=RequestMethod.GET)
	public @ResponseBody String getDevEUIByAppIdHandler(HttpServletRequest request,Map<String,Object> map) throws Exception  {
		logger.debug("/*Ajax getting getDevEUIByAppId */");
		
		String apps = request.getParameter("appId").trim();
		logger.debug("Application.. as ",apps);
		String[] appIdName=apps.split(":");
		String appId=appIdName[0];
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
							 returnVal+="<option value="+a.getDevEUI()+":"+a.getDevName()+">"+a.getDevName()+"-"+ a.getDevEUI() + "</option>";
								
						}
					}
				}
			
				
			
		}catch(Exception e){
			logger.error("Error in Ajax/getDevEUIByAppId",e);
			e.printStackTrace();
		}
			
			
		return returnVal;

	}
	
	@RequestMapping(value= {"/getDevEUIDel"}, method=RequestMethod.GET)
	public @ResponseBody String getDevEUIDelHandler(HttpServletRequest request,Map<String,Object> map) throws Exception  {
		logger.debug("/*Ajax getting getDevEUIDel */");
		
		String apps = request.getParameter("appId").trim();
		String[] appArr=apps.split(":");
		String appId=appArr[0];
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
		String orgs=request.getParameter("orgId").trim();
		String[] orgArr=orgs.split(":");
		String orgId=orgArr[0];
		String apps=request.getParameter("appId").trim();
		String[] appArr=apps.split(":");
		String appId=appArr[0];
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
		String orgs=request.getParameter("orgId").trim();
		String[] orgArr=orgs.split(":");
		String orgId=orgArr[0];
		String apps=request.getParameter("appId").trim();
		String[] appArr=apps.split(":");
		String appId=appArr[0];
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
    public String deleteNodeHandler(HttpServletRequest request,HttpSession session,Map<String,Object> map,RedirectAttributes redirectAttributes) throws Exception {
		   logger.debug("/inside deleteNode");
		   	Map<String,Object> orgMapped=organisationService.getLoraServerOrganisation();	   
		   		map.put("organisations", orgMapped);		   
		   			return "deleteNode";
	}
	
	
	@RequestMapping(value= {"/delDevEUI"}, method=RequestMethod.GET)
    public String delDevEUIHandler(HttpServletRequest request,HttpSession session,Map<String,Object> map,RedirectAttributes redirectAttributes) throws Exception {
		   logger.debug("/inside delDevEUI");
			Map<String,Object> orgMapped=organisationService.getLoraServerOrganisation();	   
	   			map.put("organisations", orgMapped);
	   				return "deleteAllNode";
	}
	
	
	
	@RequestMapping(value= {"/userSubscription"}, method=RequestMethod.POST)
    public String userSubscriptionHandler(HttpServletRequest request, Map<String,Object> map,RedirectAttributes redirectAttributes) {
		logger.debug("/inside userSubscription");
		String orgIdName=request.getParameter("orgid").trim();
		String appIdName=request.getParameter("appid").trim();
		String devNode=request.getParameter("devid").trim();
		String uname=request.getParameter("uname").trim();
		String email=request.getParameter("email").trim();
		String contact=request.getParameter("contact").trim();
		String roleId=request.getParameter("usertype").trim();
		String landMarkID=request.getParameter("landMarkID").trim();
		String[] devArr=devNode.split(":");
		String[] appArr=appIdName.split(":");
		String[] orgArr=orgIdName.split(":");		
		String devId=devArr[0].trim();
		String devNodeName=devArr[1].trim();
		String appId=appArr[0].trim();
		String appName=appArr[1].trim();
		String orgId=orgArr[0].trim();
		String orgName=orgArr[1].trim();
		
		
		
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
			 	udm.setOrgId(orgId);
				udm.setOrgName(orgName);
				udm.setAppId(appId);
				udm.setAppName(appName);
				udm.setDevEUI(devId);
				udm.setDevNode(devNodeName);
				udm.setStatus(AppConstants.IND_A);
				udm.setCreateddt(new Date(System.currentTimeMillis()));
				udm.setUpdateddt(new Date(System.currentTimeMillis()));
			
			if(user!=null){
				
				redirectAttributes.addFlashAttribute("status",
						"<div class=\"failure\" > Email alrady exist!</div>");
				
			}else{
				TblUserInfo newUser=null;
					newUser=new TblUserInfo();					
					
					Role r=userLoginService.getRoleByRoleId(roleId);
					Landmark l=aplService.getLandMarkById(landMarkID);
					String password = new PasswordGenerator().randomString(6);
					newUser.setUname(uname);
					newUser.setPassword(password);
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
										"<div class=\"success\" > User registered successfully.Please check your email notification for activation!</div>");
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
	
	
	@RequestMapping(value= {"/personalInfo"}, method=RequestMethod.GET)
    public String personalInfoHanlder(HttpSession session,Map<String,Object> map) throws Exception {
		
			logger.debug("/inside personalInfo");
			TblUserInfo user=(TblUserInfo)session.getAttribute("user");
			TblUserInfo u=userLoginService.getUserByUId(user.getId());
			if(u!=null){
				map.put("user", u);
			}
			
				return "personalInfo";
		 
	 }
	
	
	@RequestMapping(value= {"/userUpdateInfo"}, method=RequestMethod.POST)
    public String userUpdateInfoHandler(HttpServletRequest request, Map<String,Object> map,RedirectAttributes redirectAttributes) {
		logger.debug("/inside userUpdateInfo");
		String contact=request.getParameter("contact");
		String email=request.getParameter("email");
		String uId=request.getParameter("uId");
		logger.debug("uId as ",uId);
		logger.debug("contact as ",contact);
		logger.debug("email as ",email);
		try{
			TblUserInfo user=userLoginService.getUserByUId(uId);
			if(user!=null){				
				user.setContactnumber(contact);
				user.setEmailId(email);
				user.setUpdateddt(new Date(System.currentTimeMillis()));
				userLoginService.updateUserInfo(user);
				redirectAttributes.addFlashAttribute("status",
						"<div class=\"success\" >User details updated successfully!</div>");
			}else{
				redirectAttributes.addFlashAttribute("status",
						"<div class=\"failure\" >Incorrect UserId!</div>");	
			}
		}catch(Exception e){
			logger.error("Error in userUpdateInfo",e.getMessage());		
				redirectAttributes.addFlashAttribute("status",
						"<div class=\"failure\" >Systemc Exception while updating user infos!</div>");	
			
		}
			
		return "redirect:/personalInfo";
		 
	 }
	
	
	@RequestMapping(value= {"/addDevice"}, method=RequestMethod.GET)
    public String addDeviceHandler(HttpSession session,Map<String,Object> map) throws Exception {
		
			logger.debug("/inside addDevice");
				  		   
			 Map<String,Object> orgMapped=organisationService.getLoraServerOrganisation();	   
				map.put("organisations", orgMapped);						
				      return "addDevice";
		 
	 }
	@RequestMapping(value= {"/UserSearch"}, method=RequestMethod.GET)
	public String LandMarkSearchHandler(HttpServletRequest request,Map<String,Object> map) throws Exception{
		logger.debug("Inside /UserSearch");		
		String orgs=request.getParameter("orgId");
		String[] orgArr=orgs.split(":");
		String orgId=orgArr[0];
			logger.debug("printing orgId as: ",orgId);
		map.put("orgId", orgId);
			 return "UserSearch";
	}
	
	
	@RequestMapping(value= {"/getUserInfoSearch"}, method=RequestMethod.GET)
	public @ResponseBody String getUserInfoSearchHanlder(HttpServletRequest request,Map<String,Object> map) throws Exception{
		logger.debug("Inside /getUserInfoSearch");		
		String email=request.getParameter("email").trim();
		String orgId=request.getParameter("orgId").trim();
		
			logger.debug("printing email as: ",email);
			logger.debug("printing orgId as: ",orgId);
			
			String response="";
			try {
				List<TblUserInfo> dtos=userLoginService.getUserListByEmailAndType(email);
					
				List<UserDto> userDto=null;
						userDto=new ArrayList<UserDto>();		
							
							UserDto dto=null;
							
					if(dtos!=null && !dtos.isEmpty()){
						for(TblUserInfo obj: dtos){
							dto=new UserDto();
							
							dto.setuId(obj.getId());
							dto.setUserInfo(obj.getUname() + " ->"
									+ obj.getEmailId() + " ->"
									+ obj.getContactnumber());
															
							userDto.add(dto);
						}
					}	
					
					
					if(userDto!=null && !userDto.isEmpty()){
						for(UserDto d : userDto ){
							response += d.getuId() + ":" + d.getUserInfo()
							+ "|";
						}
					}
			}catch(Exception e){
				logger.debug("Error during AJAX calling for GetLandMark",e);	
			}
			logger.debug("Response",response);
			return response;
	}
	
	
	@RequestMapping(value= {"/validateUserName"}, method=RequestMethod.POST)
	public @ResponseBody String validateUserNameHandler(HttpServletRequest request) throws Exception{
		logger.debug("Inside /validateUserName");		
		String uname=request.getParameter("uname").trim();
		logger.debug("uanme as",uname);	
		String response="";
			try {
				TblUserInfo userInfo=userLoginService.getUserByUsername(uname);
					if(userInfo!=null){
						response="LoginId already exists";
					}				
			}catch(Exception e){
				logger.debug("Error during AJAX calling for validateUserName",e);	
			}
			logger.debug("Response",response);
			return response;
	}
	
	
	@RequestMapping(value= {"/validateEmail"}, method=RequestMethod.POST)
	public @ResponseBody String validateEmailHandler(HttpServletRequest request) throws Exception{
		logger.debug("Inside /validateEmail");		
		String email=request.getParameter("email").trim();
		logger.debug("email as",email);	
		String response="";
			try {
				TblUserInfo userInfo=userLoginService.getUserByEmailId(email);
					if(userInfo!=null){
						response="EmailId already exists";
					}				
			}catch(Exception e){
				logger.debug("Error during AJAX calling for validateEmail",e);	
			}
			logger.debug("Response",response);
			return response;
	}
	
	@RequestMapping(value= {"/addDeviceToUser"}, method=RequestMethod.POST)
    public String addDeviceToUserHanlder(HttpServletRequest request, Map<String,Object> map,RedirectAttributes redirectAttributes) {
		logger.debug("/inside addDeviceToUser");
		String orgs=request.getParameter("orgid").trim();
		String[] orgArr=orgs.split(":");
		String orgId=orgArr[0];
		String orgName=orgArr[1];
		
		String apps=request.getParameter("appid").trim();
		String[] appArr=apps.split(":");
		String appId=appArr[0];
		String appName=appArr[1];
		
		String devNode=request.getParameter("devid").trim();
		String uId=request.getParameter("uId").trim();
		String[] devArr=devNode.split(":");
		String devId=devArr[0];
		String devNodeName=devArr[1].trim();
		
		
		logger.debug("OrgId....",orgId);
		logger.debug("devId....",devId);
		logger.debug("uId....",uId);
		
		
		try{
			TblUserInfo user=userLoginService.getUserByUId(uId);
			if(user!=null){
				List<UserDeviceMapping> udmList=user.getUserDeviceMappings();
				if(udmList!=null && !udmList.isEmpty()){
					for(UserDeviceMapping udm : udmList){
						if(udm.getDevEUI().equals(devId)){
							redirectAttributes.addFlashAttribute("status",
									"<div class=\"failure\" > Device already registered to user!</div>");
							return "redirect:/addDevice";
						}
					}
				}
				
				
				
				UserDeviceMapping udm=null;
				 	udm=new UserDeviceMapping();
				 	udm.setDevNode(devNodeName);
				 	udm.setDevEUI(devId);
					udm.setOrgId(orgId);
					udm.setOrgName(orgName);
					udm.setAppId(appId);
					udm.setAppName(appName);
					udm.setTblUserInfo(user);
					udm.setStatus(AppConstants.IND_A);
					udm.setCreateddt(new Date(System.currentTimeMillis()));
					udm.setUpdateddt(new Date(System.currentTimeMillis()));
					UserDeviceMapping udmReg=userLoginService.saveNewUDMToUser(udm);
					if(udmReg!=null){
						redirectAttributes.addFlashAttribute("status",
								"<div class=\"success\" >new device mapped to the user successfully!</div>");
					}else{
						redirectAttributes.addFlashAttribute("status",
								"<div class=\"failure\" > System Exception while persisting new device...result failed!</div>");
					}
						
			  }
				
										
		}catch(Exception e){
			logger.error("Error in userSubscription",e.getMessage());
			if(e.getMessage().equals("Device already exist")){
				redirectAttributes.addFlashAttribute("status",
						"<div class=\"failure\" >Device already exist!</div>");
			}else{
				 redirectAttributes.addFlashAttribute("status",
							"<div class=\"failure\" > System Exception..result failed !</div>");
			}
			
		}
			
		return "redirect:/addDevice";
		 
	 }
	
	
	@RequestMapping(value= {"/userDeviceMapped"}, method=RequestMethod.GET)
	public String userDeviceMappedHanlder(HttpSession session,HttpServletRequest request,Map<String,Object> map) throws Exception{
		logger.debug("Inside /userDeviceMapped");		
		TblUserInfo user=(TblUserInfo) session.getAttribute("user");		
		map.put("userInfo", user);
			 return "UserDeviceMapping";
	}
	
	
	@RequestMapping(value= {"/getOrgUserView"}, method=RequestMethod.GET)
	public @ResponseBody String getOrgUserViewHandler(HttpServletRequest request,Map<String,Object> map) throws Exception  {
		logger.debug("/*Ajax getting getOrgUserView */");
		
		String orgId = request.getParameter("orgId").trim();
		String usertype = request.getParameter("ut").trim();
		logger.debug("Org Id as ",orgId);
		String returnVal="";
		
		
		try{
						
			List<UserDeviceMapping> udms=userLoginService.getUserDeviceByOrgId(orgId);
			List<TblUserInfo> users=userLoginService.getUserByRoleId(usertype);
			
			
			/*if(users!=null && !users.isEmpty()){
				for(TblUserInfo u : users){
					 returnVal+="<tr><td>"+udm.getOrgId()+"</td>"+
							 "<td>"+udm.getTblUserInfo()+"</td>";
						
				}
			}*/
			
				
			
		}catch(Exception e){
			logger.error("Error in Ajax/getOrgUserView",e);
			e.printStackTrace();
		}
			
			
		return returnVal;
	}

}


