package kr.ac.kopo.polycms.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.kopo.polycms.model.ChatDto;
import kr.ac.kopo.polycms.model.ChatMemberDto;
import kr.ac.kopo.polycms.model.User;
import kr.ac.kopo.polycms.service.ChatService;


@Controller
@RequestMapping("/chatting")
public class ChatController {
	final String path="chatting/";
	
	private static final Logger logger = LoggerFactory.getLogger(ChatController.class);
	
	@Autowired
	ChatService service;
	
	//전체채팅룸으로 이동
	@RequestMapping(value="chat", method = { RequestMethod.GET, RequestMethod.POST })
	public String chat (Model model,HttpServletRequest req, HttpSession session) throws Exception{
		
		logger.info("chat.do RUN! / Run Time: " + new Date());	
		
//		MemberDto login = (MemberDto)req.getSession().getAttribute("login");
//		
//		if(login==null) {
//			return "redirect:/loginNull.do";
//		}
		User user= new User();
		user.setId((String) session.getAttribute("user"));
		model.addAttribute("user", user.getId());
		String id= user.getId();
		System.out.println("userid는" +id);
		
		//DB에 현재 아이디로 어떤 방에 들어가있는지 조사 후, 세팅하기
		ChatMemberDto chatM = service.getRoomMember(new ChatMemberDto(id, "",""));
		
		//만약 채팅방을 처음 입장하는 것이라면 방에대한 아이디정보를 생성
		if(chatM ==null) {
			service.addRoomMember(new ChatMemberDto(id, "",""));
			
			//추가를 한다음 chatM을 다시 받아오도록한다.
			chatM = service.getRoomMember(new ChatMemberDto(id, "",""));
			logger.info("아이디 정보 추가 성공!" + new Date());
			
		}
		//존재한다면 방정보를 all로 변경 
		else {
			service.updateRoomMember(new ChatMemberDto(id, "all", "")); //room 변경
			
		}
		

		//현재 방이름 넣기(전체채팅방이니 all)
		model.addAttribute("room", "all");

		return path+"chat";
	}
	
	
	//방만들기
	@RequestMapping(value="createChatRoom.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String createChatRoom (Model model, HttpSession session, ChatDto chat) throws Exception{
		
		logger.info("createChatRoom.do RUN! / Run Time: " + new Date());
		
//		MemberDto login = (MemberDto)req.getSession().getAttribute("login");
//		
//		if(login==null) {
//			return "redirect:/loginNull.do";
//		}
		User user= new User();
		user.setId((String) session.getAttribute("user"));
		model.addAttribute("user", user.getId());
		String id= user.getId();
		System.out.println("userid는" +user.getId());
		
		logger.info(chat.toString());
		System.out.println("chat방 정보" +chat.toString());
		//해당 정보로 방을 DB에 생성( 이미 방이 존재한다면 생성하지 않는다 )
		ChatDto dto = service.checkRoom(chat.getName());
		if(dto ==null) {
			service.createChatRoom(chat);
			System.out.println("채팅방생성");
			System.out.println(chat.getName());
			
		}
		
		//현재 아이디로 만든 방의 이름으로 정보를 수정한다.
		service.updateRoomMember(new ChatMemberDto(id, chat.getName(), ""));
		
		//이전방은 수정하지 않음
		
		//현재 방이름 넣기(전체채팅방이니 all)
		model.addAttribute("room", chat.getName());
		
		return path+"chat";
	}
	//중복확인
	@ResponseBody
	@RequestMapping(value="checkRoom.do", method = { RequestMethod.GET, RequestMethod.POST })
	public int checkRoom(Model model, String name) throws Exception{
		System.out.println("name="+name);
		
		ChatDto dto = service.checkRoom(name);
		//중복값이 없을경우
		if(dto ==null) {
			return 1;
		}
		else {
			return 0;
		}		
	}
	
	//방이동
	@RequestMapping(value="MoveChatRoom.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String MoveChatRoom (Model model, HttpSession session, String roomName) throws Exception{
		
		logger.info("MoveChatRoom.do RUN! / Run Time: " + new Date());
		
//		MemberDto login = (MemberDto)req.getSession().getAttribute("login");
//		
//		if(login==null) {
//			return "redirect:/loginNull.do";
//		}
		User user= new User();
		user.setId((String) session.getAttribute("user"));
		model.addAttribute("user", user.getId());
		String id= user.getId();
		System.out.println("userid는" +user.getId());
		logger.info("이동할 방이름 : "+roomName);
		
		//이동하게 될 방 이름으로 수정
		service.updateRoomMember(new ChatMemberDto(id, roomName, ""));
		
		//접속 끊기 이전방은 수정하지 않음.
		
		//방이동 처리
		model.addAttribute("room", roomName);
		
		return path+"chat";
	}
	
	
}


