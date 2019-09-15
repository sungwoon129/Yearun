package kr.ac.kopo.polycms.model;

public class Planner {
	String id;
	int plannerCode;
	int areaNo;
	String myPhoto;
	String date;
	String title;
	String planName;
	String areaName;
	
	
	public String getAreaName() {
		return areaName;
	}
	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}
	public int getAreaNo() {
		return areaNo;
	}
	public void setAreaNo(int areaNo) {
		this.areaNo = areaNo;
	}
	public String getPlanName() {
		return planName;
	}
	public void setPlanName(String planName) {
		this.planName = planName;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
	public String getMyPhoto() {
		return myPhoto;
	}
	public void setMyPhoto(String myPhoto) {
		this.myPhoto = myPhoto;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getPlannerCode() {
		return plannerCode;
	}
	public void setPlannerCode(int plannerCode) {
		this.plannerCode = plannerCode;
	}

}
