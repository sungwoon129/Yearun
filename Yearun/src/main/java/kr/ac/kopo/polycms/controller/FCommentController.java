package kr.ac.kopo.polycms.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.kopo.polycms.model.CommentVO;
import kr.ac.kopo.polycms.service.CommentService;
 

 
@Controller
@RequestMapping("/comment")
public class FCommentController {
 
    @Autowired
    CommentService mCommentService;
    
    
    @RequestMapping("/list") //댓글 리스트
    @ResponseBody
    
    private List<CommentVO> mCommentServiceList(Model model, @RequestParam int freeCode) throws Exception{
       
    	
    	
        return mCommentService.commentListService(freeCode);
    }
    
    @RequestMapping(value="/insert") //댓글 작성 
    @ResponseBody
    private int mCommentServiceInsert(@RequestParam int freeCode, @RequestParam String content, HttpSession session) throws Exception{
    	
        CommentVO comment = new CommentVO();
        comment.setId((String) session.getAttribute("user"));
        comment.setFreeCode(freeCode);
       comment.setContent(content);
        //로그인 기능을 구현했거나 따로 댓글 작성자를 입력받는 폼이 있다면 입력 받아온 값으로 사용하면 됩니다. 저는 따로 폼을 구현하지 않았기때문에 임시로 "test"라는 값을 입력해놨습니다.
       
       
        return mCommentService.commentInsertService(comment);
        
    }
    
    @RequestMapping("/update") //댓글 수정  
    @ResponseBody
    private int mCommentServiceUpdateProc(@RequestParam int cno, @RequestParam String content) throws Exception{
        
        CommentVO comment = new CommentVO();
        comment.setCno(cno);
        comment.setContent(content);
        
        return mCommentService.commentUpdateService(comment);
    }
    
    @RequestMapping("/delete/{cno}") //댓글 삭제  
    @ResponseBody
    private int mCommentServiceDelete(@PathVariable int cno) throws Exception{
        
        return mCommentService.commentDeleteService(cno);
    }
    
   
    
}


