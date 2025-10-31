package com.itgoupgo.community.common.model.vo;

// 페이징 처리 시 필요한 7개의 변수를 담기 위한 VO
// * 목록 화면 구현 시 : Controller, Service, DAO, Mapper, View 에 걸쳐 사용됨
public class PageInfo {

	// --------------------- 요청 시 받아오는 변수 (4개) ---------------------
	private int listCount;	// 현재 총 게시글 개수
	private int currentPage;// 현재 페이지 (요청 시 받아옴)
	private int pageLimit;	// 페이징바의 페이지 최대 개수 (상수)
	private int boardLimit;	// 한 페이지에 보여질 게시글의 최대 개수 (상수)
	
	// --------------------- 계산 후 담는 변수 (3개 + DB 범위 2개) ---------------------
	private int maxPage;	// 가장 마지막 페이지가 몇 번인지
	private int startPage;	// 페이지 하단에 보여질 페이징바의 시작수
	private int endPage;	// 페이지 하단에 보여질 페이징바의 끝수
	
	// * DB 조회에 필요한 페이징 정보 (Oracle ROWNUM 방식 사용)
	private int startRow;   // 조회할 게시글의 시작 행 번호 (RNUM)
	private int endRow;     // 조회할 게시글의 끝 행 번호 (RNUM)
	

	// 기본 생성자
	public PageInfo() {}

	// 전체 매개변수 생성자 (Pagination Util에서 사용)
	public PageInfo(int listCount, int currentPage, int pageLimit, int boardLimit, int maxPage, int startPage,
			int endPage) {
		super();
		this.listCount = listCount;
		this.currentPage = currentPage;
		this.pageLimit = pageLimit;
		this.boardLimit = boardLimit;
		this.maxPage = maxPage;
		this.startPage = startPage;
		this.endPage = endPage;
		
		// DB 조회용 행 번호 계산 및 설정 (Pagination 클래스에서 호출 시점에 이 정보는 아직 계산되지 않았으므로 임시로 설정)
		// 실제 startRow와 endRow는 Pagination 클래스 내부에서 계산 후 Setter로 다시 설정
		this.startRow = (currentPage - 1) * boardLimit + 1;
		this.endRow = startRow + boardLimit - 1;
	}

	// Getter / Setter
	public int getListCount() {
		return listCount;
	}

	public void setListCount(int listCount) {
		this.listCount = listCount;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getPageLimit() {
		return pageLimit;
	}

	public void setPageLimit(int pageLimit) {
		this.pageLimit = pageLimit;
	}

	public int getBoardLimit() {
		return boardLimit;
	}

	public void setBoardLimit(int boardLimit) {
		this.boardLimit = boardLimit;
	}

	public int getMaxPage() {
		return maxPage;
	}

	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	
	// toString()
	@Override
	public String toString() {
		return "PageInfo [listCount=" + listCount + ", currentPage=" + currentPage + ", pageLimit=" + pageLimit
				+ ", boardLimit=" + boardLimit + ", maxPage=" + maxPage + ", startPage=" + startPage + ", endPage="
				+ endPage + ", startRow=" + startRow + ", endRow=" + endRow + "]";
	}
}
