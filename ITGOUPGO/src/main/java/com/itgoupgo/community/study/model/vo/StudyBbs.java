package com.itgoupgo.community.study.model.vo;

import java.sql.Date;

public class StudyBbs {
	private int studyNo; // STUDY_NO	NUMBER
	private String studyTitle; // STUDY_TITLE	VARCHAR2(100 BYTE)
	private String studyContent; // STUDY_CONTENT	VARCHAR2(4000 BYTE)
	private Date studyCreateDate; // STUDY_CREATE_DATE	DATE
	private int studyView; // STUDY_VIEW	NUMBER
	private String studyCategory; // STUDY_CATEGORY	VARCHAR2(100 BYTE)
	private String studyDeleteStatus; // STUDY_DELETE_STATUS	CHAR(1 BYTE)
	private int memberNo; // MEMBER_NO	NUMBER
	private String memberNick;
	
	public StudyBbs() {}
	
	public StudyBbs(int studyNo, String studyTitle, String studyContent, Date studyCreateDate, int studyView,
			String studyCategory, String studyDeleteStatus, int memberNo, String memberNick) {
		super();
		this.studyNo = studyNo;
		this.studyTitle = studyTitle;
		this.studyContent = studyContent;
		this.studyCreateDate = studyCreateDate;
		this.studyView = studyView;
		this.studyCategory = studyCategory;
		this.studyDeleteStatus = studyDeleteStatus;
		this.memberNo = memberNo;
		this.memberNick = memberNick;
	}

	public String getMemberNick() {
		return memberNick;
	}

	public void setMemberNick(String memberNick) {
		this.memberNick = memberNick;
	}

	public int getStudyNo() {
		return studyNo;
	}

	public void setStudyNo(int studyNo) {
		this.studyNo = studyNo;
	}

	public String getStudyTitle() {
		return studyTitle;
	}

	public void setStudyTitle(String studyTitle) {
		this.studyTitle = studyTitle;
	}

	public String getStudyContent() {
		return studyContent;
	}

	public void setStudyContent(String studyContent) {
		this.studyContent = studyContent;
	}

	public Date getStudyCreateDate() {
		return studyCreateDate;
	}

	public void setStudyCreateDate(Date studyCreateDate) {
		this.studyCreateDate = studyCreateDate;
	}

	public int getStudyView() {
		return studyView;
	}

	public void setStudyView(int studyView) {
		this.studyView = studyView;
	}

	public String getStudyCategory() {
		return studyCategory;
	}

	public void setStudyCategory(String studyCategory) {
		this.studyCategory = studyCategory;
	}

	public String getStudyDeleteStatus() {
		return studyDeleteStatus;
	}

	public void setStudyDeleteStatus(String studyDeleteStatus) {
		this.studyDeleteStatus = studyDeleteStatus;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	@Override
	public String toString() {
		return "StudyBbs [studyNo=" + studyNo + ", studyTitle=" + studyTitle + ", studyContent=" + studyContent
				+ ", studyCreateDate=" + studyCreateDate + ", studyView=" + studyView + ", studyCategory="
				+ studyCategory + ", studyDeleteStatus=" + studyDeleteStatus + ", memberNo=" + memberNo + "]";
	}
	
}
