package com.team.app.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team.app.constant.AppConstants;
import com.team.app.domain.TblUserInfo;
import com.team.app.logger.AtLogger;
import com.team.app.service.UserLoginService;

@Controller
public class LoginController {
	private static final AtLogger logger = AtLogger.getLogger(LoginController.class);
		
	@Autowired
	private UserLoginService userLoginService;
		
	
	@RequestMapping(value= {"/"})
	public String defaultURL(){
		return "index";
	}
	
		
	
	@RequestMapping(value= {"/onSubmitlogin"}, method=RequestMethod.POST)
	public ModelAndView loginUser(HttpServletRequest request, HttpSession session, HttpServletResponse response,RedirectAttributes redirectAttributes) throws Exception{
		logger.debug("in /onSubmitlogin");
		String username = request.getParameter("uname") == null ? "" : request
				.getParameter("uname");
		String password = request.getParameter("pass") == null ? "" : request
				.getParameter("pass");
		
        TblUserInfo userInfo=null;
        boolean needToChangePwd=false;
		
        if (username.equalsIgnoreCase("") || password.equalsIgnoreCase("")) {
        	redirectAttributes.addFlashAttribute("status",
					"<div class='failure'>Enter User Name/Password!!</div");
			return new ModelAndView("redirect:/");
		} else {			
			userInfo=userLoginService.getUserByUserAndPwd(username,password);
		}
        
        if (userInfo!=null) {
        	logger.debug("Inside NeedToPwd Change");
			if (userInfo.getPwdChangeDt()== null || userInfo.getPwdChangeDt().equals("")) {
				logger.debug("Inside NeedToPwd is null");
				needToChangePwd = true;
			} 
		}
        
        if(userInfo!=null){
        	session.setAttribute("user", userInfo);
        	        	         	
        }
        
        
        if (userInfo!=null) {
			if (userInfo.getPwdChangeDt()== null || userInfo.getPwdChangeDt().equals("")) {
				needToChangePwd = true;
			}
		}
        
        if (needToChangePwd) {
        	
			return new ModelAndView("redirect:/changePasswordReq");
			
		} 
        
        if(userInfo!=null){
        	if(userInfo.getRoleBean().getType().equalsIgnoreCase("admin")) {
        	 	return new ModelAndView("redirect:/home");
        	}else if(userInfo.getRoleBean().getType().equalsIgnoreCase("usr")) {
        		return new ModelAndView("redirect:/userHome");
        	}else {
        		redirectAttributes.addFlashAttribute("status",
    					"<div class='failure'>Incorrect role identified!</div");
        		return new ModelAndView("redirect:/");
        	}
        }else{
        	session.setAttribute("userInfo", "");
        	redirectAttributes.addFlashAttribute("status","<div class='failure'>Invalid User Name/Password !</div");
        	return new ModelAndView("redirect:/");
        }
		
	
	}
	 @RequestMapping(value= {"/home"}, method=RequestMethod.GET)
	 public String home(Map<String,Object> map) throws Exception{
		List<TblUserInfo> userInfos= userLoginService.getUserInfosCount();
		  map.put("userInfos",userInfos);
		  
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
		return "adminDashboard";
	    	
	}
	
	@RequestMapping(value= {"/inValid"})
	public String inValidCredentials(){
		return "index";
	}
	
	@RequestMapping(value= {"/forgotPassword"})
	public String forgetPasswordHandler(){
		return "forgotPassword";
	}
	
	@RequestMapping(value= {"/userHome"},method=RequestMethod.GET)
	public String userHome(Map<String,Object> map){
		return "userHome";
	}
	
		 
		
		 
			@RequestMapping(value= {"/logout"})
			public String goToLogout(HttpServletRequest request,HttpServletResponse response,Map<String,Object> map){
				logger.debug("In gotoLogout Page......");
					HttpSession session = request.getSession(true);
						session.invalidate();
							response.setHeader("Cache-Control",	"no-cache, no-store, must-revalidate");
								response.setHeader("Pragma", "co-cache");
									response.setDateHeader("Expires", 0);
										return "redirect:/";
			}
		 	
		 	
		 	
			@RequestMapping(value= {"/changePasswordReq"})
			public String changePwdReqHandler(){
				logger.debug("IN ChangePassword");
				return "changePassword";
			}	
			
			
			@RequestMapping(value= {"/changePasswordSubmit"},method=RequestMethod.POST)
			public String changePwdSubmitHandler(HttpSession session,HttpServletRequest request,RedirectAttributes redirectAttributes) throws Exception{
				logger.debug("IN ChangePassword Controller....");
			TblUserInfo user=(TblUserInfo)session.getAttribute("user");
				String password=request.getParameter("pwd");
				String oldpwd=request.getParameter("oldpwd");
				if(user.getPassword().equals(oldpwd)){
					user.setPassword(password);
					user.setPwdChangeDt(new Date(System.currentTimeMillis()));
					userLoginService.updateUserInfo(user);
					redirectAttributes.addFlashAttribute("status",
							"<div class='success'>New password updated successfully!</div");
					
				}else{
					redirectAttributes.addFlashAttribute("status",
							"<div class='failure'>Old password didn't match!</div");
				}				
				
		        
				return "redirect:/";
			}

			
}
