package kr.ac.kopo.polycms.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.polycms.model.Area;
import kr.ac.kopo.polycms.model.Bucket;
import kr.ac.kopo.polycms.model.BucketList;
import kr.ac.kopo.polycms.model.Hotel;
import kr.ac.kopo.polycms.model.Planner;
import kr.ac.kopo.polycms.model.Restaurant;
import kr.ac.kopo.polycms.model.items;

@Repository
public class MapDaoImpl implements MapDao {

@Autowired
SqlSession sql;

	@Override
	public List<Area> AreaSelect() {
		// TODO Auto-generated method stub
		return sql.selectList("map.list");
		
	}

	@Override
	public List<Area> area() {
		// TODO Auto-generated method stub
		return sql.selectList("map.area");
	}

	@Override
	public List<Hotel> hotel() {
		// TODO Auto-generated method stub
		return sql.selectList("map.hotel");
	}

	@Override
	public List<Restaurant> restaurant() {
		// TODO Auto-generated method stub
		return sql.selectList("map.restaurant");
	}


	@Override
	public void add(BucketList b) {
		Map<String,Object> map = new HashMap<String,Object>();
		
		System.out.println("DAO"+b.getBucketList());
		
		map.put("list", b.getBucketList());
		System.out.println(map);
		if(b.getBucketList().size() > 0) {
			sql.insert("map.add", map);	
		}else {
			System.out.println("nono");
		}
	}

	@Override
	public List<Hotel> hotelList(String id) {
		// TODO Auto-generated method stub
		return sql.selectList("map.hotelList", id);
	}

	@Override
	public List<Restaurant> restaurantList(String id) {
		// TODO Auto-generated method stub
		return sql.selectList("map.restaurantList",id);
	}

	@Override
	public void bucketDelete(String id) {
		sql.delete("map.bucketDelete",id);
		
	}

	@Override
	public void imgUpload(Planner planner) {
		// TODO Auto-generated method stub
		System.out.println("imgUpload MapDAO");
		sql.insert("map.imgUpload",planner);
	}

	@Override
	public void planDetailAdd(items item, String id) {
		// TODO Auto-generated method stub
		
		System.out.println("planDetailAdd DAO");
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("cart", item.getCart());
		
//		map.put("id", id);
		if(item.getCart().size() > 0) {
			sql.insert("map.planDetailAdd", map);
			System.out.println("planDetailAdd sql문 실행");
		}else {
			System.out.println("nono");
		}
	}

	@Override
	public List<Planner> myPlan(int plannerCode) {
		System.out.println("myPlan MapDAO plannerCode->" + plannerCode);
		return sql.selectList("map.myPlan",plannerCode);
	}

	@Override
	public List<Planner> myBucketList(String id) {
		
		return sql.selectList("map.myBucketList",id);
	}

	@Override
	public void myBucketDelete(int plannerCode) {
		// TODO Auto-generated method stub
		sql.delete("map.myBucketDelete",plannerCode);
	}

}
