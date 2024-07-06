package com.seung.model;

import java.sql.Date;

public class QnaDTO {
	
	private int idx;
	private String userId;
	private String qnaCategory;
	private String title;
	private Date writeDate;
	private	String qna;
//	--------------------------
	private int rep;
	private int countQna;
	
	
	public int getCountQna() {
		return countQna;
	}
	public void setCountQna(int countQna) {
		this.countQna = countQna;
	}
	public int getRep() {
		return rep;
	}
	public void setRep(int rep) {
		this.rep = rep;
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
	public String getQnaCategory() {
		return qnaCategory;
	}
	public void setQnaCategory(String qnaCategory) {
		this.qnaCategory = qnaCategory;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	public String getQna() {
		return qna;
	}
	public void setQna(String qna) {
		this.qna = qna;
	}
	
}
