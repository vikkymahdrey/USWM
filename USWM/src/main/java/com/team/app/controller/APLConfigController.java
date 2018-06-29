package com.team.app.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
		 return "area";
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
					
					redirectAttributes.addFlashAttribute("status",
							"<div class=\"success\" > New area added successfully</div>");
				}else{
					
					
					redirectAttributes.addFlashAttribute("status",
							"<div class=\"failure\" > Area Already Exist !</div>");
					
				}
			}catch(Exception e){
				logger.error("Error in adding area ",e);
				redirectAttributes.addFlashAttribute("status",
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
				
				return "place";
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
				
				return "landmark";
			}
			
			
			@RequestMapping(value= {"/updateArea"}, method=RequestMethod.GET)
			public String getUpdatedArea(HttpServletRequest request,Map<String,Object> map,RedirectAttributes redirectAttributes) throws Exception{

				String areaId = request.getParameter("areaId");
				String areaName = request.getParameter("area");
				String orgId = request.getParameter("orgId");
				
				logger.debug("printing areaId /updateArea ",areaId);
				logger.debug("printing areaName /updateArea ",areaName);
				logger.debug("printing orgId /updateArea ",orgId);
				
				try{
						Area area=aplService.getAreaByOrgAndAreaId(orgId,areaId);
						if(area!=null){
							area.setAreaname(areaName);
							Area a=aplService.updateArea(area);	
							 if(a!=null){
								 redirectAttributes.addFlashAttribute("status",
											"<div class=\"success\" > Area updated successfully</div>");
							 }else{
								 redirectAttributes.addFlashAttribute("status",
											"<div class=\"failure\" > Area Already Exist !</div>");
							 }
						}else{
							redirectAttributes.addFlashAttribute("status",
									"<div class=\"success\" > Area not exist!</div>");
						}
										
						
			}catch(Exception e){
				logger.error("Error in updating area ",e);
				redirectAttributes.addFlashAttribute("status",
						"<div class=\"success\" > Adding area failed!</div>");
				
			}
				return "redirect:/aplConfig?orgId="+orgId;
	}
			
			

			@RequestMapping(value= {"/addPlace"}, method=RequestMethod.GET)
			public String addPlace(HttpSession session,HttpServletRequest request,Map<String,Object> map,RedirectAttributes redirectAttributes) throws Exception{
				
				String placeName = request.getParameter("place");
				String areaId = request.getParameter("areaId");
				
				try{
					Area areaBean = aplService.getAreasByAreaId(areaId);
					Place place = new Place();
					place.setPlacename(placeName);
					place.setArea(areaBean);	
			
				Place p = aplService.insertPlace(place,areaId);
				
				 if(p!=null){
					 redirectAttributes.addFlashAttribute("status",
								"<div class=\"success\" > New place added successfully!</div>");
				 }else{
					 redirectAttributes.addFlashAttribute("status",
								"<div class=\"failure\" > Place Already Exist in the area!</div>");
				 }
			
				
				
			}catch(Exception e){
					logger.error("Error in adding place ",e);
					 redirectAttributes.addFlashAttribute("status",
							"<div class=\"failure\" > Place adding failed</div>");
			}
						
					return "redirect:/showPlace?areaId="+areaId;
				}
			
			
			@RequestMapping(value= {"/updatePlace"}, method=RequestMethod.GET)
			public String getUpdatedPlace(HttpServletRequest request,Map<String,Object> map,RedirectAttributes redirectAttributes) throws Exception{
				
				String placeId = request.getParameter("placeId");
				String placeName = request.getParameter("place");
				String areaId = request.getParameter("areaId");
				
				try{
					Place place=aplService.getPlaceByPlaceAndAreaId(placeId,areaId);
					if(place!=null){
						if(place.getPlacename().equalsIgnoreCase(placeName)){
							 redirectAttributes.addFlashAttribute("status",
										"<div class=\"failure\" > Place Already Exist in the area!</div>");
						}else{
							place.setPlacename(placeName);
							Place p=aplService.updatePlace(place);
							redirectAttributes.addFlashAttribute("status",
									"<div class=\"success\" > Place updated successfully!</div>");
						}
					}
				
									
			}catch(Exception e){
					logger.error("Error in updating place ",e);
					redirectAttributes.addFlashAttribute("status",
							"<div class=\"failure\" > Place updating failed</div>");
						}
							return "redirect:/showPlace?areaId="+areaId;
				}
			
			
			@RequestMapping(value= {"/addLandmark"}, method=RequestMethod.POST)
			public String addLandmark(HttpServletRequest request,Map<String,Object> map,RedirectAttributes redirectAttributes) throws Exception{
				
				String landmarkName = request.getParameter("landmark");
				String placeId = request.getParameter("placeId");
				
				try{	
					
					Place place=aplService.getPlaceById(placeId);
					Landmark landmark=null;
				     		landmark=new Landmark();				
							landmark.setLandmarkname(landmarkName);
							landmark.setPlace(place);		
					Landmark l=aplService.insertLandmark(landmark,placeId);
					if(l!=null){
						 redirectAttributes.addFlashAttribute("status",
									"<div class=\"success\" > New Landmark added successfully!</div>");
					 }else{
						 redirectAttributes.addFlashAttribute("status",
									"<div class=\"failure\" > Landmark Already Exist in the place!</div>");
					 }
				
			}catch(Exception e){
					logger.error("Error in adding landmark ",e);
					map.put("status",
							"<div class=\"failure\" > Landmark adding failed</div>");
						}
						
					return "redirect:/showLandmark?placeId=" + placeId;
				}
					
			@RequestMapping(value= {"/updateLandmark"}, method=RequestMethod.POST)
			public String getUpdatedLandmark(HttpServletRequest request,Map<String,Object> map,RedirectAttributes redirectAttributes) throws Exception{
				String retVal = "";
				String placeId = request.getParameter("placeId");
				String landmarkId = request.getParameter("landmarkId");
				String landmark = request.getParameter("landmark");
				String latLng= request.getParameter("latlng");
				String orgId= request.getParameter("orgId");
				String areaId= request.getParameter("area");
				
				logger.debug("latitude longitude = "+latLng);
				
				try{
					
					Landmark lm = aplService.getLandMarkByIdAndPlaceId(landmarkId,placeId);
					if(lm != null){
						if(lm.getLandmarkname().equalsIgnoreCase(landmark)){
							 redirectAttributes.addFlashAttribute("status",
										"<div class=\"failure\" > Landmark Already Exist in the place!</div>");
							 retVal =  "redirect:/showLandmark?placeId=" + placeId;
							 return retVal; 
						}else{
							lm.setLandmarkname(landmark);
						}
						
					}
				
				
				if(latLng!=null && latLng.trim().equals("")==false)  {			
					/*String latitude=latLng.split(",")[0].substring(1,  latLng.split(",")[0].length()-1);
					String longitude = latLng.split(",")[1].substring(1, latLng.split(",")[1].length()-1);
						 lm.setLatitude(Double.parseDouble(latitude));
						 lm.setLongitude(Double.parseDouble(longitude));
						 lm = aplService.updateLandmark(lm,placeId);
						 if(location != null){
							 retVal =  "redirect:/marklandmark?location="+location;
						 }else if(areaId != null){
							 retVal =  "redirect:/marklandmark?area="+areaId;
						 }else if(placeId != null){
							 retVal =  "redirect:/marklandmark?place="+placeId;
						 }
						 */
						 			
				}else{
					Landmark lnd = aplService.updateLandmark(lm);
					if(lnd!=null){
						redirectAttributes.addFlashAttribute("status",
								"<div class=\"success\" > Landmark updated successfully !</div>");
						
					}else{
						redirectAttributes.addFlashAttribute("status",
								"<div class=\"failure\" > Landmark updation failed!</div>");
						
					}
					retVal =  "redirect:/showLandmark?placeId=" + placeId;
					
				}				
				}catch(Exception ex){
					logger.error("Error in fetching the landmark ",ex);
				}
				return retVal;
			}	
				
}