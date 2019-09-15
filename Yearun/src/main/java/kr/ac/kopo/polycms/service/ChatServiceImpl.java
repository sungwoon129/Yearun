package kr.ac.kopo.polycms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.polycms.dao.ChatDao;
import kr.ac.kopo.polycms.model.ChatDto;
import kr.ac.kopo.polycms.model.ChatMemberDto;

@Service
public class ChatServiceImpl implements ChatService {
	
		@Autowired
		ChatDao dao;

		@Override
		public ChatDto checkRoom(String name) throws Exception {
			return dao.checkRoom(name);
		}

		@Override
		public void createChatRoom(ChatDto dto) throws Exception {
			dao.createChatRoom(dto);
		}

		@Override
		public List<ChatDto> getRoomList() throws Exception {
			return dao.getRoomList();
		}

		@Override
		public void addRoomMember(ChatMemberDto mem) throws Exception {
			dao.addRoomMember(mem);
		}

		@Override
		public ChatMemberDto getRoomMember(ChatMemberDto mem) throws Exception {
			return dao.getRoomMember(mem);
		}

		@Override
		public List<ChatMemberDto> sameRoomList(ChatMemberDto mem) throws Exception {
			return dao.sameRoomList(mem);
		}

		@Override
		public void updateRoomMember(ChatMemberDto mem) throws Exception {
			dao.updateRoomMember(mem);
		}

		@Override
		public void deleteRoomMember(ChatMemberDto mem) throws Exception {
			dao.deleteRoomMember(mem);
		}

		@Override
		public void updateChatCountInc(String name) throws Exception {
			dao.updateChatCountInc(name);
			System.out.println("ㅈㅈㅈㅈㅈ");
		}

		@Override
		public void updateChatCountDec(String name) throws Exception {
			dao.updateChatCountDec(name);
			System.out.println("ㄱㄱㄱㄱㄱ");
		}

		@Override
		public void deleteChat() throws Exception {
			dao.deleteChat();
		}

		@Override
		public List<ChatDto> searchRoomList(String name) throws Exception {
			return dao.searchRoomList(name);
		}
	}
	

