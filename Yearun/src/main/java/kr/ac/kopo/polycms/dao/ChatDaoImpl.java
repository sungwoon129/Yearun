package kr.ac.kopo.polycms.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import kr.ac.kopo.polycms.model.ChatDto;
import kr.ac.kopo.polycms.model.ChatMemberDto;

@Repository
public class ChatDaoImpl implements ChatDao {
	@Autowired
	SqlSession sqlSession;
	
	

	@Override
	public ChatDto checkRoom(String name) throws Exception {
		return sqlSession.selectOne("chat.getRoom", name);
	}

	@Override
	public void createChatRoom(ChatDto dto) throws Exception {
		sqlSession.insert("chat.createChatRoom", dto);
	}

	@Override
	public List<ChatDto> getRoomList() throws Exception {
		return sqlSession.selectList("chat.getRoomList");
	}

	@Override
	public void addRoomMember(ChatMemberDto mem) throws Exception {
		sqlSession.insert("chat.addRoomMember",mem);
	}

	@Override
	public ChatMemberDto getRoomMember(ChatMemberDto mem) throws Exception {
		return sqlSession.selectOne("chat.getRoomMember", mem);
	}

	@Override
	public List<ChatMemberDto> sameRoomList(ChatMemberDto mem) throws Exception {
		return sqlSession.selectList("chat.sameRoomList",mem);
	}

	@Override
	public void updateRoomMember(ChatMemberDto mem) throws Exception {
		sqlSession.update("chat.updateRoomMember", mem);
	}

	@Override
	public void deleteRoomMember(ChatMemberDto mem) throws Exception {
		sqlSession.delete("chat.deleteRoomMember", mem);
	}

	@Override
	public void updateChatCountInc(String name) throws Exception {
		sqlSession.update("chat.updateChatCountInc", name);
	}

	@Override
	public void updateChatCountDec(String name) throws Exception {
		sqlSession.update("chat.updateChatCountDec", name);
	}

	@Override
	public void deleteChat() throws Exception {
		sqlSession.delete("chat.deleteChat");
	}

	@Override
	public List<ChatDto> searchRoomList(String name) throws Exception {
		return sqlSession.selectList("chat.searchRoomList", name);
	}


}



