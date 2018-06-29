package com.team.app.dao;

import java.io.Serializable;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.team.app.domain.Area;

public interface AreaDao extends JpaRepository<Area, Serializable> {
	
	@Query("Select a from Area a where a.orgId=:orgId")
	List<Area> getAreasByOrgId(@Param("orgId") String orgId);

	@Query("Select a from Area a where a.orgId=:orgId and a.areaname=:areaname")
	Area getAreaByNameAndOrgId(@Param("areaname") String areaname, @Param("orgId")String orgId);

	@Query("Select a from Area a where a.id=:areaId")
	Area getAreasByAreaId(@Param("areaId") String areaId);

}
