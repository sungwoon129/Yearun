package kr.ac.kopo.polycms.model;

public class Area {

	int areaNo;
	String areaName;
	String areaPhoto;
	String areaInfo;
	int areaScore;
	String lon;
	String lat;
	
	public String getLon() {
		return lon;
	}
	public void setLon(String lon) {
		this.lon = lon;
	}
	public String getLat() {
		return lat;
	}
	public void setLat(String lat) {
		this.lat = lat;
	}
	public int getAreaNo() {
		return areaNo;
	}
	public void setAreaNo(int areaNo) {
		this.areaNo = areaNo;
	}
	public String getAreaName() {
		return areaName;
	}
	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}
	public String getAreaPhoto() {
		return areaPhoto;
	}
	public void setAreaPhoto(String areaPhoto) {
		this.areaPhoto = areaPhoto;
	}
	public String getAreaInfo() {
		return areaInfo;
	}
	public void setAreaInfo(String areaInfo) {
		this.areaInfo = areaInfo;
	}
	public int getAreaScore() {
		return areaScore;
	}
	public void setAreaScore(int areaScore) {
		this.areaScore = areaScore;
	}
	
}
