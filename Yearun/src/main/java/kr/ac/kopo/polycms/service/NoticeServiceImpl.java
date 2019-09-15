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

import kr.ac.kopo.polycms.dao.NoticeDao;
import kr.ac.kopo.polycms.model.Notice;
import kr.ac.kopo.polycms.util.Pager;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	NoticeDao dao;
	
	
	@Override
	public void incRecommend(long noticeCode,String id) {
		
		dao.incRecommend(noticeCode,id);
		dao.updateRecommend(noticeCode);
		
	}
	
	@Override
	public int countRecommend(String id, long noticeCode) {
		
		return dao.countRecommend(id,noticeCode);
	}

	
	@Override
	public List<Notice> list(Pager pager) {
		int total = (int) dao.total(pager);
		int todayTotal = dao.todayTotal(pager);
		
		pager.setTodayTotal(todayTotal);
		pager.setTotal(total);
		return dao.list(pager);
	}

	@Override
	public void add(Notice item) {
		dao.add(item);
	}

	@Override
	public void update(Notice item) {
		dao.update(item);

	}

	@Override
	public void delete(long noticeCode) {
		dao.delete(noticeCode);
	}

	@Override
	public Notice item(long noticeCode) {
	
		return dao.item(noticeCode);
	}

	@Override
	public void incRef(long noticeCode) {
		dao.inRef(noticeCode);
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
}
