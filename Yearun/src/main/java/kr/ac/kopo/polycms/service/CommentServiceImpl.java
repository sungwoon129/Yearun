package kr.ac.kopo.polycms.service;

import java.util.List;

import org.aspectj.lang.annotation.SuppressAjWarnings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.polycms.dao.CommentDao;
import kr.ac.kopo.polycms.model.CommentVO;
import kr.ac.kopo.polycms.model.MyComment;

@Service

public class CommentServiceImpl implements kr.ac.kopo.polycms.service.CommentService {
@Autowired
CommentDao mCommentDao;

	@Override
	public List<CommentVO> commentListService(int freeCode) {
		return mCommentDao.commentListService(freeCode);
	}

	@Override
	public int commentInsertService(CommentVO comment) {
		return mCommentDao.commentInsertService(comment);
	}

	@Override
	public int commentUpdateService(CommentVO comment) {
		return mCommentDao.commentUpdateService(comment);
	}

	@Override
	public int commentDeleteService(int cno) {
		return mCommentDao.commentDeleteService(cno);
	}

	@Override
	public List<MyComment> myComment(String id) {
		return mCommentDao.myComment(id);
	}

}
