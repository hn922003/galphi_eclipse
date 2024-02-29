package com.galphi.vo;

import java.util.Date;

public class BookCommentVO {

	private int ISBN;
	private String nick;
	private int idx;
	private float score;
	private String memo;
	private Date wDate;
	
	public BookCommentVO() {
		// TODO Auto-generated constructor stub
	}

	public BookCommentVO(int iSBN, String nick, int idx, float score, String memo) {
		super();
		ISBN = iSBN;
		this.nick = nick;
		this.idx = idx;
		this.score = score;
		this.memo = memo;
	}

	public int getISBN() {
		return ISBN;
	}

	public void setISBN(int iSBN) {
		ISBN = iSBN;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public float getScore() {
		return score;
	}

	public void setScore(float score) {
		this.score = score;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public Date getwDate() {
		return wDate;
	}

	public void setwDate(Date wDate) {
		this.wDate = wDate;
	}

	@Override
	public String toString() {
		return "BookCommentVO [ISBN=" + ISBN + ", nick=" + nick + ", idx=" + idx + ", score=" + score + ", memo=" + memo
				+ ", wDate=" + wDate + "]";
	}

	
}
