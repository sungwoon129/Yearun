package kr.ac.kopo.polycms.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.polycms.model.MyArticle;
import kr.ac.kopo.polycms.model.Notice;
import kr.ac.kopo.polycms.model.Post;
import kr.ac.kopo.polycms.util.Pager;
@Repository
public class BoardDaoImpl implements BoardDao {
@Autowired
SqlSession sql;
	
	@Override
	public void incRecommend(long freeCode,String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("freeCode", freeCode);
		map.put("id",id);
		
		sql.insert("board.checkRecommend", map);
	}
	
	@Override
	public void updateRecommend(long freeCode) {
		sql.update("board.incRecommend", freeCode);
	}

	@Override
	public void incRef(long freeCode) {
		sql.update("board.incRef", freeCode);
	}

	@Override
	public Post item(long freeCode) {
		return sql.selectOne("board.item", freeCode);
	}

	@Override
	public List<Post> list(Pager pager) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pager", pager);
		
		return sql.selectList("board.list",map);
		
	}

	@Override
	public void add(Post item) {
		
		
		sql.insert("board.add", item);
		
	}


	@Override
	public void update(Post item) {
		sql.update("board.update", item);
	}

	@Override
	public void delete(long freeCode) {
		sql.delete("board.delete", freeCode);
	}

	@Override
	public void replyadd(Post item) {
		sql.insert("board.replyadd", item);
	
	
	}

	@Override
	public int total(Pager pager) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("pager", pager);
		
		 int total = sql.selectOne("board.total",map);
		 

		 
		 return total;
	}

	@Override
	public int todayTotal(Pager pager) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("pager", pager);
		
		int todayTotal = sql.selectOne("board.todayTotal",map);
		 
		return todayTotal;
	}

	@Override
	public void replyupdate(int originNo, int groupOrd, int groupLayer) {
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("originNo", originNo);
		map.put("groupOrd", groupOrd);
		map.put("groupLayer", groupLayer);
		sql.update("board.replyupdate", map);		
	}

	@Override
	public void deleteComment(long freeCode) {
		sql.delete("board.deleteComment",freeCode);
	}

	@Override
	public int countRecommend(String id, long freeCode) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("freeCode", freeCode);
		return sql.selectOne("board.countRecommend", map);
	}

	@Override
	public List<Notice> nlist() {
		return sql.selectList("board.nlist");
	}

	@Override
	public Notice nitem(int noticeCode) {
		return sql.selectOne("board.nitem", noticeCode);
	}

	@Override
	public int countComment(long freeCode) {
		return sql.selectOne("board.countComment", freeCode);
	}

	@Override
	public List<Post> flist() {
	
		return sql.selectList("board.flist");
	}

	@Override
	public List<MyArticle> mylist(String id,Pager pager) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("pager", pager);
		
		return sql.selectList("board.mylist", map);
	}

	








}
