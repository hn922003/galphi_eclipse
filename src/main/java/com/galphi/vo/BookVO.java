package com.galphi.vo;

public class BookVO {

	private int ISBN;
	private String title;
	private String author;
	private String publisher;
	private String pDate;
	private String category;
	private float avg;
	private String chap;
	private String summary;
	private String review;
	
	public BookVO() { }
	public BookVO(int iSBN, String title, String author, String publisher, String pDate, String category, float avg,
			String chap, String summary, String review) {
		super();
		ISBN = iSBN;
		this.title = title;
		this.author = author;
		this.publisher = publisher;
		this.pDate = pDate;
		this.category = category;
		this.avg = avg;
		this.chap = chap;
		this.summary = summary;
		this.review = review;
	}

	public int getISBN() {
		return ISBN;
	}
	public void setISBN(int iSBN) {
		ISBN = iSBN;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getpDate() {
		return pDate;
	}
	public void setpDate(String pDate) {
		this.pDate = pDate;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public float getAvg() {
		return avg;
	}
	public void setAvg(float avg) {
		this.avg = avg;
	}
	public String getChap() {
		return chap;
	}
	public void setChap(String chap) {
		this.chap = chap;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}

	@Override
	public String toString() {
		return "BookVO [ISBN=" + ISBN + ", title=" + title + ", author=" + author + ", publisher=" + publisher
				+ ", pDate=" + pDate + ", category=" + category + ", avg=" + avg + ", chap=" + chap + ", summary="
				+ summary + ", review=" + review + "]";
	}
	
}
