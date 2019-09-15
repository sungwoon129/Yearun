package kr.ac.kopo.polycms.model;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class Notice {
	public long getRecommend() {
		return recommend;
	}

	public void setRecommend(long recommend) {
		this.recommend = recommend;
	}

	int noticeCode;
	String noticeTitle;
	String noticeContext;
	String id;
	long ref;
	MultipartFile uploadFile;
	Date regDate;
	String upFilename;
	long recommend;

	public String getUpFilename() {
		return upFilename;
	}

	public void setUpFilename(String upFilename) {
		this.upFilename = upFilename;
	}

	public MultipartFile getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public long getRef() {
		return ref;
	}

	public void setRef(long ref) {
		this.ref = ref;
	}

	public int getNoticeCode() {
		return noticeCode;
	}

	public void setNoticeCode(int noticeCode) {
		this.noticeCode = noticeCode;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeContext() {
		return noticeContext;
	}

	public void setNoticeContext(String noticeContext) {
		this.noticeContext = noticeContext;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
}
