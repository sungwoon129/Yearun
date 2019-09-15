package kr.ac.kopo.polycms.model;

public class Bucket {
	private String id;
	private int hotelNo;
	private int restaurantNo;
	private int areaNo;
	

	@Override
	public String toString() {
		return "Bucket [id=" + id + ", hotelNo=" + hotelNo + ", restaurantNo=" + restaurantNo + ", areaNo=" + areaNo
				+ "]";
	}
	public int getHotelNo() {
		return hotelNo;
	}
	public void setHotelNo(int hotelNo) {
		this.hotelNo = hotelNo;
	}
	public int getRestaurantNo() {
		return restaurantNo;
	}
	public void setRestaurantNo(int restaurantNo) {
		this.restaurantNo = restaurantNo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public int getAreaNo() {
		return areaNo;
	}
	public void setAreaNo(int areaNo) {
		this.areaNo = areaNo;
	}
	
	
	

	
	
	
}
