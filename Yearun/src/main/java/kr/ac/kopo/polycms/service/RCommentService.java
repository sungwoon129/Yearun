package kr.ac.kopo.polycms.service;

import java.util.List;

import kr.ac.kopo.polycms.model.CommentVO;
import kr.ac.kopo.polycms.model.RCommentVO;

public interface RCommentService {

	List<RCommentVO> commentListService(int reviewCode);

	int commentInsertService(RCommentVO comment);

	int commentUpdateService(RCommentVO comment);

	int commentDeleteService(int cno);

}
