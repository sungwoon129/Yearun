package kr.ac.kopo.polycms.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.kopo.polycms.model.MyArticle;
import kr.ac.kopo.polycms.model.MyComment;
import kr.ac.kopo.polycms.model.Planner;
import kr.ac.kopo.polycms.model.Post;
import kr.ac.kopo.polycms.model.RPost;
import kr.ac.kopo.polycms.model.User;
import kr.ac.kopo.polycms.service.BoardService;
import kr.ac.kopo.polycms.service.CommentService;
import kr.ac.kopo.polycms.service.MapService;
import kr.ac.kopo.polycms.service.RBoardService;
import kr.ac.kopo.polycms.service.UserService;
import kr.ac.kopo.polycms.util.Pager;

@Controller
public class MypageController {
	@Autowired
	UserService userService;
	@Autowired
	BoardService service;
	@Autowired
	RBoardService rservice;
	@Autowired
	CommentService cservice;
	@Autowired
	MapService mservice;

//	final String realuploadpath="d://upload//";
	final String realuploadpath="/home/team8/upload/";
	
	
@RequestMapping(value="/mypage", method=RequestMethod.GET)
String mypage(User item,HttpSession session,Model model) {
	   
		item.setId((String) session.getAttribute("user"));
		User userinfo = userService.userInfo(item.getId());
		model.addAttribute("userinfo", userinfo);
		return "mypage/userinfo";
}

@RequestMapping(value="/mypageUpdate", method=RequestMethod.POST)
String mypageUpdate(User user) {
    user.setAddress(user.getAddress1_input()+user.getAddress2_input());
//  user.setAge(user.getBirth_input1()+user.getBirth_input2()+user.getBirth_input3());
  user.setAge(user.getBirth_input1());
  user.setPhone(user.getPhone1_input()+user.getPhone2_input()+user.getPhone3_input());
  
  System.out.println("생년월일"+user.getAge());
  System.out.println("주소"+user.getAddress());
  System.out.println("폰번호"+user.getPhone());
	   userService.mypageUpdate(user);
	return "mypage/userinfo";
	   
}
 
@RequestMapping("/myArticle")
String myArticle(MyArticle item, HttpSession session,Model model,Pager pager) {
item.setId((String) session.getAttribute("user"));
List<MyArticle> mylist = service.mylist(item.getId(),pager);


model.addAttribute("mylist", mylist);



return "mypage/myarticle";

}

@RequestMapping("/myComment")
String myComment(MyComment item, HttpSession session,Model model) {
	item.setId((String) session.getAttribute("user"));
	List<MyComment> mycomment = cservice.myComment(item.getId());
	
	model.addAttribute("mycomment", mycomment);
	return "mypage/mycomment";
}

//자기가 짠 플랜 리스트
@RequestMapping("/mybucket")
String myBucketList(HttpSession session, Model model) {
	String id = (String)session.getAttribute("user");
	
	List<Planner> planList = mservice.myBucketList(id);
	
	model.addAttribute("planList", planList);
	
	return "mypage/myBucketList";
}

//각각의 플랜 정보
@RequestMapping(value="/mybucketView", method=RequestMethod.GET)
String mybucket(int plannerCode, String myPhoto, Model model) {
	
	model.addAttribute("plannerCode", plannerCode);
	model.addAttribute("myPhoto", myPhoto);
	return "mypage/mybucket";
}

//플랜 정보 페이지 들어가면 시작되는 ajax으로 일정에 대한 값을 받아와 달력에 뿌려준다.
@RequestMapping("/myPlan")
@ResponseBody
HashMap<String, Object> myPlan(@RequestParam int plannerCode) {
	System.out.println("myPlan 컨트롤러 plannerCode->" + plannerCode);
	HashMap<String, Object> map = new HashMap<String, Object>();
	
	List<Planner> plan = mservice.myPlan(plannerCode);
	map.put("plan", plan);
	return map;
}

//플랜 삭제(실제 경로에서 이미지도 같이 삭제되게한다)
@RequestMapping(value="/myBucketDelete", method=RequestMethod.GET)
String myBucketDelete(int plannerCode,String myPhoto) {
	
	System.out.println("myBucketDelete메서드 Mypage컨트롤러"+myPhoto);
	File file = new File(realuploadpath+myPhoto);
  
  if( file.exists() ){
      if(file.delete()){
          System.out.println("파일삭제 성공");
      }else{
          System.out.println("파일삭제 실패");
      }
  }else{
      System.out.println("파일이 존재하지 않습니다.");
  }
       

	mservice.myBucketDelete(plannerCode);
	return "redirect:mybucket";
}

@RequestMapping(value="/goodbye")
String goodBye() {
	return "mypage/goodbye";
}

@RequestMapping(value="/deleteUser")
String deleteUser(HttpSession session) {
	String id =(String)session.getAttribute("user");
	session.invalidate();
	userService.deleteUser(id);
	
	return "redirect:.";
}


}
