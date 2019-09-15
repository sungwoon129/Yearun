package kr.ac.kopo.polycms.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.polycms.model.CommentVO;
import kr.ac.kopo.polycms.model.RCommentVO;
@Repository
public class RCommentDaoImpl implements RCommentDao {
@Autowired
SqlSession sql;


	@Override
	public List<RCommentVO> commentListService(int reviewCode) {
		return sql.selectList("reviewcomment.commentList", reviewCode);
	}

	@Override
	public int commentInsertService(RCommentVO comment) {
		
		
		return sql.insert("reviewcomment.commentInsert", comment);
	}

	@Override
	public int commentUpdateService(RCommentVO comment) {
		return sql.update("reviewcomment.commentUpdate", comment);
	}

	@Override
	public int commentDeleteService(int cno) {
		return sql.delete("reviewcomment.commentDelete", cno);
	}

}
