package kr.ac.kopo.polycms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.polycms.dao.RCommentDao;
import kr.ac.kopo.polycms.model.CommentVO;
import kr.ac.kopo.polycms.model.RCommentVO;
@Service
public class RCommentServiceImpl implements RCommentService {
@Autowired
RCommentDao dao;
	
	@Override
	public List<RCommentVO> commentListService(int reviewCode) {
		return dao.commentListService(reviewCode);
	}

	@Override
	public int commentInsertService(RCommentVO comment) {
		return dao.commentInsertService(comment);
	}

	@Override
	public int commentUpdateService(RCommentVO comment) {
		return dao.commentUpdateService(comment);
	}

	@Override
	public int commentDeleteService(int cno) {
		return dao.commentDeleteService(cno);
	}

}
