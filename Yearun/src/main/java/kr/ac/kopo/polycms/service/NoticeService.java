package kr.ac.kopo.polycms.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;

import kr.ac.kopo.polycms.model.Notice;
import kr.ac.kopo.polycms.util.Pager;

public interface NoticeService {

	List<Notice> list(Pager pager);

	void add(Notice item);

	void update(Notice item);

	void delete(long noticeCode);

	Notice item(long noticeCode);

	void incRef(long noticeCode);

	String profileUpload(MultipartFile file, HttpServletRequest request, HttpServletResponse response)
			throws IOException;

	int countRecommend(String id, long noticeCode);

	void incRecommend(long noticeCode, String id);

}
