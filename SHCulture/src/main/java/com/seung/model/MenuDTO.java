package com.seung.model;

import org.springframework.web.multipart.MultipartFile;

public class MenuDTO {
	private int idx;
	private int rest;
	private String menuName;
	private int price;
	private String menuImg;
	private String menuInfo;
	


	//	===============================
	private MultipartFile menuUpload;

	
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

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getMenuImg() {
		return menuImg;
	}

	public void setMenuImg(String menuImg) {
		this.menuImg = menuImg;
	}

	public MultipartFile getMenuUpload() {
		return menuUpload;
	}

	public void setMenuUpload(MultipartFile menuUpload) {
		this.menuUpload = menuUpload;
	}
	
	public String getMenuInfo() {
		return menuInfo;
	}

	public void setMenuInfo(String menuInfo) {
		this.menuInfo = menuInfo;
	}
}
