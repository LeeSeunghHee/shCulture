package com.seung.model;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

//	restaurant          varchar2(100)       not null primary key,
//	restImg             varchar2(200)       ,
//	restNum             varchar2(20)        not null,
//	addr                varchar2(100)       not null,
//	lat                 number              ,
//	gugun               varchar2(10)        not null,
//	restInfo            varchar2(255)       not null,
//	gpa                 number              default 0

public class RestaurantDTO {
	
	private int idx;
	private String restName;
	private String international;
	private String roadName;
	private String localNum;
	private String postalCode;
	private String detailL;
	private String restNum;
	private String gun;
	private String restImg;
	private String startTime;
	private String endTime;
	private String lastOrder;
	private String breakTiS;
	private String breakTiE;
	private String restWeek;
	private String restDay;
	private String restInfo;
	private String convenient;
	private String sns;
	private String userId;
	private int maxPeople;

	//	========================================
	private MultipartFile uploadRest;
	private String closeDay;
	private String restTime;
	private int pick_count;
	private int reser_count;
	private List<String> gunList;
	private List<String> interList;
	private double ravg;
	private int app;
	

	public int getApp() {
		return app;
	}
	public void setApp(int app) {
		this.app = app;
	}
	public double getRavg() {
		return ravg;
	}
	public void setRavg(double ravg) {
		this.ravg = ravg;
	}
	public int getReser_count() {
		return reser_count;
	}
	public void setReser_count(int reser_count) {
		this.reser_count = reser_count;
	}
	public int getMaxPeople() {
		return maxPeople;
	}
	public void setMaxPeople(int maxPeople) {
		this.maxPeople = maxPeople;
	}
	public List<String> getGunList() {
		return gunList;
	}
	public void setGunList(List<String> gunList) {
		this.gunList = gunList;
	}
	public List<String> getInterList() {
		return interList;
	}
	public void setInterList(List<String> interList) {
		this.interList = interList;
	}
	public int getPick_count() {
		return pick_count;
	}
	public void setPick_count(int pick_count) {
		this.pick_count = pick_count;
	}
	public String getRestTime() {
		return restTime;
	}
	public void setRestTime(String restTime) {
		this.restTime = restTime;
	}
	public String getLastOrder() {
		return lastOrder;
	}
	public void setLastOrder(String lastOrder) {
		this.lastOrder = lastOrder;
	}
	public String getBreakTiS() {
		return breakTiS;
	}
	public void setBreakTiS(String breakTiS) {
		this.breakTiS = breakTiS;
	}
	public String getBreakTiE() {
		return breakTiE;
	}
	public void setBreakTiE(String breakTiE) {
		this.breakTiE = breakTiE;
	}
	public String getCloseDay() {
		return closeDay;
	}
	public void setCloseDay(String closeDay) {
		this.closeDay = closeDay;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getRestName() {
		return restName;
	}
	public void setRestName(String restName) {
		this.restName = restName;
	}
	public String getInternational() {
		return international;
	}
	public void setInternational(String international) {
		this.international = international;
	}
	public String getPostalCode() {
		return postalCode;
	}
	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}
	public String getRoadName() {
		return roadName;
	}
	public void setRoadName(String roadName) {
		this.roadName = roadName;
	}
	public String getLocalNum() {
		return localNum;
	}
	public void setLocalNum(String localNum) {
		this.localNum = localNum;
	}
	public String getDetailL() {
		return detailL;
	}
	public void setDetailL(String detailL) {
		this.detailL = detailL;
	}
	public String getRestNum() {
		return restNum;
	}
	public void setRestNum(String restNum) {
		this.restNum = restNum;
	}
	public String getGun() {
		return gun;
	}
	public void setGun(String gun) {
		this.gun = gun;
	}
	public String getRestImg() {
		return restImg;
	}
	public void setRestImg(String restImg) {
		this.restImg = restImg;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public String getRestWeek() {
		return restWeek;
	}
	public void setRestWeek(String restWeek) {
		this.restWeek = restWeek;
	}
	public String getRestDay() {
		return restDay;
	}
	public void setRestDay(String restDay) {
		this.restDay = restDay;
	}
	public String getRestInfo() {
		return restInfo;
	}
	public void setRestInfo(String restInfo) {
		this.restInfo = restInfo;
	}
	public String getConvenient() {
		return convenient;
	}
	public void setConvenient(String convenient) {
		this.convenient = convenient;
	}
	public String getSns() {
		return sns;
	}
	public void setSns(String sns) {
		this.sns = sns;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public MultipartFile getUploadRest() {
		return uploadRest;
	}
	public void setUploadRest(MultipartFile uploadRest) {
		this.uploadRest = uploadRest;
	}
}
