package com.galphi.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

import com.galphi.service.BookCommentService;
import com.galphi.vo.BookCommentVO;
import com.galphi.vo.Param;

public class BookCommentDAO {

	private static BookCommentDAO instance = new BookCommentDAO();
	private BookCommentDAO() { }
	public static BookCommentDAO getInstance() {
		return instance;
	}
	
	public void insertComment(SqlSession mapper, BookCommentVO co) {
		mapper.insert("insertComment", co);
	}
	
	public ArrayList<BookCommentVO> selectCommentList(SqlSession mapper, int ISBN) {
		// System.out.println(ISBN);
		return (ArrayList<BookCommentVO>) mapper.selectList("selectCommentList", ISBN);
	}
	
	
	public BookCommentVO selectcommentByIdx(SqlSession mapper, int idx) {
		// System.out.println("흔적");
		return (BookCommentVO) mapper.selectOne("selectcommentByIdx", idx);
	}
	
	public void updateComment(SqlSession mapper, Param param) {
		mapper.update("updateComment", param);
	}
	
	public void deleteComment(SqlSession mapper, int idx) {
		mapper.delete("deleteComment", idx);
	}
	
	
	

}
