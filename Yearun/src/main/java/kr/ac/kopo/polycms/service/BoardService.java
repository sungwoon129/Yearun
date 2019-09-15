package kr.ac.kopo.polycms.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import kr.ac.kopo.polycms.model.MyArticle;
import kr.ac.kopo.polycms.model.Notice;
import kr.ac.kopo.polycms.model.Post;
import kr.ac.kopo.polycms.model.User;
import kr.ac.kopo.polycms.util.Pager;

public interface BoardService {

	void incRecommend(long freeCode, String id);

	void incRef(long freeCode);

	Post item(long freeCode);

	List<Post> list(Pager pager);

	void add(Post item);

	void update(Post item);

	void delete(long freeCode);

	void replyadd(Post item);



	String profileUpload(MultipartFile file,HttpServletRequest request, HttpServletResponse response) throws IOException;

	int countRecommend(String id, long freeCode);

	List<Notice> nlist();

	Notice nitem(int noticeCode);

	int countComment(long freeCode);

	List<Post> flist();

	List<MyArticle> mylist(String id, Pager pager);



	

	

	

	

	

	

	



}
