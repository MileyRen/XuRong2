package org.ecnu.oracle.orm;

// Generated 2013-3-7 21:12:37 by Hibernate Tools 3.4.0.CR1

/**
 * GroupInfo generated by hbm2java
 */
public class GroupInfo implements java.io.Serializable {

	private String groupId;
	private String groupName;
	private String groupType;
	private String groupDesc;
	private String lastTime;
	private String person;

	public GroupInfo() {
	}

	public GroupInfo(String groupId, String groupName, String groupType) {
		this.groupId = groupId;
		this.groupName = groupName;
		this.groupType = groupType;
	}

	public GroupInfo(String groupId, String groupName, String groupType,
			String groupDesc, String lastTime, String person) {
		this.groupId = groupId;
		this.groupName = groupName;
		this.groupType = groupType;
		this.groupDesc = groupDesc;
		this.lastTime = lastTime;
		this.person = person;
	}

	public String getGroupId() {
		return this.groupId;
	}

	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}

	public String getGroupName() {
		return this.groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public String getGroupType() {
		return this.groupType;
	}

	public void setGroupType(String groupType) {
		this.groupType = groupType;
	}

	public String getGroupDesc() {
		return this.groupDesc;
	}

	public void setGroupDesc(String groupDesc) {
		this.groupDesc = groupDesc;
	}

	public String getLastTime() {
		return this.lastTime;
	}

	public void setLastTime(String lastTime) {
		this.lastTime = lastTime;
	}

	public String getPerson() {
		return this.person;
	}

	public void setPerson(String person) {
		this.person = person;
	}

}