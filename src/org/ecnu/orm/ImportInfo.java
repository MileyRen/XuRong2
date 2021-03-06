package org.ecnu.orm;

// Generated 2013-3-19 20:17:50 by Hibernate Tools 3.4.0.CR1

import java.util.Date;

/**
 * ImportInfo generated by hbm2java
 */
public class ImportInfo implements java.io.Serializable {

	private Long id;
	private String tableName;
	private String operater;
	private Date lastTime;

	public ImportInfo() {
	}

	public ImportInfo(String tableName, String operater, Date lastTime) {
		this.tableName = tableName;
		this.operater = operater;
		this.lastTime = lastTime;
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTableName() {
		return this.tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	public String getOperater() {
		return this.operater;
	}

	public void setOperater(String operater) {
		this.operater = operater;
	}

	public Date getLastTime() {
		return this.lastTime;
	}

	public void setLastTime(Date lastTime) {
		this.lastTime = lastTime;
	}

}
