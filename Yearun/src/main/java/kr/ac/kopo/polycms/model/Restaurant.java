package kr.ac.kopo.polycms.model;

public class Restaurant {
int restaurantNo;
String restaurantName;
String restaurantPhone;
String restaurantAddress;
int areaNo;
String restaurantPhoto;


public String getRestaurantPhoto() {
	return restaurantPhoto;
}
public void setRestaurantPhoto(String restaurantPhoto) {
	this.restaurantPhoto = restaurantPhoto;
}
public int getAreaNo() {
	return areaNo;
}
public void setAreaNo(int areaNo) {
	this.areaNo = areaNo;
}
public int getRestaurantNo() {
	return restaurantNo;
}
public void setRestaurantNo(int restaurantNo) {
	this.restaurantNo = restaurantNo;
}
public String getRestaurantName() {
	return restaurantName;
}
public void setRestaurantName(String restaurantName) {
	this.restaurantName = restaurantName;
}
public String getRestaurantPhone() {
	return restaurantPhone;
}
public void setRestaurantPhone(String restaurantPhone) {
	this.restaurantPhone = restaurantPhone;
}
public String getRestaurantAddress() {
	return restaurantAddress;
}
public void setRestaurantAddress(String restaurantAddress) {
	this.restaurantAddress = restaurantAddress;
}
public String getRestaurantInfo() {
	return restaurantInfo;
}
public void setRestaurantInfo(String restaurantInfo) {
	this.restaurantInfo = restaurantInfo;
}

public int getRestaurantScore() {
	return restaurantScore;
}
public void setRestaurantScore(int restaurantScore) {
	this.restaurantScore = restaurantScore;
}

String restaurantInfo;
int restaurantScore;
}
