package com.galphi.vo;

public class Param {
	private int idx;
	private String memo;
	private Float score;
	private int startNo;
	private int endNo;
	private String list;
	
	public Param() {	}

	public Param(int idx, String memo, Float score) {
		super();
		this.idx = idx;
		this.memo = memo;
		this.score = score;
	}
	
	public Param(int startNo, int endNo, String list) {
		super();
		this.startNo = startNo;
		this.endNo = endNo;
		this.list = list;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public Float getScore() {
		return score;
	}

	public void setScore(Float score) {
		this.score = score;
	}

	public int getStartNo() {
		return startNo;
	}

	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}

	public int getEndNo() {
		return endNo;
	}

	public void setEndNo(int endNo) {
		this.endNo = endNo;
	}

	public String getList() {
		return list;
	}

	public void setList(String list) {
		this.list = list;
	}

	@Override
	public String toString() {
		return "Param [idx=" + idx + ", memo=" + memo + ", score=" + score + ", startNo=" + startNo + ", endNo=" + endNo
				+ ", list=" + list + "]";
	}
	
}
