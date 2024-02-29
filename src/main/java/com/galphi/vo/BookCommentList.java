package com.galphi.vo;

import java.util.ArrayList;

public class BookCommentList {

	private ArrayList<BookCommentVO> list = new ArrayList<BookCommentVO>();

	public ArrayList<BookCommentVO> getList() {
		return list;
	}
	public void setList(ArrayList<BookCommentVO> list) {
		this.list = list;
	}
	
	@Override
	public String toString() {
		return "BookCommentList [list=" + list + "]";
	}
	
}
