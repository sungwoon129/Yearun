package kr.ac.kopo.polycms.service;

import java.util.List;

import kr.ac.kopo.polycms.model.Area;
import kr.ac.kopo.polycms.model.Bucket;
import kr.ac.kopo.polycms.model.BucketList;
import kr.ac.kopo.polycms.model.Hotel;
import kr.ac.kopo.polycms.model.Planner;
import kr.ac.kopo.polycms.model.Restaurant;
import kr.ac.kopo.polycms.model.items;

public interface MapService {

	List<Area> AreaSelect();

	List<Area> Area();

	List<Hotel> hotel();

	List<Restaurant> restaurant();

	void add(BucketList b);

	List<Hotel> hotelList(String id);

	List<Restaurant> restaurantList(String id);

	void bucketDelete(String id);

	void imgUpload(Planner planner);

	void planDetailAdd(items item, String id);

	List<Planner> myPlan(int plannerCode);

	List<Planner> myBucketList(String id);

	void myBucketDelete(int plannerCode);

}
