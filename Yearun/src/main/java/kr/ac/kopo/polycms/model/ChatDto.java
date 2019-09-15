package kr.ac.kopo.polycms.model;

public class ChatDto {
	//NUM, NAME, PWD, TOTALCOUNT,REMAINCOUNT, CONTENT
	int num;
	String name;
	int totalcount;
	int remaincount;
	String content;
	String pwd;
	
	
		
	
//	public ChatDto(String name, String pwd, int totalcount, int remaincount, String content) {
//		// TODO Auto-generated constructor stub
//		this.name = name;
//		
//		this.totalcount =totalcount;
//		this.remaincount = remaincount;
//		this.content = content;
//		this.pwd =pwd;
//	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public int getTotalcount() {
		return totalcount;
	}
	public void setTotalcount(int totalcount) {
		this.totalcount = totalcount;
	}
	public int getRemaincount() {
		return remaincount;
	}
	public void setRemaincount(int remaincount) {
		this.remaincount = remaincount;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
//	public String toString() {
//		return "ChatDto [name="+name+", pwd="+pwd+", totalcount="+totalcount+", remaincount=" +remaincount+ ",content="+content+"]";
//		
//		
//	}
}
