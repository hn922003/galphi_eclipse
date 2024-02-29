package com.galphi.service;

import org.apache.ibatis.session.SqlSession;

import com.galphi.dao.BookCommentDAO;
import com.galphi.mybatis.MySession;
import com.galphi.vo.BookCommentList;
import com.galphi.vo.BookCommentVO;
import com.galphi.vo.Param;

public class BookCommentService {

	private static BookCommentService instance = new BookCommentService();
	private BookCommentService() { }
	public static BookCommentService getInstance() {
		return instance;
	}
	
	public void insertComment(BookCommentVO co) {
		SqlSession mapper = MySession.getSession();
		BookCommentDAO.getInstance().insertComment(mapper, co);
		mapper.commit();
		mapper.close();
	}
	
	public BookCommentList selectCommentList(int ISBN) {
		// System.out.println(ISBN);
		SqlSession mapper = MySession.getSession();
		BookCommentList bookCommentList = new BookCommentList();
		bookCommentList.setList(BookCommentDAO.getInstance().selectCommentList(mapper, ISBN));
		mapper.close();
		return bookCommentList;
	}
	
	public BookCommentVO selectcommentByIdx(int idx) {
		// System.out.println("흔적");

		SqlSession mapper = MySession.getSession();
		
		BookCommentVO co = BookCommentDAO.getInstance().selectcommentByIdx(mapper, idx);
		mapper.close();
		return co;
	}
	
	public void updateComment(Param param) {
		SqlSession mapper = MySession.getSession();
		
		BookCommentDAO.getInstance().updateComment(mapper, param);
		mapper.commit();
		mapper.close();
		
	}
	
	public void deleteComment(int idx) {
		SqlSession mapper = MySession.getSession();
		BookCommentDAO.getInstance().deleteComment(mapper, idx);
		mapper.commit();
		mapper.close();
	}
	
}















