package com.team.app.domain;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the tbl_device_battrey_info database table.
 * 
 */
@Entity
@Table(name="tbl_device_battrey_info")
@NamedQuery(name="TblDeviceBattreyInfo.findAll", query="SELECT t FROM TblDeviceBattreyInfo t")
public class TblDeviceBattreyInfo implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private String id;

	@Column(name="battrey_perc")
	private String battreyPerc;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="created_at")
	private Date createdAt;

	private String devEUI;

	private String nodeName;
	private String tempInfo;
	
	public String getTempInfo() {
		return tempInfo;
	}

	public void setTempInfo(String tempInfo) {
		this.tempInfo = tempInfo;
	}

	private String applicationID;
	private String applicationName;
	

	public String getApplicationID() {
		return applicationID;
	}

	public void setApplicationID(String applicationID) {
		this.applicationID = applicationID;
	}

	public String getApplicationName() {
		return applicationName;
	}

	public void setApplicationName(String applicationName) {
		this.applicationName = applicationName;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="updated_at")
	private Date updatedAt;

	public TblDeviceBattreyInfo() {
	}

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getBattreyPerc() {
		return this.battreyPerc;
	}

	public void setBattreyPerc(String battreyPerc) {
		this.battreyPerc = battreyPerc;
	}

	public Date getCreatedAt() {
		return this.createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public String getDevEUI() {
		return this.devEUI;
	}

	public void setDevEUI(String devEUI) {
		this.devEUI = devEUI;
	}

	public String getNodeName() {
		return this.nodeName;
	}

	public void setNodeName(String nodeName) {
		this.nodeName = nodeName;
	}

	public Date getUpdatedAt() {
		return this.updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

}