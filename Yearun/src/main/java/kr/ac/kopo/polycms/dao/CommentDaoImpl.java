package kr.ac.kopo.polycms.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.polycms.model.CommentVO;
import kr.ac.kopo.polycms.model.MyComment;
@Repository
public class CommentDaoImpl implements CommentDao {
@Autowired
SqlSession sql;

	@Override
	public List<CommentVO> commentListService(int freeCode) {
	
		return sql.selectList("freecomment.commentList",freeCode);
	}

	@Override
	public int commentInsertService(CommentVO comment) {
		return sql.insert("freecomment.commentInsert", comment);
	}

	@Override
	public int commentUpdateService(CommentVO comment) {
		return sql.update("freecomment.commentUpdate", comment);
	}

	@Override
	public int commentDeleteService(int cno) {
		return sql.delete("freecomment.commentDelete", cno);
	}

	@Override
	public List<MyComment> myComment(String id) {
		return sql.selectList("freecomment.myComment", id);
	}
	
	

}
