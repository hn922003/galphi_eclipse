package com.galphi.vo;

public class Param {
	private int idx;
	private String memo;
	private Float score;
	
	public Param() {	}

	public Param(int idx, String memo, Float score) {
		super();
		this.idx = idx;
		this.memo = memo;
		this.score = score;
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

	@Override
	public String toString() {
		return "Param [idx=" + idx + ", memo=" + memo + ", score=" + score + "]";
	}
	
	
}
