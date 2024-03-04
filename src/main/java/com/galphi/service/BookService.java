package com.galphi.service;

import java.util.Date;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.galphi.dao.BookDAO;
import com.galphi.mybatis.MySession;
import com.galphi.vo.BookList;
import com.galphi.vo.BookVO;

public class BookService {

	private static BookService instance = new BookService();
	private BookService() { }
	public static BookService getInstance() {
		return instance;
	}
	
//	메인글 1개
	public BookVO selectByISBN(int ISBN) {
		System.out.println("BookService 클래스의 selectByISBN() 메소드 실행");
		// System.out.println(ISBN);
		SqlSession mapper = MySession.getSession();
		BookVO vo = BookDAO.getInstance().selectByISBN(mapper, ISBN);
		System.out.println(vo);
		mapper.close();
		return vo;
	}

//	list.jsp에서 호출되는 브라우저에 출력할 페이지 번호를 넘겨받고 mapper를 얻어온 후 1페이지 분량의
//	메인글 목록을 얻어오는 BookDAO 클래스의 select sql 명령을 실행하는 메소드를 호출하는 메소드
	/*
	public BookList selectList(int currentPage) {
		System.out.println("BookService 클래스의 selectList() 메소드 실행");
		SqlSession mapper = MySession.getSession();
		
		int pageSize = 10;
		int totalCount = BookDAO.getInstance().selectCount(mapper);
		// System.out.println(totalCount);
		BookList bookList = new BookList(pageSize, totalCount, currentPage);
		bookList.setList(BookDAO.getInstance().selectList(mapper));
		// System.out.println(bookList);
		
		mapper.close();
		return bookList;
	}
	 */
	
	public BookList selectDailyList(int currentPage) {
		System.out.println("BookService 클래스의 selectDailyList() 메소드 실행");
		SqlSession mapper = MySession.getSession();
		int pageSize = 10;
		int totalCount = 1;
		BookList bookDailyList = new BookList(pageSize, totalCount, currentPage);
		HashMap<String, Integer> hmap = new HashMap<String, Integer>();
		hmap.put("startNo", bookDailyList.getStartNo());
		hmap.put("endNo", bookDailyList.getEndNo());
		bookDailyList.setList(BookDAO.getInstance().selectDailyList(mapper, hmap));
		
		mapper.close();
		return bookDailyList;
	}
	
	public BookList selectBestList(int currentPage) {
		System.out.println("BookService 클래스의 selectBestList() 메소드 실행");
		SqlSession mapper = MySession.getSession();
		int pageSize = 10;
		int totalCount = 1;
		BookList bookBestList = new BookList(pageSize, totalCount, currentPage);
		HashMap<String, Integer> hmap = new HashMap<String, Integer>();
		hmap.put("startNo", bookBestList.getStartNo());
		hmap.put("endNo", bookBestList.getEndNo());
		bookBestList.setList(BookDAO.getInstance().selectBestList(mapper, hmap));
		
		mapper.close();
		return bookBestList;
	}
	
	public BookList selectNewList(int currentPage) {
		System.out.println("BookService 클래스의 selectNewList() 메소드 실행");
		SqlSession mapper = MySession.getSession();
		int pageSize = 10;
		int totalCount = BookDAO.getInstance().selectNewCount(mapper);
		BookList bookNewList = new BookList(pageSize, totalCount, currentPage);
		HashMap<String, Integer> hmap = new HashMap<String, Integer>();
		hmap.put("startNo", bookNewList.getStartNo());
		hmap.put("endNo", bookNewList.getEndNo());
		bookNewList.setList(BookDAO.getInstance().selectNewList(mapper, hmap));
		
		mapper.close();
		return bookNewList;
	}
	
}

