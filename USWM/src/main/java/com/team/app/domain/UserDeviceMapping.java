package com.team.app.domain;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.*;


/**
 * The persistent class for the user_device_mapping database table.
 * 
 */
@Entity
@Table(name="user_device_mapping")
@NamedQuery(name="UserDeviceMapping.findAll", query="SELECT u FROM UserDeviceMapping u")
public class UserDeviceMapping implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private String id;

	private String devEUI;

	private String orgId;
	
	private String devNode;
	
	

	@Temporal(TemporalType.TIMESTAMP)
	private Date createddt;

	

	//bi-directional many-to-one association to TblUserInfo
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="userId")
	private TblUserInfo tblUserInfo;

	public UserDeviceMapping() {
	}

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getDevEUI() {
		return this.devEUI;
	}
	
	public Date getCreateddt() {
		return createddt;
	}

	public void setCreateddt(Date createddt) {
		this.createddt = createddt;
	}

	public void setDevEUI(String devEUI) {
		this.devEUI = devEUI;
	}
	
	public String getDevNode() {
		return devNode;
	}

	public void setDevNode(String devNode) {
		this.devNode = devNode;
	}

	public String getOrgId() {
		return this.orgId;
	}

	public void setOrgId(String orgId) {
		this.orgId = orgId;
	}

	public TblUserInfo getTblUserInfo() {
		return this.tblUserInfo;
	}

	public void setTblUserInfo(TblUserInfo tblUserInfo) {
		this.tblUserInfo = tblUserInfo;
	}

}