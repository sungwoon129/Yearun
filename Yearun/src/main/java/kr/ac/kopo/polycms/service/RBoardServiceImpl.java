package kr.ac.kopo.polycms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.polycms.dao.RBoardDao;
import kr.ac.kopo.polycms.model.Notice;
import kr.ac.kopo.polycms.model.RPost;
import kr.ac.kopo.polycms.util.Pager;
@Service
public class RBoardServiceImpl implements RBoardService {
@Autowired
RBoardDao rdao;



	@Override
	public void incRecommend(long reviewCode,String id) {
		rdao.incRecommend(reviewCode,id);
		rdao.updateRecommend(reviewCode);
	}

	@Override
	public void incRef(long reviewCode) {
		rdao.incRef(reviewCode);
	}

	@Override
	public RPost item(long reviewCode) {
		return rdao.item(reviewCode);
	}

	@Override
	public List<RPost> list(Pager pager) {
		int total = (int) rdao.total(pager);
		int todayTotal = rdao.todayTotal(pager);
		
		pager.setTodayTotal(todayTotal);
		pager.setTotal(total);
		
		return rdao.list(pager);
	}

	@Override
	public void add(RPost item) {
		rdao.add(item);
	}

	@Override
	public void update(RPost item) {
		rdao.update(item);
	}

	@Override
	public void delete(long reviewCode) {
		rdao.delete(reviewCode);
	}

	@Override
	public int countRecommend(String id, int reviewCode) {
		return rdao.countRecommend(id,reviewCode);
	}

	@Override
	public int countComment(long reviewCode) {
		return  rdao.countComment(reviewCode);
	}



	@Override
	public List<RPost> rlist() {
		return rdao.rlist();
	}



}
