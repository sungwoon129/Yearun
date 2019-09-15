package kr.ac.kopo.polycms.service;

import java.util.List;

import kr.ac.kopo.polycms.model.CommentVO;
import kr.ac.kopo.polycms.model.MyComment;

public interface CommentService {

	List<CommentVO> commentListService(int freeCode);

	int commentInsertService(CommentVO comment);

	int commentUpdateService(CommentVO comment);

	int commentDeleteService(int cno);

	List<MyComment> myComment(String id);

}
