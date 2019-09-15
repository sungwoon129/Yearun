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
import kr.ac.kopo.polycms.model.RCommentVO;
import kr.ac.kopo.polycms.service.CommentService;
import kr.ac.kopo.polycms.service.RCommentService;
 

 
@Controller
@RequestMapping("/rcomment")
public class RCommentController {
 
    @Autowired
    RCommentService rmCommentService;
    
    
    @RequestMapping("/list") //댓글 리스트
    @ResponseBody
    
    private List<RCommentVO> mCommentServiceList(Model model, @RequestParam int reviewCode) throws Exception{
       
    	
    	
        return rmCommentService.commentListService(reviewCode);
    }
    
    @RequestMapping(value="/insert") //댓글 작성 
    @ResponseBody
    private int mCommentServiceInsert(@RequestParam int reviewCode, @RequestParam String content, HttpSession session) throws Exception{
    	System.out.println(reviewCode);
        RCommentVO comment = new RCommentVO();
        comment.setId((String) session.getAttribute("user"));
        comment.setReviewCode(reviewCode);
       comment.setContent(content);
       System.out.println(comment.getReviewCode());
       System.out.println(comment.getContent());
     
        return rmCommentService.commentInsertService(comment);
        
    }
    
    @RequestMapping("/update") //댓글 수정  
    @ResponseBody
    private int mCommentServiceUpdateProc(@RequestParam int cno, @RequestParam String content) throws Exception{
        
        RCommentVO comment = new RCommentVO();
        comment.setCno(cno);
        comment.setContent(content);
        
        return rmCommentService.commentUpdateService(comment);
    }
    
    @RequestMapping("/delete/{cno}") //댓글 삭제  
    @ResponseBody
    private int mCommentServiceDelete(@PathVariable int cno) throws Exception{
        
        return rmCommentService.commentDeleteService(cno);
    }
    
}


