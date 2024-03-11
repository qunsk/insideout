package com.example.InsideOut.service;

//글목록 파트
public class PagingPgm {

	// 기본 변수
	private int total;          // 총 데이터 개수
	private int rowPerPage;     // 화면에 출력할 데이터 개수
	private int currentPage;    // 현재 페이지 번호
	
	// 파생된 변수
	private int pagePerBlk = 10;  // 블럭당 페이지 개수 (1개의 블럭당 10개의 페이지)
	private int startPage;        // 각 블럭의 시작 페이지
	private int endPage;          // 각 블럭의 끝 페이지
	private int totalPage;        // 총 페이지 수

	public PagingPgm(int total, int rowPerPage, int currentPage) {

	// 기본 변수
	this.total = total;
	this.rowPerPage = rowPerPage;
	this.currentPage = currentPage;

    // 파생된 변수
    totalPage = (int) Math.ceil((double) total / rowPerPage); // 총 페이지 수
    startPage = currentPage - (currentPage - 1) % pagePerBlk; // 1, 11, 21...
    endPage = startPage + pagePerBlk - 1; // 10, 20, 30...
   
   if (endPage > totalPage) // 실제 존재하는 페이지만 존재하게 한다.
      endPage = totalPage;
	}

	public int getTotal() {
	   return total;
	}
	
	public int getRowPerPage() {
	   return rowPerPage;
	}
	
	public int getCurrentPage() {
	   return currentPage;
	}
	
	public int getPagePerBlk() {
	   return pagePerBlk;
	}
	
	public int getStartPage() {
	   return startPage;
	}
	
	public int getEndPage() {
	   return endPage;
	}
	
	public int getTotalPage() {
	   return totalPage;
	}
	
	public void setTotal(int total) {
	   this.total = total;
	}
	
	public void setRowPerPage(int rowPerPage) {
	   this.rowPerPage = rowPerPage;
	}
	
	public void setCurrentPage(int currentPage) {
	   this.currentPage = currentPage;
	}
	
	public void setPagePerBlk(int pagePerBlk) {
	   this.pagePerBlk = pagePerBlk;
	}
	
	public void setStartPage(int startPage) {
	   this.startPage = startPage;
	}
	
	public void setEndPage(int endPage) {
	   this.endPage = endPage;
	}
	
	public void setTotalPage(int totalPage) {
	   this.totalPage = totalPage;
	}

}


