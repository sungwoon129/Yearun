package kr.ac.kopo.polycms.model;

import java.util.Date;

public class CommentVO {
	int cno;
	int freeCode;
	String content;
	String id;
	Date regDate;
	long recommend;
	

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public int getFreeCode() {
		return freeCode;
	}

	public void setFreeCode(int freeCode) {
		this.freeCode = freeCode;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public long getRecommend() {
		return recommend;
	}

	public void setRecommend(long recommend) {
		this.recommend = recommend;
	}
	
	


	
}
