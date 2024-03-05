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
	
	
//	전체 책 개수 쓸 수도 있으니 일단 남겨둡니다.
	public int selectCount(SqlSession mapper) {
		System.out.println("BookDAO 클래스의 selectCount() 메소드 실행");
		return (int) mapper.selectOne("selectCount");
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
	
// 	BookService 클래스에서 호출되는 mapper와 1페이지 분량의 시작 인덱스, 끝 인덱스가 저장된
//	HashMap 객체를 넘겨받고 1페이지 분량의 메인글 목록을 얻어오는 book.xml 파일의 
//	select sql 명령을 실행하는 메소드
	/*
	public ArrayList<BookVO> selectList(SqlSession mapper, Date today) {
		System.out.println("BookDAO 클래스의 selectList() 메소드 실행");
		return (ArrayList<BookVO>) mapper.selectList("selectList", today);
	}
	 */
}
