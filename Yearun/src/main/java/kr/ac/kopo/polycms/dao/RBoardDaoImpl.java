package kr.ac.kopo.polycms.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.polycms.model.Notice;
import kr.ac.kopo.polycms.model.RPost;
import kr.ac.kopo.polycms.util.Pager;
@Repository
public class RBoardDaoImpl implements RBoardDao {
@Autowired
SqlSession sql;


	

	@Override
	public void incRecommend(long reviewCode,String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("reviewCode", reviewCode);
		map.put("id",id);
		
		sql.insert("rboard.checkRecommend", map);
	}

	@Override
	public void incRef(long reviewCode) {
		sql.update("rboard.incRef", reviewCode);
	}

	@Override
	public RPost item(long reviewCode) {
		return sql.selectOne("rboard.item", reviewCode);
	}

	@Override
	public List<RPost> list(Pager pager) {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pager", pager);
		
		return sql.selectList("rboard.list",map);
	}

	@Override
	public void add(RPost item) {
		sql.insert("rboard.add", item);
	}

	@Override
	public void update(RPost item) {
		sql.update("rboard.update", item);
	}

	@Override
	public void delete(long reviewCode) {
		sql.delete("rboard.delete", reviewCode);
	}

	@Override
	public void updateRecommend(long reviewCode) {
		sql.update("rboard.incRecommend", reviewCode);
		
	}

	@Override
	public int total(Pager pager) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("pager", pager);
		
		 int total = sql.selectOne("rboard.total",map);
		return total;
	}

	@Override
	public int todayTotal(Pager pager) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("pager", pager);
		
		int todayTotal = sql.selectOne("rboard.todayTotal",map);
		 
		return todayTotal;
	}

	@Override
	public int countRecommend(String id, int reviewCode) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("reviewCode", reviewCode);
		return sql.selectOne("rboard.countRecommend", map);
	}

	@Override
	public int countComment(long reviewCode) {
		return sql.selectOne("rboard.countComment", reviewCode);
		
	}


	@Override
	public List<RPost> rlist() {
		return sql.selectList("rboard.rlist");
	}



}
