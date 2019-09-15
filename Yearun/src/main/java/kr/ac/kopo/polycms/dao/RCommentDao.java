package kr.ac.kopo.polycms.dao;

import java.util.List;

import kr.ac.kopo.polycms.model.CommentVO;
import kr.ac.kopo.polycms.model.RCommentVO;

public interface RCommentDao {

	List<RCommentVO> commentListService(int reviewCode);

	int commentInsertService(RCommentVO comment);

	int commentUpdateService(RCommentVO comment);

	int commentDeleteService(int cno);

}
