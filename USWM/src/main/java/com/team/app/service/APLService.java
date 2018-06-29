package com.team.app.service;

import java.util.List;

import com.team.app.domain.Area;
import com.team.app.domain.Landmark;
import com.team.app.domain.Place;
import com.team.app.dto.OrganisationDto;

public interface APLService {

	List<OrganisationDto> getOrganisation() throws Exception;

	List<Area> getAreasByOrgId(String orgId) throws Exception;

	Place getPlaceById(String placeforLandmark)throws Exception;

	List<Landmark> getSpecificLandmarks(String area, String place, String orgId)throws Exception;

	Area insertArea(Area areaObj)throws Exception;

	Area getAreasByAreaId(String areaId)throws Exception;



	

}
