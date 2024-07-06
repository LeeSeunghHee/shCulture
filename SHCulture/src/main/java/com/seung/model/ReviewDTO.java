package com.seung.model;

import java.sql.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

//	idx         number          default BMreview_seq.nextval primary key,
//	userid      varchar2(50)    not null,
//	rest        varchar2(100)   not null,       
//	title       varchar2(50)    not null,
//	content     varchar2(255)   not null,
//	gpa         number          default 0,
//	filepath    varchar2(255)   ,

public class ReviewDTO {
	
	private int idx;
	private String userId;
	private String rest;
	private String reviewImg;
	private String title;
	private String review;
	private int	star;
	private Date writeDate;
	private int recommend;

	//	-------------------------------------
	private List<MultipartFile> uploadReview;
	private String restName;
	private String profileImg;
	private String nickname;
	
	
	public String getProfileImg() {
		return profileImg;
	}
	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getRestName() {
		return restName;
	}
	public void setRestName(String restName) {
		this.restName = restName;
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
	public String getReviewImg() {
		return reviewImg;
	}
	public void setReviewImg(String reviewImg) {
		this.reviewImg = reviewImg;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	public List<MultipartFile> getUploadReview() {
		return uploadReview;
	}
	public void setUploadReview(List<MultipartFile> uploadReview) {
		this.uploadReview = uploadReview;
	}
	
	public int getRecommend() {
		return recommend;
	}
	public void setRecommend(int recommend) {
		this.recommend = recommend;
	}	
}
