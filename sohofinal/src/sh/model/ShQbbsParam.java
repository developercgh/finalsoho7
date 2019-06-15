package sh.model;

import java.io.Serializable;

public class ShQbbsParam implements Serializable {
	
	
	// search(검색)
	private String q_category;	// 제목, 내용, 작성자
	private String q_keyword;	// 검색어
	
	// paging
	private int recordCountPerPage = 10;	// 표현할 한 페이지의 글수 (10개씩표현)
	private int pageNumber = 0;			// 페이지 번호 현재페이지 넘버?
	
	// start, end
	private int start = 1;
	private int end = 10;
	
	
	public ShQbbsParam() {
		
	}


	public ShQbbsParam(String q_category, String q_keyword) {
		super();
		this.q_category = q_category;
		this.q_keyword = q_keyword;
	}


	public String getQ_category() {
		return q_category;
	}


	public void setQ_category(String q_category) {
		this.q_category = q_category;
	}


	public String getQ_keyword() {
		return q_keyword;
	}


	public void setQ_keyword(String q_keyword) {
		this.q_keyword = q_keyword;
	}


	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}


	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
	}


	public int getPageNumber() {
		return pageNumber;
	}


	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}


	public int getStart() {
		return start;
	}


	public void setStart(int start) {
		this.start = start;
	}


	public int getEnd() {
		return end;
	}


	public void setEnd(int end) {
		this.end = end;
	}


	@Override
	public String toString() {
		return "QbbsParam [q_category=" + q_category + ", q_keyword=" + q_keyword + ", recordCountPerPage="
				+ recordCountPerPage + ", pageNumber=" + pageNumber + ", start=" + start + ", end=" + end + "]";
	}
	
	
	






}
