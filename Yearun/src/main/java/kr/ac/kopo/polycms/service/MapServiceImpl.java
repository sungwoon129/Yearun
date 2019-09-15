package kr.ac.kopo.polycms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.polycms.dao.MapDao;
import kr.ac.kopo.polycms.model.Area;
import kr.ac.kopo.polycms.model.Bucket;
import kr.ac.kopo.polycms.model.BucketList;
import kr.ac.kopo.polycms.model.Hotel;
import kr.ac.kopo.polycms.model.Planner;
import kr.ac.kopo.polycms.model.Restaurant;
import kr.ac.kopo.polycms.model.items;

@Service
public class MapServiceImpl implements MapService {
@Autowired
MapDao dao;
	
	@Override
	public List<Area> AreaSelect() {
		// TODO Auto-generated method stub
		return dao.AreaSelect();
	}

	@Override
	public List<Area> Area() {
		// TODO Auto-generated method stub
		return dao.area();
	}

	@Override
	public List<Hotel> hotel() {
		// TODO Auto-generated method stub
		return dao.hotel();
	}

	@Override
	public List<Restaurant> restaurant() {
		// TODO Auto-generated method stub
		return dao.restaurant();
	}

	@Override
	public void add(BucketList b) {
		dao.add(b);
		
	}

	@Override
	public List<Hotel> hotelList(String id) {
		// TODO Auto-generated method stub
		return dao.hotelList(id);
	}

	@Override
	public List<Restaurant> restaurantList(String id) {
		// TODO Auto-generated method stub
		return dao.restaurantList(id);
	}

	@Override
	public void bucketDelete(String id) {
		// TODO Auto-generated method stub
		dao.bucketDelete(id);
	}

	@Override
	public void imgUpload(Planner planner) {
		// TODO Auto-generated method stub
		dao.imgUpload(planner);
	}

	@Override
	public void planDetailAdd(items item, String id) {
		dao.planDetailAdd(item,id);
		
	}

	@Override
	public List<Planner> myPlan(int plannerCode) {
		// TODO Auto-generated method stub
		return dao.myPlan(plannerCode);
	}

	@Override
	public List<Planner> myBucketList(String id) {
		// TODO Auto-generated method stub
		return dao.myBucketList(id);
	}

	@Override
	public void myBucketDelete(int plannerCode) {
		// TODO Auto-generated method stub
		dao.myBucketDelete(plannerCode);
	}

	

}
