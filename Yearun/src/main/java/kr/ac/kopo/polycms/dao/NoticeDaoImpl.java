package kr.ac.kopo.polycms.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.polycms.model.Notice;
import kr.ac.kopo.polycms.util.Pager;

@Repository
public class NoticeDaoImpl implements NoticeDao {

	@Autowired
	SqlSession sql;
	
	@Override
	public void incRecommend(long noticeCode,String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("noticeCode", noticeCode);
		map.put("id",id);
		
		sql.insert("notice.checkRecommend", map);
	}
	@Override
	public void updateRecommend(long noticeCode) {
		sql.update("notice.incRecommend", noticeCode);
	}

	@Override
	public int countRecommend(String id, long noticeCode) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("noticeCode", noticeCode);
		return sql.selectOne("notice.countRecommend", map);
	}
	
	@Override
	public List<Notice> list(Pager pager) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pager", pager);
		
		return sql.selectList("notice.list");
	}

	@Override
	public void add(Notice item) {
		sql.insert("notice.add",item);
	}

	@Override
	public void update(Notice item) {
		sql.update("notice.update",item);
	}

	@Override
	public void delete(long noticeCode) {
		sql.delete("notice.delete",noticeCode);
	}

	@Override
	public Notice item(long noticeCode) {
		
		return sql.selectOne("notice.item", noticeCode);
	}

	@Override
	public void inRef(long noticeCode) {
		sql.update("notice.incRef", noticeCode);
	}

	@Override
	public int total(Pager pager) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("pager", pager);
		
		 int total = sql.selectOne("notice.total",map);
		 

		 
		 return total;
	}

	@Override
	public int todayTotal(Pager pager) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("pager", pager);
		
		int todayTotal = sql.selectOne("notice.todayTotal",map);
		 
		return todayTotal;
	}
}
