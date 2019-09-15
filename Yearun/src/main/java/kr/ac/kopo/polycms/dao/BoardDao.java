package kr.ac.kopo.polycms.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import kr.ac.kopo.polycms.model.MyArticle;
import kr.ac.kopo.polycms.model.Notice;
import kr.ac.kopo.polycms.model.Post;
import kr.ac.kopo.polycms.util.Pager;

public interface BoardDao {

	void incRecommend(long freeCode, String id);

	void incRef(long freeCode);

	Post item(long freeCode);

	List<Post> list(Pager pager);

	void add(Post item);

	void update(Post item);

	void delete(long freeCode);

	void replyadd(Post item);

	int total(Pager pager);

	int todayTotal(Pager pager);

	void replyupdate(int originNo, int groupOrd, int groupLayer);

	void deleteComment(long freeCode);

	void updateRecommend(long freeCode);

	int countRecommend(String id, long freeCode);

	List<Notice> nlist();

	Notice nitem(int noticeCode);

	int countComment(long freeCode);

	List<Post> flist();

	List<MyArticle> mylist(String id, Pager pager);



	

	





	

}
