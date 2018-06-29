package com.team.app.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.dom4j.Branch;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team.app.domain.Area;
import com.team.app.domain.Landmark;
import com.team.app.domain.Place;
import com.team.app.domain.TblUserInfo;
import com.team.app.dto.OrganisationDto;
import com.team.app.logger.AtLogger;
import com.team.app.service.APLService;

@Controller
public class APLConfigController {

	private static final AtLogger logger = AtLogger.getLogger(APLConfigController.class);
	
	@Autowired
	private APLService aplService;
	
	@RequestMapping(value= {"/aplConfig"}, method=RequestMethod.GET)
	public String getAPLHandler(Map<String,Object> map, HttpServletRequest request) throws Exception{
		
		logger.debug("INside /aplConfig");
		List<OrganisationDto> orgDtos=aplService.getOrganisation();
		 map.put("organisations", orgDtos);
		 String orgId=request.getParameter("orgid");
		 logger.debug("printing orgId ",orgId);
		 if(orgId != null && !(orgId.isEmpty())){
			 List<Area> areaList=aplService.getAreasByOrgId(orgId);
			 map.put("areaList",areaList);
		 }
		 return "area1";
	}
	
	
	@RequestMapping(value= {"/marklandmark"}, method=RequestMethod.GET)
	public String getAPLFromGoogleMap(HttpServletRequest request,Map<String,Object> map) throws Exception{
		logger.debug("IN /marklandmark");
		logger.debug("printing orgId in /marklandmark ",request.getParameter("orgId"));
		 List<Area> areaList=aplService.getAreasByOrgId(request.getParameter("orgId"));
		 map.put("areas",areaList);
			
		 return "marklandmark1";
	}
	
	
	// An ajax call comes from marklandmark.jsp
			@RequestMapping(value = {"/getLandmarks"},  method=RequestMethod.POST)
			public  @ResponseBody String getLandmarks(@RequestParam(required = false, value = "place") String place,
					@RequestParam(required = false, value = "area") String area, @RequestParam(required = false, value = "orgId") String orgId,
					@RequestParam(required = false, value = "placeforLandmark") String placeforLandmark)
			{
				String response = "";
			
				if (placeforLandmark != null) {
					try {
						  
						Place p=aplService.getPlaceById(placeforLandmark);
						List<Landmark> landmarks=p.getLandmarks();
						
						response = "<select name='landmarkId' id='landmarkId'>";
					
						for (Landmark eachlandmark : landmarks) {
							response += "<option value='" + eachlandmark.getId()
									+ "' >" + eachlandmark.getLandmarkname() + "</option>";
						}
						response += "</select>";
					}catch(Exception ex){
						logger.error("Error in fetching landmarks for place ", ex);
					} 
				}else{
					try {
					
						List<Landmark> landmarks = aplService.getSpecificLandmarks(area,place,orgId);
						
						for (Landmark eachlandmark : landmarks) {
							response +=  "$" + eachlandmark.getPlace().getArea().getAreaname() + ":"
									+ eachlandmark.getPlace().getPlacename() + ":"
									+ eachlandmark.getId() + ":"
									+ eachlandmark.getLandmarkname() + ":"
									+ eachlandmark.getLat() + ":"
									+ eachlandmark.getLon();
						}
					
					}catch(Exception ex){
						logger.error("Error in fetching the specific landmarks ",ex);												
					}
				}
				
				
				return response;
			}
			
			
			@RequestMapping(value= {"/addArea"}, method=RequestMethod.GET)
			public String getArea(HttpSession session,HttpServletRequest request,Map<String,Object> map,RedirectAttributes redirectAttributes) throws Exception{
				String areaName = request.getParameter("area");
				String orgId = request.getParameter("orgId");
				
				logger.debug("printing areaName /addArea",areaName);
				logger.debug("printing orgId /addArea",orgId);
				/*TblUserInfo user = (TblUserInfo)session.getAttribute("user");
				String doneBy=user.getId();*/
				Area areaObj=null;
				try{
					areaObj=new Area();
				    areaObj.setAreaname(areaName);
				  areaObj.setOrgId(orgId);
				  Area a=aplService.insertArea(areaObj);
				
				if (a!=null) {
					logger.debug("Inside Null");
					redirectAttributes.addFlashAttribute("status",
							"<div class=\"failure\" > New area added successfully</div>");
				}else{
					
					logger.debug("Inside Null111");
					redirectAttributes.addFlashAttribute("status",
							"<div class=\"success\" > Area Already Exist !</div>");
					
				}
			}catch(Exception e){
				logger.error("Error in adding area ",e);
				map.put("status",
						"<div class=\"failure\" > Area adding failed</div>");
					}
					
				return "redirect:/aplConfig?orgId="+orgId;
			}
			
			
			
			@RequestMapping(value= {"/showPlace"}, method=RequestMethod.GET)
			public String getPlaceHandler(Map<String,Object> map, HttpServletRequest request) throws Exception{
				String areaId=request.getParameter("areaId"); 
				
				try{
					Area a=aplService.getAreasByAreaId(areaId);
					List<Place> placeList=a.getPlaces();
					map.put("placeList",placeList);
					map.put("areas", a);
				}catch(Exception ex){
					logger.error("Error in showPlace",ex);
				}
				
				return "place1";
			}
			
			@RequestMapping(value= {"/showLandmark"}, method=RequestMethod.GET)
			public String getLandmarkHandler(Map<String,Object> map, HttpServletRequest request) throws Exception{
				String placeId=request.getParameter("placeId");
				try{
					
					Place place=aplService.getPlaceById(placeId);
					List<Landmark> landmarkList=place.getLandmarks();
									
					map.put("landmarkList",landmarkList);
					map.put("place", place);
				}catch(Exception ex){
					logger.error("Error in showLandmark",ex);
				}
				
				return "landmark1";
			}
}
