package com.seung.model;


public class BookingDTO {
	
	private int idx;
	private int rest;
	private String breakTiOne;
	private String breakTiTwo;
	private int rotation;
	private String timer;
	//	--------------------------------
	
	
	public String getTimer() {
		return timer;
	}
	public void setTimer(String timer) {
		this.timer = timer;
	}
	public int getRotation() {
		return rotation;
	}
	public void setRotation(int rotation) {
		this.rotation = rotation;
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
	public String getBreakTiOne() {
		return breakTiOne;
	}
	public void setBreakTiOne(String breakTiOne) {
		this.breakTiOne = breakTiOne;
	}
	public String getBreakTiTwo() {
		return breakTiTwo;
	}
	public void setBreakTiTwo(String breakTiTwo) {
		this.breakTiTwo = breakTiTwo;
	}
}
