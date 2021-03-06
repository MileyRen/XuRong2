package org.ecnu.orm;

// Generated 2013-3-12 14:15:56 by Hibernate Tools 3.4.0.CR1

import java.util.Date;

/**
 * ChannelHis generated by hbm2java
 */
public class ChannelHis implements java.io.Serializable {

	private Long id;
	private String nodeId;
	private String nodeGroupName;
	private String channelId;
	private String wareId;
	private String wareName;
	private Integer normalStock;
	private Integer currentNumber;
	private Integer incrementNumber;
	private Date lastTime;

	public ChannelHis() {
	}

	public ChannelHis(String nodeId, String channelId, Date lastTime) {
		this.nodeId = nodeId;
		this.channelId = channelId;
		this.lastTime = lastTime;
	}

	public ChannelHis(String nodeId, String nodeGroupName, String channelId,
			String wareId, String wareName, Integer normalStock,
			Integer currentNumber, Integer incrementNumber, Date lastTime) {
		this.nodeId = nodeId;
		this.nodeGroupName = nodeGroupName;
		this.channelId = channelId;
		this.wareId = wareId;
		this.wareName = wareName;
		this.normalStock = normalStock;
		this.currentNumber = currentNumber;
		this.incrementNumber = incrementNumber;
		this.lastTime = lastTime;
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNodeId() {
		return this.nodeId;
	}

	public void setNodeId(String nodeId) {
		this.nodeId = nodeId;
	}

	public String getNodeGroupName() {
		return this.nodeGroupName;
	}

	public void setNodeGroupName(String nodeGroupName) {
		this.nodeGroupName = nodeGroupName;
	}

	public String getChannelId() {
		return this.channelId;
	}

	public void setChannelId(String channelId) {
		this.channelId = channelId;
	}

	public String getWareId() {
		return this.wareId;
	}

	public void setWareId(String wareId) {
		this.wareId = wareId;
	}

	public String getWareName() {
		return this.wareName;
	}

	public void setWareName(String wareName) {
		this.wareName = wareName;
	}

	public Integer getNormalStock() {
		return this.normalStock;
	}

	public void setNormalStock(Integer normalStock) {
		this.normalStock = normalStock;
	}

	public Integer getCurrentNumber() {
		return this.currentNumber;
	}

	public void setCurrentNumber(Integer currentNumber) {
		this.currentNumber = currentNumber;
	}

	public Integer getIncrementNumber() {
		return this.incrementNumber;
	}

	public void setIncrementNumber(Integer incrementNumber) {
		this.incrementNumber = incrementNumber;
	}

	public Date getLastTime() {
		return this.lastTime;
	}

	public void setLastTime(Date lastTime) {
		this.lastTime = lastTime;
	}

}
