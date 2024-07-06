package com.seung.model;

import java.sql.Date;

//	idx             number          default BMreservation_seq.nextval primary key,
//	userid          varchar2(50)    not null,
//	rest            varchar2(100)   not null,
//	reserDate       date            not null,
//	people          number          not null,
//	etc             varchar2(100),

public class ReservationDTO {
	private int idx;
	private String userId;
	private String rest;
	private Date reserDate;
	private String reserTime;
	private int people;
	private int approval;
	private String etc;
//	-------------------------------
	private String restName;
	private double rstar; 
	private String restImg;
	private String international;
	private int restIdx;
	private int countReview;
	private double ravg;
	private String userName;
	private String review;
	private String reviewImg;
	private int recommend;
	private Date writeDate;
	private int star;
	
	
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public int getRecommend() {
		return recommend;
	}
	public void setRecommend(int recommend) {
		this.recommend = recommend;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}
	public String getReviewImg() {
		return reviewImg;
	}
	public void setReviewImg(String reviewImg) {
		this.reviewImg = reviewImg;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public double getRavg() {
		return ravg;
	}
	public void setRavg(double ravg) {
		this.ravg = ravg;
	}
	public int getCountReview() {
		return countReview;
	}
	public void setCountReview(int countReview) {
		this.countReview = countReview;
	}
	public int getRestIdx() {
		return restIdx;
	}
	public void setRestIdx(int restIdx) {
		this.restIdx = restIdx;
	}
	public String getInternational() {
		return international;
	}
	public void setInternational(String international) {
		this.international = international;
	}
	public String getRestName() {
		return restName;
	}
	public void setRestName(String restName) {
		this.restName = restName;
	}
	public double getRstar() {
		return rstar;
	}
	public void setRstar(double rstar) {
		this.rstar = rstar;
	}
	public String getRestImg() {
		return restImg;
	}
	public void setRestImg(String restImg) {
		this.restImg = restImg;
	}
	public String getReserTime() {
		return reserTime;
	}
	public void setReserTime(String reserTime) {
		this.reserTime = reserTime;
	}
	public int getApproval() {
		return approval;
	}
	public void setApproval(int approval) {
		this.approval = approval;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getRest() {
		return rest;
	}
	public void setRest(String rest) {
		this.rest = rest;
	}
	public Date getReserDate() {
		return reserDate;
	}
	public void setReserDate(Date reserDate) {
		this.reserDate = reserDate;
	}
	public int getPeople() {
		return people;
	}
	public void setPeople(int people) {
		this.people = people;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
}
