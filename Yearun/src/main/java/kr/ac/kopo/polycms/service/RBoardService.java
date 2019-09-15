package kr.ac.kopo.polycms.service;

import java.util.List;

import kr.ac.kopo.polycms.model.Notice;
import kr.ac.kopo.polycms.model.RPost;
import kr.ac.kopo.polycms.util.Pager;

public interface RBoardService {

	

	void incRecommend(long reviewCode, String id);

	void incRef(long reviewCode);

	RPost item(long reviewCode);

	List<RPost> list(Pager pager);

	void add(RPost item);

	void update(RPost item);

	void delete(long reviewCode);

	int countRecommend(String id, int reviewCode);

	int countComment(long reviewCode);

	

	List<RPost> rlist();


}
