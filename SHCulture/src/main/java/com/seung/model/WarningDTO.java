package com.seung.model;

import java.sql.Date;

public class WarningDTO {
	
	private int idx;
	private int rest;
	private String userId;
	private int reviewIdx;
	private String reviewContent;
	private String reason;
	private int approval;
	private String appPs;
	private Date writeDate;
//	----------------------------------------
	private String restName;
	
	
	
	public String getRestName() {
		return restName;
	}
	public void setRestName(String restName) {
		this.restName = restName;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getRest() {
		return rest;
	}
	public void setRest(int rest) {
		this.rest = rest;
	}
	public int getReviewIdx() {
		return reviewIdx;
	}
	public void setReviewIdx(int reviewIdx) {
		this.reviewIdx = reviewIdx;
	}
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public int getApproval() {
		return approval;
	}
	public void setApproval(int approval) {
		this.approval = approval;
	}
	public String getAppPs() {
		return appPs;
	}
	public void setAppPs(String appPs) {
		this.appPs = appPs;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	
	
}
