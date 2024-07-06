package com.seung.model;

import java.sql.Date;

public class ReplyDTO {
	
	private int idx;
	private int qna;
	private String writer;
	private Date writeDate;
	private String reply;
	
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getQna() {
		return qna;
	}
	public void setQna(int qna) {
		this.qna = qna;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	
}
