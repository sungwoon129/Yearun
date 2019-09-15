package kr.ac.kopo.polycms.model;

import java.util.Date;

public class MyArticle {
	long code;
	String board;
	String boardname;

	public String getBoardname() {
		return boardname;
	}
	public void setBoardname(String boardname) {
		this.boardname = boardname;
	}
	public String getBoard() {
		return board;
	}
	public void setBoard(String board) {
		this.board = board;
	}
	public long getCode() {
		return code;
	}
	public void setCode(long code) {
		this.code = code;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getRecommend() {
		return Recommend;
	}
	public void setRecommend(int recommend) {
		Recommend = recommend;
	}


	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getRef() {
		return Ref;
	}
	public void setRef(int ref) {
		Ref = ref;
	}
	String id;

	String title;
	int Recommend;
	Date regDate;
	int Ref;


}
