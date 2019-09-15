package kr.ac.kopo.polycms.service;

import java.util.List;

import kr.ac.kopo.polycms.model.ChatDto;
import kr.ac.kopo.polycms.model.ChatMemberDto;


public interface ChatService {
public ChatDto checkRoom(String name) throws Exception;
	
	public void createChatRoom(ChatDto dto) throws Exception;
	
	public List<ChatDto> getRoomList() throws Exception;
	
	public void addRoomMember(ChatMemberDto mem) throws Exception;
	
	public ChatMemberDto getRoomMember(ChatMemberDto mem) throws Exception;
	
	public List<ChatMemberDto> sameRoomList(ChatMemberDto mem) throws Exception;
	
	public void updateRoomMember(ChatMemberDto mem) throws Exception;
	
	public void deleteRoomMember(ChatMemberDto mem) throws Exception;
	
	public void updateChatCountInc(String name) throws Exception;
	
	public void updateChatCountDec(String name) throws Exception;
	
	public void deleteChat() throws Exception;
	
	public List<ChatDto> searchRoomList(String name) throws Exception;
}


