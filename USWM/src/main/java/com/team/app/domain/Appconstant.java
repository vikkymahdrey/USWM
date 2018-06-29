package com.team.app.domain;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the appconstant database table.
 * 
 */
@Entity
@NamedQuery(name="Appconstant.findAll", query="SELECT a FROM Appconstant a")
public class Appconstant implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;

	private String key;

	private String value;

	public Appconstant() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getKey() {
		return this.key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getValue() {
		return this.value;
	}

	public void setValue(String value) {
		this.value = value;
	}

}