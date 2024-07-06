package com.seung.model;

public class PickDTO {
	
	private int idx;
	private String userId;
	private int rest;
	private int pick;
	
	
	
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
	public int getRest() {
		return rest;
	}
	public void setRest(int rest) {
		this.rest = rest;
	}
	public int getPick() {
		return pick;
	}
	public void setPick(int pick) {
		this.pick = pick;
	}
}
