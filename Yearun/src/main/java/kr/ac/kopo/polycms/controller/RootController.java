package kr.ac.kopo.polycms.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.scribejava.core.model.OAuth2AccessToken;

import kr.ac.kopo.polycms.model.JsonParser;
import kr.ac.kopo.polycms.model.Notice;
import kr.ac.kopo.polycms.model.Post;
import kr.ac.kopo.polycms.model.RPost;
import kr.ac.kopo.polycms.model.User;
import kr.ac.kopo.polycms.model.naverLoginBO;
import kr.ac.kopo.polycms.service.BoardService;
import kr.ac.kopo.polycms.service.RBoardService;
import kr.ac.kopo.polycms.service.UserService;

@Controller
public class RootController {
   @Autowired
   UserService userService;
   
   @Autowired
   BoardService service;
   @Autowired
   RBoardService rservice;
   
   
   @RequestMapping("/")
   String index(Model model) {
	   
		List<Post> flist = service.flist();
		List<Notice> nlist = service.nlist();
		List<RPost> rlist = rservice.rlist();
		
		model.addAttribute("flist", flist);
		model.addAttribute("nlist",nlist);
		model.addAttribute("rlist",rlist);
		
	
	   
      return "index";
   }
   
   

   
   @RequestMapping("/preparing")
   String preparing() {
      return "preparing";
   }
   
   @RequestMapping(value ="/idChk",method =RequestMethod.POST )
   @ResponseBody
   public int idChk(String id) {
      System.out.println("id>>>>>"+id);
      
      return userService.idChk(id);
   }
   
   @RequestMapping(value ="/nameChk",method =RequestMethod.POST )
   @ResponseBody
   public int nameChk(String name) {
      System.out.println("name>>>>>"+name);
      
      return userService.nameChk(name);
   }
   /* NaverLoginBO */
    private naverLoginBO naverLoginBO;
    private String apiResult = null;
    private String ACCESS_TOKEN = null;
    @Autowired
    private void setNaverLoginBO(naverLoginBO naverLoginBO) {
        this.naverLoginBO = naverLoginBO;
    }
    
   //로그인 첫 화면 요청 메소드
    @RequestMapping(value = "/login", method = { RequestMethod.GET, RequestMethod.POST })
    public String login(Model model, HttpSession session) {
        
        /* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
        String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
        
        //https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
        //redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
        System.out.println("네이버:" + naverAuthUrl);
        
        //네이버 
        model.addAttribute("url", naverAuthUrl);

        /* 생성한 인증 URL을 View로 전달 */
        return "login";
    }

    //네이버 로그인 성공시 callback호출 메소드
    @RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })
    public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session,User vo)
            throws Exception {
        System.out.println("여기는 callback");
        JsonParser json = new JsonParser();

      OAuth2AccessToken oauthToken = naverLoginBO.getAccessToken(session, code, state);
      String apiResult = naverLoginBO.getUserProfile(oauthToken);
      System.out.println("oauthToken >>> "+oauthToken);
      System.out.println("getAccessToken >>> "+oauthToken.getAccessToken());
      ACCESS_TOKEN = oauthToken.getAccessToken();
      
      vo = json.changeJson(apiResult); // vo에 userEmail, userGender, userNaver 저장
      System.out.println("vo Name:"+vo.getName());
      System.out.println("vo Nickname:"+vo.getNickname());
      System.out.println("vo NaverID:"+vo.getId());
      if (userService.selectNaver(vo) > 0) { // 세션만들기
         session.setAttribute("user", vo.getId());
      } else {
         userService.insertNaver(vo);
         session.setAttribute("user", vo.getId());
      }

        return "callback";
    }
//   
//   @RequestMapping(value="/login", method=RequestMethod.GET)
//   String login() {
//      return "login";
//   }
   //회원가입
   final String path = "signup/";
   //약관동의
   @RequestMapping(value="/acceptTerms", method=RequestMethod.GET)
   String acceptTerms() {
      return path+"acceptTerms";
   }
   //회원정보입력
   
   @RequestMapping(value="/memberadd", method=RequestMethod.GET)
   String MemberAdd() {
      return path+"signup";
   }
   @RequestMapping(value="/memberadd", method=RequestMethod.POST)
   String MemberAdd(User user) {
      user.setAddress(user.getAddress1_input()+user.getAddress2_input());
//      user.setAge(user.getBirth_input1()+user.getBirth_input2()+user.getBirth_input3());
      user.setAge(user.getBirth_input1());
      user.setPhone(user.getPhone1_input()+user.getPhone2_input()+user.getPhone3_input());
      
      System.out.println("생년월일"+user.getAge());
      System.out.println("주소"+user.getAddress());
      System.out.println("폰번호"+user.getPhone());
      userService.memberAdd(user);
      return "redirect:complete";
   }
   
   @RequestMapping(value="/complete", method=RequestMethod.GET)
   String complete() {
      return path+"complete";
   }
   
   @RequestMapping(value="/loginChk", method=RequestMethod.POST)
   @ResponseBody
   boolean login(User user, HttpSession session) {
      if(userService.login(user)&&user.getId().equals("admin")) {
      session.setAttribute("admin", user.getId());
      session.setAttribute("user", user.getId());
      /*session.setAttribute("nickname", user.getNickname());*/
      System.out.println("관리자 권한 로그인 성공 아이디는 : "+session.getAttribute("admin"));
      } else if(userService.login(user)&&!user.getId().equals("admin")){
      session.setAttribute("user", user.getId());
      System.out.println("유저 권한 로그인 성공 아이디는 : "+session.getAttribute("user"));
      }else {
         System.out.println("로그인 실패");
      }
      
      return userService.login(user);
   }


   @RequestMapping("/logout")
   String logout(HttpSession session,Model model) {
//      System.out.println("ACCESS_TOKEN>>>>"+ACCESS_TOKEN);
//      
//      String deleteTokenUrl =naverLoginBO.deleteToken(ACCESS_TOKEN);
//      model.addAttribute("deleteTokenUrl",deleteTokenUrl);
      session.invalidate();
      
      return "redirect:.";
   }
   @RequestMapping("/contactus")
   String contactUs() {
	   return "contactus";
   }

}