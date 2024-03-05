package com.galphi.service;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.galphi.dao.BookDAO;
import com.galphi.mybatis.MySession;
import com.galphi.vo.BookList;
import com.galphi.vo.BookVO;
import com.galphi.vo.Param;

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
		// System.out.println(vo);
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
	
//	전체 목록 가져오기
	public BookList selectList(int currentPage) {
		System.out.println("BookService 클래스의 selectList() 메소드 실행");
		SqlSession mapper = MySession.getSession();
		int pageSize = 10;
		int totalCount = BookDAO.getInstance().selectCount(mapper);
		// System.out.println(totalCount);
		BookList bookList = new BookList(pageSize, totalCount, currentPage);
		HashMap<String, Integer> hmap = new HashMap<String, Integer>();
		hmap.put("startNo", bookList.getStartNo());
		hmap.put("endNo", bookList.getEndNo());
		bookList.setList(BookDAO.getInstance().selectList(mapper, hmap));
		// System.out.println(bookList);
		
		mapper.close();
		return bookList;
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
	
	public BookList selectCategoryList(int currentPage, String list) {
		System.out.println("BookService 클래스의 selectCategoryList() 메소드 실행");
		SqlSession mapper = MySession.getSession();
		try {
			list = list.toLowerCase();
		} catch (Exception e) {
			
		}
		
		int pageSize = 10;
		int totalCount = BookDAO.getInstance().selectCategoryCount(mapper, list);
		// System.out.println(totalCount);
		// System.out.println(list);
	
		BookList bookCategoryList = new BookList(pageSize, totalCount, currentPage);
		int startNo = bookCategoryList.getStartNo();
		int endNo = bookCategoryList.getEndNo();
		Param param = new Param(startNo, endNo, list);
		// System.out.println(startNo);
		// System.out.println(endNo);
		// System.out.println(list);
		bookCategoryList.setList(BookDAO.getInstance().selectCategoryList(mapper, param));
		
		mapper.close();
		return bookCategoryList;
	}
	
	public BookList selectList(int currentPage, String category, String item) {
		System.out.println("BookService 클래스의 selectList(int, String, String) 메소드 실행");
		SqlSession mapper = MySession.getSession();
		BookList bookList = null;
		int pageSize = 10;
		// 카테고리에 따른 검색어를 포함하는 글의 개수를 얻어온다.
		// 카테고리에 따른 검색어가 포함되었나 조건을 세워야 하기 때문에 Param 클래스 객체를 사용한다.
		Param param = new Param();
		param.setCategory(category);
		param.setItem(item);
		int totalCount = BookDAO.getInstance().selectCount(mapper, param); 
		// System.out.println(totalCount);
		bookList = new BookList(pageSize, totalCount, currentPage);
		param.setStartNo(bookList.getStartNo());
		param.setEndNo(bookList.getEndNo());
		bookList.setList(BookDAO.getInstance().selectList(mapper, param));

		return bookList;
	}
	
}

