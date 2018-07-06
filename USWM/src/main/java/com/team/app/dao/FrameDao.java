package com.team.app.dao;

import java.io.Serializable;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.team.app.domain.LoraFrame;

public interface FrameDao extends JpaRepository<LoraFrame, Serializable> {

	@Query("Select f from LoraFrame f order by id desc")
	List<LoraFrame> getFrames();
		
	@Modifying
	@Query(value="UPDATE lora_frames f SET f.nodeName=?1 WHERE f.devEUI=?2", nativeQuery = true)
	@Transactional
	void setUpdateNodeName(@Param("nodeName") String nodeName, @Param("devEUI") String devEUI);
	
	
	@Modifying
	@Query(value="delete from lora_frames  where applicationID=?1 and devEUI=?2",nativeQuery = true)
	@Transactional
	void deleteDevEUI(@Param("applicationID") String applicationID, @Param("devEUI") String devEUI);

	@Query("Select f from LoraFrame f where f.applicationID=:applicationID group by f.devEUI")
	List<LoraFrame> getDevEUIByAppId(@Param("applicationID") String applicationID);

	@Query("Select f from LoraFrame f where f.devEUI=:devEUI")
	List<LoraFrame> getDeviceIdByDevEUI(@Param("devEUI") String devEUI);
	
	



}
