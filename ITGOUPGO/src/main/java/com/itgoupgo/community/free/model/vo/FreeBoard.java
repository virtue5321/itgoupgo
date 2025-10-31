package com.itgoupgo.community.free.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


// 필드부
public class FreeBoard {
	
	private int freeNo;             	// 글번호 (FREE_NO)
    private int memberNo;           	// 회원 고유번호 (MEMBER_NO) - 작성자
    private String freeTitle;       	// 제목 (FREE_TITLE)
    private String freeContent;     	// 내용 (FREE_CONTENT)
    private Date freeCreateDate;    	// 작성일 (FREE_CREATE_DATE)
    private int freeView;           	// 조회수 (FREE_VIEW)
    private String freeDeleteStatus;	// 삭제 여부 (FREE_DELETE_STATUS) - 'Y' 또는 'N'
	public int getFreeNo() {
		return freeNo;
	}
	
	// 생성자 
	public void setFreeDeleteStatus(String freeDeleteStatus) {
		this.freeDeleteStatus = freeDeleteStatus;
	}
	
	public FreeBoard(int freeNo, int memberNo, String freeTitle, String freeContent, Date freeCreateDate, int freeView,
			String freeDeleteStatus) {
		super();
		this.freeNo = freeNo;
		this.memberNo = memberNo;
		this.freeTitle = freeTitle;
		this.freeContent = freeContent;
		this.freeCreateDate = freeCreateDate;
		this.freeView = freeView;
		this.freeDeleteStatus = freeDeleteStatus;
	}
	
	// Getter and Setter
	public void setFreeNo(int freeNo) {
		this.freeNo = freeNo;
	}
	
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getFreeTitle() {
		return freeTitle;
	}
	public void setFreeTitle(String freeTitle) {
		this.freeTitle = freeTitle;
	}
	public String getFreeContent() {
		return freeContent;
	}
	public void setFreeContent(String freeContent) {
		this.freeContent = freeContent;
	}
	public Date getFreeCreateDate() {
		return freeCreateDate;
	}
	public void setFreeCreateDate(Date freeCreateDate) {
		this.freeCreateDate = freeCreateDate;
	}
	public int getFreeView() {
		return freeView;
	}
	public void setFreeView(int freeView) {
		this.freeView = freeView;
	}
	public String getFreeDeleteStatus() {
		return freeDeleteStatus;
	}
	
	// toString
	@Override
	public String toString() {
		return "FreeBoard [freeNo=" + freeNo + ", memberNo=" + memberNo + ", freeTitle=" + freeTitle + ", freeContent="
				+ freeContent + ", freeCreateDate=" + freeCreateDate + ", freeView=" + freeView + ", freeDeleteStatus="
				+ freeDeleteStatus + "]";
	}
}
