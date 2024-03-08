package com.galphi.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.galphi.vo.BookVO;
import com.galphi.vo.Param;

public class BookDAO {

	private static BookDAO instance = new BookDAO();
	private BookDAO() { }
	public static BookDAO getInstance() {
		return instance;
	}
	
//	책 1권
	public BookVO selectByISBN(SqlSession mapper, int ISBN) {
		System.out.println("BookDAO 클래스의 selectByISBN() 메소드 실행");
		System.out.println(ISBN);
		return (BookVO) mapper.selectOne("selectByISBN", ISBN);
	}
	
//	전체 개수
	public int selectCount(SqlSession mapper) {
		System.out.println("BookDAO 클래스의 selectCount() 메소드 실행");
		return (int) mapper.selectOne("selectCount");
	}

//	전체 책 1페이지
	public ArrayList<BookVO> selectList(SqlSession mapper, HashMap<String, Integer> hmap) {
		System.out.println("BookDAO 클래스의 selectList() 메소드 실행");
		return (ArrayList<BookVO>) mapper.selectList("selectList", hmap);
	}

//	오늘의 책 추천 한 페이지 가져오기
	public ArrayList<BookVO> selectDailyList(SqlSession mapper, HashMap<String, Integer> hmap) {
		System.out.println("BookDAO 클래스의 selectDailyList() 메소드 실행");
		return (ArrayList<BookVO>) mapper.selectList("selectDailyList", hmap);
	}
	
//	베스트 도서 한 페이지 가져오기
	public ArrayList<BookVO> selectBestList(SqlSession mapper, HashMap<String, Integer> hmap) {
		System.out.println("BookDAO 클래스의 selectBestList() 메소드 실행");
		return (ArrayList<BookVO>) mapper.selectList("selectBestList", hmap);
	}
	
//	신간도서 한 페이지 가져오기
	public ArrayList<BookVO> selectNewList(SqlSession mapper, HashMap<String, Integer> hmap) {
		System.out.println("BookDAO 클래스의 selectNewList() 메소드 실행");
		return (ArrayList<BookVO>) mapper.selectList("selectNewList", hmap);
	}
	
//	신간도서 개수 가져오기
	public int selectNewCount(SqlSession mapper) {
		System.out.println("BookDAO 클래스의 selectNewCount() 메소드 실행");
		return (int) mapper.selectOne("selectNewCount");
	}
	
//	카테고리별 개수 가져오기
	public int selectCategoryCount(SqlSession mapper, String list) {
		System.out.println("BookDAO 클래스의 selectCategoryCount() 메소드 실행");
		return (int) mapper.selectOne("selectCategoryCount", list);
	}
	
//	카테고리별 한 페이지 가져오기
	public ArrayList<BookVO> selectCategoryList(SqlSession mapper, Param param) {
		System.out.println("BookDAO 클래스의 selectCategoryList() 메소드 실행");
		return (ArrayList<BookVO>) mapper.selectList("selectCategoryList", param);
	}

//	검색 엔진 전체 개수
	public int selectCount(SqlSession mapper, Param param) {
		System.out.println("BookDAO 클래스의 selectCount(SqlSession mapper, Param param) 메소드 실행");
		return (int) mapper.selectOne("selectCountMulti", param);
	}
	
//	검색 한페이지 가져오기
	public ArrayList<BookVO> selectList(SqlSession mapper, Param param) {
		System.out.println("BookDAO 클래스의 selectList(SqlSession mapper, Param param) 메소드 실행");
		return (ArrayList<BookVO>) mapper.selectList("selectListMulti", param);
	}
	
	public void update(SqlSession mapper, Param param) {
		mapper.update("update", param);
	}
	
	
	
	
	
	
}
