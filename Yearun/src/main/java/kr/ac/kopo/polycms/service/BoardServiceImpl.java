package kr.ac.kopo.polycms.service;

import java.io.File;

import java.io.IOException;
import java.io.PrintWriter;

import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.ac.kopo.polycms.dao.BoardDao;
import kr.ac.kopo.polycms.model.MyArticle;
import kr.ac.kopo.polycms.model.Notice;
import kr.ac.kopo.polycms.model.Post;
import kr.ac.kopo.polycms.model.User;
import kr.ac.kopo.polycms.util.Pager;
@Service
public class BoardServiceImpl implements BoardService {
@Autowired
BoardDao dao;






	
	@Override
	public void incRecommend(long freeCode,String id) {
		
		dao.incRecommend(freeCode,id);
		dao.updateRecommend(freeCode);
		
	}

	@Override
	public void incRef(long freeCode) {
		dao.incRef(freeCode);
		
	}

	@Override
	public Post item(long freeCode) {
		return dao.item(freeCode);
	}

	@Override
	public List<Post> list(Pager pager) {
	
		int total = (int) dao.total(pager);
		int todayTotal = dao.todayTotal(pager);
		
		pager.setTodayTotal(todayTotal);
		pager.setTotal(total);
		return dao.list(pager);
	}

	@Override
	public void add(Post item) {
		dao.add(item);
	}

	@Override
	public void update(Post item) {
		dao.update(item);
	}

	@Override
	public void delete(long freeCode) {
		dao.deleteComment(freeCode);
		dao.delete(freeCode);
	}

	@Override
	public void replyadd(Post item) {
		dao.replyadd(item);
		dao.replyupdate(item.getOriginNo(),item.getGroupOrd(),item.getGroupLayer());
	}


	@Override
	public String profileUpload(MultipartFile file,HttpServletRequest request, HttpServletResponse response) throws IOException {
		int email =1;
		for(int i=1; i<file.getSize(); i++) {
			email += i;
		}
		
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		// 업로드할 폴더 경로
		String realFolder = request.getSession().getServletContext().getRealPath("upload");
		UUID uuid = UUID.randomUUID();

		// 업로드할 파일 이름
		String org_filename = file.getOriginalFilename();
		String str_filename = uuid.toString() + org_filename;

		System.out.println("원본 파일명 : " + org_filename);
		System.out.println("저장할 파일명 : " + str_filename);

		String filepath = realFolder + "\\" + email + "\\" + str_filename;
		System.out.println("파일경로 : " + filepath);

		File f = new File(filepath);
		if (!f.exists()) {
			f.mkdirs();
		}
		file.transferTo(f);
		out.println("upload/"+email+"/"+str_filename);
		out.close();
		
		
		return filepath;
		
	}

	@Override
	public int countRecommend(String id, long freeCode) {
		
		return dao.countRecommend(id,freeCode);
	}

	@Override
	public List<Notice> nlist() {
		return dao.nlist();
	}

	@Override
	public Notice nitem(int noticeCode) {
		return dao.nitem(noticeCode);
	}

	@Override
	public int countComment(long freeCode) {
		return dao.countComment(freeCode);
	}

	@Override
	public List<Post> flist() {
		
		return dao.flist();
	}

	@Override
	public List<MyArticle> mylist(String id,Pager pager) {
			
		return dao.mylist(id,pager);
	}

	

	






	







}
